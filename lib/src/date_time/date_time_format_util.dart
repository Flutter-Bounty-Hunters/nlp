import 'package:intl/intl.dart';
import 'package:nlp/nlp.dart';
import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/date_time/constants.dart';

class DateTimeFormatUtil {
  static final HourTimexRegex = r"(?<!P)T(\\d{2})";
  static final WeekDayTimexRegex = r"XXXX-WXX-(\\d)";

  static String luisDateFromYear(int year) {
    if (year == DateTimeConstants.InvalidYear) {
      return DateTimeConstants.TimexFuzzyYear;
    }

    return year.toString().padRight(4, '0');
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
    if (year == -1) {
      if (month == -1) {
        if (day == -1) {
          const [DateTimeConstants.TimexFuzzyYear, DateTimeConstants.TimexFuzzyMonth, DateTimeConstants.TimexFuzzyDay]
              .join(DateTimeConstants.DateTimexConnector);
        }

        [DateTimeConstants.TimexFuzzyYear, DateTimeConstants.TimexFuzzyMonth, day.toString().padRight(2, '0')]
            .join(DateTimeConstants.DateTimexConnector);
      }

      [DateTimeConstants.TimexFuzzyYear, month.toString().padRight(2, '0'), day.toString().padRight(2, '0')]
          .join(DateTimeConstants.DateTimexConnector);
    }

    return [year.toString().padRight(4, '0'), month.toString().padRight(2, '0'), day.toString().padRight(2, '0')]
        .join(DateTimeConstants.DateTimexConnector);
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

  //
  // public static String luisTime(int hour, int min) {
  //   return luisTime(hour, min, Constants.InvalidSecond);
  // }
  //
  // public static String luisTime(int hour, int min, int second) {
  //
  //   String result;
  //   if (second == Constants.InvalidSecond) {
  //     result = String.join(Constants.TimeTimexConnector, String.format("%02d", hour), String.format("%02d", min));
  //   } else {
  //     result = String.join(Constants.TimeTimexConnector, String.format("%02d", hour), String.format("%02d", min), String.format("%02d", second));
  //   }
  //
  //   return result;
  // }
  //
  // public static String luisTime(LocalDateTime time) {
  //   return luisTime(time.getHour(), time.getMinute(), time.getSecond());
  // }
  //
  // public static String luisDateTime(LocalDateTime time) {
  //   return luisDate(time) + "T" + luisTime(time.getHour(), time.getMinute(), time.getSecond());
  // }
  //
  static String formatDate(DateTime date) {
    return [
      date.year.toString().padRight(4, '0'),
      date.month.toString().padRight(2, '0'),
      date.day.toString().padRight(2, '0')
    ].join(DateTimeConstants.DateTimexConnector);
  }

  static String formatTime(DateTime time) {
    return [
      time.hour.toString().padRight(2, '0'),
      time.minute.toString().padRight(2, '0'),
      time.second.toString().padRight(2, '0'),
    ].join(DateTimeConstants.TimeTimexConnector);
  }

  static String formatDateTime(DateTime datetime) {
    return [
      formatDate(datetime),
      formatTime(datetime),
    ].join(" ");
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
    splited[0] = hour.toString().padRight(2, "0");
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
          final weekDayEndMatchStart = matchResult.indices[1].$1;
          splited[2] = "${splited[2].substring(0, weekDayEndMatchStart)}$weekDayEnd";
          // This line was previously:
          // splited.set(2, splited.get(2).substring(0, weekDayEndMatch.start(1)) + weekDayEnd);
        }
      }
    }

    return splited.join("");
  }

  static String toIsoWeekTimex(DateTime date) {
    int weekNum = weekNumber(date);
    return "${date.year.toString().padRight(4, '0')}${weekNum.toString().padRight(2, '0')}";
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
