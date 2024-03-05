import 'package:intl/intl.dart';
import 'package:nlp/nlp.dart';
import 'package:nlp/src/core/string_utility.dart';

class DateTimeFormatUtil {
  static final HourTimexRegex = r"(?<!P)T(\\d{2})";
  static final WeekDayTimexRegex = r"XXXX-WXX-(\\d)";

  static String luisDateFromYear(int year) {
    if (year == DateTimeConstants.InvalidYear) {
      return DateTimeConstants.TimexFuzzyYear;
    }

    return year.toString().padLeft(4, '0');
  }

  // public static String luisDate(int year, int month) {
  //   if (year == Constants.InvalidYear) {
  //     if (month == Constants.InvalidMonth) {
  //       return String.join(Constants.DateTimexConnector, Constants.TimexFuzzyYear, Constants.TimexFuzzyMonth);
  //     }
  //
  //     return String.join(Constants.DateTimexConnector, Constants.TimexFuzzyYear, String.format("%02d", month));
  //   }
  //
  //   return String.join(Constants.DateTimexConnector, String.format("%04d", year), String.format("%02d", month));
  // }

  static String luisDateFromComponents(int year, [int? month, int? day]) {
    // TODO: replace all these if statements with a single list that uses conditional inclusion and then join()s.
    if (year == -1 || year == DateTimeConstants.InvalidYear) {
      if (month == -1) {
        if (day == -1) {
          return const [
            DateTimeConstants.TimexFuzzyYear,
            DateTimeConstants.TimexFuzzyMonth,
            DateTimeConstants.TimexFuzzyDay
          ].join(DateTimeConstants.DateTimexConnector);
        }

        return [
          DateTimeConstants.TimexFuzzyYear,
          DateTimeConstants.TimexFuzzyMonth,
          if (day != null) day.toString().padLeft(2, '0')
        ].join(DateTimeConstants.DateTimexConnector);
      }

      return [
        DateTimeConstants.TimexFuzzyYear,
        month.toString().padLeft(2, '0'),
        if (day != null) day.toString().padLeft(2, '0')
      ].join(DateTimeConstants.DateTimexConnector);
    }

    return [
      year.toString().padLeft(4, '0'),
      month.toString().padLeft(2, '0'),
      if (day != null) day.toString().padLeft(2, '0')
    ].join(DateTimeConstants.DateTimexConnector);
  }

  static String luisDateFromDateTime(DateTime date, [DateTime? alternativeDate]) {
    int year = date.year;
    int month = date.month;
    int day = date.day;

    if (alternativeDate != null) {
      if (alternativeDate.year != year) {
        year = -1;
      }

      if (alternativeDate.month != month) {
        month = -1;
      }

      if (alternativeDate.day != day) {
        day = -1;
      }
    }

    return luisDateFromComponents(year, month, day);
  }

  static String LuisDateShortTime(DateTime time, [String? timex]) {
    var hasMin = timex != null ? timex.contains(DateTimeConstants.TimeTimexConnector) : false;
    var hasSec = timex != null ? timex.split(DateTimeConstants.TimeTimexConnector[0]).length > 2 : false;

    return "${luisDateFromDateTime(time)}${FormatShortTime(time, hasMin, hasSec)}";
  }

  //
  // public static String luisTime(int hour, int min) {
  //   return luisTime(hour, min, Constants.InvalidSecond);
  // }
  //
  static String luisTimeFromComponents(int hour, int min, int second) {
    String result;
    if (second == DateTimeConstants.InvalidSecond) {
      result =
          [hour.toString().padLeft(2, '0'), min.toString().padLeft(2, '0')].join(DateTimeConstants.TimeTimexConnector);
    } else {
      result = [hour.toString().padLeft(2, '0'), min.toString().padLeft(2, '0'), second.toString().padLeft(2, '0')]
          .join(DateTimeConstants.TimeTimexConnector);
    }

    return result;
  }

  //
  static String luisTime(DateTime time) {
    return luisTimeFromComponents(time.hour, time.minute, time.second);
  }

