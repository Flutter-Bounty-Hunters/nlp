import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_util.dart';

class DateObjectExtension {
  static const IndexOfLeapMonth = 1;
  static List<int> MonthValidDays = <int>[31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  static DateTime GetFirstThursday(int year, [int month = DateTimeConstants.InvalidMonth]) {
    var targetMonth = month;

    if (month == DateTimeConstants.InvalidMonth) {
      targetMonth = 1;
    }

    var firstDay = DateUtil.createSafeDate(year, targetMonth, 1);
    DateTime firstThursday = firstDay.This(DateTime.thursday);

    // Thursday falls into previous year or previous month
    if (firstThursday.month != targetMonth) {
      firstThursday = firstDay.AddDays(DateTimeConstants.WeekDayCount);
    }

    return firstThursday;
  }

  static DateTime GetLastThursday(int year, [int month = DateTimeConstants.InvalidMonth]) {
    var targetMonth = month;

    if (month == DateTimeConstants.InvalidMonth) {
      targetMonth = 12;
    }

    var lastDay = GetLastDay(year, targetMonth);
    DateTime lastThursday = lastDay.This(DateTime.thursday);

    // Thursday falls into next year or next month
    if (lastThursday.month != targetMonth) {
      lastThursday = lastThursday.AddDays(-DateTimeConstants.WeekDayCount);
    }

    return lastThursday;
  }

  static DateTime GetLastDay(int year, int month) {
    month++;

    if (month == 13) {
      year++;
      month = 1;
    }

    var firstDayOfNextMonth = DateUtil.createSafeDate(year, month, 1);

    return firstDayOfNextMonth.AddDays(-1);
  }
}
