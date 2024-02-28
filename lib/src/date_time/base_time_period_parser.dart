import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/timezone_utility.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseTimePeriodParser implements IDateTimeParser {
  final ITimePeriodParserConfiguration config;

  BaseTimePeriodParser(this.config);

  @override
  String getParserName() => DateTimeConstants.SYS_DATETIME_TIMEPERIOD;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime reference) {
    var referenceTime = reference;

    Object? value;
    if (er.type == getParserName()) {
      DateTimeResolutionResult innerResult;

      if (TimeZoneUtility.ShouldResolveTimeZone(er, config.options)) {
        var metadata = er.data as Map<String, Object>;
        var timezoneEr = metadata[DateTimeConstants.SYS_DATETIME_TIMEZONE] as ExtractResult;
        var timezonePr = config.TimeZoneParser().parse(timezoneEr);

        innerResult = InternalParse(er.text.substring(0, er.length - timezoneEr.length), referenceTime);

        if (timezonePr != null && timezonePr.value != null) {
          innerResult.timeZoneResolution = (timezonePr.value as DateTimeResolutionResult).timeZoneResolution;
        }
      } else {
        innerResult = InternalParse(er.text, referenceTime);
      }

      if (innerResult.success) {
        innerResult.futureResolution = <String, String>{
          TimeTypeConstants.START_TIME:
              DateTimeFormatUtil.formatTime((innerResult.futureValue as (DateTime, DateTime)).$1),
          TimeTypeConstants.END_TIME:
              DateTimeFormatUtil.formatTime((innerResult.futureValue as (DateTime, DateTime)).$2),
        };

        innerResult.pastResolution = <String, String>{
          TimeTypeConstants.START_TIME:
              DateTimeFormatUtil.formatTime((innerResult.pastValue as (DateTime, DateTime)).$1),
          TimeTypeConstants.END_TIME: DateTimeFormatUtil.formatTime((innerResult.pastValue as (DateTime, DateTime)).$2),
        };

        value = innerResult;
      }
    }

    var ret = DateTimeParseResult(
      text: er.text,
      start: er.start,
      length: er.length,
      type: er.type,
      data: er.data,
      value: value,
      timexStr: value == null ? '' : (value as DateTimeResolutionResult).timex,
      resolutionStr: '',
    );

    return ret;
  }

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) => candidateResults;

  DateTimeResolutionResult InternalParse(String entityText, DateTime referenceTime) {
    var innerResult = ParseSimpleCases(entityText, referenceTime);

    if (!innerResult.success) {
      innerResult = MergeTwoTimePoints(entityText, referenceTime);
    }

    if (!innerResult.success) {
      innerResult = ParseTimeOfDay(entityText, referenceTime);
    }

    return innerResult;
  }

  // Cases like "from 3 to 5am" or "between 3:30 and 5" are parsed here
  DateTimeResolutionResult ParseSimpleCases(String text, DateTime referenceTime) {
    // Cases like "from 3 to 5pm" or "between 4 and 6am", time point is pure number without colon
    var ret = ParsePureNumCases(text, referenceTime);

    if (!ret.success) {
      // Cases like "from 3:30 to 5" or "between 3:30am to 6pm", at least one of the time point contains colon
      ret = ParseSpecificTimeCases(text, referenceTime);
    }

    if (!ret.success) {
      // Cases like "between 0730-0930"
      ret = ParsePureDigitNumCases(text, referenceTime);
    }

    return ret;
  }

  // Cases like "between 0730 to 0930", only this case is handled in this method
  DateTimeResolutionResult ParsePureDigitNumCases(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    int year = referenceTime.year, month = referenceTime.month, day = referenceTime.day;
    var trimmedText = text.trim();

    var match = RegExpComposer.matchBegin(config.PureNumberBetweenAndRegex(), trimmedText, true);

    if (match != null) {
      // get hours
      var hourGroup = match.getGroup(DateTimeConstants.HourGroupName);
      var minuteGroup = match.getGroup(DateTimeConstants.MinuteGroupName);

      if (hourGroup.captures.length == 2 && minuteGroup.captures.length == 2) {
        var beginHourEndIndex = hourGroup.captures[0].index + hourGroup.captures[0].length;
        var beginMinuteStartIndex = minuteGroup.captures[0].index;
        var endHourEndIndex = hourGroup.captures[1].index + hourGroup.captures[1].length;
        var endMinuteStartIndex = minuteGroup.captures[1].index;

        // falls into the case "between 0730 to 0930"
        if (beginHourEndIndex == beginMinuteStartIndex && endHourEndIndex == endMinuteStartIndex) {
          var startHourStr = hourGroup.captures[0].value;
          var startMinuteStr = minuteGroup.captures[0].value;
          var endHourStr = hourGroup.captures[1].value;
          var endMinuteStr = minuteGroup.captures[1].value;

          int beginHour = config.Numbers()[startHourStr] ?? int.parse(startHourStr);

          int beginMinute = config.Numbers()[startMinuteStr] ?? int.parse(startMinuteStr);

          int endHour = config.Numbers()[endHourStr] ?? int.parse(endHourStr);

          int endMinute = config.Numbers()[endMinuteStr] ?? int.parse(endMinuteStr);

          var beginDateTime = DateUtil.createSafeDate(year, month, day, beginHour, beginMinute, 0);
          var endDateTime = DateUtil.createSafeDate(year, month, day, endHour, endMinute, 0);

          if (beginHour <= DateTimeConstants.HalfDayHourCount && endHour <= DateTimeConstants.HalfDayHourCount) {
            if (beginHour > endHour) {
              if (beginHour == DateTimeConstants.HalfDayHourCount) {
                beginDateTime = beginDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
              } else {
                endDateTime = endDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
              }
            }

            ret.comment = DateTimeConstants.Comment_AmPm;
          }

          if (endDateTime.isBefore(beginDateTime)) {
            endDateTime = endDateTime.AddHours(24);
          }

          var beginStr = DateTimeFormatUtil.ShortTime(beginDateTime.hour, beginMinute);
          var endStr = DateTimeFormatUtil.ShortTime(endDateTime.hour, endMinute);

          ret.timex =
              "(${beginStr},${endStr},${DateTimeFormatUtil.luisTimeSpan(endDateTime.difference(beginDateTime))})";

          ret.futureValue = ret.pastValue = (beginDateTime, endDateTime);

          ret.success = true;
        }
      }
    }

    return ret;
  }

  // Cases like "from 3 to 5pm" or "between 4 and 6am", time point is pure number without colon
  DateTimeResolutionResult ParsePureNumCases(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    int year = referenceTime.year, month = referenceTime.month, day = referenceTime.day;
    var trimmedText = text.trim();

    var match = RegExpComposer.matchBegin(config.PureNumberFromToRegex(), trimmedText, true);

    match ??= RegExpComposer.matchBegin(config.PureNumberBetweenAndRegex(), trimmedText, true);

    if (match != null) {
      // this "from .. to .." pattern is valid if followed by a Date OR "pm"
      var isValid = false;

      // get hours
      var hourGroup = match.getGroup(DateTimeConstants.HourGroupName);
      var hourStr = hourGroup.captures[0].value;
      var afterHourIndex = hourGroup.captures[0].index + hourGroup.captures[0].length;

      // hard to integrate this part into the regex
      if (afterHourIndex == trimmedText.length || !trimmedText.substring(afterHourIndex).trim().startsWith(":")) {
        int beginHour = config.Numbers()[hourStr] ?? int.parse(hourStr);

        hourStr = hourGroup.captures[1].value;
        afterHourIndex = hourGroup.captures[1].index + hourGroup.captures[1].length;

        if (afterHourIndex == trimmedText.length || !trimmedText.substring(afterHourIndex).trim().startsWith(":")) {
          int endHour = config.Numbers()[hourStr] ?? int.parse(hourStr);

          // parse "pm"
          var leftDesc = match.getGroup("leftDesc").value;
          var rightDesc = match.getGroup("rightDesc").value;
          var matchPmStr = match.getGroup(DateTimeConstants.PmGroupName).value;
          var matchAmStr = match.getGroup(DateTimeConstants.AmGroupName).value;
          var descStr = match.getGroup(DateTimeConstants.DescGroupName).value;

          // The "ampm" only occurs in time, we don't have to consider it here
          if (leftDesc.isEmpty) {
            var rightAmValid = rightDesc.isNotEmpty && config.UtilityConfiguration().amDescRegExp().hasMatch(rightDesc);
            var rightPmValid = rightDesc.isNotEmpty && config.UtilityConfiguration().pmDescRegExp().hasMatch(rightDesc);

            if (matchAmStr.isNotEmpty || rightAmValid) {
              if (endHour > DateTimeConstants.HalfDayHourCount) {
                endHour -= DateTimeConstants.HalfDayHourCount;
              }

              if (beginHour > DateTimeConstants.HalfDayHourCount &&
                  beginHour - DateTimeConstants.HalfDayHourCount < endHour) {
                beginHour -= DateTimeConstants.HalfDayHourCount;
              }

              // Resolve case like "11 to 3am"
              if (beginHour < DateTimeConstants.HalfDayHourCount && beginHour > endHour) {
                beginHour += DateTimeConstants.HalfDayHourCount;
              }

              isValid = true;
            } else if (matchPmStr.isNotEmpty || rightPmValid) {
              if (endHour <= DateTimeConstants.HalfDayHourCount) {
                endHour += DateTimeConstants.HalfDayHourCount;
              }

              // Resolve case like "11 to 3pm"
              if (beginHour + DateTimeConstants.HalfDayHourCount < endHour) {
                beginHour += DateTimeConstants.HalfDayHourCount;
              }

              isValid = true;
            }
          }

          if (isValid) {
            var beginStr = "T" + beginHour.toString().padLeft(2, '0');
            var endStr = "T" + endHour.toString().padLeft(2, '0');

            if (endHour >= beginHour) {
              ret.timex = "(${beginStr},${endStr},PT${endHour - beginHour}H)";
            } else {
              ret.timex = "(${beginStr},${endStr},PT${endHour - beginHour + 24}H)";
            }

            // Try to get the timezone resolution
            var timeErs = config.TimeExtractor().extractDateTime(trimmedText, referenceTime);
            for (var er in timeErs) {
              var pr = config.TimeParser().parseDateTime(er, referenceTime);
              if ((pr.value as DateTimeResolutionResult).timeZoneResolution != null) {
                ret.timeZoneResolution = (pr.value as DateTimeResolutionResult).timeZoneResolution;
                break;
              }
            }

            ret.futureValue = ret.pastValue = (
              DateUtil.createSafeDate(year, month, day, beginHour, 0, 0),
              DateUtil.createSafeDate(year, month, day, endHour, 0, 0)
            );

            ret.success = true;
          }
        }
      }
    }

    return ret;
  }

  // Cases like "from 3:30 to 5" or "between 3:30am to 6pm", at least one of the time point contains colon
  DateTimeResolutionResult ParseSpecificTimeCases(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    int year = referenceTime.year, month = referenceTime.month, day = referenceTime.day;

    // Handle cases like "from 4:30 to 5"
    var match = RegExpComposer.matchExact(config.SpecificTimeFromToRegex(), text, true);

    match ??= RegExpComposer.matchExact(config.SpecificTimeBetweenAndRegex(), text, true);

    if (match != null) {
      // Cases like "half past seven" are not handled here
      if (match.getGroup(DateTimeConstants.PrefixGroupName).success) {
        return ret;
      }

      // Cases like "4" is different with "4:00" as the timex is different "T04H" vs "T04H00M"
      int beginHour;
      int beginMinute = DateTimeConstants.InvalidMinute;
      int beginSecond = DateTimeConstants.InvalidSecond;
      int endHour;
      int endMinute = DateTimeConstants.InvalidMinute;
      int endSecond = DateTimeConstants.InvalidSecond;

      // Get time1 and time2
      var hourGroup = match.getGroup(DateTimeConstants.HourGroupName);

      var hourStr = hourGroup.captures[0].value;

      if (config.Numbers().containsKey(hourStr)) {
        beginHour = config.Numbers()[hourStr]!;
      } else {
        beginHour = int.parse(hourStr);
      }

      hourStr = hourGroup.captures[1].value;

      if (config.Numbers().containsKey(hourStr)) {
        endHour = config.Numbers()[hourStr]!;
      } else {
        endHour = int.parse(hourStr);
      }

      var time1StartIndex = match.getGroup("time1").index;
      var time1EndIndex = time1StartIndex + match.getGroup("time1").length;
      var time2StartIndex = match.getGroup("time2").index;
      var time2EndIndex = time2StartIndex + match.getGroup("time2").length;

      // Get beginMinute (if exists) and endMinute (if exists)
      for (int i = 0; i < match.getGroup(DateTimeConstants.MinuteGroupName).captures.length; i++) {
        var minuteCapture = match.getGroup(DateTimeConstants.MinuteGroupName).captures[i];
        if (minuteCapture.index >= time1StartIndex && minuteCapture.index + minuteCapture.length <= time1EndIndex) {
          beginMinute = int.parse(minuteCapture.value);
        } else if (minuteCapture.index >= time2StartIndex &&
            minuteCapture.index + minuteCapture.length <= time2EndIndex) {
          endMinute = int.parse(minuteCapture.value);
        }
      }

      // Get beginSecond (if exists) and endSecond (if exists)
      for (int i = 0; i < match.getGroup(DateTimeConstants.SecondGroupName).captures.length; i++) {
        var secondCapture = match.getGroup(DateTimeConstants.SecondGroupName).captures[i];
        if (secondCapture.index >= time1StartIndex && secondCapture.index + secondCapture.length <= time1EndIndex) {
          beginSecond = int.parse(secondCapture.value);
        } else if (secondCapture.index >= time2StartIndex &&
            secondCapture.index + secondCapture.length <= time2EndIndex) {
          endSecond = int.parse(secondCapture.value);
        }
      }

      // Desc here means descriptions like "am / pm / o'clock"
      // Get leftDesc (if exists) and rightDesc (if exists)
      var leftDesc = match.getGroup("leftDesc").value;
      var rightDesc = match.getGroup("rightDesc").value;

      for (int i = 0; i < match.getGroup(DateTimeConstants.DescGroupName).captures.length; i++) {
        var descCapture = match.getGroup(DateTimeConstants.DescGroupName).captures[i];
        if (descCapture.index >= time1StartIndex &&
            descCapture.index + descCapture.length <= time1EndIndex &&
            leftDesc.isEmpty) {
          leftDesc = descCapture.value;
        } else if (descCapture.index >= time2StartIndex &&
            descCapture.index + descCapture.length <= time2EndIndex &&
            rightDesc.isEmpty) {
          rightDesc = descCapture.value;
        }
      }

      var beginDateTime = DateUtil.createSafeDate(
          year, month, day, beginHour, beginMinute >= 0 ? beginMinute : 0, beginSecond >= 0 ? beginSecond : 0);
      var endDateTime = DateUtil.createSafeDate(
          year, month, day, endHour, endMinute >= 0 ? endMinute : 0, endSecond >= 0 ? endSecond : 0);

      var hasLeftAm = leftDesc.isNotEmpty && leftDesc.startsWith("a");
      var hasLeftPm = leftDesc.isNotEmpty && leftDesc.startsWith("p");
      var hasRightAm = rightDesc.isNotEmpty && rightDesc.startsWith("a");
      var hasRightPm = rightDesc.isNotEmpty && rightDesc.startsWith("p");
      var hasLeft = hasLeftAm || hasLeftPm;
      var hasRight = hasRightAm || hasRightPm;

      // Both time point has description like 'am' or 'pm'
      if (hasLeft && hasRight) {
        if (hasLeftAm) {
          if (beginHour >= DateTimeConstants.HalfDayHourCount) {
            beginDateTime = beginDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
          }
        } else {
          if (beginHour < DateTimeConstants.HalfDayHourCount) {
            beginDateTime = beginDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
          }
        }

        if (hasRightAm) {
          if (endHour > DateTimeConstants.HalfDayHourCount) {
            endDateTime = endDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
          }
        } else {
          if (endHour < DateTimeConstants.HalfDayHourCount) {
            endDateTime = endDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
          }
        }
      } else if (hasLeft || hasRight) {
        // one of the time point has description like 'am' or 'pm'
        if (hasLeftAm) {
          if (beginHour >= DateTimeConstants.HalfDayHourCount) {
            beginDateTime = beginDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
          }

          if (endHour < DateTimeConstants.HalfDayHourCount) {
            if (endDateTime.isBefore(beginDateTime)) {
              endDateTime = endDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
            }
          }
        } else if (hasLeftPm) {
          if (beginHour < DateTimeConstants.HalfDayHourCount) {
            beginDateTime = beginDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
          }

          if (endHour < DateTimeConstants.HalfDayHourCount) {
            if (endDateTime.isBefore(beginDateTime)) {
              var span = beginDateTime.difference(endDateTime);
              endDateTime = endDateTime.AddHours(
                  span.inHours >= DateTimeConstants.HalfDayHourCount ? 24 : DateTimeConstants.HalfDayHourCount);
            }
          }
        }

        if (hasRightAm) {
          if (endHour > DateTimeConstants.HalfDayHourCount) {
            endDateTime = endDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
          }

          if (beginHour < DateTimeConstants.HalfDayHourCount) {
            if (endDateTime.isBefore(beginDateTime)) {
              beginDateTime = beginDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
            }
          }
        } else if (hasRightPm) {
          if (endHour <= DateTimeConstants.HalfDayHourCount) {
            endDateTime = endDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
          }

          if (beginHour < DateTimeConstants.HalfDayHourCount) {
            if (endDateTime.isBefore(beginDateTime)) {
              beginDateTime = beginDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
            } else {
              var span = endDateTime.difference(beginDateTime);
              if (span.inHours > DateTimeConstants.HalfDayHourCount) {
                beginDateTime = beginDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
              }
            }
          }
        }
      }

      // No 'am' or 'pm' indicator
      else if (beginHour <= DateTimeConstants.HalfDayHourCount && endHour <= DateTimeConstants.HalfDayHourCount) {
        if (beginHour > endHour) {
          if (beginHour == DateTimeConstants.HalfDayHourCount) {
            beginDateTime = beginDateTime.AddHours(-DateTimeConstants.HalfDayHourCount);
          } else {
            endDateTime = endDateTime.AddHours(DateTimeConstants.HalfDayHourCount);
          }
        }

        ret.comment = DateTimeConstants.Comment_AmPm;
      }

      if (endDateTime.isBefore(beginDateTime)) {
        endDateTime = endDateTime.AddHours(24);
      }

      var beginStr = DateTimeFormatUtil.ShortTime(beginDateTime.hour, beginMinute, beginSecond);
      var endStr = DateTimeFormatUtil.ShortTime(endDateTime.hour, endMinute, endSecond);

      ret.success = true;

      ret.timex = "($beginStr,$endStr,${DateTimeFormatUtil.luisTimeSpan(endDateTime.difference(beginDateTime))})";

      ret.futureValue = ret.pastValue = (beginDateTime, endDateTime);

      ret.subDateTimeEntities = <Object>[];

      // In SplitDateAndTime mode, time points will be get from these subDateTimeEntities
      // Cases like "from 4 to 5pm", "4" should not be treated as SubDateTimeEntity
      if (hasLeft || beginMinute != DateTimeConstants.InvalidMinute || beginSecond != DateTimeConstants.InvalidSecond) {
        var er = ExtractResult(
          start: time1StartIndex,
          length: time1EndIndex - time1StartIndex,
          text: text.substring(time1StartIndex, time1EndIndex),
          type: DateTimeConstants.SYS_DATETIME_TIME,
        );

        var pr = config.TimeParser().parseDateTime(er, referenceTime);
        ret.subDateTimeEntities?.add(pr);
      }

      // Cases like "from 4am to 5", "5" should not be treated as SubDateTimeEntity
      if (hasRight || endMinute != DateTimeConstants.InvalidMinute || endSecond != DateTimeConstants.InvalidSecond) {
        var er = ExtractResult(
          start: time2StartIndex,
          length: time2EndIndex - time2StartIndex,
          text: text.substring(time2StartIndex, time2EndIndex),
          type: DateTimeConstants.SYS_DATETIME_TIME,
        );
        var pr = config.TimeParser().parseDateTime(er, referenceTime);
        ret.subDateTimeEntities?.add(pr);
      }

      ret.success = true;
    }

    return ret;
  }

  DateTimeResolutionResult MergeTwoTimePoints(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    DateTimeParseResult? pr1, pr2;
    var validTimeNumber = false;

    var ers = config.TimeExtractor().extractDateTime(text, referenceTime);
    if (ers.length != 2) {
      if (ers.length == 1) {
        var numErs = config.integerExtractor().extract(text);

        for (var num in numErs) {
          int midStrBegin = 0, midStrEnd = 0;

          // ending number
          if (num.start > ers[0].start + ers[0].length) {
            midStrBegin = ers[0].start + ers[0].length ?? 0;
            midStrEnd = num.start - midStrBegin ?? 0;
          } else if (num.start + num.length < ers[0].start) {
            midStrBegin = num.start + num.length ?? 0;
            midStrEnd = ers[0].start - midStrBegin ?? 0;
          }

          // check if the middle String between the time point and the valid number is a connect String.
          var middleStr = text.substring(midStrBegin, midStrEnd);
          var tillMatch = config.TillRegex().firstMatch(middleStr);
          if (tillMatch != null) {
            num.data = null;
            num.type = DateTimeConstants.SYS_DATETIME_TIME;
            ers.add(num);
            validTimeNumber = true;
            break;
          }
        }

        ers.sort((x, y) => (x.start - y.start));
      }

      if (!validTimeNumber) {
        return ret;
      }
    }

    pr1 = config.TimeParser().parseDateTime(ers[0], referenceTime);
    pr2 = config.TimeParser().parseDateTime(ers[1], referenceTime);

    // cases with time1 = time2 are excluded to avoid parsing here expressions like
    // "morning-morning" (which in Hindi means "early-morning")
    if (pr1.value == null || pr2.value == null || pr1.text == pr2.text) {
      return ret;
    }

    var ampmStr1 = (pr1.value as DateTimeResolutionResult).comment ?? '';
    var ampmStr2 = (pr2.value as DateTimeResolutionResult).comment ?? '';

    var beginTime = (pr1.value as DateTimeResolutionResult).futureValue as DateTime;
    var endTime = (pr2.value as DateTimeResolutionResult).futureValue as DateTime;

    if (ampmStr2.isNotEmpty &&
        ampmStr2.endsWith(DateTimeConstants.Comment_AmPm) &&
        !endTime.isAfter(beginTime) &&
        endTime.AddHours(DateTimeConstants.HalfDayHourCount).isAfter(beginTime)) {
      endTime = endTime.AddHours(DateTimeConstants.HalfDayHourCount);
      (pr2.value as DateTimeResolutionResult).futureValue = endTime;
      pr2.timexStr = "T${endTime.hour}";
      if (endTime.minute > 0) {
        pr2.timexStr = "${pr2.timexStr}:${endTime.minute}";
      }
    }

    if (ampmStr1.isNotEmpty &&
        ampmStr1.endsWith(DateTimeConstants.Comment_AmPm) &&
        endTime.isAfter(beginTime.AddHours(DateTimeConstants.HalfDayHourCount))) {
      beginTime = beginTime.AddHours(DateTimeConstants.HalfDayHourCount);
      (pr1.value as DateTimeResolutionResult).futureValue = beginTime;
      pr1.timexStr = "T${beginTime.hour}";
      if (beginTime.minute > 0) {
        pr1.timexStr = "${pr1.timexStr}:${beginTime.minute}";
      }
    }

    if (endTime.isBefore(beginTime)) {
      endTime = endTime.AddDays(1);
    }

    final diff = endTime.difference(beginTime);
    var microseconds = diff.inMicroseconds;

    microseconds = microseconds.remainder(Duration.microsecondsPerDay);
    final hours = microseconds ~/ Duration.microsecondsPerHour;

    microseconds = microseconds.remainder(Duration.microsecondsPerHour);
    final minutes = microseconds ~/ Duration.microsecondsPerMinute;

    ret.timex =
        "(${pr1.timexStr},${pr2.timexStr}," "PT${(hours > 0 ? "${hours}H" : '')}${(minutes > 0 ? "${minutes}M" : '')})";
    ret.futureValue = ret.pastValue = (beginTime, endTime);
    ret.success = true;

    if (ampmStr1.isNotEmpty &&
        ampmStr1.endsWith(DateTimeConstants.Comment_AmPm) &&
        ampmStr2.isNotEmpty &&
        ampmStr2.endsWith(DateTimeConstants.Comment_AmPm)) {
      ret.comment = DateTimeConstants.Comment_AmPm;
    }

    if ((pr1.value as DateTimeResolutionResult).timeZoneResolution != null) {
      ret.timeZoneResolution = (pr1.value as DateTimeResolutionResult).timeZoneResolution;
    } else if ((pr2.value as DateTimeResolutionResult).timeZoneResolution != null) {
      ret.timeZoneResolution = (pr2.value as DateTimeResolutionResult).timeZoneResolution;
    }

    ret.subDateTimeEntities = <Object>[pr1, pr2];

    return ret;
  }

  // parse "morning", "afternoon", "night"
  DateTimeResolutionResult ParseTimeOfDay(String text, DateTime referenceTime) {
    int day = referenceTime.day, month = referenceTime.month, year = referenceTime.year;
    var ret = DateTimeResolutionResult();

    // extract early/late prefix from text
    var match = RegExpComposer.getMatchesSimple(config.TimeOfDayRegex(), text).firstOrNull;
    bool hasEarly = false, hasLate = false;
    if (match != null) {
      if (match.getGroup("early").value.isNotEmpty) {
        var early = match.getGroup("early").value;
        text = text.replaceAll(early, '');
        hasEarly = true;
        ret.comment = DateTimeConstants.Comment_Early;
        ret.mod = DateTimeConstants.EARLY_MOD;
      }

      if (!hasEarly && match.getGroup("late").value.isNotEmpty) {
        var late = match.getGroup("late").value;
        text = text.replaceAll(late, '');
        hasLate = true;
        ret.comment = DateTimeConstants.Comment_Late;
        ret.mod = DateTimeConstants.LATE_MOD;
      }
    }

    var (timex, beginHour, endHour, endMinSeg) = config.GetMatchedTimeRange(text);

    if (timex.isEmpty) {
      return DateTimeResolutionResult();
    }

    // Modify time period if "early" or "late" modifiers exist
    if (hasEarly) {
      endHour = beginHour + DateTimeConstants.EARLY_LATE_TIME_DELTA;

      // Handling case: night ends at 23:59, due to .NET limitation
      if (endMinSeg == 59) {
        endMinSeg = 0;
      }
    } else if (hasLate) {
      beginHour += DateTimeConstants.EARLY_LATE_TIME_DELTA;
    }

    ret.timex = timex;

    ret.futureValue = ret.pastValue = (
      DateUtil.createSafeDate(year, month, day, beginHour, 0, 0),
      DateUtil.createSafeDate(year, month, day, endHour, endMinSeg, endMinSeg)
    );

    ret.success = true;

    return ret;
  }
}

abstract interface class ITimePeriodParserConfiguration extends IDateTimeOptionsConfiguration {
  IDateTimeExtractor TimeExtractor();

  IDateTimeParser TimeParser();

  IExtractor integerExtractor();

  IDateTimeParser TimeZoneParser();

  RegExp PureNumberFromToRegex();

  RegExp PureNumberBetweenAndRegex();

  RegExp SpecificTimeFromToRegex();

  RegExp SpecificTimeBetweenAndRegex();

  RegExp TimeOfDayRegex();

  RegExp GeneralEndingRegex();

  RegExp TillRegex();

  Map<String, int> Numbers();

  IDateTimeUtilityConfiguration UtilityConfiguration();

  (String timex, int beginHour, int endHour, int endMin) GetMatchedTimeRange(String text);
}