  static String luisTimeSpan(Duration timeSpan) {
    var timexBuilder = StringBuffer("${DateTimeConstants.GeneralPeriodPrefix}${DateTimeConstants.TimeTimexPrefix}");

    int microseconds = timeSpan.inMicroseconds;

    final days = microseconds ~/ Duration.microsecondsPerDay;
    microseconds = microseconds.remainder(Duration.microsecondsPerDay);

    final hours = microseconds ~/ Duration.microsecondsPerHour;
    microseconds = microseconds.remainder(Duration.microsecondsPerHour);

    final minutes = microseconds ~/ Duration.microsecondsPerMinute;
    microseconds = microseconds.remainder(Duration.microsecondsPerMinute);

    var seconds = microseconds ~/ Duration.microsecondsPerSecond;

    if (days > 0 || hours > 0) {
      timexBuilder.write("${(days * DateTimeConstants.DayHourCount) + hours}H");
    }

    if (minutes > 0) {
      timexBuilder.write("${minutes}M");
    }

    if (seconds > 0) {
      timexBuilder.write("${seconds}S");
    }

    return timexBuilder.toString();
  }

  //
  static String luisDateTime(DateTime time) {
    return "${luisDateFromDateTime(time)}T${luisTime(time)}";
  }

  //
  static String formatDate(DateTime date) {
    return [
      date.year.toString().padLeft(4, '0'),
      date.month.toString().padLeft(2, '0'),
      date.day.toString().padLeft(2, '0')
    ].join(DateTimeConstants.DateTimexConnector);
  }

  static String formatTime(DateTime time) {
    return [
      time.hour.toString().padLeft(2, '0'),
      time.minute.toString().padLeft(2, '0'),
      time.second.toString().padLeft(2, '0'),
    ].join(DateTimeConstants.TimeTimexConnector);
  }

  static String formatDateTime(DateTime datetime) {
    return [
      formatDate(datetime),
      formatTime(datetime),
    ].join(" ");
  }

  static String FormatShortTime(DateTime time, [bool keepMin = false, bool keepSec = false]) {
    int hour = time.hour,
        min = (keepMin || time.minute > 0) ? time.minute : DateTimeConstants.InvalidMinute,
        sec = (keepSec || time.second > 0) ? time.second : DateTimeConstants.InvalidSecond;
    return ShortTime(hour, min, sec);
  }

  static String ShortTime(int hour,
      [int min = DateTimeConstants.InvalidSecond, int second = DateTimeConstants.InvalidSecond]) {
    String timeString;

    if (min == DateTimeConstants.InvalidSecond && second == DateTimeConstants.InvalidSecond) {
      timeString = "${DateTimeConstants.TimeTimexPrefix}${hour.toString().padLeft(2, '0')}";
    } else if (second == DateTimeConstants.InvalidSecond) {
      timeString = "${DateTimeConstants.TimeTimexPrefix}${luisTimeFromComponents(hour, min, second)}";
    } else {
      timeString = "${DateTimeConstants.TimeTimexPrefix}${luisDateFromComponents(hour, min, second)}";
    }

    return timeString;
  }

  static DateTimeResolutionResult ResolveEndOfDay(String timexPrefix, DateTime futureDate, DateTime pastDate) {
    var ret = DateTimeResolutionResult();

    ret.timex = "${timexPrefix}T23:59:59";
    ret.futureValue = futureDate.dateOnly.AddDays(1).AddSeconds(-1);
    ret.pastValue = pastDate.dateOnly.AddDays(1).AddSeconds(-1);
    ret.success = true;

    return ret;
  }

  //
  // public static String shortTime(int hour) {
  //   return shortTime(hour, Constants.InvalidSecond);
  // }
  //
  // public static String shortTime(int hour, int min) {
  //   return shortTime(hour, min, Constants.InvalidSecond);
  // }
  //
  // public static String shortTime(int hour, int min, int second) {
  //   String timeString;
  //
  //   if (min == Constants.InvalidSecond && second == Constants.InvalidSecond) {
  //     timeString = String.format("%s%02d", Constants.TimeTimexPrefix, hour);
  //   } else if (second == Constants.InvalidSecond) {
  //     timeString = String.format("%s%s", Constants.TimeTimexPrefix, luisTime(hour, min));
  //   } else {
  //     timeString = String.format("%s%s", Constants.TimeTimexPrefix, luisTime(hour, min, second));
  //   }
  //
  //   return timeString;
  // }
  //
  // // Only handle TimeSpan which is less than one day
  // public static String luisTimeSpan(Duration timeSpan) {
  //   String result = "PT";
  //
  //   if (timeSpan.toHours() % 24 > 0) {
  //     result = String.format("%s%sH", result, timeSpan.toHours() % 24);
  //   }
  //
  //   if (timeSpan.toMinutes() % 60 > 0) {
  //     result = String.format("%s%sM", result, timeSpan.toMinutes() % 60);
  //   }
  //
  //   if (timeSpan.get(ChronoUnit.SECONDS) % 60 > 0) {
  //     result = String.format("%s%sS", result, timeSpan.get(ChronoUnit.SECONDS) % 60);
  //   }
  //
  //   if (timeSpan.toMinutes() % 60 > 0) {
  //     result = String.format("%s%sM", result, timeSpan.toMinutes() % 60);
  //   }
  //
  //   if (timeSpan.get(ChronoUnit.SECONDS) % 60 > 0) {
  //     result = String.format("%s%sS", result, timeSpan.get(ChronoUnit.SECONDS) % 60);
  //   }
  //
  //   return timeSpan.toString();
  // }
  //
  static String toPm(String timeStr) {
    bool hasT = false;
    if (timeStr.startsWith("T")) {
      hasT = true;
      timeStr = timeStr.substring(1);
    }

    final splited = timeStr.split(":");
    int hour = int.parse(splited[0]);
    hour = hour >= DateTimeConstants.HalfDayHourCount
        ? hour - DateTimeConstants.HalfDayHourCount
        : hour + DateTimeConstants.HalfDayHourCount;
    splited[0] = hour.toString().padLeft(2, "0");
    timeStr = splited.join(":");

    return hasT ? "T$timeStr" : timeStr;
  }

