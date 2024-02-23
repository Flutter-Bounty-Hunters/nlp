import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/timezone_utility.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseTimeParser implements IDateTimeParser {
  BaseTimeParser(this.config);

  final ITimeParserConfiguration config;

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) => candidateResults;

  @override
  String getParserName() => DateTimeConstants.SYS_DATETIME_TIME;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime reference) {
    Object? value;
    if (er.type == getParserName()) {
      DateTimeResolutionResult innerResult;

      // Resolve timezone
      if (TimeZoneUtility.ShouldResolveTimeZone(er, config.options)) {
        var metadata = er.data as Map<String, Object>;
        var timezoneEr = metadata[DateTimeConstants.SYS_DATETIME_TIMEZONE] as ExtractResult;
        var timezonePr = config.TimeZoneParser().parse(timezoneEr);

        innerResult = InternalParse(er.text.substring(0, (er.text.length - timezoneEr.length)), reference);

        if (timezonePr != null && timezonePr.value != null) {
          innerResult.timeZoneResolution = (timezonePr.value as DateTimeResolutionResult).timeZoneResolution;
        }
      } else {
        innerResult = InternalParse(er.text, reference);
      }

      if (innerResult.success) {
        innerResult.futureResolution = <String, String>{
          TimeTypeConstants.TIME: DateTimeFormatUtil.formatTime(innerResult.futureValue as DateTime),
        };

        innerResult.pastResolution = <String, String>{
          TimeTypeConstants.TIME: DateTimeFormatUtil.formatTime(innerResult.pastValue as DateTime),
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

  DateTimeResolutionResult InternalParse(String text, DateTime referenceTime) {
    var innerResult = ParseBasicRegexMatch(text, referenceTime);
    return innerResult;
  }

  // parse basic patterns in TimeRegexList
  DateTimeResolutionResult ParseBasicRegexMatch(String text, DateTime referenceTime) {
    var trimmedText = text.trim();
    var offset = 0;

    var match = RegExpComposer.getMatchesSimple(config.AtRegex(), trimmedText).firstOrNull;

    if (match == null) {
      match = RegExpComposer.getMatchesSimple(config.AtRegex(), config.TimeTokenPrefix() + trimmedText).firstOrNull;
      offset = config.TimeTokenPrefix().length;
    }

    if (match != null && match.index == offset && match.length == trimmedText.length) {
      return Match2Time(match, referenceTime);
    }

    // parse hour pattern, like "twenty one", "16"
    // create a extract result which content the pass-in text
    int? hour = config.Numbers()[text] ?? int.tryParse(text);
    if (hour != null) {
      if (hour >= 0 && hour <= 24) {
        var ret = DateTimeResolutionResult();

        if (hour == 24) {
          hour = 0;
        }

        if (hour <= DateTimeConstants.HalfDayHourCount && hour != 0) {
          ret.comment = DateTimeConstants.Comment_AmPm;
        }

        ret.timex = "T${hour.toString().padLeft(2, '0')}";
        ret.futureValue = ret.pastValue =
            DateUtil.createSafeDate(referenceTime.year, referenceTime.month, referenceTime.day, hour, 0, 0);
        ret.success = true;
        return ret;
      }
    }

    var regexes = config.TimeRegexes();

    for (var regex in regexes) {
      var exactMatch = RegExpComposer.matchExact(regex, trimmedText, true);

      if (exactMatch != null) {
        return Match2Time(exactMatch, referenceTime);
      }
    }

    return DateTimeResolutionResult();
  }

  DateTimeResolutionResult Match2Time(NlpMatch match, DateTime referenceTime) {
    var ret = DateTimeResolutionResult();
    bool hasMin = false, hasSec = false, hasAm = false, hasPm = false, hasMid = false;
    int hour = 0, min = 0, second = 0, day = referenceTime.day, month = referenceTime.month, year = referenceTime.year;

    var writtenTimeStr = match.getGroup("writtentime").value;

    if (writtenTimeStr.isNotEmpty) {
      // get hour
      var hourStr = match.getGroup("hournum").value;
      hour = config.Numbers()[hourStr]!;

      // get minute
      var minStr = match.getGroup("minnum").value;
      var tensStr = match.getGroup("tens").value;

      if (minStr.isNotEmpty) {
        min = config.Numbers()[minStr]!;
        if (tensStr.isNotEmpty) {
          min += config.Numbers()[tensStr]!;
        }

        hasMin = true;
      }
    } else if (match.getGroup("mid").value.isNotEmpty) {
      hasMid = true;
      if (match.getGroup("midnight").value.isNotEmpty) {
        hour = 0;
        min = 0;
        second = 0;
      } else if (match.getGroup("midearlymorning").value.isNotEmpty) {
        hour = 6;
        min = 0;
        second = 0;
      } else if (match.getGroup("midmorning").value.isNotEmpty) {
        hour = 10;
        min = 0;
        second = 0;
      } else if (match.getGroup("midafternoon").value.isNotEmpty) {
        hour = 14;
        min = 0;
        second = 0;
      } else if (match.getGroup("midday").value.isNotEmpty) {
        hour = DateTimeConstants.HalfDayHourCount;
        min = 0;
        second = 0;
      }
    } else {
      // get hour
      var hourStr = match.getGroup(DateTimeConstants.HourGroupName).value;
      if (hourStr.isEmpty) {
        hourStr = match.getGroup("hournum").value;

        if (!config.Numbers().containsKey(hourStr)) {
          return ret;
        }

        hour = config.Numbers()[hourStr]!;
      } else {
        final newHour = int.tryParse(hourStr);
        if (newHour == null) {
          if (!config.Numbers().containsKey(hourStr)) {
            return ret;
          }
          hour = config.Numbers()[hourStr]!;
        } else {
          hour = newHour;
        }
      }

      // get minute
      var minStr = match.getGroup(DateTimeConstants.MinuteGroupName).value;
      if (minStr.isEmpty) {
        minStr = match.getGroup("minnum").value;
        if (minStr.isNotEmpty) {
          min = config.Numbers()[minStr]!;
          hasMin = true;
        }

        var tensStr = match.getGroup("tens").value;
        if (tensStr.isNotEmpty) {
          min += config.Numbers()[tensStr]!;
          hasMin = true;
        }
      } else {
        min = int.parse(minStr);
        hasMin = true;
      }

      // get second
      var secStr = match.getGroup(DateTimeConstants.SecondGroupName).value;
      if (secStr.isNotEmpty) {
        second = int.parse(secStr);
        hasSec = true;
      } else {
        // as for minStr, check if secStr is defined in Numbers
        secStr = match.getGroup("secnum").value;
        if (secStr.isNotEmpty) {
          second = config.Numbers()[secStr]!;
          hasSec = true;
        }
      }
    }

    // Adjust by desc string
    var descStr = match.getGroup(DateTimeConstants.DescGroupName).value;

    // ampm is a special case in which at 6ampm = at 6
    if (config.UtilityConfiguration().amDescRegExp().hasMatch(descStr) ||
        config.UtilityConfiguration().amPmDescRegExp().hasMatch(descStr) ||
        match.getGroup(DateTimeConstants.ImplicitAmGroupName).value.isNotEmpty) {
      if (hour >= DateTimeConstants.HalfDayHourCount) {
        hour -= DateTimeConstants.HalfDayHourCount;
      }

      if (!config.UtilityConfiguration().amPmDescRegExp().hasMatch(descStr)) {
        hasAm = true;
      }
    } else if (config.UtilityConfiguration().pmDescRegExp().hasMatch(descStr) ||
        match.getGroup(DateTimeConstants.ImplicitPmGroupName).value.isNotEmpty) {
      if (hour < DateTimeConstants.HalfDayHourCount) {
        hour += DateTimeConstants.HalfDayHourCount;
      }

      hasPm = true;
    }

    // adjust min by prefix
    var timePrefix = match.getGroup(DateTimeConstants.PrefixGroupName).value;
    if (timePrefix.isNotEmpty) {
      (hour, min, hasMin) = config.AdjustByPrefix(timePrefix, hour, min, hasMin);
    }

    // adjust hour by suffix
    var timeSuffix = match.getGroup(DateTimeConstants.SuffixGroupName).value;
    if (timeSuffix.isNotEmpty) {
      (hour, min, hasMin, hasAm, hasPm) = config.AdjustBySuffix(timeSuffix, hour, min, hasMin, hasAm, hasPm);
    }

    if (hour == 24) {
      hour = 0;
    }

    ret.timex = "T${hour.toString().padLeft(2, '0')}";
    if (hasMin) {
      ret.timex = "${ret.timex!}:${min.toString().padLeft(2, '0')}";
    }

    if (hasSec) {
      ret.timex = "${ret.timex!}:${second.toString().padLeft(2, '0')}";
    }

    if (hour <= DateTimeConstants.HalfDayHourCount && hour != 0 && !hasPm && !hasAm && !hasMid) {
      ret.comment = DateTimeConstants.Comment_AmPm;
    }

    ret.futureValue = ret.pastValue = DateUtil.createSafeDate(year, month, day, hour, min, second);
    ret.success = true;

    return ret;
  }
}

abstract interface class ITimeParserConfiguration extends IDateTimeOptionsConfiguration {
  String TimeTokenPrefix();

  RegExp AtRegex();

  List<RegExp> TimeRegexes();

  Map<String, int> Numbers();

  IDateTimeUtilityConfiguration UtilityConfiguration();

  IDateTimeParser TimeZoneParser();

  (int hour, int min, bool hasMin) AdjustByPrefix(String prefix, int hour, int min, bool hasMin);

  (int hour, int min, bool hasMin, bool hasAm, bool hasPm) AdjustBySuffix(
      String suffix, int hour, int min, bool hasMin, bool hasAm, bool hasPm);
}
