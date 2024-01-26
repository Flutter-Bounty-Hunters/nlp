// ignore_for_file: constant_identifier_names

import 'dart:collection';

import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';

class TimexUtility {
  static String generateCompoundDurationTimex(
      Map<String, String> unitToTimexComponents, Map<String, int> unitValueMap) {
    var unitList = unitToTimexComponents.keys.toList();
    unitList.sort((x, y) => unitValueMap[x]! < unitValueMap[y]! ? 1 : -1);
    unitList = unitList.map((t) => unitToTimexComponents[t]!).toList();
    return TimexHelpers.generateCompoundDurationTimex(unitList);
  }

  static String generateDurationTimex(double number, String unitStr, bool isLessThanDay) {
    if (DateTimeConstants.TimexBusinessDay != unitStr) {
      if (DateTimeConstants.DECADE_UNIT == unitStr) {
        number = number * 10;
        unitStr = DateTimeConstants.TimexYear;
      } else if (DateTimeConstants.FORTNIGHT_UNIT == unitStr) {
        number = number * 2;
        unitStr = DateTimeConstants.TimexWeek;
      } else {
        unitStr = unitStr.substring(0, 1);
      }
    }

    // Concatenate the relevant values back to back in a String.
    final durationTimex = StringBuffer()
      ..write(DateTimeConstants.GeneralPeriodPrefix)
      ..write(isLessThanDay ? DateTimeConstants.TimeTimexPrefix : "")
      ..write(StringUtility.format(number))
      ..write(unitStr);

    return durationTimex.toString();
  }

  static String generateWeekTimex([DateTime? monday]) {
    if (monday == null) {
      return DateTimeConstants.TimexFuzzyYear + DateTimeConstants.DateTimexConnector + DateTimeConstants.TimexFuzzyWeek;
    } else {
      return DateTimeFormatUtil.toIsoWeekTimex(monday);
    }
  }

  static bool hasDoubleTimex(String comment) {
    return comment == DateTimeConstants.Comment_DoubleTimex;
  }

  static LinkedHashMap<String, Object> processDoubleTimex(
      LinkedHashMap<String, Object> resolutionDic, String futureKey, String pastKey, String originTimex) {
    final timexes = originTimex.split(DateTimeConstants.CompositeTimexSplit);

    if (!resolutionDic.containsKey(futureKey) || !resolutionDic.containsKey(pastKey) || timexes.length != 2) {
      return resolutionDic;
    }

    final futureResolution = resolutionDic[futureKey] as HashMap<String, String>;
    final pastResolution = resolutionDic[pastKey] as HashMap<String, String>;
    futureResolution[DateTimeResolutionKey.Timex] = timexes[0];
    pastResolution[DateTimeResolutionKey.Timex] = timexes[1];
    return resolutionDic;
  }
}

class DateTimeResolutionKey {
  static final String Timex = "timex";
  static final String Mod = "Mod";
  static final String IsLunar = "isLunar";
  static final String START = "start";
  static final String END = "end";
  static final String List = "list";
  static final String SourceEntity = "sourceEntity";
}

class TimexHelpers {
  static String generateCompoundDurationTimex(List<String> timexList) {
    bool isTimeDurationAlreadyExist = false;
    final timexBuilder = StringBuffer(TimexConstants.GENERAL_PERIOD_PREFIX);

    for (final timexComponent in timexList) {
      // The Time Duration component occurs first time
      if (!isTimeDurationAlreadyExist && isTimeDurationTimex(timexComponent)) {
        timexBuilder.write("${TimexConstants.TIME_TIMEX_PREFIX}${getDurationTimexWithoutPrefix(timexComponent)}");
        isTimeDurationAlreadyExist = true;
      } else {
        timexBuilder.write(getDurationTimexWithoutPrefix(timexComponent));
      }
    }

    return timexBuilder.toString();
  }

  static bool isTimeDurationTimex(String timex) {
    return timex.startsWith("${TimexConstants.GENERAL_PERIOD_PREFIX}${TimexConstants.TIME_TIMEX_PREFIX}");
  }

  static String getDurationTimexWithoutPrefix(String timex) {
    // Remove "PT" prefix for TimeDuration, Remove "P" prefix for DateDuration
    return timex.substring(isTimeDurationTimex(timex) ? 2 : 1);
  }
}

class TimexConstants {
  // Timex
  static const TIMEX_YEAR = "Y";
  static const TIMEX_MONTH = "M";
  static const TIMEX_MONTH_FULL = "MON";
  static const TIMEX_WEEK = "W";
  static const TIMEX_DAY = "D";
  static const TIMEX_BUSINESS_DAY = "BD";
  static const TIMEX_WEEKEND = "WE";
  static const TIMEX_HOUR = "H";
  static const TIMEX_MINUTE = "M";
  static const TIMEX_SECOND = "S";
  static const TIMEX_NIGHT = "NI";
  static const TIMEX_FUZZY = 'X';
  static const TIMEX_FUZZY_YEAR = "XXXX";
  static const TIMEX_FUZZY_MONTH = "XX";
  static const TIMEX_FUZZY_WEEK = "WXX";
  static const TIMEX_FUZZY_DAY = "XX";
  static const DATE_TIMEX_CONNECTOR = "-";
  static const TIME_TIMEX_CONNECTOR = ":";
  static const GENERAL_PERIOD_PREFIX = "P";
  static const TIME_TIMEX_PREFIX = "T";

  static const YEAR_UNIT = "year";
  static const MONTH_UNIT = "month";
  static const WEEK_UNIT = "week";
  static const DAY_UNIT = "day";
  static const HOUR_UNIT = "hour";
  static const MINUTE_UNIT = "minute";
  static const SECOND_UNIT = "second";
  static const TIME_DURATION_UNIT = "s";

  static const AM = "AM";
  static const PM = "PM";

  static const INVALID_VALUE = -1;
}

class TimexTypes {
  static const PRESENT = "present";
  static const DEFINITE = "definite";
  static const DATE = "date";
  static const DATE_TIME = "datetime";
  static const DATE_RANGE = "daterange";
  static const DURATION = "duration";
  static const TIME = "time";
  static const TIME_RANGE = "timerange";
  static const DATE_TIME_RANGE = "datetimerange";
}
