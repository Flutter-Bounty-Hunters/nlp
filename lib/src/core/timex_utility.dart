// ignore_for_file: constant_identifier_names

import 'dart:collection';

import 'package:nlp/src/core/range_timex_component.dart';
import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/date_time/time_of_day_resolution_result.dart';

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

  static String modifyAmbiguousCenturyTimex(String timex) {
    return "XX${timex.substring(2)}";
  }

  static String CombineDateAndTimeTimex(String dateTimex, String timeTimex) {
    return "$dateTimex$timeTimex";
  }

  static RangeTimexComponents GetRangeTimexComponents(String rangeTimex) {
    rangeTimex = rangeTimex.replaceAll("(", '').replaceAll(")", '');
    var components = rangeTimex.split(",").where((element) => element.isNotEmpty).toList();
    var result = RangeTimexComponents();

    if (components.length == 3) {
      result.beginTimex = components[0];
      result.endTimex = components[1];
      result.durationTimex = components[2];
      result.isValid = true;
    }

    return result;
  }

  static String GenerateDateTimePeriodTimexFromDateTime(
      DateTime beginDateTime, DateTime endDateTime, String durationTimex) {
    return GenerateDateTimePeriodTimex(
        DateTimeFormatUtil.luisDateTime(beginDateTime), DateTimeFormatUtil.luisDateTime(endDateTime), durationTimex);
  }

  static String GenerateDateTimePeriodTimexFromTimeSpan(String beginTimex, String endTimex, Duration duration) {
    var durationTimex = DateTimeFormatUtil.luisTimeSpan(duration);
    return GenerateDateTimePeriodTimex(beginTimex, endTimex, durationTimex);
  }

  static String GenerateDateTimePeriodTimex(String beginTimex, String endTimex, String durationTimex) {
    return "($beginTimex,$endTimex,$durationTimex)";
  }

  static String GenerateDurationTimex(double number, String unitStr, bool isLessThanDay) {
    if (DateTimeConstants.TimexBusinessDay != unitStr) {
      switch (unitStr) {
        case DateTimeConstants.DECADE_UNIT:
          number = number * 10;
          unitStr = DateTimeConstants.TimexYear;
          break;
        case DateTimeConstants.FORTNIGHT_UNIT:
          number = number * 2;
          unitStr = DateTimeConstants.TimexWeek;
          break;
        case DateTimeConstants.WEEKEND_UNIT:
          unitStr = DateTimeConstants.TimexWeekend;
          break;
        default:
          unitStr = unitStr.substring(0, 1);
          break;
      }
    }

    return DateTimeConstants.GeneralPeriodPrefix +
        (isLessThanDay ? DateTimeConstants.TimeTimexPrefix : '') +
        number.toString() +
        unitStr;
  }

  static (String timex, DateTime begin, DateTime end) GenerateRelativeUnitDateTimePeriodTimex(
      DateTime beginDateTime, DateTime endDateTime, DateTime referenceTime, String unitStr, int swift) {
    String prefix = DateTimeConstants.GeneralPeriodPrefix + DateTimeConstants.TimeTimexPrefix;
    String durationTimex = '';
    switch (unitStr) {
      case DateTimeConstants.TimexDay:
        endDateTime = DateUtil.createSafeDate(beginDateTime.year, beginDateTime.month, beginDateTime.day);
        endDateTime = endDateTime.AddDays(1).AddSeconds(-1);
        durationTimex = prefix +
            ((endDateTime.millisecondsSinceEpoch - beginDateTime.millisecondsSinceEpoch) / 1000).toString() +
            DateTimeConstants.TimexSecond;
        break;
      case DateTimeConstants.TimexHour:
        beginDateTime = swift > 0 ? beginDateTime : referenceTime.AddHours(swift);
        endDateTime = swift > 0 ? referenceTime.AddHours(swift) : endDateTime;
        durationTimex = "${prefix}1${DateTimeConstants.TimexHour}";
        break;
      case DateTimeConstants.TimexMinute:
        beginDateTime = swift > 0 ? beginDateTime : referenceTime.AddMinutes(swift);
        endDateTime = swift > 0 ? referenceTime.AddMinutes(swift) : endDateTime;
        durationTimex = "${prefix}1${DateTimeConstants.TimexMinute}";
        break;
      case DateTimeConstants.TimexSecond:
        beginDateTime = swift > 0 ? beginDateTime : referenceTime.AddSeconds(swift);
        endDateTime = swift > 0 ? referenceTime.AddSeconds(swift) : endDateTime;
        durationTimex = "${prefix}1${DateTimeConstants.TimexSecond}";
        break;
    }

    return (
      GenerateDateTimePeriodTimexFromDateTime(beginDateTime, endDateTime, durationTimex),
      beginDateTime,
      endDateTime
    );
  }

  static String CombineDateTimeTimex(String timeTimex1, String dateTimeTimex2, DateTime dateTime1) {
    return dateTimeTimex2 == DateTimeConstants.TimexNow
        ? DateTimeFormatUtil.LuisDateShortTime(dateTime1)
        : dateTimeTimex2.split(DateTimeConstants.TimeTimexPrefix[0])[0] + timeTimex1;
  }

  static bool IsRangeTimex(String timex) {
    return timex.isNotEmpty && timex.startsWith("(");
  }

  static TimeOfDayResolutionResult ResolveTimeOfDay(String tod) {
    var result = new TimeOfDayResolutionResult();
    switch (tod) {
      case DateTimeConstants.EarlyMorning:
        result.Timex = DateTimeConstants.EarlyMorning;
        result.BeginHour = DateTimeConstants.EarlyMorningBeginHour;
        result.EndHour = DateTimeConstants.EarlyMorningEndHour;
        break;
      case DateTimeConstants.Morning:
        result.Timex = DateTimeConstants.Morning;
        result.BeginHour = DateTimeConstants.MorningBeginHour;
        result.EndHour = DateTimeConstants.MorningEndHour;
        break;
      case DateTimeConstants.MidDay:
        result.Timex = DateTimeConstants.MidDay;
        result.BeginHour = DateTimeConstants.MidDayBeginHour;
        result.EndHour = DateTimeConstants.MidDayEndHour;
        break;
      case DateTimeConstants.Afternoon:
        result.Timex = DateTimeConstants.Afternoon;
        result.BeginHour = DateTimeConstants.AfternoonBeginHour;
        result.EndHour = DateTimeConstants.AfternoonEndHour;
        break;
      case DateTimeConstants.Evening:
        result.Timex = DateTimeConstants.Evening;
        result.BeginHour = DateTimeConstants.EveningBeginHour;
        result.EndHour = DateTimeConstants.EveningEndHour;
        break;
      case DateTimeConstants.Daytime:
        result.Timex = DateTimeConstants.Daytime;
        result.BeginHour = DateTimeConstants.DaytimeBeginHour;
        result.EndHour = DateTimeConstants.DaytimeEndHour;
        break;
      case DateTimeConstants.Nighttime:
        result.Timex = DateTimeConstants.Nighttime;
        result.BeginHour = DateTimeConstants.NighttimeBeginHour;
        result.EndHour = DateTimeConstants.NighttimeEndHour;
        break;
      case DateTimeConstants.BusinessHour:
        result.Timex = DateTimeConstants.BusinessHour;
        result.BeginHour = DateTimeConstants.BusinessBeginHour;
        result.EndHour = DateTimeConstants.BusinessEndHour;
        break;
      case DateTimeConstants.Night:
        result.Timex = DateTimeConstants.Night;
        result.BeginHour = DateTimeConstants.NightBeginHour;
        result.EndHour = DateTimeConstants.NightEndHour;
        result.EndMin = DateTimeConstants.NightEndMin;
        break;
      case DateTimeConstants.MealtimeBreakfast:
        result.Timex = DateTimeConstants.MealtimeBreakfast;
        result.BeginHour = DateTimeConstants.MealtimeBreakfastBeginHour;
        result.EndHour = DateTimeConstants.MealtimeBreakfastEndHour;
        break;
      case DateTimeConstants.MealtimeBrunch:
        result.Timex = DateTimeConstants.MealtimeBrunch;
        result.BeginHour = DateTimeConstants.MealtimeBrunchBeginHour;
        result.EndHour = DateTimeConstants.MealtimeBrunchEndHour;
        break;
      case DateTimeConstants.MealtimeLunch:
        result.Timex = DateTimeConstants.MealtimeLunch;
        result.BeginHour = DateTimeConstants.MealtimeLunchBeginHour;
        result.EndHour = DateTimeConstants.MealtimeLunchEndHour;
        break;
      case DateTimeConstants.MealtimeDinner:
        result.Timex = DateTimeConstants.MealtimeDinner;
        result.BeginHour = DateTimeConstants.MealtimeDinnerBeginHour;
        result.EndHour = DateTimeConstants.MealtimeDinnerEndHour;
        break;
      default:
        break;
    }

    return result;
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