  static String allStringToPm(String timeStr) {
    final hourTimexRegex = RegExp(HourTimexRegex);
    final matches = hourTimexRegex.allMatches(timeStr); // RegExpUtility.getMatches(HourTimexRegex, timeStr);
    final splited = <String>[];

    int lastPos = 0;
    for (Match match in matches) {
      if (lastPos != match.start) {
        splited.add(timeStr.substring(lastPos, match.start));
      }
      splited.add(timeStr.substring(match.start, match.end));
      lastPos = match.end;
    }

    if (!StringUtility.isNullOrEmpty(timeStr.substring(lastPos))) {
      splited.add(timeStr.substring(lastPos));
    }

    for (int i = 0; i < splited.length; i++) {
      if (hourTimexRegex.matchAsPrefix(splited[i]) != null) {
        splited[i] = toPm(splited[i]);
      }
    }

    // Modify weekDay timex for the cases which cross day boundary
    if (splited.length >= 4) {
      final weekDayStartMatch = RegExp(WeekDayTimexRegex).firstMatch(splited[0]);
      final weekDayEndMatch = RegExp(WeekDayTimexRegex).firstMatch(splited[2]);
      final hourStartMatch = RegExp(HourTimexRegex).firstMatch(splited[1]);
      final hourEndMatch = RegExp(HourTimexRegex).firstMatch(splited[3]);

      String weekDayStartStr = weekDayStartMatch?.group(1) ?? "";
      String weekDayEndStr = weekDayEndMatch?.group(1) ?? "";
      String hourStartStr = hourStartMatch?.group(1) ?? "";
      String hourEndStr = hourEndMatch?.group(1) ?? "";

      if (int.tryParse(weekDayStartStr) != null &&
          int.tryParse(weekDayEndStr) != null &&
          int.tryParse(hourStartStr) != null &&
          int.tryParse(hourEndStr) != null) {
        int weekDayStart = int.parse(weekDayStartStr);
        int weekDayEnd = int.parse(weekDayEndStr);
        int hourStart = int.parse(hourStartStr);
        int hourEnd = int.parse(hourEndStr);

        if (hourEnd < hourStart && weekDayStart == weekDayEnd) {
          weekDayEnd = weekDayEnd == DateTimeConstants.WeekDayCount ? 1 : weekDayEnd + 1;

          // Re-run weekday-end match using JS regex so we can get the index of the start of the match.
          final matchResult = JsRegExp(WeekDayTimexRegex).exec(splited[2]);
          final weekDayEndMatchStart = matchResult!.indices[1].$1;
          splited[2] = "${splited[2].substring(0, weekDayEndMatchStart)}$weekDayEnd";
          // This line was previously:
          // splited.set(2, splited.get(2).substring(0, weekDayEndMatch.start(1)) + weekDayEnd);
        }
      }
    }

    return splited.join("");
  }

  static String toIsoWeekTimex(DateTime date) {
    //var cal = DateTimeFormatInfo.InvariantInfo.Calendar;
    var thursday = date.AddDays(DateTime.thursday - date.weekday);

    int weekNum = weekNumber(thursday);

    return "${thursday.year.toString().padLeft(4, '0')}-W${weekNum.toString().padLeft(2, '0')}";

    // int weekNum = weekNumber(date);
    // return "${date.year.toString().padLeft(4, '0')}-W${weekNum.toString().padLeft(2, '0')}";
    // Response was previously:
    // return String.format("%04d-W%02d", date.year, weekNum);
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  static int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }
}
