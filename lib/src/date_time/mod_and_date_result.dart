import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/duration/duration.dart';

class ModAndDateResult {
  static ModAndDateResult ModAndDateResultWithDateList(
      DateTime beginDate, DateTime endDate, String mod, List<DateTime>? dateList) {
    return ModAndDateResult(beginDate, endDate)
      ..Mod = mod
      ..DateList = dateList;
  }

  ModAndDateResult(DateTime beginDate, DateTime endDate) {
    this.BeginDate = beginDate;
    this.EndDate = endDate;
    this.Mod = '';
    this.DateList = [];
  }

  late DateTime BeginDate;

  late DateTime EndDate;

  late String Mod;

  List<DateTime>? DateList;

  static ModAndDateResult GetModAndDate(
      DateTime beginDate, DateTime endDate, DateTime referenceDate, String timex, bool future) {
    DateTime beginDateResult = beginDate;
    DateTime endDateResult = endDate;
    var isBusinessDay = timex.endsWith(DateTimeConstants.TimexBusinessDay);
    var businessDayCount = 0;
    List<DateTime>? dateList = null;

    if (isBusinessDay) {
      businessDayCount = int.parse(timex.substring(1, timex.length - 3));
    }

    if (future) {
      String mod = DateTimeConstants.AFTER_MOD;

      // For future the beginDate should add 1 first
      if (isBusinessDay) {
        beginDateResult = DurationParsingUtil.getNextBusinessDay(referenceDate);
        final nthBusinessDay = DurationParsingUtil.getNthBusinessDay(beginDateResult, businessDayCount - 1, true);
        dateList = nthBusinessDay.dateList;
        endDateResult = nthBusinessDay.result;
        endDateResult = endDateResult.AddDays(1);
        return ModAndDateResultWithDateList(beginDateResult, endDateResult, mod, dateList);
      } else {
        beginDateResult = referenceDate.AddDays(1);
        endDateResult = DurationParsingUtil.shiftDateTime(timex, beginDateResult, true);
        return ModAndDateResultWithDateList(beginDateResult, endDateResult, mod, null);
      }
    } else {
      const String mod = DateTimeConstants.BEFORE_MOD;

      if (isBusinessDay) {
        endDateResult = DurationParsingUtil.getNextBusinessDay(endDateResult, false);
        final nthBusinessDay = DurationParsingUtil.getNthBusinessDay(endDateResult, businessDayCount - 1, false);
        dateList = nthBusinessDay.dateList;
        beginDateResult = nthBusinessDay.result;
        endDateResult = endDateResult.AddDays(1);
        return ModAndDateResultWithDateList(beginDateResult, endDateResult, mod, dateList);
      } else {
        beginDateResult = DurationParsingUtil.shiftDateTime(timex, endDateResult, false);
        return ModAndDateResultWithDateList(beginDateResult, endDateResult, mod, null);
      }
    }
  }
}
