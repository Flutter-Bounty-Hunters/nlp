import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/ago_later_util.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseDateTimeParser implements IDateTimeParser {
  BaseDateTimeParser(this.config);

  final IDateTimeParserConfiguration config;

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) => candidateResults;

  @override
  String getParserName() => DateTimeConstants.SYS_DATETIME_DATETIME;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime reference) {
    var referenceTime = reference;

    Object? value;
    if (er.type == getParserName()) {
      var innerResult = MergeDateAndTime(er.text, referenceTime);

      if ((!innerResult.success) && (config.options.match(DateTimeOptions.TasksMode))) {
        innerResult = MergeHolidayAndTime(er.text, referenceTime);
      }

      if (!innerResult.success) {
        innerResult = ParseBasicRegex(er.text, referenceTime);
      }

      if (!innerResult.success) {
        innerResult = ParseTimeOfToday(er.text, referenceTime);
      }

      if (!innerResult.success) {
        innerResult = ParseSpecialTimeOfDate(er.text, referenceTime);
      }

      if (!innerResult.success) {
        innerResult = ParserDurationWithAgoAndLater(er.text, referenceTime);
      }

      if (innerResult.success) {
        innerResult.futureResolution = <String, String>{
          TimeTypeConstants.DATETIME: DateTimeFormatUtil.formatDateTime(innerResult.futureValue as DateTime),
        };

        innerResult.pastResolution = <String, String>{
          TimeTypeConstants.DATETIME: DateTimeFormatUtil.formatDateTime(innerResult.pastValue as DateTime),
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

  // Merge a Date entity and a Time entity
  DateTimeResolutionResult MergeDateAndTime(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();

    var er1 = config.DateExtractor().extractDateTime(text, referenceTime);
    if (er1.isEmpty) {
      er1 = config.DateExtractor().extractDateTime(config.TokenBeforeDate() + text, referenceTime);
      if (er1.length == 1) {
        er1[0].start -= config.TokenBeforeDate().length;
      } else {
        return ret;
      }
    } else {
      // This is to understand if there is an ambiguous token in the text. For some languages (e.g. spanish),
      // the same word could mean different things (e.g a time in the day or an specific day).
      if (config.ContainsAmbiguousToken(text, er1[0].text)) {
        return ret;
      }
    }

    var er2 = config.TimeExtractor().extractDateTime(text, referenceTime);
    if (er2.isEmpty) {
      // Here we filter out "morning, afternoon, night..." time entities
      var prefixToken = config.TokenBeforeTime();
      er2 = config.TimeExtractor().extractDateTime(prefixToken + text, referenceTime);

      if (er2.length == 1) {
        er2[0].start -= prefixToken.length;
      } else if (er2.isEmpty) {
        // check whether there is a number being used as a time point
        bool hasTimeNumber = false;
        var numErs = config.integerExtractor().extract(text);
        if (numErs.isNotEmpty && er1.length == 1) {
          for (var num in numErs) {
            var middleBegin = er1[0].start + er1[0].length;
            var middleEnd = num.start;
            if (middleBegin > middleEnd) {
              continue;
            }

            var middleStr = text.substring(middleBegin, middleEnd).trim();
            var match = config.DateNumberConnectorRegex().firstMatch(middleStr);
            if (middleStr.isEmpty || match != null) {
              num.type = DateTimeConstants.SYS_DATETIME_TIME;
              er2.add(num);
              hasTimeNumber = true;
            }
          }
        }

        if (!hasTimeNumber) {
          return ret;
        }
      }
    }

    // Handle cases like "Oct. 5 in the afternoon at 7:00";
    // in this case "5 in the afternoon" will be extracted as a Time entity
    var correctTimeIdx = 0;
    while (correctTimeIdx < er2.length && er2[correctTimeIdx].isOverlap(er1[0])) {
      correctTimeIdx++;
    }

    if (correctTimeIdx >= er2.length) {
      return ret;
    }

    var pr1 = config.DateParser().parseDateTime(er1[0], referenceTime);
    var pr2 = config.TimeParser().parseDateTime(er2[correctTimeIdx], referenceTime);
    if (pr1.value == null || pr2.value == null) {
      return ret;
    }

    var futureDate = (pr1.value as DateTimeResolutionResult).futureValue as DateTime;
    var pastDate = (pr1.value as DateTimeResolutionResult).pastValue as DateTime;
    var time = (pr2.value as DateTimeResolutionResult).futureValue as DateTime;

    var hour = time.hour;
    var min = time.minute;
    var sec = time.second;

    // Handle morning, afternoon
    if (config.PMTimeRegex().hasMatch(text) && WithinAfternoonHours(hour)) {
      hour += DateTimeConstants.HalfDayHourCount;
    } else if (config.AMTimeRegex().hasMatch(text) && WithinMorningHoursAndNoon(hour, min, sec)) {
      hour -= DateTimeConstants.HalfDayHourCount;
    }

    var timeStr = pr2.timexStr ?? '';
    if (timeStr.endsWith(DateTimeConstants.Comment_AmPm)) {
      timeStr = timeStr.substring(0, timeStr.length - 4);
    }

    timeStr = "T${hour.toString().padLeft(2, '0')}${timeStr.substring(3)}";
    ret.timex = (pr1.timexStr ?? '') + timeStr;

    var val = pr2.value as DateTimeResolutionResult;
    if (hour <= DateTimeConstants.HalfDayHourCount &&
        !config.PMTimeRegex().hasMatch(text) &&
        !config.AMTimeRegex().hasMatch(text) &&
        val.comment?.isNotEmpty == true) {
      ret.comment = DateTimeConstants.Comment_AmPm;
    }

    ret.futureValue = DateUtil.createSafeDate(futureDate.year, futureDate.month, futureDate.day, hour, min, sec);
    ret.pastValue = DateUtil.createSafeDate(pastDate.year, pastDate.month, pastDate.day, hour, min, sec);

    // Handle case like "Wed Oct 26 15:50:06 2016" which year and month separated by time.
    var timeSuffix = text.substring(er2[0].start + er2[0].length);
    var matchYear = RegExpComposer.getMatchesSimple(config.YearRegex(), timeSuffix).firstOrNull;
    if (matchYear != null &&
        ((pr1.value as DateTimeResolutionResult).futureValue as DateTime).year !=
            ((pr1.value as DateTimeResolutionResult).pastValue as DateTime).year) {
      var year = (config.DateExtractor() as BaseDateExtractor).getYearFromText(matchYear);
      var dateSuffix = text.substring(er1[0].start + er1[0].length);
      var checkYear =
          config.DateExtractor().getYearFromText(RegExpComposer.getMatchesSimple(config.YearRegex(), dateSuffix).first);

      if (year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum && year == checkYear) {
        ret.futureValue = DateUtil.createSafeDate(year, futureDate.month, futureDate.day, hour, min, sec);
        ret.pastValue = DateUtil.createSafeDate(year, pastDate.month, pastDate.day, hour, min, sec);
        ret.timex = year.toString() + (pr1.timexStr ?? '').substring(4) + timeStr;
      }
    }

    ret.success = true;

    // Change the value of time object
    pr2.timexStr = timeStr;
    if (ret.comment?.isNotEmpty == true) {
      (pr2.value as DateTimeResolutionResult).comment =
          ret.comment == DateTimeConstants.Comment_AmPm ? DateTimeConstants.Comment_AmPm : '';
    }

    // Add the date and time object in case we want to split them
    ret.subDateTimeEntities = <Object>[pr1, pr2];

    // Add timezone
    ret.timeZoneResolution = (pr2.value as DateTimeResolutionResult).timeZoneResolution;

    return ret;
  }

  static bool WithinAfternoonHours(int hour) {
    return hour < DateTimeConstants.HalfDayHourCount;
  }

  static bool WithinMorningHoursAndNoon(int hour, int min, int sec) {
    return hour > DateTimeConstants.HalfDayHourCount ||
        (hour == DateTimeConstants.HalfDayHourCount && (min > 0 || sec > 0));
  }

  DateTimeResolutionResult ParseBasicRegex(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    var trimmedText = text.trim();

    // Handle "now"
    if (config.NowRegex().matchExact(trimmedText, true) != null) {
      final timex = config.GetMatchedNowTimex(trimmedText);
      ret.timex = timex;
      ret.futureValue = ret.pastValue = referenceTime;
      ret.success = true;
      return ret;
    }

    return ret;
  }

  // Set Resolution of merged entity generated after merging of holiday entity and a time.
  DateTimeResolutionResult MergeHolidayAndTime(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();

    var er1 = config.HolidayExtractor().extractDateTime(text, referenceTime);

    if (er1.isEmpty) {
      er1 = config.HolidayExtractor().extractDateTime(config.TokenBeforeDate() + text, referenceTime);
      if (er1.length == 1) {
        er1[0].start -= config.TokenBeforeDate().length;
      } else {
        return ret;
      }
    } else {
      // This is to understand if there is an ambiguous token in the text. For some languages (e.g. spanish),
      // the same word could mean different things (e.g a time in the day or an specific day).
      if (config.ContainsAmbiguousToken(text, er1[0].text)) {
        return ret;
      }
    }

    var er2 = config.TimeExtractor().extractDateTime(text, referenceTime);
    if (er2.isEmpty) {
      // Here we filter out "morning, afternoon, night..." time entities
      var prefixToken = config.TokenBeforeTime();
      er2 = config.TimeExtractor().extractDateTime(prefixToken + text, referenceTime);

      if (er2.length == 1) {
        er2[0].start -= prefixToken.length;
      } else if (er2.isEmpty) {
        // check whether there is a number being used as a time point
        bool hasTimeNumber = false;
        var numErs = config.integerExtractor().extract(text);
        if (numErs.isNotEmpty && er1.length == 1) {
          for (var num in numErs) {
            var middleBegin = er1[0].start + er1[0].length;
            var middleEnd = num.start;
            if (middleBegin > middleEnd) {
              continue;
            }

            var middleStr = text.substring(middleBegin, middleEnd).trim();
            var match = config.DateNumberConnectorRegex().firstMatch(middleStr);
            if (middleStr.isEmpty || match != null) {
              num.type = DateTimeConstants.SYS_DATETIME_TIME;
              er2.add(num);
              hasTimeNumber = true;
            }
          }
        }

        if (!hasTimeNumber) {
          return ret;
        }
      }
    }

    var correctTimeIdx = 0;
    while (correctTimeIdx < er2.length && er2[correctTimeIdx].isOverlap(er1[0])) {
      correctTimeIdx++;
    }

    if (correctTimeIdx >= er2.length) {
      return ret;
    }

    var pr1 = config.HolidayTimeParser().parseDateTime(er1[0], referenceTime);

    var pr2 = config.TimeParser().parseDateTime(er2[correctTimeIdx], referenceTime);
    if (pr1.value == null || pr2.value == null) {
      return ret;
    }

    var futureDate = (pr1.value as DateTimeResolutionResult).futureValue as DateTime;
    var pastDate = (pr1.value as DateTimeResolutionResult).pastValue as DateTime;
    var time = (pr2.value as DateTimeResolutionResult).futureValue as DateTime;

    var hour = time.hour;
    var min = time.minute;
    var sec = time.second;

    // Handle morning, afternoon
    if (config.PMTimeRegex().hasMatch(text) && WithinAfternoonHours(hour)) {
      hour += DateTimeConstants.HalfDayHourCount;
    } else if (config.AMTimeRegex().hasMatch(text) && WithinMorningHoursAndNoon(hour, min, sec)) {
      hour -= DateTimeConstants.HalfDayHourCount;
    }

    var timeStr = pr2.timexStr ?? '';
    if (timeStr.endsWith(DateTimeConstants.Comment_AmPm)) {
      timeStr = timeStr.substring(0, timeStr.length - 4);
    }

    timeStr = "T${hour.toString().padLeft(2, '0')}${timeStr.substring(3)}";
    ret.timex = (pr1.timexStr ?? '') + timeStr;

    var val = pr2.value as DateTimeResolutionResult;
    if (hour <= DateTimeConstants.HalfDayHourCount &&
        !config.PMTimeRegex().hasMatch(text) &&
        !config.AMTimeRegex().hasMatch(text) &&
        val.comment?.isNotEmpty == true) {
      ret.comment = DateTimeConstants.Comment_AmPm;
    }

    ret.futureValue = DateUtil.createSafeDate(futureDate.year, futureDate.month, futureDate.day, hour, min, sec);
    ret.pastValue = DateUtil.createSafeDate(pastDate.year, pastDate.month, pastDate.day, hour, min, sec);

    // Handle case like "on christmas 15:50:06 2016" which year and holiday separated by time.
    var timeSuffix = text.substring(er2[0].start + er2[0].length);
    var matchYear = RegExpComposer.getMatchesSimple(config.YearRegex(), timeSuffix).firstOrNull;
    if (matchYear != null &&
        ((pr1.value as DateTimeResolutionResult).futureValue as DateTime).year !=
            ((pr1.value as DateTimeResolutionResult).pastValue as DateTime).year) {
      var year = (config.DateExtractor() as BaseDateExtractor).getYearFromText(matchYear);
      var dateSuffix = text.substring(er1[0].start + er1[0].length);
      var checkYear =
          config.DateExtractor().getYearFromText(RegExpComposer.getMatchesSimple(config.YearRegex(), dateSuffix).first);

      if (year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum && year == checkYear) {
        ret.futureValue = DateUtil.createSafeDate(year, futureDate.month, futureDate.day, hour, min, sec);
        ret.pastValue = DateUtil.createSafeDate(year, pastDate.month, pastDate.day, hour, min, sec);
        ret.timex = year.toString() + (pr1.timexStr ?? '').substring(4) + timeStr;
      }
    }

    ret.success = true;

    // Change the value of time object
    pr2.timexStr = timeStr;
    if (ret.comment?.isNotEmpty == true) {
      (pr2.value as DateTimeResolutionResult).comment =
          ret.comment == DateTimeConstants.Comment_AmPm ? DateTimeConstants.Comment_AmPm : '';
    }

    // Add the date and time object in case we want to split them
    ret.subDateTimeEntities = <Object>[pr1, pr2];

    // Add timezone
    ret.timeZoneResolution = (pr2.value as DateTimeResolutionResult).timeZoneResolution;

    return ret;
  }

  DateTimeResolutionResult ParseTimeOfToday(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    var trimmedText = text.trim();

    int hour = 0, min = 0, sec = 0;
    String timeStr = '';

    var wholeMatch = RegExpComposer.matchExact(config.SimpleTimeOfTodayAfterRegex(), trimmedText, true);

    wholeMatch ??= RegExpComposer.matchExact(config.SimpleTimeOfTodayBeforeRegex(), trimmedText, true);

    if (wholeMatch != null) {
      var hourStr = wholeMatch.getGroup(DateTimeConstants.HourGroupName).value;
      if (hourStr.isEmpty) {
        hourStr = wholeMatch.getGroup("hournum").value;
        hour = config.Numbers()[hourStr]!;
      } else {
        hour = int.parse(hourStr);
      }

      timeStr = "T${hour.toString().padLeft(2, '0')}";
    } else {
      var ers = config.TimeExtractor().extractDateTime(trimmedText, referenceTime);
      if (ers.length != 1) {
        var prefixToken = config.TokenBeforeTime();
        ers = config.TimeExtractor().extractDateTime(prefixToken + trimmedText, referenceTime);

        if (ers.length == 1) {
          ers[0].start -= prefixToken.length;
        } else {
          return ret;
        }
      }

      var pr = config.TimeParser().parseDateTime(ers[0], referenceTime);
      if (pr.value == null) {
        return ret;
      }

      // Add timezone
      ret.timeZoneResolution = (pr.value as DateTimeResolutionResult).timeZoneResolution;

      var time = (pr.value as DateTimeResolutionResult).futureValue as DateTime;

      hour = time.hour;
      min = time.minute;
      sec = time.second;
      timeStr = pr.timexStr ?? '';
    }

    var match = config.SpecificTimeOfDayRegex().firstMatch(trimmedText);

    if (match != null) {
      var matchStr = match.input.substring(match.start, match.end);

      // Handle "last", "next"
      var swift = config.GetSwiftDay(matchStr);

      var date = referenceTime.AddDays(swift);

      // Handle "morning", "afternoon"
      hour = config.GetHour(matchStr, hour);

      // In this situation, timeStr cannot end up with "ampm", because we always have a "morning" or "night"
      if (timeStr.endsWith(DateTimeConstants.Comment_AmPm)) {
        timeStr = timeStr.substring(0, timeStr.length - 4);
      }

      timeStr = "T${hour.toString().padLeft(2, '0')}${timeStr.substring(3)}";

      ret.timex = DateTimeFormatUtil.formatDate(date) + timeStr;
      ret.futureValue = ret.pastValue = DateUtil.createSafeDate(date.year, date.month, date.day, hour, min, sec);
      ret.success = true;
      return ret;
    }

    return ret;
  }

  DateTimeResolutionResult ParseSpecialTimeOfDate(String text, DateTime refDateTime) {
    var ret = ParseUnspecificTimeOfDate(text, refDateTime);

    if (ret.success) {
      return ret;
    }

    var ers = config.DateExtractor().extractDateTime(text, refDateTime);
    if (ers.length != 1) {
      return ret;
    }

    var beforeStr = text.substring(0, ers[0].start);
    var afterStr = text.substring(ers[0].start + ers[0].length);
    if (config.SpecificEndOfRegex().hasMatch(beforeStr) || config.SpecificEndOfRegex().hasMatch(afterStr)) {
      var pr = config.DateParser().parseDateTime(ers[0], refDateTime);
      var futureDate = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
      var pastDate = (pr.value as DateTimeResolutionResult).pastValue as DateTime;

      ret = DateTimeFormatUtil.ResolveEndOfDay(pr.timexStr ?? '', futureDate, pastDate);
    }

    return ret;
  }

  DateTimeResolutionResult ParseUnspecificTimeOfDate(String text, DateTime refDateTime) {
    // Handle 'eod', 'end of day'
    var ret = DateTimeResolutionResult();
    var eod = config.UnspecificEndOfRegex().firstMatch(text);
    if (eod != null) {
      ret = DateTimeFormatUtil.ResolveEndOfDay(DateTimeFormatUtil.formatDate(refDateTime), refDateTime, refDateTime);
    }

    return ret;
  }

  // Handle cases like "two hours ago"
  DateTimeResolutionResult ParserDurationWithAgoAndLater(String text, DateTime referenceTime) {
    return AgoLaterUtil.ParseDurationWithAgoAndLater(
        text,
        referenceTime,
        config.DurationExtractor(),
        config.DurationParser(),
        config.NumberParser(),
        config.UnitMap(),
        config.UnitRegex(),
        config.UtilityConfiguration(),
        config.GetSwiftDay);
  }
}

abstract interface class IDateTimeParserConfiguration extends IDateTimeOptionsConfiguration {
  String TokenBeforeDate();

  String TokenBeforeTime();

  IDateExtractor DateExtractor();

  IDateTimeExtractor HolidayExtractor();

  IDateTimeExtractor TimeExtractor();

  IDateTimeParser DateParser();

  IDateTimeParser TimeParser();

  IDateTimeParser HolidayTimeParser();

  IExtractor CardinalExtractor();

  IExtractor integerExtractor();

  IParser NumberParser();

  IDateTimeExtractor DurationExtractor();

  IDateTimeParser DurationParser();

  RegExp NowRegex();

  RegExp AMTimeRegex();

  RegExp PMTimeRegex();

  RegExp SimpleTimeOfTodayAfterRegex();

  RegExp SimpleTimeOfTodayBeforeRegex();

  RegExp SpecificTimeOfDayRegex();

  RegExp SpecificEndOfRegex();

  RegExp UnspecificEndOfRegex();

  RegExp UnitRegex();

  RegExp DateNumberConnectorRegex();

  RegExp YearRegex();

  Map<String, String> UnitMap();

  Map<String, int> Numbers();

  IDateTimeUtilityConfiguration UtilityConfiguration();

  bool ContainsAmbiguousToken(String text, String matchedText);

  String? GetMatchedNowTimex(String text);

  int GetSwiftDay(String text);

  int GetHour(String text, int hour);
}
