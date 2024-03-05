import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_util.dart';

class DateContext {
  DateContext({
    this.year = DateTimeConstants.InvalidYear,
  });

  final int year;

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

    futureDate = adjustTimeZones(referenceDate, futureDate);
    pastDate = adjustTimeZones(referenceDate, pastDate);

    return (futureDate, pastDate);
  }

  static bool IsFeb29th(int year, int month, int day) {
    return month == 2 && day == 29;
  }

  static DateTime adjustTimeZones(DateTime original, DateTime dateTime) {
    final timeZoneOffset = original.timeZoneOffset;
    if (dateTime.timeZoneOffset != timeZoneOffset) {
      final newDate = dateTime.subtract(dateTime.timeZoneOffset).add(timeZoneOffset);
    }
    return dateTime;
  }

  static bool IsFeb29thDate(DateTime date) {
    return date.month == 2 && date.day == 29;
  }

  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  (DateTimeParseResult pr1, DateTimeParseResult pr2) SyncYear(DateTimeParseResult pr1, DateTimeParseResult pr2) {
    if (IsEmpty()) {
      int futureYear;
      int pastYear;
      if (IsFeb29thDate((pr1.value as DateTimeResolutionResult).futureValue as DateTime)) {
        futureYear = ((pr1.value as DateTimeResolutionResult).futureValue as DateTime).year;
        pastYear = ((pr1.value as DateTimeResolutionResult).pastValue as DateTime).year;
        pr2.value = SyncDateEntityResolutionInFeb29th(pr2.value as DateTimeResolutionResult, futureYear, pastYear);
      } else if (IsFeb29thDate((pr2.value as DateTimeResolutionResult).futureValue as DateTime)) {
        futureYear = ((pr2.value as DateTimeResolutionResult).futureValue as DateTime).year;
        pastYear = ((pr2.value as DateTimeResolutionResult).pastValue as DateTime).year;
        pr1.value = SyncDateEntityResolutionInFeb29th(pr1.value as DateTimeResolutionResult, futureYear, pastYear);
      }
    }

    return (pr1, pr2);
  }

  static DateTime SwiftDateObject(DateTime beginDate, DateTime endDate) {
    if (beginDate.isAfter(endDate)) {
      beginDate = beginDate.AddYears(-1);
    }

    return beginDate;
  }

  bool IsEmpty() {
    return year == DateTimeConstants.InvalidYear;
  }

  DateTimeResolutionResult ProcessDatePeriodEntityResolution(DateTimeResolutionResult resolutionResult) {
    if (!IsEmpty()) {
      resolutionResult.timex = TimexUtility.SetTimexWithContext(resolutionResult.timex ?? '', this);
      resolutionResult.futureValue = SetDateRangeWithContext(resolutionResult.futureValue as (DateTime, DateTime));
      resolutionResult.pastValue = SetDateRangeWithContext(resolutionResult.pastValue as (DateTime, DateTime));
    }

    return resolutionResult;
  }

  DateTimeResolutionResult ProcessDateEntityResolution(DateTimeResolutionResult resolutionResult) {
    if (!IsEmpty()) {
      resolutionResult.timex = TimexUtility.SetTimexWithContext(resolutionResult.timex ?? '', this);
      resolutionResult.futureValue = SetDateWithContext(resolutionResult.futureValue as DateTime);
      resolutionResult.pastValue = SetDateWithContext(resolutionResult.pastValue as DateTime);
    }

    return resolutionResult;
  }

  DateTimeParseResult ProcessDateEntityParsingResult(DateTimeParseResult originalResult) {
    if (!IsEmpty()) {
      originalResult.timexStr = TimexUtility.SetTimexWithContext(originalResult.timexStr ?? '', this);
      originalResult.value = ProcessDateEntityResolution(originalResult.value as DateTimeResolutionResult);
    }

    return originalResult;
  }

  DateTimeResolutionResult SyncDateEntityResolutionInFeb29th(
      DateTimeResolutionResult resolutionResult, int futureYear, int pastYear) {
    resolutionResult.futureValue = SetDateWithContext(resolutionResult.futureValue as DateTime, futureYear);
    resolutionResult.pastValue = SetDateWithContext(resolutionResult.pastValue as DateTime, pastYear);

    return resolutionResult;
  }

  (DateTime, DateTime) SetDateRangeWithContext((DateTime, DateTime) originalDateRange) {
    var startDate = SetDateWithContext(originalDateRange.$1);
    var endDate = SetDateWithContext(originalDateRange.$2);

    return (startDate, endDate);
  }

  DateTime SetDateWithContext(DateTime originalDate, [int year = -1]) {
    if (originalDate != DateUtil.minValue()) {
      return DateUtil.createSafeDate(year == -1 ? this.year : year, originalDate.month, originalDate.day);
    }

    return originalDate;
  }
}
