import 'package:nlp/src/date_time/date_util.dart';

class DateContext {
  static (DateTime future, DateTime past) GenerateDates(
      bool noYear, DateTime referenceDate, int year, int month, int day) {
    var futureDate = DateUtil.createSafeDate(year, month, day);
    var pastDate = DateUtil.createSafeDate(year, month, day);
    var futureYear = year;
    var pastYear = year;
    if (noYear) {
      if (IsFeb29th(year, month, day)) {
        if (isLeapYear(year)) {
          if (futureDate.isBefore(referenceDate)) {
            futureDate = DateTime(futureYear + 4, month, day);
          } else {
            pastDate = DateTime(pastYear - 4, month, day);
          }
        } else {
          pastYear = pastYear >> 2 << 2;
          if (!isLeapYear(pastYear)) {
            pastYear -= 4;
          }

          futureYear = pastYear + 4;
          if (!isLeapYear(futureYear)) {
            futureYear += 4;
          }

          futureDate = DateTime(futureYear, month, day);
          pastDate = DateTime(pastYear, month, day);
        }
      } else {
        if (futureDate.isBefore(referenceDate) && futureDate != DateUtil.minValue()) {
          futureDate = DateTime(year + 1, month, day);
        }

        if (!referenceDate.isAfter(pastDate) && pastDate != DateUtil.minValue()) {
          pastDate = DateTime(year - 1, month, day);
        }
      }
    }

    return (futureDate, pastDate);
  }

  static bool IsFeb29th(int year, int month, int day) {
    return month == 2 && day == 29;
  }

  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }
}
