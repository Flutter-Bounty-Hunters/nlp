import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_util.dart';

import 'package:nlp/src/date_time/timezone_utility.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseDateTimePeriodParser implements IDateTimeParser {
  BaseDateTimePeriodParser(this.config);

  final IDateTimePeriodParserConfiguration config;

  @override
  String getParserName() => DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) => candidateResults;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime reference) {
    var referenceTime = reference;

    Object? value;
    if (er.type == getParserName()) {
      var innerResult = InternalParse(er.text, referenceTime);

      // Handling timeZone
      if (innerResult.success && TimeZoneUtility.ShouldResolveTimeZone(er, config.options)) {
        var metadata = er.data as Map<String, Object>;
        var timezoneEr = metadata[DateTimeConstants.SYS_DATETIME_TIMEZONE] as ExtractResult;
        var timezonePr = config.TimeZoneParser().parse(timezoneEr);
        if (timezonePr != null && timezonePr.value != null) {
          innerResult.timeZoneResolution = (timezonePr.value as DateTimeResolutionResult).timeZoneResolution;
        }
      }

      if (innerResult.success) {
        if (!IsBeforeOrAfterMod(innerResult.mod ?? '')) {
          innerResult.futureResolution = <String, String>{
            TimeTypeConstants.START_DATETIME:
                DateTimeFormatUtil.formatDateTime((innerResult.futureValue as (DateTime, DateTime)).$1),
            TimeTypeConstants.END_DATETIME:
                DateTimeFormatUtil.formatDateTime((innerResult.futureValue as (DateTime, DateTime)).$2),
          };

          innerResult.pastResolution = <String, String>{
            TimeTypeConstants.START_DATETIME:
                DateTimeFormatUtil.formatDateTime((innerResult.pastValue as (DateTime, DateTime)).$1),
            TimeTypeConstants.END_DATETIME:
                DateTimeFormatUtil.formatDateTime((innerResult.pastValue as (DateTime, DateTime)).$2),
          };
        } else {
          if (innerResult.mod == DateTimeConstants.AFTER_MOD) {
            // Cases like "1/1/2015 after 2:00" there is no EndTime
            innerResult.futureResolution = <String, String>{
              TimeTypeConstants.START_DATETIME: DateTimeFormatUtil.formatDateTime(innerResult.futureValue as DateTime),
            };

            innerResult.pastResolution = <String, String>{
              TimeTypeConstants.START_DATETIME: DateTimeFormatUtil.formatDateTime(innerResult.pastValue as DateTime),
            };
          } else {
            // Cases like "1/1/2015 before 5:00 in the afternoon" there is no StartTime
            innerResult.futureResolution = <String, String>{
              TimeTypeConstants.END_DATETIME: DateTimeFormatUtil.formatDateTime(innerResult.futureValue as DateTime),
            };

            innerResult.pastResolution = <String, String>{
              TimeTypeConstants.END_DATETIME: DateTimeFormatUtil.formatDateTime(innerResult.pastValue as DateTime),
            };
          }
        }

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

  List<DateTimeParseResult> FilterResults(String query, List<DateTimeParseResult> candidateResults) {
    return candidateResults;
  }

  DateTimeResolutionResult InternalParse(String entityText, DateTime referenceTime) {
    var innerResult = MergeDateWithSingleTimePeriod(entityText, referenceTime);

    if (!innerResult.success) {
      innerResult = MergeTwoTimePoints(entityText, referenceTime);
    }

    if (!innerResult.success) {
      innerResult = ParseSpecificTimeOfDay(entityText, referenceTime);
    }

    if (!innerResult.success) {
      innerResult = ParseDateWithPeriodPrefix(entityText, referenceTime);
    }

    if (!innerResult.success) {
      // Cases like "today after 2:00pm", "1/1/2015 before 2:00 in the afternoon"
      innerResult = ParseDateWithTimePeriodSuffix(entityText, referenceTime);
    }

    if (!innerResult.success) {
      innerResult = ParseDuration(entityText, referenceTime);
    }

    if (!innerResult.success) {
      innerResult = ParseRelativeUnit(entityText, referenceTime);
    }

    return innerResult;
  }

  // parse specific TimeOfDay like "this night", "early morning", "late evening"
  DateTimeResolutionResult ParseSpecificTimeOfDay(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    var trimmedText = text.trim();
    var timeText = trimmedText;

    var match = RegExpComposer.getMatchesSimple(config.PeriodTimeOfDayWithDateRegex(), trimmedText).firstOrNull;

    // Extract early/late prefix from text if any
    bool hasEarly = false, hasLate = false;
    if (match != null) {
      timeText = match.getGroup(DateTimeConstants.TimeOfDayGroupName).value;

      if (match.getGroup("early").value.isNotEmpty) {
        hasEarly = true;
        ret.comment = DateTimeConstants.Comment_Early;
        ret.mod = DateTimeConstants.EARLY_MOD;
      }

      if (!hasEarly && match.getGroup("late").value.isNotEmpty) {
        hasLate = true;
        ret.comment = DateTimeConstants.Comment_Late;
        ret.mod = DateTimeConstants.LATE_MOD;
      }
    } else {
      match = RegExpComposer.getMatchesSimple(config.AmDescRegex(), trimmedText).firstOrNull;
      if (match == null) {
        match = RegExpComposer.getMatchesSimple(config.PmDescRegex(), trimmedText).firstOrNull;
      }

      if (match != null) {
        timeText = match.value;
      }
    }

    // Handle time of day

    // Late/early only works with time of day
    // Only standard time of day (morning, afternoon, evening and night) will not directly return
    var (String timeStr, int beginHour, int endHour, int endMin) = config.GetMatchedTimeRange(timeText);
    if (timeStr.isEmpty) {
      return ret;
    }

    // Modify time period if "early" or "late" exists
    // Since 'time of day' is defined as four hour periods
    // the first 2 hours represent early, the later 2 hours represent late
    if (hasEarly) {
      endHour = beginHour + DateTimeConstants.EARLY_LATE_TIME_DELTA;

      // Handling special case: night ends at 23:59 due to .NET issues.
      if (endMin == 59) {
        endMin = 0;
      }
    } else if (hasLate) {
      beginHour += DateTimeConstants.EARLY_LATE_TIME_DELTA;
    }

    if (config.SpecificTimeOfDayRegex().matchExact(trimmedText, true) != null) {
      var swift = config.GetSwiftPrefix(trimmedText);

      var date = referenceTime.AddDays(swift);
      int day = date.day, month = date.month, year = date.year;

      ret.timex = DateTimeFormatUtil.formatDate(date) + timeStr;

      ret.futureValue = ret.pastValue = (
        DateUtil.createSafeDate(year, month, day, beginHour, 0, 0),
        DateUtil.createSafeDate(year, month, day, endHour, endMin, endMin)
      );

      ret.success = true;
      return ret;
    }

    // Handle day followed by morning, afternoon and morning, afternoon followed by day
    match = RegExpComposer.getMatchesSimple(config.PeriodTimeOfDayWithDateRegex(), trimmedText).firstOrNull;

    if (match == null) {
      match = RegExpComposer.getMatchesSimple(config.AmDescRegex(), trimmedText).firstOrNull;
      match ??= RegExpComposer.getMatchesSimple(config.PmDescRegex(), trimmedText).firstOrNull;
    }

    if (match == null && (config.options.match(DateTimeOptions.TasksMode))) {
      match = RegExpComposer.getMatchesSimple(config.TasksmodeMealTimeofDayRegex(), trimmedText).firstOrNull;
    }

    if (match != null) {
      var beforeStr = trimmedText.substring(0, match.index).trim();
      var afterStr = trimmedText.substring(match.index + match.length).trim();

      // Eliminate time period, if any
      var timePeriodErs = config.TimePeriodExtractor().extractDateTime(beforeStr, referenceTime);
      if (timePeriodErs.isNotEmpty) {
        beforeStr =
            beforeStr.replaceRange(timePeriodErs[0].start, timePeriodErs[0].start + timePeriodErs[0].length, '').trim();
      } else {
        timePeriodErs = config.TimePeriodExtractor().extractDateTime(afterStr, referenceTime);
        if (timePeriodErs.isNotEmpty) {
          afterStr = afterStr
              .replaceRange(timePeriodErs[0].start, timePeriodErs[0].start + timePeriodErs[0].length, '')
              .trim();
        }
      }

      var ers = config.DateExtractor().extractDateTime('$beforeStr $afterStr', referenceTime);

      if (config.options.match(DateTimeOptions.TasksMode)) {
        ers.addAll(config.HolidayExtractor().extractDateTime('$beforeStr $afterStr', referenceTime));
      }

      // Consider cases with specific time of day e.g. "between 7 and 9:30 last night"
      if (ers.isEmpty) {
        match = RegExpComposer.getMatchesSimple(config.SpecificTimeOfDayRegex(), trimmedText).firstOrNull;
        if (match != null) {
          var matchStr = match.value;

          // Handle "last", "next"
          var swift = config.GetSwiftPrefix(matchStr);
          var timeOfDayDate = referenceTime.AddDays(swift);

          var datetimexStr = DateTimeFormatUtil.formatDate(timeOfDayDate);

          var futDate = DateUtil.createSafeDate(timeOfDayDate.year, timeOfDayDate.month, timeOfDayDate.day, 0, 0, 0);
          var pasDate = futDate;

          var timePeriodParseResult =
              timePeriodErs.isNotEmpty ? config.TimePeriodParser().parse(timePeriodErs[0]) : null;
          var timePeriodResolutionResult =
              timePeriodErs.isNotEmpty ? timePeriodParseResult?.value as DateTimeResolutionResult : null;

          if (timePeriodResolutionResult == null) {
            return ParsePureNumberCases(text, referenceTime);
          }

          var periodTimex = timePeriodResolutionResult.timex ?? '';

          var rangeTimexComponents = TimexUtility.GetRangeTimexComponents(periodTimex);

          if (rangeTimexComponents.isValid) {
            var beginTimex = TimexUtility.CombineDateAndTimeTimex(datetimexStr, rangeTimexComponents.beginTimex);
            var endTimex = TimexUtility.CombineDateAndTimeTimex(datetimexStr, rangeTimexComponents.endTimex);

            var timePeriodFutureValue = timePeriodResolutionResult.futureValue as (DateTime, DateTime);
            var beginTime = timePeriodFutureValue.$1;
            var endTime = timePeriodFutureValue.$2;
            var hour1 = beginTime.hour;
            var hour2 = endTime.hour;

            if (match.getGroup("pm").value.isNotEmpty) {
              if (hour1 <= DateTimeConstants.HalfDayHourCount) {
                hour1 += DateTimeConstants.HalfDayHourCount;
                List<String> timexList = (beginTimex.split('T'));
                beginTimex = '${timexList[0]}T$hour1${timexList[1].substring(2)}';
              }

              if (hour2 <= DateTimeConstants.HalfDayHourCount) {
                hour2 += DateTimeConstants.HalfDayHourCount;
                List<String> timexList = endTimex.split('T');
                endTimex = '${timexList[0]}T$hour2${timexList[1].substring(2)}';
              }
            }

            ret.timex =
                TimexUtility.GenerateDateTimePeriodTimex(beginTimex, endTimex, rangeTimexComponents.durationTimex);

            ret.futureValue = (
              DateUtil.createSafeDate(
                  futDate.year, futDate.month, futDate.day, hour1, beginTime.minute, beginTime.second),
              DateUtil.createSafeDate(futDate.year, futDate.month, futDate.day, hour2, endTime.minute, endTime.second)
            );

            ret.pastValue = (
              DateUtil.createSafeDate(
                  pasDate.year, pasDate.month, pasDate.day, hour1, beginTime.minute, beginTime.second),
              DateUtil.createSafeDate(pasDate.year, pasDate.month, pasDate.day, hour2, endTime.minute, endTime.second)
            );

            ret.success = true;

            return ret;
          }
        }
      }

      if (ers.isEmpty || ers[0].length < beforeStr.length) {
        var valid = false;

        if (ers.isNotEmpty && ers[0].start == 0) {
          var midStr = beforeStr.substring(ers[0].start + ers[0].length ?? 0);
          if (midStr.replaceAll(',', ' ').trim().isEmpty) {
            valid = true;
          }
        }

        if (!valid) {
          ers = config.DateExtractor().extractDateTime(afterStr, referenceTime);

          if (config.options.match(DateTimeOptions.TasksMode)) {
            ers.addAll(config.HolidayExtractor().extractDateTime('$beforeStr $afterStr', referenceTime));
          }

          if (ers.isEmpty || ers[0].length != afterStr.length) {
            if (ers.isNotEmpty && ers[0].start + ers[0].length == afterStr.length) {
              var midStr = afterStr.substring(0, ers[0].start ?? 0);
              if (midStr.replaceAll(',', ' ').trim().isEmpty) {
                valid = true;
              }
            }
          } else {
            valid = true;
          }
        }

        if (!valid) {
          return ret;
        }
      }

      var hasSpecificTimePeriod = false;
      if (timePeriodErs.isNotEmpty) {
        var timePr = config.TimePeriodParser().parseDateTime(timePeriodErs[0], referenceTime);
        if (timePr != null) {
          var periodFuture = (timePr.value as DateTimeResolutionResult).futureValue as (DateTime, DateTime);
          var periodPast = (timePr.value as DateTimeResolutionResult).pastValue as (DateTime, DateTime);

          if (periodFuture == periodPast) {
            beginHour = periodFuture.$1.hour;
            endHour = periodFuture.$2.hour;
          } else {
            if (periodFuture.$1.hour >= beginHour || periodFuture.$2.hour <= endHour) {
              beginHour = periodFuture.$1.hour;
              endHour = periodFuture.$2.hour;
            } else {
              beginHour = periodPast.$1.hour;
              endHour = periodPast.$2.hour;
            }
          }

          hasSpecificTimePeriod = true;
        }
      }

      var pr = config.DateParser().parseDateTime(ers[0], referenceTime);

      if (pr.value == null && (config.options.match(DateTimeOptions.TasksMode))) {
        pr = config.HolidayTimeParser().parseDateTime(ers[0], referenceTime);
      }

      var futureDate = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
      var pastDate = (pr.value as DateTimeResolutionResult).pastValue as DateTime;

      if (!hasSpecificTimePeriod) {
        ret.timex = (pr.timexStr ?? '') + timeStr;
      } else {
        ret.timex = "(${pr.timexStr}T$beginHour,${pr.timexStr}T$endHour,PT${endHour - beginHour}H)";
      }

      ret.futureValue = (
        DateUtil.createSafeDate(futureDate.year, futureDate.month, futureDate.day, beginHour, 0, 0),
        DateUtil.createSafeDate(futureDate.year, futureDate.month, futureDate.day, endHour, endMin, endMin)
      );

      ret.pastValue = (
        DateUtil.createSafeDate(pastDate.year, pastDate.month, pastDate.day, beginHour, 0, 0),
        DateUtil.createSafeDate(pastDate.year, pastDate.month, pastDate.day, endHour, endMin, endMin)
      );

      ret.success = true;

      return ret;
    }

    return ret;
  }

  bool IsBeforeOrAfterMod(String mod) {
    if (!config.CheckBothBeforeAfter()) {
      return mod.isNotEmpty && (mod == DateTimeConstants.BEFORE_MOD || mod == DateTimeConstants.AFTER_MOD);
    } else {
      // matches with InclusiveModPrepositions are also parsed here
      return mod.isNotEmpty &&
          (mod == DateTimeConstants.BEFORE_MOD ||
              mod == DateTimeConstants.AFTER_MOD ||
              mod == DateTimeConstants.UNTIL_MOD ||
              mod == DateTimeConstants.SINCE_MOD);
    }
  }

  // Cases like "today after 2:00pm", "1/1/2015 before 2:00 in the afternoon"
  DateTimeResolutionResult ParseDateWithTimePeriodSuffix(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();

    var dateEr = config.DateExtractor().extractDateTime(text, referenceTime).firstOrNull;

    if (dateEr == null && (config.options.match(DateTimeOptions.TasksMode))) {
      dateEr = config.HolidayExtractor().extractDateTime(text, referenceTime).firstOrNull;
    }

    var timeEr = config.TimeExtractor().extractDateTime(text, referenceTime).firstOrNull;

    if (dateEr != null && timeEr != null) {
      var dateStrEnd = (dateEr.start + dateEr.length);
      var timeStrEnd = (timeEr.start + timeEr.length);

      if (dateStrEnd < timeEr.start) {
        var midStr = text.substring(dateStrEnd, timeEr.start - dateStrEnd).trim();
        var afterStr = text.substring(timeStrEnd);

        String? modStr = GetValidConnectorModForDateAndTimePeriod(midStr, true);

        // check also afterStr
        if (modStr.isEmpty && config.CheckBothBeforeAfter()) {
          modStr = midStr.length <= 4 ? GetValidConnectorModForDateAndTimePeriod(afterStr, false) : null;
        }

        if (modStr?.isNotEmpty == true) {
          var datePr = config.DateParser().parseDateTime(dateEr, referenceTime);

          if ((config.options.match(DateTimeOptions.TasksMode)) && (datePr.value == null)) {
            datePr = config.HolidayTimeParser().parseDateTime(dateEr, referenceTime);
          }

          var timePr = config.TimeParser().parseDateTime(timeEr, referenceTime);

          if (datePr.value != null && timePr.value != null) {
            var timeResolutionResult = timePr.value as DateTimeResolutionResult;
            var dateResolutionResult = datePr.value as DateTimeResolutionResult;
            var futureDateValue = dateResolutionResult.futureValue as DateTime;
            var pastDateValue = dateResolutionResult.pastValue as DateTime;
            var futureTimeValue = timeResolutionResult.futureValue as DateTime;
            var pastTimeValue = timeResolutionResult.pastValue as DateTime;

            ret.comment = timeResolutionResult.comment;
            ret.timex = "${datePr.timexStr}${timePr.timexStr}";

            ret.futureValue = DateUtil.createSafeDate(futureDateValue.year, futureDateValue.month, futureDateValue.day,
                futureTimeValue.hour, futureTimeValue.minute, futureTimeValue.second);

            ret.pastValue = DateUtil.createSafeDate(pastDateValue.year, pastDateValue.month, pastDateValue.day,
                pastTimeValue.hour, pastTimeValue.minute, pastTimeValue.second);

            ret.mod = modStr;
            ret.subDateTimeEntities = <Object>[
              datePr,
              timePr,
            ];

            ret.success = true;
          }
        }
      }
    }

    return ret;
  }

  // Cases like "today after 2:00pm", "1/1/2015 before 2:00 in the afternoon"
  // Valid connector in English for Before include: "before", "no later than", "in advance of", "prior to", "earlier than", "sooner than", "by", "till", "until"...
  // Valid connector in English for After include: "after", "later than"
  String GetValidConnectorModForDateAndTimePeriod(String text, bool inPrefix) {
    String? mod;

    // $1 is the regex to be tested
    // $2 is the mod corresponding to an inclusive match (i.e. containing an InclusiveModPrepositions, e.g. "at or before 3")
    // Item3 is the mod corresponding to a non-inclusive match (e.g. "before 3")
    var beforeAfterRegexTuples = <(RegExp, String, String)>[
      (config.BeforeRegex(), DateTimeConstants.UNTIL_MOD, DateTimeConstants.BEFORE_MOD),
      (config.AfterRegex(), DateTimeConstants.SINCE_MOD, DateTimeConstants.AFTER_MOD),
    ];

    for (var regex in beforeAfterRegexTuples) {
      NlpMatch? match = inPrefix //
          ? RegExpComposer.matchExact(regex.$1, text, true)
          : RegExpComposer.matchBegin(regex.$1, text, true);
      if (match != null) {
        mod = inPrefix
            ? regex.$3
            : (match.getGroup(DateTimeConstants.IncludeGroupName).value.isNotEmpty ? regex.$2 : regex.$3);
        return mod;
      }
    }

    return mod ?? '';
  }

  DateTimeResolutionResult ParseDateWithPeriodPrefix(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();

    var dateResult = config.DateExtractor().extractDateTime(text, referenceTime);

    if (config.options.match(DateTimeOptions.TasksMode)) {
      dateResult.addAll(config.HolidayExtractor().extractDateTime(text, referenceTime));
    }

    if (dateResult.length > 0) {
      DateTimeParseResult pr = DateTimeParseResult(start: 0, length: 0, text: '');
      var beforeString = text.substring(0, dateResult.last.start).trimRight();
      var match = RegExpComposer.getMatchesSimple(config.PrefixDayRegex(), beforeString).firstOrNull;
      if (match != null) {
        pr = config.DateParser().parseDateTime(dateResult.last, referenceTime);

        if ((pr.value == null) && (config.options.match(DateTimeOptions.TasksMode))) {
          pr = config.HolidayTimeParser().parseDateTime(dateResult.last, referenceTime);
        }
      }

      // Check also afterString
      if (match == null && config.CheckBothBeforeAfter()) {
        var afterString = text
            .substring((dateResult.first.start + dateResult.first.length),
                text.length - ((dateResult.first.start + dateResult.first.length)))
            .trimLeft();
        match = RegExpComposer.getMatchesSimple(config.PrefixDayRegex(), afterString).firstOrNull;
        if (match != null) {
          pr = config.DateParser().parseDateTime(dateResult.first, referenceTime);

          if ((pr.value == null) && (config.options.match(DateTimeOptions.TasksMode))) {
            pr = config.HolidayTimeParser().parseDateTime(dateResult.first, referenceTime);
          }
        }
      }

      if (match != null) {
        if (pr.value != null) {
          var startTime = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
          startTime = DateTime(startTime.year, startTime.month, startTime.day);
          var endTime = startTime;

          if (match.getGroup("EarlyPrefix").success) {
            endTime = endTime.AddHours(DateTimeConstants.HalfDayHourCount);
            ret.mod = DateTimeConstants.EARLY_MOD;
          } else if (match.getGroup("MidPrefix").success) {
            startTime =
                startTime.AddHours(DateTimeConstants.HalfDayHourCount - DateTimeConstants.HalfMidDayDurationHourCount);
            endTime =
                endTime.AddHours(DateTimeConstants.HalfDayHourCount + DateTimeConstants.HalfMidDayDurationHourCount);
            ret.mod = DateTimeConstants.MID_MOD;
          } else if (match.getGroup("LatePrefix").success) {
            startTime = startTime.AddHours(DateTimeConstants.HalfDayHourCount);
            endTime = startTime.AddHours(DateTimeConstants.HalfDayHourCount);
            ret.mod = DateTimeConstants.LATE_MOD;
          } else {
            return ret;
          }

          ret.timex = pr.timexStr;

          ret.pastValue = ret.futureValue = (startTime, endTime);

          ret.success = true;
        }
      }
    }

    return ret;
  }

  DateTimeResolutionResult MergeDateWithSingleTimePeriod(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    var trimmedText = text.trim();

    var ers = config.TimePeriodExtractor().extractDateTime(trimmedText, referenceTime);

    if (ers.length == 0) {
      return ParsePureNumberCases(text, referenceTime);
    } else if (ers.length == 1) {
      var timePeriodParseResult = config.TimePeriodParser().parse(ers[0]);
      var timePeriodResolutionResult = timePeriodParseResult?.value as DateTimeResolutionResult?;

      if (timePeriodResolutionResult == null) {
        return ParsePureNumberCases(text, referenceTime);
      }

      var periodTimex = timePeriodResolutionResult.timex ?? '';

      // If it is a range type timex
      if (TimexUtility.IsRangeTimex(periodTimex)) {
        var dateResult = config.DateExtractor().extractDateTime(trimmedText.replaceAll(ers[0].text, ''), referenceTime);

        if (config.options.match(DateTimeOptions.TasksMode)) {
          dateResult.addAll(
              config.HolidayExtractor().extractDateTime(trimmedText.replaceAll(ers[0].text, ''), referenceTime));
        }

        // Try to add TokenBeforeDate if no result is found because it is not always included in the DateTimePeriod extraction
        // (e.g. "I'll leave on the 17 from 2 to 4 pm" -> "the 17 from 2 to 4 pm")
        if (dateResult.length == 0) {
          dateResult = config.DateExtractor()
              .extractDateTime(config.TokenBeforeDate() + trimmedText.substring(0, ers[0].start), referenceTime);

          if (config.options.match(DateTimeOptions.TasksMode)) {
            dateResult.addAll(config.HolidayExtractor()
                .extractDateTime(config.TokenBeforeDate() + trimmedText.substring(0, ers[0].start), referenceTime));
          }
        }

        // check if TokenBeforeDate and TokenBeforeTime are null
        var dateText = trimmedText.replaceAll(ers[0].text, '').trim();
        dateText = config.TokenBeforeDate().isNotEmpty && dateText.startsWith(config.TokenBeforeDate())
            ? dateText.replaceAll(config.TokenBeforeDate(), '').trim()
            : dateText;
        dateText = config.TokenBeforeTime().isNotEmpty
            ? dateText.replaceAll(config.TokenBeforeTime().trim(), '').trim()
            : dateText;
        if (config.CheckBothBeforeAfter()) {
          List<String> tokenListBeforeDate = config.TokenBeforeDate().split('|');
          for (String token in tokenListBeforeDate.where((n) => n.isNotEmpty)) {
            dateText = dateText.replaceAll(token, '').trim();
          }
        }

        // If only one day is extracted and the day text equals to the rest part of source text
        if (dateResult.length == 1 && dateText == dateResult[0].text) {
          String dateTimex;
          DateTime futureTime;
          DateTime pastTime;

          var pr = config.DateParser().parseDateTime(dateResult[0], referenceTime);

          if ((pr.value == null) && (config.options.match(DateTimeOptions.TasksMode))) {
            pr = config.HolidayTimeParser().parseDateTime(dateResult[0], referenceTime);
          }

          if (pr.value != null) {
            futureTime = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
            pastTime = (pr.value as DateTimeResolutionResult).pastValue as DateTime;

            dateTimex = pr.timexStr ?? '';
          } else {
            return ParsePureNumberCases(text, referenceTime);
          }

          var rangeTimexComponents = TimexUtility.GetRangeTimexComponents(periodTimex);

          if (rangeTimexComponents.isValid) {
            var beginTimex = TimexUtility.CombineDateAndTimeTimex(dateTimex, rangeTimexComponents.beginTimex);
            var endTimex = TimexUtility.CombineDateAndTimeTimex(dateTimex, rangeTimexComponents.endTimex);
            ret.timex =
                TimexUtility.GenerateDateTimePeriodTimex(beginTimex, endTimex, rangeTimexComponents.durationTimex);

            var timePeriodFutureValue = timePeriodResolutionResult.futureValue as (DateTime, DateTime);
            var beginTime = timePeriodFutureValue.$1;
            var endTime = timePeriodFutureValue.$2;

            ret.futureValue = (
              DateUtil.createSafeDate(futureTime.year, futureTime.month, futureTime.day, beginTime.hour,
                  beginTime.minute, beginTime.second),
              DateUtil.createSafeDate(
                  futureTime.year, futureTime.month, futureTime.day, endTime.hour, endTime.minute, endTime.second)
            );

            ret.pastValue = (
              DateUtil.createSafeDate(
                  pastTime.year, pastTime.month, pastTime.day, beginTime.hour, beginTime.minute, beginTime.second),
              DateUtil.createSafeDate(
                  pastTime.year, pastTime.month, pastTime.day, endTime.hour, endTime.minute, endTime.second)
            );

            if (timePeriodResolutionResult.comment?.isNotEmpty == true &&
                timePeriodResolutionResult.comment == DateTimeConstants.Comment_AmPm) {
              // AmPm comment is used for later SetParserResult to judge whether this parse result should have two parsing results
              // Cases like "from 10:30 to 11 on 1/1/2015" should have AmPm comment, as it can be parsed to "10:30am to 11am" and also be parsed to "10:30pm to 11pm"
              // Cases like "from 10:30 to 3 on 1/1/2015" should not have AmPm comment
              if (beginTime.hour < DateTimeConstants.HalfDayHourCount &&
                  endTime.hour < DateTimeConstants.HalfDayHourCount) {
                ret.comment = DateTimeConstants.Comment_AmPm;
              }
            }

            ret.success = true;
            ret.subDateTimeEntities = <Object>[pr, if (timePeriodParseResult != null) timePeriodParseResult];

            return ret;
          }
        }

        return ParsePureNumberCases(text, referenceTime);
      }
    }

    return ret;
  }

  // Handle cases like "Monday 7-9", where "7-9" can't be extracted by the TimePeriodExtractor
  DateTimeResolutionResult ParsePureNumberCases(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    var trimmedText = text.trim();

    var match = RegExpComposer.getMatchesSimple(config.PureNumberFromToRegex(), trimmedText).firstOrNull;

    match ??= RegExpComposer.getMatchesSimple(config.PureNumberBetweenAndRegex(), trimmedText).firstOrNull;

    if (match != null && (match.index == 0 || match.index + match.length == trimmedText.length)) {
      // Just because we think we found a time period doesn't mean it is one, it could be the start of a hyphenated date
      var hyphenDateMatch = RegExpComposer.getMatchesSimple(config.HyphenDateRegex(), trimmedText).firstOrNull;

      if (hyphenDateMatch != null &&
          hyphenDateMatch.index >= match.index &&
          (match.index + match.length) <= (hyphenDateMatch.index + hyphenDateMatch.length)) {
        return ret;
      }

      var (text, beginHour, endHour) = ParseTimePeriod(match, 0, 0);
      ret.comment = text;

      var dateStr = '';

      // parse following date
      var dateExtractResult =
          config.DateExtractor().extractDateTime(trimmedText.replaceAll(match.value, ''), referenceTime);

      if (config.options.match(DateTimeOptions.TasksMode)) {
        dateExtractResult
            .addAll(config.HolidayExtractor().extractDateTime(trimmedText.replaceAll(match.value, ''), referenceTime));
      }

      // Try to add TokenBeforeDate if no result is found because it is not always included in the DateTimePeriod extraction
      // (e.g. "I'll leave on the 17 from 2 to 4 pm" -> "the 17 from 2 to 4 pm")
      if (dateExtractResult.length == 0) {
        dateExtractResult = config.DateExtractor()
            .extractDateTime(config.TokenBeforeDate() + trimmedText.substring(0, match.index), referenceTime);

        if (config.options.match(DateTimeOptions.TasksMode)) {
          dateExtractResult.addAll(config.HolidayExtractor()
              .extractDateTime(config.TokenBeforeDate() + trimmedText.substring(0, match.index), referenceTime));
        }
      }

      DateTime futureDate, pastDate;
      if (dateExtractResult.length > 0) {
        var pr = config.DateParser().parseDateTime(dateExtractResult[0], referenceTime);

        if ((config.options.match(DateTimeOptions.TasksMode)) && (pr.value == null)) {
          pr = config.HolidayTimeParser().parseDateTime(dateExtractResult[0], referenceTime);
        }

        if (pr.value != null) {
          futureDate = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
          pastDate = (pr.value as DateTimeResolutionResult).pastValue as DateTime;

          dateStr = pr.timexStr ?? '';
        } else {
          return ret;
        }
      } else {
        // Consider cases with specific time of day e.g. "between 7 and 9 last night"
        match = RegExpComposer.getMatchesSimple(config.SpecificTimeOfDayRegex(), trimmedText).firstOrNull;
        if (match != null) {
          var matchStr = match.value;
          ret.comment = null;

          // Handle "last", "next"
          var swift = config.GetSwiftPrefix(matchStr);
          var timeOfDayDate = referenceTime.AddDays(swift);

          dateStr = DateTimeFormatUtil.formatDate(timeOfDayDate);

          futureDate = DateUtil.createSafeDate(timeOfDayDate.year, timeOfDayDate.month, timeOfDayDate.day, 0, 0, 0);
          pastDate = futureDate;

          if (match.getGroup("pm").success) {
            if (beginHour <= DateTimeConstants.HalfDayHourCount) {
              beginHour += DateTimeConstants.HalfDayHourCount;
            }

            if (endHour <= DateTimeConstants.HalfDayHourCount) {
              endHour += DateTimeConstants.HalfDayHourCount;
            }
          }
        } else {
          return ret;
        }
      }

      var pastHours = endHour - beginHour;
      var beginTimex = TimexUtility.CombineDateAndTimeTimex(dateStr, DateTimeFormatUtil.ShortTime(beginHour));
      var endTimex = TimexUtility.CombineDateAndTimeTimex(dateStr, DateTimeFormatUtil.ShortTime(endHour));
      var durationTimex =
          TimexUtility.GenerateDurationTimex((endHour - beginHour).toDouble(), DateTimeConstants.TimexHour, true);

      ret.timex = TimexUtility.GenerateDateTimePeriodTimex(beginTimex, endTimex, durationTimex);

      ret.futureValue = (
        DateUtil.createSafeDate(futureDate.year, futureDate.month, futureDate.day, beginHour, 0, 0),
        DateUtil.createSafeDate(futureDate.year, futureDate.month, futureDate.day, endHour, 0, 0)
      );

      ret.pastValue = (
        DateUtil.createSafeDate(pastDate.year, pastDate.month, pastDate.day, beginHour, 0, 0),
        DateUtil.createSafeDate(pastDate.year, pastDate.month, pastDate.day, endHour, 0, 0)
      );

      ret.success = true;
    }

    return ret;
  }

  (String time, int beginHour, int endHour) ParseTimePeriod(NlpMatch match, int beginHour, int endHour) {
    // This "from .. to .." pattern is valid if followed by a day OR "pm"
    var hasAm = false;
    var hasPm = false;
    var comments = '';

    // Get hours
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

    // parse "pm"
    var matchPmStr = match.getGroup(DateTimeConstants.PmGroupName).value;
    var matchAmStr = match.getGroup(DateTimeConstants.AmGroupName).value;
    var descStr = match.getGroup(DateTimeConstants.DescGroupName).value;
    var beginDescStr = match.getGroup(DateTimeConstants.LeftAmPmGroupName).value;
    var endDescStr = match.getGroup(DateTimeConstants.RightAmPmGroupName).value;

    if (beginDescStr.isNotEmpty && endDescStr.isNotEmpty) {
      if (beginDescStr.startsWith("a")) {
        if (beginHour >= DateTimeConstants.HalfDayHourCount) {
          beginHour -= DateTimeConstants.HalfDayHourCount;
        }

        hasAm = true;
      } else if (beginDescStr.startsWith("p")) {
        if (beginHour < DateTimeConstants.HalfDayHourCount) {
          beginHour += DateTimeConstants.HalfDayHourCount;
        }

        hasPm = true;
      }

      if (endDescStr.isNotEmpty && endDescStr.startsWith("a")) {
        if (endHour >= DateTimeConstants.HalfDayHourCount) {
          endHour -= DateTimeConstants.HalfDayHourCount;
        }

        hasAm = true;
      } else if (endDescStr.startsWith("p")) {
        if (endHour < DateTimeConstants.HalfDayHourCount) {
          endHour += DateTimeConstants.HalfDayHourCount;
        }

        hasPm = true;
      }
    } else {
      if (matchAmStr.isNotEmpty || (descStr.isNotEmpty && descStr.startsWith("a"))) {
        if (beginHour >= DateTimeConstants.HalfDayHourCount) {
          beginHour -= DateTimeConstants.HalfDayHourCount;
        }

        if (endHour >= DateTimeConstants.HalfDayHourCount) {
          endHour -= DateTimeConstants.HalfDayHourCount;
        }

        hasAm = true;
      } else if (matchPmStr.isNotEmpty || (descStr.isNotEmpty && descStr.startsWith("p"))) {
        if (beginHour < DateTimeConstants.HalfDayHourCount) {
          beginHour += DateTimeConstants.HalfDayHourCount;
        }

        if (endHour < DateTimeConstants.HalfDayHourCount) {
          endHour += DateTimeConstants.HalfDayHourCount;
        }

        hasPm = true;
      }

      if (beginHour > endHour && beginHour >= DateTimeConstants.HalfDayHourCount) {
        beginHour -= DateTimeConstants.HalfDayHourCount;
      }
    }

    if (!hasAm &&
        !hasPm &&
        beginHour <= DateTimeConstants.HalfDayHourCount &&
        endHour <= DateTimeConstants.HalfDayHourCount) {
      if (beginHour > endHour) {
        if (beginHour == DateTimeConstants.HalfDayHourCount) {
          beginHour = 0;
        } else {
          endHour += DateTimeConstants.HalfDayHourCount;
        }
      }

      comments = DateTimeConstants.Comment_AmPm;
    }

    return (comments, beginHour, endHour);
  }

  DateTimeResolutionResult MergeTwoTimePoints(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    DateTimeParseResult? pr1, pr2;
    bool bothHaveDates = false, beginHasDate = false, endHasDate = false;

    var timeExtractResults = config.TimeExtractor().extractDateTime(text, referenceTime);
    var dateTimeExtractResults = config.DateTimeExtractor().extractDateTime(text, referenceTime);

    if (dateTimeExtractResults.length == 2) {
      pr1 = config.DateTimeParser().parseDateTime(dateTimeExtractResults[0], referenceTime);
      pr2 = config.DateTimeParser().parseDateTime(dateTimeExtractResults[1], referenceTime);
      bothHaveDates = true;
    } else if (dateTimeExtractResults.length == 1 && timeExtractResults.length == 2) {
      if (!dateTimeExtractResults[0].isOverlap(timeExtractResults[0])) {
        pr1 = config.TimeParser().parseDateTime(timeExtractResults[0], referenceTime);
        pr2 = config.DateTimeParser().parseDateTime(dateTimeExtractResults[0], referenceTime);
        endHasDate = true;
      } else {
        pr1 = config.DateTimeParser().parseDateTime(dateTimeExtractResults[0], referenceTime);
        pr2 = config.TimeParser().parseDateTime(timeExtractResults[1], referenceTime);
        beginHasDate = true;
      }
    } else if (dateTimeExtractResults.length == 1 && timeExtractResults.length == 1) {
      if (timeExtractResults[0].start < dateTimeExtractResults[0].start) {
        pr1 = config.TimeParser().parseDateTime(timeExtractResults[0], referenceTime);
        pr2 = config.DateTimeParser().parseDateTime(dateTimeExtractResults[0], referenceTime);
        endHasDate = true;
      } else if (timeExtractResults[0].start >= dateTimeExtractResults[0].start + dateTimeExtractResults[0].length) {
        pr1 = config.DateTimeParser().parseDateTime(dateTimeExtractResults[0], referenceTime);
        pr2 = config.TimeParser().parseDateTime(timeExtractResults[0], referenceTime);
        beginHasDate = true;
      } else {
        // If the only TimeExtractResult is part of DateTimeExtractResult, then it should not be handled in this method
        return ret;
      }
    } else if (timeExtractResults.length == 2) {
      // If both ends are Time. then this is a TimePeriod, not a DateTimePeriod
      return ret;
    } else {
      return ret;
    }

    if (pr1.value == null || pr2.value == null) {
      return ret;
    }

    DateTime futureBegin = (pr1.value as DateTimeResolutionResult).futureValue as DateTime,
        futureEnd = (pr2.value as DateTimeResolutionResult).futureValue as DateTime;

    DateTime pastBegin = (pr1.value as DateTimeResolutionResult).pastValue as DateTime,
        pastEnd = (pr2.value as DateTimeResolutionResult).pastValue as DateTime;

    // If one side contains "ampm" while the other doesn't, shift the time appropriately
    var ampmStr1 = (pr1.value as DateTimeResolutionResult).comment;
    var ampmStr2 = (pr2.value as DateTimeResolutionResult).comment;
    if ((ampmStr1 == DateTimeConstants.Comment_AmPm) ^ (ampmStr2 == DateTimeConstants.Comment_AmPm)) {
      if (futureBegin.isAfter(futureEnd) && futureBegin.day == futureEnd.day) {
        futureEnd = futureEnd.AddHours(DateTimeConstants.HalfDayHourCount);
      }

      if (pastBegin.isAfter(pastEnd) && pastBegin.day == pastEnd.day) {
        pastEnd = pastEnd.AddHours(DateTimeConstants.HalfDayHourCount);
      }
    }

    var leftTimex = pr1.timexStr;
    var rightTimex = pr2.timexStr;

    if (bothHaveDates) {
      if (futureBegin.isAfter(futureEnd)) {
        futureBegin = pastBegin;
      }

      if (pastEnd.isBefore(pastBegin)) {
        pastEnd = futureEnd;
      }
    } else if (beginHasDate) {
      futureEnd = DateUtil.createSafeDate(
          futureBegin.year, futureBegin.month, futureBegin.day, futureEnd.hour, futureEnd.minute, futureEnd.second);
      pastEnd = DateUtil.createSafeDate(
          pastBegin.year, pastBegin.month, pastBegin.day, pastEnd.hour, pastEnd.minute, pastEnd.second);

      rightTimex = TimexUtility.CombineDateTimeTimex(pr2.timexStr ?? '', pr1.timexStr ?? '', futureEnd);
    } else if (endHasDate) {
      futureBegin = DateUtil.createSafeDate(
          futureEnd.year, futureEnd.month, futureEnd.day, futureBegin.hour, futureBegin.minute, futureBegin.second);
      pastBegin = DateUtil.createSafeDate(
          pastEnd.year, pastEnd.month, pastEnd.day, pastBegin.hour, pastBegin.minute, pastBegin.second);

      leftTimex = TimexUtility.CombineDateTimeTimex(pr1.timexStr ?? '', pr2.timexStr ?? '', pastBegin);
    }

    ret.timex = TimexUtility.GenerateDateTimePeriodTimexFromTimeSpan(
        leftTimex ?? '', rightTimex ?? '', (futureEnd.difference(futureBegin)));

    if (ampmStr1?.isNotEmpty == true &&
        ampmStr1!.endsWith(DateTimeConstants.Comment_AmPm) &&
        ampmStr2?.isNotEmpty == true &&
        ampmStr2!.endsWith(DateTimeConstants.Comment_AmPm)) {
      ret.comment = DateTimeConstants.Comment_AmPm;
    }

    if (config.options.match(DateTimeOptions.EnablePreview)) {
      if ((pr1.value as DateTimeResolutionResult).timeZoneResolution != null) {
        ret.timeZoneResolution = (pr1.value as DateTimeResolutionResult).timeZoneResolution;
      } else if ((pr2.value as DateTimeResolutionResult).timeZoneResolution != null) {
        ret.timeZoneResolution = (pr2.value as DateTimeResolutionResult).timeZoneResolution;
      }
    }

    ret.futureValue = (futureBegin, futureEnd);
    ret.pastValue = (pastBegin, pastEnd);
    ret.success = true;

    ret.subDateTimeEntities = <Object>[pr1, pr2];

    return ret;
  }

  // TODO: this can be abstracted with the similar method in BaseDatePeriodParser
  // parse "in 20 minutes"
  DateTimeResolutionResult ParseDuration(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();

    // For the rest of datetime, it will be handled in next function
    if (config.RestOfDateTimeRegex().hasMatch(text)) {
      return ret;
    }

    var ers = config.DurationExtractor().extractDateTime(text, referenceTime);
    if (ers.length == 1) {
      var pr = config.DurationParser().parse(ers[0]);

      var beforeStr = text.substring(0, pr?.start ?? 0).trim();
      var afterStr = text.substring((pr?.start ?? 0) + (pr?.length ?? 0)).trim();

      var numbersInSuffix = config.CardinalExtractor().extract(beforeStr);
      var numbersInDuration = config.CardinalExtractor().extract(ers[0].text);

      // Handle cases like "2 upcoming days", "5 previous years"
      if (numbersInSuffix.isNotEmpty && numbersInDuration.isEmpty) {
        var numberEr = numbersInSuffix.first;
        var numberText = numberEr.text;
        var durationText = ers[0].text;
        var combinedText = "$numberText $durationText";
        var combinedDurationEr = config.DurationExtractor().extractDateTime(combinedText, referenceTime);

        if (combinedDurationEr.isNotEmpty) {
          pr = config.DurationParser().parse(combinedDurationEr.first);
          var startIndex = numberEr.start + numberEr.length;
          beforeStr = beforeStr.substring(startIndex).trim();
        }
      }

      if (pr?.value != null) {
        var swiftSeconds = 0;
        var mod = '';
        var durationResult = pr?.value as DateTimeResolutionResult;
        if (durationResult.pastValue is double && durationResult.futureValue is double) {
          swiftSeconds = (durationResult.futureValue as double).toInt();
        }

        DateTime beginTime;
        var endTime = beginTime = referenceTime;

        if (config.PreviousPrefixRegex().matchExact(beforeStr, true) != null) {
          mod = DateTimeConstants.BEFORE_MOD;
          beginTime = referenceTime.AddSeconds(-swiftSeconds);
        }

        // Handle the "within (the) (next) xx seconds/minutes/hours" case
        // Should also handle the multiple duration case like P1DT8H
        // Set the beginTime equal to reference time for now
        if (config.WithinNextPrefixRegex().matchExact(beforeStr, true) != null) {
          endTime = beginTime.AddSeconds(swiftSeconds);
        }

        if (config.CheckBothBeforeAfter() && config.WithinNextPrefixRegex().matchExact(afterStr, true) != null) {
          endTime = beginTime.AddSeconds(swiftSeconds);
        }

        if (config.FutureRegex().matchExact(beforeStr, true) != null) {
          mod = DateTimeConstants.AFTER_MOD;
          endTime = beginTime.AddSeconds(swiftSeconds);
        }

        if (config.PreviousPrefixRegex().matchExact(afterStr, true) != null) {
          mod = DateTimeConstants.BEFORE_MOD;
          beginTime = referenceTime.AddSeconds(-swiftSeconds);
        }

        if (config.FutureRegex().matchExact(afterStr, true) != null) {
          mod = DateTimeConstants.AFTER_MOD;
          endTime = beginTime.AddSeconds(swiftSeconds);
        }

        if (config.FutureSuffixRegex().matchExact(afterStr, true) != null) {
          mod = DateTimeConstants.AFTER_MOD;
          endTime = beginTime.AddSeconds(swiftSeconds);
        }

        ret.timex =
            "(${DateTimeFormatUtil.luisDateFromDateTime(beginTime)}T${DateTimeFormatUtil.luisTime(beginTime)}," +
                "${DateTimeFormatUtil.luisDateFromDateTime(endTime)}T${DateTimeFormatUtil.luisTime(endTime)}," +
                "${durationResult.timex})";

        ret.futureValue = ret.pastValue = (beginTime, endTime);
        ret.success = true;

        if (mod.isNotEmpty) {
          (pr!.value as DateTimeResolutionResult).mod = mod;
        }

        ret.subDateTimeEntities = <Object>[pr!];

        return ret;
      }
    }

    return ret;
  }

  // parse "last minute", "next hour"
  DateTimeResolutionResult ParseRelativeUnit(String text, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();

    var match = RegExpComposer.getMatchesSimple(config.RelativeTimeUnitRegex(), text).firstOrNull;

    match ??= RegExpComposer.getMatchesSimple(config.RestOfDateTimeRegex(), text).firstOrNull;

    if (match != null) {
      var srcUnit = match.getGroup("unit").value;

      var unitStr = config.UnitMap()[srcUnit];

      int swiftValue = 1;
      var prefixMatch = config.PreviousPrefixRegex().firstMatch(text);
      if (prefixMatch != null) {
        swiftValue = -1;
      }

      DateTime beginTime;
      var endTime = beginTime = referenceTime;
      String timex = "";

      if (config.UnitMap().containsKey(srcUnit)) {
        (timex, beginTime, endTime) = TimexUtility.GenerateRelativeUnitDateTimePeriodTimex(
            beginTime, endTime, referenceTime, unitStr ?? '', swiftValue);
        ret.timex = timex;

        ret.futureValue = ret.pastValue = (beginTime, endTime);
        ret.success = ret.timex?.isNotEmpty == true;

        return ret;
      }
    }

    return ret;
  }
}

abstract interface class IDateTimePeriodParserConfiguration extends IDateTimeOptionsConfiguration {
  String TokenBeforeDate();

  String TokenBeforeTime();

  IDateExtractor DateExtractor();

  IDateTimeExtractor HolidayExtractor();

  IDateTimeExtractor TimeExtractor();

  IDateTimeExtractor DateTimeExtractor();

  IDateTimeExtractor TimePeriodExtractor();

  IDateTimeExtractor DurationExtractor();

  IExtractor CardinalExtractor();

  IParser NumberParser();

  IDateTimeParser DateParser();

  IDateTimeParser HolidayTimeParser();

  IDateTimeParser TimeParser();

  IDateTimeParser DateTimeParser();

  IDateTimeParser TimePeriodParser();

  IDateTimeParser DurationParser();

  IDateTimeParser TimeZoneParser();

  RegExp PureNumberFromToRegex();

  RegExp HyphenDateRegex();

  RegExp PureNumberBetweenAndRegex();

  RegExp SpecificTimeOfDayRegex();

  RegExp TimeOfDayRegex();

  RegExp PreviousPrefixRegex();

  RegExp FutureRegex();

  RegExp FutureSuffixRegex();

  RegExp NumberCombinedWithUnitRegex();

  RegExp UnitRegex();

  RegExp PeriodTimeOfDayWithDateRegex();

  RegExp RelativeTimeUnitRegex();

  RegExp RestOfDateTimeRegex();

  RegExp AmDescRegex();

  RegExp PmDescRegex();

  RegExp WithinNextPrefixRegex();

  RegExp PrefixDayRegex();

  RegExp BeforeRegex();

  RegExp AfterRegex();

  RegExp TasksmodeMealTimeofDayRegex();

  bool CheckBothBeforeAfter();

  Map<String, String> UnitMap();

  Map<String, int> Numbers();

  (String todSymbol, int beginHour, int endHour, int endMin) GetMatchedTimeRange(String text);

  int GetSwiftPrefix(String text);
}
