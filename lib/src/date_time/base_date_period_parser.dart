import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/data_structure.dart';
import 'package:nlp/src/date_time/date_context.dart';
import 'package:nlp/src/date_time/date_object_extension.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/date_time/mod_and_date_result.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/numbers/number_constants.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseDatePeriodParser implements IDateTimeParser {
  BaseDatePeriodParser(this.config);

  final IDatePeriodParserConfiguration config;

  @override
  String getParserName() => DateTimeConstants.SYS_DATETIME_DATEPERIOD;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime refDate) {
    Object? value;

    if (getParserName() == er.type) {
      var innerResult = ParseBaseDatePeriod(er.text, refDate);

      if (!innerResult.success) {
        innerResult = ParseComplexDatePeriod(er.text, refDate);
      }

      if (innerResult.success) {
        if (innerResult.mod == DateTimeConstants.BEFORE_MOD) {
          innerResult.futureResolution = <String, String>{
            TimeTypeConstants.END_DATE: DateTimeFormatUtil.formatDate(innerResult.futureValue as DateTime),
          };

          innerResult.pastResolution = <String, String>{
            TimeTypeConstants.END_DATE: DateTimeFormatUtil.formatDate(innerResult.pastValue as DateTime),
          };
        } else if (innerResult.mod == DateTimeConstants.AFTER_MOD) {
          innerResult.futureResolution = <String, String>{
            TimeTypeConstants.START_DATE: DateTimeFormatUtil.formatDate(innerResult.futureValue as DateTime),
          };

          innerResult.pastResolution = <String, String>{
            TimeTypeConstants.START_DATE: DateTimeFormatUtil.formatDate(innerResult.pastValue as DateTime),
          };
        } else if (innerResult.futureValue != null && innerResult.pastValue != null) {
          innerResult.futureResolution = <String, String>{
            TimeTypeConstants.START_DATE:
                DateTimeFormatUtil.formatDate((innerResult.futureValue as (DateTime, DateTime)).$1),
            TimeTypeConstants.END_DATE:
                DateTimeFormatUtil.formatDate((innerResult.futureValue as (DateTime, DateTime)).$2),
          };

          innerResult.pastResolution = <String, String>{
            TimeTypeConstants.START_DATE:
                DateTimeFormatUtil.formatDate((innerResult.pastValue as (DateTime, DateTime)).$1),
            TimeTypeConstants.END_DATE:
                DateTimeFormatUtil.formatDate((innerResult.pastValue as (DateTime, DateTime)).$2),
          };
        } else {
          innerResult.futureResolution = innerResult.pastResolution = <String, String>{};
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
      metadata: er.metadata,
      value: value,
      timexStr: value == null ? '' : (value as DateTimeResolutionResult).timex,
      resolutionStr: '',
    );

    return ret;
  }

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) => candidateResults;

  static bool inclusiveEndPeriod = false;

  //  static readonly Calendar Cal = DateTimeFormatInfo.InvariantInfo.Calendar;

  //  readonly IDatePeriodParserConfiguration config;

  //  BaseDatePeriodParser(IDatePeriodParserConfiguration configuration)
  // {
  //     config = configuration;
  // }

  static bool IsPresent(int swift) {
    return swift == 0;
  }

  static (DateTime, DateTime) GetWeekRangeFromDate(DateTime date) {
    var startDate = date.This(DateTime.monday);
    var endDate = inclusiveEndPeriod
        ? startDate.AddDays(DateTimeConstants.WeekDayCount - 1)
        : startDate.AddDays(DateTimeConstants.WeekDayCount);
    return (startDate, endDate);
  }

  static (DateTime, DateTime) GetMonthRangeFromDate(DateTime date) {
    var startDate = DateUtil.createSafeDate(date.year, date.month, 1);
    DateTime endDate;
    if (date.month < 12) {
      endDate = DateUtil.createSafeDate(date.year, date.month + 1, 1);
    } else {
      endDate = DateUtil.createSafeDate(date.year + 1, 1, 1);
    }

    endDate = inclusiveEndPeriod ? endDate.AddDays(-1) : endDate;

    return (startDate, endDate);
  }

  // @TODO Refactor code to remove the cycle between BaseDatePeriodParser and its config.
  static DateContext GetYearContext(
      ISimpleDatePeriodParserConfiguration config, String startDateStr, String endDateStr, String text) {
    var isEndDatePureYear = false;
    var isDateRelative = false;
    int contextYear = DateTimeConstants.InvalidYear;

    var yearMatchForEndDate = RegExpComposer.firstMatch(config.YearRegex(), endDateStr);

    if (yearMatchForEndDate != null && yearMatchForEndDate.length == endDateStr.length) {
      isEndDatePureYear = true;
    }

    var relativeMatchForStartDate = config.RelativeRegex().firstMatch(startDateStr);
    var relativeMatchForEndDate = config.RelativeRegex().firstMatch(endDateStr);
    isDateRelative = relativeMatchForStartDate != null || relativeMatchForEndDate != null;

    if (!isEndDatePureYear && !isDateRelative) {
      final matches = RegExpComposer.getMatchesSimple(config.YearRegex(), text);
      for (final match in matches) {
        final yearMatch = RegExpComposer.firstMatch(config.YearRegex(), match.value)!;
        var year = config.DateExtractor().getYearFromText(yearMatch);

        if (year != DateTimeConstants.InvalidYear) {
          if (contextYear == DateTimeConstants.InvalidYear) {
            contextYear = year;
          } else {
            // This indicates that the text has two different year value, no common context year
            if (contextYear != year) {
              contextYear = DateTimeConstants.InvalidYear;
              break;
            }
          }
        }
      }
    }

    return DateContext(year: contextYear);
  }

  // Shift resolution when a modifier like "end of" or "middle of" is present.
  static DateTime ShiftResolution((DateTime, DateTime) date, NlpMatch match, bool start) {
    DateTime result;
    int i = start ? 0 : 1;
    if (match.getGroup("EndOf").captures.length >= 2 && match.getGroup("EndOf").captures[i].length > 0) {
      result = date.$2;
    } else if (match.getGroup("MiddleOf").captures.length >= 2 && match.getGroup("MiddleOf").captures[i].length > 0) {
      var startDate = date.$1;
      var endDate = date.$2;
      var shift = (endDate.difference(startDate).inDays / 2).toInt();
      result = startDate.AddDays(shift);
    } else {
      result = date.$1;
    }

    return result;
  }

  // Process case like "from|between START to|and END" where START/END can be daterange or datepoint
  DateTimeResolutionResult ParseComplexDatePeriod(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = RegExpComposer.firstMatch(config.ComplexDatePeriodRegex(), text);

    if (match != null) {
      var futureBegin = DateUtil.minValue();
      var futureEnd = DateUtil.minValue();
      var pastBegin = DateUtil.minValue();
      var pastEnd = DateUtil.minValue();
      var isSpecificDate = false;
      var isStartByWeek = false;
      var isEndByWeek = false;
      bool isAmbiguousStart = false, isAmbiguousEnd = false;
      var ambiguousRes = DateTimeResolutionResult();
      var dateContext =
          GetYearContext(config, match.getGroup("start").value.trim(), match.getGroup("end").value.trim(), text);

      var startResolution = ParseSingleTimePoint(match.getGroup("start").value.trim(), referenceDate, dateContext);

      if (startResolution.success) {
        // Check if the extraction is ambiguous (e.g. "mar" can be resolved to both "March" and "Tuesday" in FR, IT and ES)
        if (config.AmbiguousPointRangeRegex() != null &&
            config.AmbiguousPointRangeRegex()!.hasMatch(match.getGroup("start").value.trim())) {
          ambiguousRes = startResolution;
          isAmbiguousStart = true;
        } else {
          futureBegin = startResolution.futureValue as DateTime;
          pastBegin = startResolution.pastValue as DateTime;
          isSpecificDate = true;
        }
      }

      if (!startResolution.success || isAmbiguousStart) {
        startResolution = ParseBaseDatePeriod(match.getGroup("start").value.trim(), referenceDate, dateContext);

        if (startResolution.success) {
          // When the start group contains modifiers such as 'end of', 'middle of', the begin resolution must be updated accordingly.
          futureBegin = ShiftResolution(startResolution.futureValue as (DateTime, DateTime), match, true);
          pastBegin = ShiftResolution(startResolution.pastValue as (DateTime, DateTime), match, true);

          if (startResolution.timex?.contains("-W") == true) {
            isStartByWeek = true;
          }
        }
      }

      if (startResolution.success) {
        var endResolution = ParseSingleTimePoint(match.getGroup("end").value.trim(), referenceDate, dateContext);

        if (endResolution.success) {
          // Check if the extraction is ambiguous
          if (config.AmbiguousPointRangeRegex() != null &&
              config.AmbiguousPointRangeRegex()!.hasMatch(match.getGroup("end").value.trim())) {
            ambiguousRes = endResolution;
            isAmbiguousEnd = true;
          } else {
            futureEnd = endResolution.futureValue as DateTime;
            pastEnd = endResolution.pastValue as DateTime;
            isSpecificDate = true;
          }
        }

        if (!endResolution.success || isAmbiguousEnd) {
          endResolution = ParseBaseDatePeriod(match.getGroup("end").value.trim(), referenceDate, dateContext);

          if (endResolution.success) {
            // When the end group contains modifiers such as 'end of', 'middle of', the end resolution must be updated accordingly.
            futureEnd = ShiftResolution(endResolution.futureValue as (DateTime, DateTime), match, false);
            pastEnd = ShiftResolution(endResolution.pastValue as (DateTime, DateTime), match, false);

            if (endResolution.timex?.contains("-W") == true) {
              isEndByWeek = true;
            }
          }
        }

        if (endResolution.success) {
          // When start or end is ambiguous it is better to resolve it to the type of the unambiguous extraction.
          // In Spanish, for example, 'de lunes a mar' (from Monday to Tuesday) or 'de enero a mar' (from January to March).
          // In the first case 'mar' is resolved as Date (weekday), in the second case it is resolved as DatePeriod (month).
          if (isAmbiguousStart && isSpecificDate) {
            startResolution = ambiguousRes;
            futureBegin = startResolution.futureValue as DateTime;
            pastBegin = startResolution.pastValue as DateTime;
          } else if (isAmbiguousEnd && isSpecificDate) {
            endResolution = ambiguousRes;
            futureEnd = endResolution.futureValue as DateTime;
            pastEnd = endResolution.pastValue as DateTime;
          }

          if (futureBegin.isAfter(futureEnd)) {
            if (dateContext == null || dateContext.IsEmpty()) {
              futureBegin = pastBegin;
            } else {
              futureBegin = DateContext.SwiftDateObject(futureBegin, futureEnd);
            }
          }

          if (pastEnd.isBefore(pastBegin)) {
            if (dateContext == null || dateContext.IsEmpty()) {
              pastEnd = futureEnd;
            } else {
              pastBegin = DateContext.SwiftDateObject(pastBegin, pastEnd);
            }
          }

          // If both begin/end are date ranges in "month", the timex should be ByMonth
          // The year period case should already be handled in Basic Cases
          var datePeriodTimexType = DatePeriodTimexType.ByMonth;

          if (isSpecificDate) {
            // If at least one of the begin/end is specific date, the timex should be    ByDay
            datePeriodTimexType = DatePeriodTimexType.ByDay;
          } else if (isStartByWeek && isEndByWeek) {
            // If both begin/end are date ranges in "Week", the timex should be ByWeek
            datePeriodTimexType = DatePeriodTimexType.ByWeek;
          }

          var hasYear = startResolution.timex?.startsWith(DateTimeConstants.TimexFuzzyYear) != true ||
              endResolution.timex?.startsWith(DateTimeConstants.TimexFuzzyYear) != true;
          // If the year is not specified, the combined range timex will use fuzzy years.
          ret.timex = TimexUtility.GenerateDatePeriodTimex(
              futureBegin, futureEnd, datePeriodTimexType, pastBegin, pastEnd, hasYear);
          ret.futureValue = (futureBegin, futureEnd);
          ret.pastValue = (pastBegin, pastEnd);
          ret.success = true;
        }
      }
    }

    return ret;
  }

  DateTimeResolutionResult ParseBaseDatePeriod(String text, DateTime referenceDate, [DateContext? dateContext]) {
    var innerResult = ParseMonthWithYear(text, referenceDate);
    if (!innerResult.success) {
      innerResult = ParseSimpleCases(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseOneWordPeriod(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = MergeTwoTimePoints(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseYear(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseWeekOfMonth(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseWeekOfYear(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseHalfYear(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseQuarter(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseSeason(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseWhichWeek(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseWeekOfDate(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseMonthOfDate(text, referenceDate);
    }

    if (!innerResult.success) {
      innerResult = ParseDecade(text, referenceDate);
    }

    // Cases like "within/less than/more than x weeks from/before/after today"
    if (!innerResult.success) {
      innerResult = ParseDatePointWithAgoAndLater(text, referenceDate);
    }

    // Parse duration should be at the end since it will extract "the last week" from "the last week of July"
    if (!innerResult.success) {
      innerResult = ParseDuration(text, referenceDate);
    }

    // Cases like "21st century"
    if (!innerResult.success) {
      innerResult = ParseOrdinalNumberWithCenturySuffix(text, referenceDate);
    }

    if (innerResult.success && dateContext != null) {
      innerResult = dateContext.ProcessDatePeriodEntityResolution(innerResult);
    }

    return innerResult;
  }

  // Cases like "21st century"
  DateTimeResolutionResult ParseOrdinalNumberWithCenturySuffix(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var er = config.OrdinalExtractor().extract(text).firstOrNull;

    if (er != null && er.start + er.length < text.length) {
      var afterString = text.substring((er.start + er.length)).trim();

      // It falls into the cases like "21st century"
      if (config.CenturySuffixRegex().hasMatch(afterString)) {
        var number = config.NumberParser().parse(er);

        if (number != null) {
          // Note that 1st century means from year 0 - 100
          var startYear = ((number.value as double).toInt() - 1) * DateTimeConstants.CenturyYearsCount;
          var startDate = DateTime(startYear, 1, 1);
          var endDate = DateTime(startYear + DateTimeConstants.CenturyYearsCount, 1, 1);

          var startLuisStr = DateTimeFormatUtil.luisDateFromDateTime(startDate);
          var endLuisStr = DateTimeFormatUtil.luisDateFromDateTime(endDate);
          var durationTimex = "P${DateTimeConstants.CenturyYearsCount}Y";

          ret.timex = "($startLuisStr,$endLuisStr,$durationTimex)";
          ret.futureValue = (startDate, endDate);
          ret.pastValue = (startDate, endDate);
          ret.success = true;
        }
      }
    }

    return ret;
  }

  // Only handle cases like "within/less than/more than x weeks from/before/after today"
  DateTimeResolutionResult ParseDatePointWithAgoAndLater(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var er = config.DateExtractor().extractDateTime(text, referenceDate).firstOrNull;

    if (er != null) {
      var beforeString = text.substring(0, er.start);
      var afterString = text.substring(er.start + er.length);
      var isAgo = config.AgoRegex().hasMatch(er.text);
      var isLater = config.LaterRegex().hasMatch(er.text);

      if ((beforeString.isNotEmpty || (config.CheckBothBeforeAfter() && afterString.isNotEmpty)) &&
          (isAgo || isLater)) {
        var isLessThanOrWithIn = false;
        var isMoreThan = false;

        // cases like "within 3 days from yesterday/tomorrow" does not make any sense
        if (config.TodayNowRegex().hasMatch(er.text)) {
          (isLessThanOrWithIn, isMoreThan) = MatchWithinNextPrefix(beforeString, isAgo, isLessThanOrWithIn, isMoreThan);
        } else {
          isLessThanOrWithIn = isLessThanOrWithIn || config.LessThanRegex().hasMatch(beforeString);
          isMoreThan = config.MoreThanRegex().hasMatch(beforeString);
        }

        // Check also afterString
        if (config.CheckBothBeforeAfter() && !isLessThanOrWithIn && !isMoreThan) {
          (isLessThanOrWithIn, isMoreThan) = MatchWithinNextPrefix(afterString, isAgo, isLessThanOrWithIn, isMoreThan);
        }

        var pr = config.DateParser().parseDateTime(er, referenceDate);
        var durationExtractionResult = config.DurationExtractor().extractDateTime(er.text, referenceDate).firstOrNull;

        if (durationExtractionResult != null) {
          var duration = config.DurationParser().parse(durationExtractionResult);
          var durationInSeconds = ((duration!.value as DateTimeResolutionResult).pastValue as double).toInt();

          if (isLessThanOrWithIn) {
            DateTime startDate;
            DateTime endDate;

            if (isAgo) {
              startDate = (pr.value as DateTimeResolutionResult).pastValue as DateTime;
              endDate = startDate.AddSeconds(durationInSeconds);
            } else {
              endDate = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
              startDate = endDate.AddSeconds(-durationInSeconds);
            }

            if (startDate != DateUtil.minValue()) {
              var startLuisStr = DateTimeFormatUtil.luisDateFromDateTime(startDate);
              var endLuisStr = DateTimeFormatUtil.luisDateFromDateTime(endDate);
              var durationTimex = (duration.value as DateTimeResolutionResult).timex;

              ret.timex = "($startLuisStr,$endLuisStr,$durationTimex)";
              ret.futureValue = (startDate, endDate);
              ret.pastValue = (startDate, endDate);
              ret.success = true;
            }
          } else if (isMoreThan) {
            ret.mod = isAgo ? DateTimeConstants.BEFORE_MOD : DateTimeConstants.AFTER_MOD;

            ret.timex = "${pr.timexStr}";
            ret.futureValue = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
            ret.pastValue = (pr.value as DateTimeResolutionResult).pastValue as DateTime;
            ret.success = true;
          }
        }
      }
    }

    return ret;
  }

  DateTimeResolutionResult ParseSingleTimePoint(String text, DateTime referenceDate, [DateContext? dateContext]) {
    var ret = DateTimeResolutionResult();
    var er = config.DateExtractor().extractDateTime(text, referenceDate).firstOrNull;

    if (er != null) {
      var match = RegExpComposer.firstMatch(config.WeekWithWeekDayRangeRegex(), text);
      String weekPrefix = '';
      if (match != null) {
        weekPrefix = match.getGroup("week").value;
      }

      if (weekPrefix.isNotEmpty) {
        er.text = weekPrefix + " " + er.text;
      }

      var pr = config.DateParser().parseDateTime(er, referenceDate);

      if (pr != null) {
        ret.timex = "(${pr.timexStr}";
        ret.futureValue = (pr.value as DateTimeResolutionResult).futureValue as DateTime;
        ret.pastValue = (pr.value as DateTimeResolutionResult).pastValue as DateTime;
        ret.success = true;
      }

      // Expressions like "today", "tomorrow",... should keep their original year
      if (dateContext != null && !config.SpecialDayRegex().hasMatch(er.text)) {
        ret = dateContext.ProcessDateEntityResolution(ret);
      }
    }

    // Handle expressions with "now"
    if (er == null) {
      var nowPr = ParseNowAsDate(text, referenceDate);
      if (nowPr.value != null) {
        ret.timex = "(${nowPr.timexStr}";
        ret.futureValue = (nowPr.value as DateTimeResolutionResult).futureValue as DateTime;
        ret.pastValue = (nowPr.value as DateTimeResolutionResult).pastValue as DateTime;
        ret.success = true;
      }
    }

    return ret;
  }

  DateTimeResolutionResult ParseSimpleCases(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    int year = referenceDate.year, month = referenceDate.month;
    int beginDay, endDay;
    var noYear = true;

    var match = RegExpComposer.matchExact(config.MonthFrontBetweenRegex(), text, true);
    String beginLuisStr, endLuisStr;

    if (match == null) {
      match = RegExpComposer.matchExact(config.BetweenRegex(), text, true);
    }

    if (match == null) {
      match = RegExpComposer.matchExact(config.MonthFrontSimpleCasesRegex(), text, true);
    }

    if (match == null) {
      match = RegExpComposer.matchExact(config.SimpleCasesRegex(), text, true);
    }

    if (match != null) {
      var days = match.getGroup(DateTimeConstants.DayGroupName);
      var writtenDay = match.getGroup(DateTimeConstants.OrdinalGroupName);
      if (writtenDay.captures.length > 0 && days.captures[0].value == writtenDay.captures[0].value) {
        // Parse beginDay in written form
        var dayMatch = writtenDay.captures[0];
        var dayEr = ExtractResult(
          start: dayMatch.index,
          length: dayMatch.length,
          text: dayMatch.value,
          type: Constants.SYS_NUMBER_ORDINAL,
          metadata: Metadata(isOrdinalRelative: false),
        );
        var dayPr = config.NumberParser().parse(dayEr);
        beginDay = (dayPr?.value as double).toInt();
      } else {
        beginDay = config.DayOfMonth()[days.captures[0].value]!;
      }

      if (writtenDay.captures.length > 0 &&
          days.captures[1].value == writtenDay.captures[writtenDay.captures.length - 1].value) {
        // Parse endDay in written form
        var dayMatch = writtenDay.captures[writtenDay.captures.length - 1];
        var dayEr = ExtractResult(
          start: dayMatch.index,
          length: dayMatch.length,
          text: dayMatch.value,
          type: Constants.SYS_NUMBER_ORDINAL,
          metadata: Metadata(isOrdinalRelative: false),
        );
        var dayPr = config.NumberParser().parse(dayEr);
        endDay = (dayPr!.value as double).toInt();
      } else {
        endDay = config.DayOfMonth()[days.captures[1].value]!;
      }

      // parse year
      year = config.DateExtractor().getYearFromText(match);

      if (year != DateTimeConstants.InvalidYear) {
        noYear = false;
      } else {
        year = referenceDate.year;
      }

      var monthStr = match.getGroup("month").value;

      if (monthStr.isNotEmpty) {
        month = config.MonthOfYear()[monthStr]!;
      } else {
        monthStr = match.getGroup("relmonth").value.trim();
        var swiftMonth = config.GetSwiftDayOrMonth(monthStr);
        switch (swiftMonth) {
          case 1:
            if (month != 12) {
              month += 1;
            } else {
              month = 1;
              year += 1;
            }

            break;
          case -1:
            if (month != 1) {
              month -= 1;
            } else {
              month = 12;
              year -= 1;
            }

            break;
          default:
            break;
        }

        if (config.IsFuture(monthStr)) {
          noYear = false;
        }
      }
    } else {
      return ret;
    }

    if (noYear) {
      beginLuisStr = DateTimeFormatUtil.luisDateFromComponents(-1, month, beginDay);
      endLuisStr = DateTimeFormatUtil.luisDateFromComponents(-1, month, endDay);
    } else {
      beginLuisStr = DateTimeFormatUtil.luisDateFromComponents(year, month, beginDay);
      endLuisStr = DateTimeFormatUtil.luisDateFromComponents(year, month, endDay);
    }

    var futurePastBeginDates = DateContext.GenerateDates(noYear, referenceDate, year, month, beginDay);
    var futurePastEndDates = DateContext.GenerateDates(noYear, referenceDate, year, month, endDay);

    ret.timex = "($beginLuisStr,$endLuisStr,P${endDay - beginDay}D)";
    ret.futureValue = (futurePastBeginDates.$1, futurePastEndDates.$1);
    ret.pastValue = (futurePastBeginDates.$2, futurePastEndDates.$2);
    ret.success = true;

    return ret;
  }

  DateTimeResolutionResult ParseOneWordPeriod(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    int year = referenceDate.year, month = referenceDate.month;
    int futureYear = year, pastYear = year;
    var earlyPrefix = false;
    var latePrefix = false;
    var midPrefix = false;
    var isReferenceDatePeriod = false;

    var earlierPrefix = false;
    var laterPrefix = false;

    var trimmedText = text.trim();
    var match = RegExpComposer.matchExact(config.OneWordPeriodRegex(), trimmedText, true);

    if (match == null) {
      match = RegExpComposer.matchExact(config.LaterEarlyPeriodRegex(), trimmedText, true);
    }

    // For cases "that week|month|year"
    if (match == null) {
      match = RegExpComposer.matchExact(config.ReferenceDatePeriodRegex(), trimmedText, true);
      isReferenceDatePeriod = true;
      ret.mod = DateTimeConstants.REF_UNDEF_MOD;
    }

    if (match != null) {
      if (match.getGroup("EarlyPrefix").success) {
        earlyPrefix = true;
        trimmedText = match.getGroup(DateTimeConstants.SuffixGroupName).value;
        ret.mod = DateTimeConstants.EARLY_MOD;
      } else if (match.getGroup("LatePrefix").success) {
        latePrefix = true;
        trimmedText = match.getGroup(DateTimeConstants.SuffixGroupName).value;
        ret.mod = DateTimeConstants.LATE_MOD;
      } else if (match.getGroup("MidPrefix").success) {
        midPrefix = true;
        trimmedText = match.getGroup(DateTimeConstants.SuffixGroupName).value;
        ret.mod = DateTimeConstants.MID_MOD;
      }

      var swift = 0;
      if (match.getGroup("month").value.isNotEmpty) {
        swift = config.GetSwiftYear(trimmedText);
      } else {
        swift = config.GetSwiftDayOrMonth(trimmedText);
      }

      // Handle the abbreviation of DatePeriod, e.g., 'eoy(end of year)', the behavior of 'eoy' should be the same as 'end of year'
      if (config.UnspecificEndOfRangeRegex().hasMatch(match.value)) {
        latePrefix = true;
        trimmedText = match.value;
        ret.mod = DateTimeConstants.LATE_MOD;
      }

      if (match.getGroup("RelEarly").success) {
        earlierPrefix = true;
        if (IsPresent(swift)) {
          ret.mod = null;
        }
      } else if (match.getGroup("RelLate").success) {
        laterPrefix = true;
        if (IsPresent(swift)) {
          ret.mod = null;
        }
      }

      var monthStr = match.getGroup("month").value;
      if (config.IsYearToDate(trimmedText)) {
        ret.timex = referenceDate.year.toString().padLeft(4, '0');
        ret.futureValue = ret.pastValue = (DateUtil.createSafeDate(referenceDate.year, 1, 1), referenceDate);
        ret.success = true;
        return ret;
      }

      if (config.IsMonthToDate(trimmedText)) {
        ret.timex =
            referenceDate.year.toString().padLeft(4, '0') + "-" + referenceDate.month.toString().padLeft(2, '0');
        ret.futureValue =
            ret.pastValue = (DateUtil.createSafeDate(referenceDate.year, referenceDate.month, 1), referenceDate);
        ret.success = true;
        return ret;
      }

      // Parse expressions "till date", "to date"
      if (match.getGroup("toDate").success) {
        ret.timex = "PRESENT_REF";
        ret.futureValue = ret.pastValue = referenceDate;
        ret.mod = DateTimeConstants.BEFORE_MOD;
        ret.success = true;
        return ret;
      }

      if (monthStr.isNotEmpty) {
        swift = config.GetSwiftYear(trimmedText);

        month = config.MonthOfYear()[monthStr]!;

        if (swift >= -1) {
          ret.timex = (referenceDate.year + swift).toString().padLeft(4, '0') + "-" + month.toString().padLeft(2, '0');
          year = year + swift;
          futureYear = pastYear = year;
        } else {
          ret.timex = "XXXX-" + month.toString().padLeft(2, '0');
          if (month < referenceDate.month) {
            futureYear++;
          }

          if (month >= referenceDate.month) {
            pastYear--;
          }
        }
      } else {
        swift = config.GetSwiftDayOrMonth(trimmedText);

        var isWorkingWeek = match.getGroup("business").success;
        var isFortnight = config.IsFortnight(trimmedText);

        if (isWorkingWeek || config.IsWeekOnly(trimmedText) || isFortnight) {
          var delta = DateTimeConstants.WeekDayCount * swift;
          var endDelta = delta;

          if (isFortnight) {
            // One more week
            delta *= 2;
            endDelta = delta + DateTimeConstants.WeekDayCount;
          }

          var monday = referenceDate.This(DateTime.monday).AddDays(delta);
          var endDay = isWorkingWeek ? DateTime.friday : DateTime.sunday;

          var beginDate = referenceDate.This(DateTime.monday).AddDays(delta);
          var endDate = inclusiveEndPeriod
              ? referenceDate.This(endDay).AddDays(endDelta)
              : referenceDate.This(endDay).AddDays(endDelta).AddDays(1);

          if (earlyPrefix) {
            endDate = inclusiveEndPeriod
                ? referenceDate.This(DateTime.wednesday).AddDays(endDelta)
                : referenceDate.This(DateTime.wednesday).AddDays(endDelta).AddDays(1);
          } else if (midPrefix) {
            beginDate = referenceDate.This(DateTime.tuesday).AddDays(delta);
            endDate = inclusiveEndPeriod
                ? referenceDate.This(DateTime.friday).AddDays(endDelta)
                : referenceDate.This(DateTime.friday).AddDays(endDelta).AddDays(1);
          } else if (latePrefix) {
            beginDate = referenceDate.This(DateTime.thursday).AddDays(delta);
          }

          if (earlierPrefix && swift == 0) {
            if (endDate.isAfter(referenceDate)) {
              endDate = referenceDate;
            }
          } else if (laterPrefix && swift == 0) {
            if (beginDate.isBefore(referenceDate)) {
              beginDate = referenceDate;
            }
          }

          if (isFortnight) {
            ret.timex = TimexUtility.GenerateDatePeriodTimex(beginDate, endDate, DatePeriodTimexType.ByFortnight);
          } else {
            ret.timex =
                isReferenceDatePeriod ? TimexUtility.GenerateWeekTimex() : TimexUtility.GenerateWeekTimex(monday);
          }

          if (latePrefix && swift != 0) {
            ret.mod = DateTimeConstants.LATE_MOD;
          }

          ret.futureValue = ret.pastValue = (beginDate, endDate);

          ret.success = true;

          return ret;
        }

        if (config.IsWeekend(trimmedText)) {
          var beginDate = referenceDate.This(DateTime.saturday).AddDays(DateTimeConstants.WeekDayCount * swift);
          var endDate = referenceDate.This(DateTime.sunday).AddDays(DateTimeConstants.WeekDayCount * swift);

          ret.timex = isReferenceDatePeriod
              ? TimexUtility.GenerateWeekendTimex()
              : TimexUtility.GenerateWeekendTimex(beginDate);

          endDate = inclusiveEndPeriod ? endDate : endDate.AddDays(1);

          ret.futureValue = ret.pastValue = (beginDate, endDate);

          ret.success = true;
          return ret;
        }

        if (config.IsMonthOnly(trimmedText)) {
          var date = referenceDate.AddMonths(swift);
          month = date.month;
          year = date.year;
          ret.timex = isReferenceDatePeriod ? TimexUtility.GenerateMonthTimex() : TimexUtility.GenerateMonthTimex(date);
          futureYear = pastYear = year;
        } else if (config.IsYearOnly(trimmedText)) {
          var date = referenceDate.AddYears(swift);
          year = date.year;

          if (match.getGroup("special").value.isNotEmpty) {
            var specialYearPrefixes = config.SpecialYearPrefixesMap()[match.getGroup("special").value.toLowerCase()];
            swift = config.GetSwiftYear(trimmedText);
            date = swift < -1 ? DateTimeConstants.InvalidDate : date;
            ret.timex = TimexUtility.GenerateYearTimex(date, specialYearPrefixes);
            ret.success = true;
            return ret;
          }

          var beginDate = DateUtil.createSafeDate(year, 1, 1);
          var endDate = inclusiveEndPeriod
              ? DateUtil.createSafeDate(year, 12, 31)
              : DateUtil.createSafeDate(year, 12, 31).AddDays(1);

          if (earlyPrefix) {
            endDate = inclusiveEndPeriod
                ? DateUtil.createSafeDate(year, 6, 30)
                : DateUtil.createSafeDate(year, 6, 30).AddDays(1);
          } else if (midPrefix) {
            beginDate = DateUtil.createSafeDate(year, 4, 1);
            endDate = inclusiveEndPeriod
                ? DateUtil.createSafeDate(year, 9, 30)
                : DateUtil.createSafeDate(year, 9, 30).AddDays(1);
          } else if (latePrefix) {
            beginDate = DateUtil.createSafeDate(year, DateTimeConstants.WeekDayCount, 1);
          }

          if (earlierPrefix && swift == 0) {
            if (endDate.isAfter(referenceDate)) {
              endDate = referenceDate;
            }
          } else if (laterPrefix && swift == 0) {
            if (beginDate.isBefore(referenceDate)) {
              beginDate = referenceDate;
            }
          }

          ret.timex = isReferenceDatePeriod ? TimexUtility.GenerateYearTimex() : TimexUtility.GenerateYearTimex(date);

          ret.futureValue = ret.pastValue = (beginDate, endDate);

          ret.success = true;
          return ret;
        }

        // Early/mid/late are resolved in this policy to 4 month ranges at the start/middle/end of the year.
        else if (match.getGroup("FourDigitYear").value.isNotEmpty) {
          var date = referenceDate.AddYears(swift);
          year = int.parse(match.getGroup("FourDigitYear").value);

          var beginDate = DateUtil.createSafeDate(year, 1, 1);
          var endDate = inclusiveEndPeriod
              ? DateUtil.createSafeDate(year, 12, 31)
              : DateUtil.createSafeDate(year, 12, 31).AddDays(1);

          if (earlyPrefix) {
            endDate = inclusiveEndPeriod
                ? DateUtil.createSafeDate(year, 4, 30)
                : DateUtil.createSafeDate(year, 4, 30).AddDays(1);
          } else if (midPrefix) {
            beginDate = DateUtil.createSafeDate(year, 5, 1);
            endDate = inclusiveEndPeriod
                ? DateUtil.createSafeDate(year, 8, 31)
                : DateUtil.createSafeDate(year, 8, 31).AddDays(1);
          } else if (latePrefix) {
            beginDate = DateUtil.createSafeDate(year, 9, 1);
          }

          ret.timex =
              isReferenceDatePeriod ? TimexUtility.GenerateYearTimex() : TimexUtility.GenerateYearTimex(beginDate);

          ret.futureValue = ret.pastValue = (beginDate, endDate);

          ret.success = true;
          return ret;
        }
      }
    } else {
      return ret;
    }

    // only "month" will come to here
    var futureStart = DateUtil.createSafeDate(futureYear, month, 1);
    var futureEnd = inclusiveEndPeriod
        ? DateUtil.createSafeDate(futureYear, month, 1).AddMonths(1).AddDays(-1)
        : DateUtil.createSafeDate(futureYear, month, 1).AddMonths(1);

    var pastStart = DateUtil.createSafeDate(pastYear, month, 1);
    var pastEnd = inclusiveEndPeriod
        ? DateUtil.createSafeDate(pastYear, month, 1).AddMonths(1).AddDays(-1)
        : DateUtil.createSafeDate(pastYear, month, 1).AddMonths(1);

    if (earlyPrefix) {
      futureEnd = inclusiveEndPeriod
          ? DateUtil.createSafeDate(futureYear, month, 15)
          : DateUtil.createSafeDate(futureYear, month, 15).AddDays(1);

      pastEnd = inclusiveEndPeriod
          ? DateUtil.createSafeDate(pastYear, month, 15)
          : DateUtil.createSafeDate(pastYear, month, 15).AddDays(1);
    } else if (midPrefix) {
      futureStart = DateUtil.createSafeDate(futureYear, month, 10);
      pastStart = DateUtil.createSafeDate(pastYear, month, 10);
      futureEnd = inclusiveEndPeriod
          ? DateUtil.createSafeDate(futureYear, month, 20)
          : DateUtil.createSafeDate(futureYear, month, 20).AddDays(1);

      pastEnd = inclusiveEndPeriod
          ? DateUtil.createSafeDate(pastYear, month, 20)
          : DateUtil.createSafeDate(pastYear, month, 20).AddDays(1);
    } else if (latePrefix) {
      futureStart = DateUtil.createSafeDate(futureYear, month, 16);
      pastStart = DateUtil.createSafeDate(pastYear, month, 16);
    }

    if (earlierPrefix && futureEnd == pastEnd) {
      if (futureEnd.isAfter(referenceDate)) {
        futureEnd = pastEnd = referenceDate;
      }
    } else if (laterPrefix && futureStart == pastStart) {
      if (futureStart.isBefore(referenceDate)) {
        futureStart = pastStart = referenceDate;
      }
    }

    ret.futureValue = (futureStart, futureEnd);
    ret.pastValue = (pastStart, pastEnd);
    ret.success = true;

    return ret;
  }

  DateTimeResolutionResult ParseMonthWithYear(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();

    var match = RegExpComposer.matchExact(config.MonthWithYear(), text, true);

    if (match == null) {
      match = RegExpComposer.matchExact(config.MonthNumWithYear(), text, true);
    }

    if (match != null) {
      var monthStr = match.getGroup("month").value;
      var orderStr = match.getGroup("order").value;
      var cardinalStr = match.getGroup("cardinal").value;

      // Get month number from MonthOfYear dictionary if month name is defined (e.g. 'May 2018'),
      // otherwise use CardinalMap (e.g. 'third month of 2018').
      var month = match.getGroup("month").success
          ? config.MonthOfYear()[monthStr]!
          : config.IsLastCardinal(cardinalStr)
              ? 12
              : config.CardinalMap()[cardinalStr]!;

      var year = config.DateExtractor().getYearFromText(match);

      if (year == DateTimeConstants.InvalidYear) {
        var swift = config.GetSwiftYear(orderStr);
        if (swift < -1) {
          return ret;
        }

        year = referenceDate.year + swift;
      }

      DateTime dateValue = inclusiveEndPeriod
          ? DateUtil.createSafeDate(year, month, 1).AddMonths(1).AddDays(-1)
          : DateUtil.createSafeDate(year, month, 1).AddMonths(1);

      ret.futureValue = ret.pastValue = (DateUtil.createSafeDate(year, month, 1), dateValue);

      ret.timex = DateTimeFormatUtil.luisDateFromComponents(year, month);

      ret.success = true;
    }

    return ret;
  }

  DateTimeResolutionResult ParseYear(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var year = DateTimeConstants.InvalidYear;

    var match = config.YearPeriodRegex().firstMatch(text);
    var matchMonth = config.MonthWithYear().firstMatch(text);

    if (match != null && matchMonth == null) {
      var beginYear = DateTimeConstants.InvalidYear;
      var endYear = DateTimeConstants.InvalidYear;

      var matches = RegExpComposer.getMatchesSimple(config.YearRegex(), text);
      if (matches.length == 2) {
        // (from|during|in|between)? 2012 (till|to|until|through|-) 2015
        if (matches[0] != null) {
          beginYear = config.DateExtractor().getYearFromText(matches[0]);
          if (!(beginYear >= DateTimeConstants.MinYearNum && beginYear <= DateTimeConstants.MaxYearNum)) {
            beginYear = DateTimeConstants.InvalidYear;
          }
        }

        if (matches[1] != null) {
          final secondYearMatch = RegExpComposer.firstMatch(config.YearRegex(), matches[1].value);
          endYear = (this.config.DateExtractor()).getYearFromText(secondYearMatch!);
          if (!(endYear >= DateTimeConstants.MinYearNum && endYear <= DateTimeConstants.MaxYearNum)) {
            endYear = DateTimeConstants.InvalidYear;
          }
        }
      }

      if (beginYear != DateTimeConstants.InvalidYear && endYear != DateTimeConstants.InvalidYear) {
        var beginDay = DateUtil.createSafeDate(beginYear, 1, 1);

        var endDay = inclusiveEndPeriod
            ? DateUtil.createSafeDate(endYear, 1, 1).AddDays(-1)
            : DateUtil.createSafeDate(endYear, 1, 1);

        ret.timex = TimexUtility.GenerateDatePeriodTimex(beginDay, endDay, DatePeriodTimexType.ByYear);
        ret.futureValue = ret.pastValue = (beginDay, endDay);
        ret.success = true;

        return ret;
      }
    } else {
      var exactMatch = RegExpComposer.matchExact(config.YearRegex(), text, true);

      if (exactMatch != null) {
        year = config.DateExtractor().getYearFromText(exactMatch);

        if (!(year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum)) {
          year = DateTimeConstants.InvalidYear;
        }
      } else {
        exactMatch = RegExpComposer.matchExact(config.YearPlusNumberRegex(), text, true);

        if (exactMatch != null) {
          year = config.DateExtractor().getYearFromText(exactMatch);
          if (exactMatch.getGroup("special").value.isNotEmpty) {
            var specialYearPrefixes =
                config.SpecialYearPrefixesMap()[exactMatch.getGroup("special").value.toLowerCase()];
            ret.timex = TimexUtility.GenerateYearTimexFromYear(year, specialYearPrefixes);
            ret.success = true;
            return ret;
          }
        }
      }

      if (year != DateTimeConstants.InvalidYear) {
        var beginDay = DateUtil.createSafeDate(year, 1, 1);

        var endDay = inclusiveEndPeriod
            ? DateUtil.createSafeDate(year + 1, 1, 1).AddDays(-1)
            : DateUtil.createSafeDate(year + 1, 1, 1);

        ret.timex = TimexUtility.GenerateYearTimexFromYear(year);
        ret.futureValue = ret.pastValue = (beginDay, endDay);
        ret.success = true;

        return ret;
      }
    }

    return ret;
  }

  // Parse entities that are made up by two time points
  DateTimeResolutionResult MergeTwoTimePoints(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();

    var er = config.DateExtractor().extractDateTime(text, referenceDate);
    DateTimeParseResult? pr1;
    DateTimeParseResult? pr2;
    if (er.length < 2) {
      er = config.DateExtractor().extractDateTime(config.TokenBeforeDate() + text, referenceDate);
      if (er.length >= 2) {
        er[0].start -= config.TokenBeforeDate().length;
        er[1].start -= config.TokenBeforeDate().length;
      } else {
        var nowPr = ParseNowAsDate(text, referenceDate);
        if (nowPr.value == null || er.length < 1) {
          return ret;
        }

        var datePr = config.DateParser().parseDateTime(er[0], referenceDate);
        pr1 = datePr.start < nowPr.start ? datePr : nowPr;
        pr2 = datePr.start < nowPr.start ? nowPr : datePr;
      }
    }

    if (er.length >= 2) {
      // Propagate the possible future relative context from the first entity to the second one in the range.
      // Handles cases like "next monday to friday"
      var futureMatchForStartDate = config.FutureRegex().firstMatch(er[0].text);
      var futureMatchForEndDate = config.FutureRegex().firstMatch(er[1].text);

      if (futureMatchForStartDate != null && futureMatchForEndDate == null) {
        er[1].text = "${futureMatchForStartDate.value} ${er[1].text}";
      }

      var match = RegExpComposer.firstMatch(config.WeekWithWeekDayRangeRegex(), text);
      String? weekPrefix;

      if (match != null) {
        weekPrefix = match.getGroup("week").value;
      }

      // Check if weekPrefix is already included in the extractions otherwise include it
      if (weekPrefix?.isNotEmpty == true) {
        if (!er[0].text.contains(weekPrefix!)) {
          er[0].text = weekPrefix + " " + er[0].text;
        }

        if (!er[1].text.contains(weekPrefix)) {
          er[1].text = weekPrefix + " " + er[1].text;
        }
      }

      var dateContext = GetYearContext(config, er[0].text, er[1].text, text);

      pr1 = config.DateParser().parseDateTime(er[0], referenceDate);
      pr2 = config.DateParser().parseDateTime(er[1], referenceDate);
      if (pr1.value == null || pr2.value == null) {
        return ret;
      }

      // When the case has no specified year, we should sync the future/past year due to invalid date Feb 29th.
      if (dateContext.IsEmpty() &&
          (DateContext.IsFeb29thDate((pr1.value as DateTimeResolutionResult).futureValue as DateTime) ||
              DateContext.IsFeb29thDate((pr2.value as DateTimeResolutionResult).futureValue as DateTime))) {
        (pr1, pr2) = dateContext.SyncYear(pr1, pr2);
      }

      // Expressions like "today", "tomorrow",... should keep their original year
      if (!config.SpecialDayRegex().hasMatch(pr1.text)) {
        pr1 = dateContext.ProcessDateEntityParsingResult(pr1);
      }

      if (!config.SpecialDayRegex().hasMatch(pr2.text)) {
        pr2 = dateContext.ProcessDateEntityParsingResult(pr2);
      }
    }

    ret.subDateTimeEntities = <Object>[pr1!, pr2!];

    DateTime futureBegin = (pr1.value as DateTimeResolutionResult).futureValue as DateTime,
        futureEnd = (pr2.value as DateTimeResolutionResult).futureValue as DateTime;

    DateTime pastBegin = (pr1.value as DateTimeResolutionResult).pastValue as DateTime,
        pastEnd = (pr2.value as DateTimeResolutionResult).pastValue as DateTime;

    if (futureBegin.isAfter(futureEnd)) {
      futureBegin = pastBegin;
    }

    if (pastEnd.isBefore(pastBegin)) {
      pastEnd = futureEnd;
    }

    ret.timex = TimexUtility.GenerateDatePeriodTimexFromTimex(
        futureBegin, futureEnd, DatePeriodTimexType.ByDay, pr1.timexStr!, pr2.timexStr!);

    if (pr1.timexStr!.startsWith(DateTimeConstants.TimexFuzzyYear) &&
        futureBegin.compareTo(DateUtil.createSafeDate(futureBegin.year, 2, 28)) <= 0 &&
        futureEnd.compareTo(DateUtil.createSafeDate(futureBegin.year, 3, 1)) >= 0) {
      // Handle cases like "Feb 28th - March 1st".
      // There may be different timexes for futureValue and pastValue due to the different validity of Feb 29th.
      ret.comment = DateTimeConstants.Comment_DoubleTimex;
      var pastTimex = TimexUtility.GenerateDatePeriodTimexFromTimex(
          pastBegin, pastEnd, DatePeriodTimexType.ByDay, pr1.timexStr!, pr2.timexStr!);
      ret.timex = TimexUtility.MergeTimexAlternatives(ret.timex!, pastTimex);
    }

    ret.futureValue = (futureBegin, futureEnd);
    ret.pastValue = (pastBegin, pastEnd);
    ret.success = true;

    return ret;
  }

  // Handle "between...and..." when contains with "now"
  DateTimeParseResult ParseNowAsDate(String text, DateTime referenceDate) {
    var pr = DateTimeParseResult(start: 0, length: 0, text: '');
    var match = config.NowRegex().firstMatch(text);

    if (match != null) {
      var value = DateUtil.createSafeDate(referenceDate.year, referenceDate.month, referenceDate.day);
      var retNow = DateTimeResolutionResult(
        timex: DateTimeFormatUtil.luisDateFromDateTime(value),
        futureValue: value,
        pastValue: value,
      );

      pr = DateTimeParseResult(
        text: match.value,
        start: match.start,
        length: match.length,
        value: retNow,
        type: DateTimeConstants.SYS_DATETIME_DATE,
        timexStr: retNow == null ? '' : (retNow as DateTimeResolutionResult).timex,
      );
    }

    return pr;
  }

  DateTimeResolutionResult ParseDuration(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    DateTime beginDate;
    DateTime endDate = beginDate = referenceDate;
    var durationTimex = '';
    var restNowSunday = false;

    var durationErs = config.DurationExtractor().extractDateTime(text, referenceDate);
    if (durationErs.length > 0) {
      var durationPr = config.DurationParser().parse(durationErs[0])!;
      var beforeStr = text.substring(0, durationPr.start ?? 0).trim();
      var afterStr = text.substring((durationPr.start ?? 0) + (durationPr.length ?? 0)).trim();

      var numbersInSuffix = config.CardinalExtractor().extract(beforeStr);
      var numbersInDuration = config.CardinalExtractor().extract(durationErs[0].text);

      // Handle cases like "2 upcoming days", "5 previous years"
      if (numbersInSuffix.isNotEmpty && numbersInDuration.isEmpty) {
        var numberEr = numbersInSuffix.first;
        var numberText = numberEr.text;
        var durationText = durationErs[0].text;
        var combinedText = "${numberText} ${durationText}";
        var combinedDurationEr = config.DurationExtractor().extractDateTime(combinedText, referenceDate);

        if (combinedDurationEr.isNotEmpty) {
          durationPr = config.DurationParser().parse(combinedDurationEr.first)!;
          var startIndex = numberEr.start + numberEr.length;
          beforeStr = beforeStr.substring(startIndex).trim();
        }
      }

      ModAndDateResult modAndDateResult = ModAndDateResult(beginDate, endDate);

      if (durationPr.value != null) {
        var durationResult = durationPr.value as DateTimeResolutionResult;

        if (durationResult.timex?.isNotEmpty != true) {
          return ret;
        }

        if (config.PastRegex().hasMatch(beforeStr) || config.PastRegex().hasMatch(afterStr)) {
          modAndDateResult =
              ModAndDateResult.GetModAndDate(beginDate, endDate, referenceDate, durationResult.timex ?? '', false);
          beginDate = modAndDateResult.BeginDate;
        }

        // Handle the "within two weeks" case which means from today to the end of next two weeks
        // Cases like "within 3 days before/after today" is not handled here (4th condition)
        var isMatch = false;
        if (config.WithinNextPrefixRegex().matchExact(beforeStr, true) != null &&
            DurationParsingUtil.isDateDuration(durationResult.timex ?? '') &&
            afterStr.isEmpty) {
          modAndDateResult =
              ModAndDateResult.GetModAndDate(beginDate, endDate, referenceDate, durationResult.timex ?? '', true);

          // In GetModAndDate, this "future" resolution will add one day to beginDate/endDate,
          // but for the "within" case it should start from the current day.
          beginDate = modAndDateResult.BeginDate.AddDays(-1);
          endDate = modAndDateResult.EndDate.AddDays(-1);
          isMatch = true;
        } else if (config.CheckBothBeforeAfter()) {
          // check also afterStr
          if (config.WithinNextPrefixRegex().matchExact(afterStr, true) != null &&
              DurationParsingUtil.isDateDuration(durationResult.timex ?? '') &&
              (config.FutureRegex().matchEnd(beforeStr, true) != null || beforeStr.isEmpty)) {
            modAndDateResult =
                ModAndDateResult.GetModAndDate(beginDate, endDate, referenceDate, durationResult.timex ?? '', true);

            // In GetModAndDate, this "future" resolution will add one day to beginDate/endDate,
            // but for the "within" case it should start from the current day.
            beginDate = modAndDateResult.BeginDate.AddDays(-1);
            endDate = modAndDateResult.EndDate.AddDays(-1);
            beforeStr = '';
          }
        }

        if (config.FutureRegex().matchExact(beforeStr, true) != null) {
          modAndDateResult =
              ModAndDateResult.GetModAndDate(beginDate, endDate, referenceDate, durationResult.timex ?? '', true);
          beginDate = modAndDateResult.BeginDate;
          endDate = modAndDateResult.EndDate;
          isMatch = true;
        }

        if (config.FutureSuffixRegex().hasMatch(afterStr)) {
          modAndDateResult =
              ModAndDateResult.GetModAndDate(beginDate, endDate, referenceDate, durationResult.timex ?? '', true);
          beginDate = modAndDateResult.BeginDate;
          endDate = modAndDateResult.EndDate;
        }

        // Handle the "in two weeks" case which means the second week
        if (config.InConnectorRegex().matchEnd(beforeStr, true) != null &&
            !DurationParsingUtil.isMultipleDuration(durationResult.timex ?? '') &&
            !isMatch) {
          modAndDateResult =
              ModAndDateResult.GetModAndDate(beginDate, endDate, referenceDate, durationResult.timex ?? '', true);

          // Change the duration value and the beginDate
          var unit = durationResult.timex?.substring(durationResult.timex!.length - 1) ?? '';

          durationResult.timex = "P1" + unit;
          beginDate = DurationParsingUtil.shiftDateTime(durationResult.timex ?? '', modAndDateResult.EndDate, false);
          endDate = modAndDateResult.EndDate;
        }

        // Handle cases like "first 2 weeks of 2019", "last 3 months of this year"
        var matchBefore = RegExpComposer.firstMatch(config.FirstLastRegex(), beforeStr);
        if (matchBefore != null) {
          var matchAfter = RegExpComposer.firstMatch(config.OfYearRegex(), afterStr);

          if (matchAfter != null) {
            // Get year
            var year = config.DateExtractor().getYearFromText(matchAfter);
            if (year == DateTimeConstants.InvalidYear) {
              var orderStr = matchAfter.getGroup("order").value;
              var swift = config.GetSwiftYear(orderStr);
              if (swift < -1) {
                return ret;
              }

              year = referenceDate.year + swift;
            }

            // Get begin/end dates for year
            if (durationResult.timex?.endsWith(DateTimeConstants.TimexWeek) == true) {
              // First/last week of the year is calculated according to ISO definition
              beginDate = DateObjectExtension.GetFirstThursday(year).This(DateTime.monday);
              endDate = DateObjectExtension.GetLastThursday(year).This(DateTime.monday).AddDays(7);
            } else {
              beginDate = DateUtil.createSafeDate(year, 1, 1);
              endDate = DateUtil.createSafeDate(year, 12, 31).AddDays(1);
            }

            // Shift begin/end dates by duration span
            if (matchBefore.getGroup(DateTimeConstants.FirstGroupName).success) {
              endDate = DurationParsingUtil.shiftDateTime(durationResult.timex ?? '', beginDate, true);
            } else {
              beginDate = DurationParsingUtil.shiftDateTime(durationResult.timex ?? '', endDate, false);
            }
          }
        }

        if (modAndDateResult.Mod.isNotEmpty) {
          (durationPr.value as DateTimeResolutionResult).mod = modAndDateResult.Mod;
        }

        durationTimex = durationResult.timex ?? '';
        ret.subDateTimeEntities = <Object>[durationPr];
        if (modAndDateResult.DateList != null) {
          ret.list = modAndDateResult.DateList;
        }
      }
    }

    // Parse "rest of"
    var match = RegExpComposer.firstMatch(config.RestOfDateRegex(), text);
    if (match != null) {
      var durationStr = match.getGroup("duration").value;
      var durationUnit = config.UnitMap()[durationStr];
      int diff;
      switch (durationUnit) {
        case DateTimeConstants.TimexWeek:
          diff = DateTimeConstants.WeekDayCount -
              (beginDate.weekday == DateTime.sunday ? DateTimeConstants.WeekDayCount : beginDate.weekday);
          endDate = beginDate.AddDays(diff);
          durationTimex = "P$diff${DateTimeConstants.TimexDay}";
          if (diff == 0) {
            restNowSunday = true;
          }

          break;

        case DateTimeConstants.TimexMonthFull:
          endDate = DateUtil.createSafeDate(beginDate.year, beginDate.month, 1);
          endDate = endDate.AddMonths(1).AddDays(-1);
          diff = endDate.day - beginDate.day + 1;
          durationTimex = "P" + diff.toString() + DateTimeConstants.TimexDay;
          break;

        case DateTimeConstants.TimexYear:
          endDate = DateUtil.createSafeDate(beginDate.year, 12, 1);
          endDate = endDate.AddMonths(1).AddDays(-1);
          diff = endDate.dayOfYear - beginDate.dayOfYear + 1;
          durationTimex = "P" + diff.toString() + DateTimeConstants.TimexDay;
          break;
      }
    }

    if ((beginDate != endDate) || restNowSunday) {
      endDate = inclusiveEndPeriod ? endDate.AddDays(-1) : endDate;

      // TODO: analyse upper code and use GenerateDatePeriodTimex to create this timex.
      ret.timex =
          "(${DateTimeFormatUtil.luisDateFromDateTime(beginDate)},${DateTimeFormatUtil.luisDateFromDateTime(endDate)},${durationTimex})";
      ret.futureValue = ret.pastValue = (beginDate, endDate);
      ret.success = true;
    }

    return ret;
  }

  // To be consistency, we follow the definition of "week of year":
  // "first week of the month" - it has the month's first Thursday in it
  // "last week of the month" - it has the month's last Thursday in it
  DateTimeResolutionResult ParseWeekOfMonth(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();

    var trimmedText = text.trim();
    var match = RegExpComposer.matchExact(config.WeekOfMonthRegex(), trimmedText, true);

    if (match == null) {
      return ret;
    }

    var cardinalStr = match.getGroup("cardinal").value;
    var monthStr = match.getGroup("month").value;
    var noYear = false;
    int year;

    int month;
    if (monthStr.isEmpty) {
      var relMonthValue = match.getGroup("relmonth").value;
      var monthText = relMonthValue.isNotEmpty ? relMonthValue : trimmedText;
      var swift = config.GetSwiftDayOrMonth(monthText);

      month = referenceDate.AddMonths(swift).month;
      year = referenceDate.AddMonths(swift).year;
    } else {
      month = config.MonthOfYear()[monthStr]!;

      year = config.DateExtractor().getYearFromText(match);

      if (year == DateTimeConstants.InvalidYear) {
        year = referenceDate.year;
        noYear = true;
      }
    }

    ret = GetWeekOfMonth(cardinalStr, month, year, referenceDate, noYear);

    return ret;
  }

  // We follow the ISO week definition:
  // "first week of the year" - it has the year's first Thursday in it
  // "last week of the year" - it has the year's last Thursday in it
  DateTimeResolutionResult ParseWeekOfYear(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = RegExpComposer.matchExact(config.WeekOfYearRegex(), text, true);

    if (match == null) {
      return ret;
    }

    var cardinalStr = match.getGroup("cardinal").value;
    var orderStr = match.getGroup("order").value;

    var year = config.DateExtractor().getYearFromText(match);
    if (year == DateTimeConstants.InvalidYear) {
      var swift = config.GetSwiftYear(orderStr);
      if (swift < -1) {
        return ret;
      }

      year = referenceDate.year + swift;
    }

    DateTime targetWeekMonday;

    if (config.IsLastCardinal(cardinalStr)) {
      targetWeekMonday = DateObjectExtension.GetLastThursday(year).This(DateTime.monday);

      ret.timex = TimexUtility.GenerateWeekTimex(targetWeekMonday);
    } else {
      var weekNum = config.CardinalMap()[cardinalStr]!;
      targetWeekMonday = DateObjectExtension.GetFirstThursday(year)
          .This(DateTime.monday)
          .AddDays(DateTimeConstants.WeekDayCount * (weekNum - 1));

      ret.timex = TimexUtility.GenerateWeekOfYearTimex(year, weekNum);
    }

    ret.futureValue = inclusiveEndPeriod
        ? (targetWeekMonday, targetWeekMonday.AddDays(DateTimeConstants.WeekDayCount - 1))
        : (targetWeekMonday, targetWeekMonday.AddDays(DateTimeConstants.WeekDayCount));

    ret.pastValue = inclusiveEndPeriod
        ? (targetWeekMonday, targetWeekMonday.AddDays(DateTimeConstants.WeekDayCount - 1))
        : (targetWeekMonday, targetWeekMonday.AddDays(DateTimeConstants.WeekDayCount));

    ret.success = true;

    return ret;
  }

  DateTimeResolutionResult ParseHalfYear(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = RegExpComposer.matchExact(config.AllHalfYearRegex(), text, true);

    if (match == null) {
      return ret;
    }

    var cardinalStr = match.getGroup("cardinal").value;
    var orderStr = match.getGroup("order").value;
    var numberStr = match.getGroup("number").value;

    int year = config.DateExtractor().getYearFromText(match);

    if (year == DateTimeConstants.InvalidYear) {
      var swift = config.GetSwiftYear(orderStr);
      if (swift < -1) {
        swift = 0;
      }

      year = referenceDate.year + swift;
    }

    int halfNum;
    if (numberStr.isNotEmpty) {
      halfNum = int.parse(numberStr);
    } else {
      halfNum = config.CardinalMap()[cardinalStr]!;
    }

    var beginDate = DateUtil.createSafeDate(year, ((halfNum - 1) * DateTimeConstants.SemesterMonthCount) + 1, 1);
    var endDate = DateUtil.createSafeDate(year, halfNum * DateTimeConstants.SemesterMonthCount, 1).AddMonths(1);
    ret.futureValue = ret.pastValue = (beginDate, endDate);

    ret.timex = TimexUtility.GenerateDatePeriodTimex(beginDate, endDate, DatePeriodTimexType.ByMonth);
    ret.success = true;

    return ret;
  }

  DateTimeResolutionResult ParseQuarter(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = RegExpComposer.matchExact(config.QuarterRegex(), text, true);

    match ??= RegExpComposer.matchExact(config.QuarterRegexYearFront(), text, true);

    if (match == null) {
      return ret;
    }

    var cardinalStr = match.getGroup("cardinal").value;
    var orderQuarterStr = match.getGroup("orderQuarter").value;
    var orderYearStr = orderQuarterStr.isEmpty ? match.getGroup("order").value : null;
    var numberStr = match.getGroup("number").value;

    bool noSpecificYear = false;
    int year = config.DateExtractor().getYearFromText(match);

    if (year == DateTimeConstants.InvalidYear) {
      var swift = orderQuarterStr.isEmpty ? config.GetSwiftYear(orderYearStr!) : 0;
      if (swift < -1) {
        swift = 0;
        noSpecificYear = true;
      }

      year = referenceDate.year + swift;
    }

    int quarterNum;
    int numOfQuarters = 0;
    if (numberStr.isNotEmpty) {
      quarterNum = int.parse(numberStr);
    } else if (orderQuarterStr.isNotEmpty) {
      int month = referenceDate.month;

      quarterNum = (month / DateTimeConstants.TrimesterMonthCount).ceil();
      var swift = config.GetSwiftYear(orderQuarterStr);
      quarterNum += swift;
      var numStr = match.getGroup(DateTimeConstants.NumGroupName).value;
      var er = config.IntegerExtractor().extract(numStr);
      if (er.length == 1) {
        numOfQuarters = ((config.NumberParser().parse(er[0])?.value ?? 0) as double).toInt() - 1;
      }

      if (numOfQuarters > 0 && swift >= 0) {
        quarterNum += numOfQuarters;
      }

      if (quarterNum <= 0) {
        quarterNum += DateTimeConstants.QuarterCount;
        year -= 1;
      } else if (quarterNum > DateTimeConstants.QuarterCount) {
        year += quarterNum ~/ DateTimeConstants.QuarterCount;
        quarterNum = quarterNum % DateTimeConstants.QuarterCount;
      }
    } else {
      quarterNum = config.CardinalMap()[cardinalStr]!;
    }

    var beginDate = DateUtil.createSafeDate(year, ((quarterNum - 1) * DateTimeConstants.TrimesterMonthCount) + 1, 1)
        .AddMonths(-numOfQuarters * DateTimeConstants.TrimesterMonthCount);
    var endDate = DateUtil.createSafeDate(year, quarterNum * DateTimeConstants.TrimesterMonthCount, 1).AddMonths(1);

    if (noSpecificYear) {
      if (endDate.compareTo(referenceDate) < 0) {
        ret.pastValue = (beginDate, endDate);

        var futureBeginDate =
            DateUtil.createSafeDate(year + 1, ((quarterNum - 1) * DateTimeConstants.TrimesterMonthCount) + 1, 1);
        var futureEndDate =
            DateUtil.createSafeDate(year + 1, quarterNum * DateTimeConstants.TrimesterMonthCount, 1).AddMonths(1);
        ret.futureValue = (futureBeginDate, futureEndDate);
      } else if (endDate.compareTo(referenceDate) > 0) {
        ret.futureValue = (beginDate, endDate);

        var pastBeginDate =
            DateUtil.createSafeDate(year - 1, ((quarterNum - 1) * DateTimeConstants.TrimesterMonthCount) + 1, 1);
        var pastEndDate =
            DateUtil.createSafeDate(year - 1, quarterNum * DateTimeConstants.TrimesterMonthCount, 1).AddMonths(1);
        ret.pastValue = (pastBeginDate, pastEndDate);
      } else {
        ret.futureValue = ret.pastValue = (beginDate, endDate);
      }

      ret.timex = TimexUtility.GenerateDatePeriodTimexByUnspecifiedTerms(
          beginDate, endDate, DatePeriodTimexType.ByMonth, UnspecificDateTimeTerms.NonspecificYear);
    } else {
      ret.futureValue = ret.pastValue = (beginDate, endDate);
      ret.timex = TimexUtility.GenerateDatePeriodTimex(beginDate, endDate, DatePeriodTimexType.ByMonth);
    }

    ret.success = true;

    return ret;
  }

  DateTimeResolutionResult ParseSeason(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = RegExpComposer.matchExact(config.SeasonRegex(), text, true);

    if (match != null) {
      var seasonTimex = config.SeasonMap()[match.getGroup("seas").value]!;

      if (match.getGroup("EarlyPrefix").success) {
        ret.mod = DateTimeConstants.EARLY_MOD;
      } else if (match.getGroup("MidPrefix").success) {
        ret.mod = DateTimeConstants.MID_MOD;
      } else if (match.getGroup("LatePrefix").success) {
        ret.mod = DateTimeConstants.LATE_MOD;
      }

      var year = config.DateExtractor().getYearFromText(match);
      if (year == DateTimeConstants.InvalidYear) {
        var swift = config.GetSwiftYear(text);
        if (swift < -1) {
          ret.timex = seasonTimex;
          ret.success = true;
          return ret;
        }

        year = referenceDate.year + swift;
      }

      var yearStr = year.toString().padLeft(4, '0');
      ret.timex = yearStr + "-" + seasonTimex;

      ret.success = true;
      return ret;
    }

    return ret;
  }

  DateTimeResolutionResult ParseWeekOfDate(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = config.WeekOfRegex().firstMatch(text);
    var dateErs = config.DateExtractor().extractDateTime(text, referenceDate);

    if (dateErs.isEmpty) {
      // For cases like "week of the 18th"
      dateErs.addAll(config.CardinalExtractor().extract(text).where((o) {
        o.type = DateTimeConstants.SYS_DATETIME_DATE;
        return dateErs.where((er) => er.isOverlap(o)).isEmpty;
      }));
    }

    if (match != null && dateErs.length == 1) {
      var pr = config.DateParser().parseDateTime(dateErs[0], referenceDate).value as DateTimeResolutionResult;
      if (config.options.match(DateTimeOptions.CalendarMode)) {
        var monday = (pr.futureValue as DateTime).This(DateTime.monday);
        ret.timex = DateTimeFormatUtil.toIsoWeekTimex(monday);
      } else {
        ret.timex = pr.timex;
      }

      ret.comment = DateTimeConstants.Comment_WeekOf;
      ret.futureValue = GetWeekRangeFromDate(pr.futureValue as DateTime);
      ret.pastValue = GetWeekRangeFromDate(pr.pastValue as DateTime);
      ret.success = true;
    }

    return ret;
  }

  DateTimeResolutionResult ParseMonthOfDate(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = config.MonthOfRegex().firstMatch(text);
    var ex = config.DateExtractor().extractDateTime(text, referenceDate);
    if (match != null && ex.length == 1) {
      var pr = config.DateParser().parseDateTime(ex[0], referenceDate).value as DateTimeResolutionResult;
      ret.timex = pr.timex;
      ret.comment = DateTimeConstants.Comment_MonthOf;
      ret.futureValue = GetMonthRangeFromDate(pr.futureValue as DateTime);
      ret.pastValue = GetMonthRangeFromDate(pr.pastValue as DateTime);
      ret.success = true;
    }

    return ret;
  }

  DateTimeResolutionResult ParseWhichWeek(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var match = RegExpComposer.matchExact(config.WhichWeekRegex(), text, true);

    if (match != null) {
      var num = int.parse(match.getGroup(DateTimeConstants.NumberGroupName).value);
      if (num == 0) {
        return ret;
      }

      // cases like "week 23 of 2019", "week 12 of last year"
      var year = config.DateExtractor().getYearFromText(match);
      if (year == DateTimeConstants.InvalidYear) {
        var orderStr = match.getGroup(DateTimeConstants.OrderGroupName).value;
        var swift = config.GetSwiftYear(orderStr);
        if (swift < -1) {
          swift = 0;
        }

        year = referenceDate.year + swift;
      }

      ret.timex = year.toString().padLeft(4, '0') + "-W" + num.toString().padLeft(2, '0');

      var firstDay = DateUtil.createSafeDate(year, 1, 1);
      var firstThursday = firstDay.AddDays(DateTime.thursday - firstDay.weekday);
      var firstWeek = 1;
      // TODO: bring back. Maybe use the time_machine package
      //var firstWeek = Cal.GetWeekOfYear(firstThursday, CalendarWeekRule.FirstFourDayWeek, DateTime.monday);

      if (firstWeek == 1) {
        num -= 1;
      }

      var value = firstThursday.AddDays((num * 7) - 3);
      var futureDate = value;
      var pastDate = value;

      ret.futureValue = (futureDate, futureDate.AddDays(DateTimeConstants.WeekDayCount));
      ret.pastValue = (pastDate, pastDate.AddDays(DateTimeConstants.WeekDayCount));
      ret.success = true;
    }

    return ret;
  }

  DateTimeResolutionResult GetWeekOfMonth(
      String cardinalStr, int month, int year, DateTime referenceDate, bool noYear) {
    var ret = DateTimeResolutionResult();
    var targetMonday = GetMondayOfTargetWeek(cardinalStr, month, year);

    var futureDate = targetMonday;
    var pastDate = targetMonday;

    if (noYear && futureDate.isBefore(referenceDate)) {
      futureDate = GetMondayOfTargetWeek(cardinalStr, month, year + 1);
    }

    if (noYear && !referenceDate.isAfter(pastDate)) {
      pastDate = GetMondayOfTargetWeek(cardinalStr, month, year - 1);
    }

    if (noYear) {
      year = DateTimeConstants.InvalidYear;
    }

    // Note that if the cardinalStr equals to "last", the weekNumber would be fixed at "5"
    // This may lead to some inconsistency between timex and Resolution
    // the StartDate and EndDate of the resolution would always be correct (following ISO week definition)
    // But week number for "last week" might be inconsistent with the resolution as we only have one timex, but we may have past and future resolutions which may have different week numbers
    var weekNum = GetWeekNumberForMonth(cardinalStr);
    ret.timex = TimexUtility.GenerateWeekOfMonthTimex(year, month, weekNum);

    ret.futureValue = inclusiveEndPeriod
        ? (futureDate, futureDate.AddDays(DateTimeConstants.WeekDayCount - 1))
        : (futureDate, futureDate.AddDays(DateTimeConstants.WeekDayCount));

    ret.pastValue = inclusiveEndPeriod
        ? (pastDate, pastDate.AddDays(DateTimeConstants.WeekDayCount - 1))
        : (pastDate, pastDate.AddDays(DateTimeConstants.WeekDayCount));

    ret.success = true;

    return ret;
  }

  DateTime GetMondayOfTargetWeek(String cardinalStr, int month, int year) {
    DateTime result;
    if (config.IsLastCardinal(cardinalStr)) {
      var lastThursday = DateObjectExtension.GetLastThursday(year, month);
      result = lastThursday.This(DateTime.monday);
    } else {
      int cardinal = GetWeekNumberForMonth(cardinalStr);
      var firstThursday = DateObjectExtension.GetFirstThursday(year, month);

      result = firstThursday.This(DateTime.monday).AddDays(DateTimeConstants.WeekDayCount * (cardinal - 1));
    }

    return result;
  }

  int GetWeekNumberForMonth(String cardinalStr) {
    // "last week of month" might not be "5th week of month"
    // Sometimes it can also be "4th week of month" depends on specific year and month
    // But as we only have one timex, we use "5" to indicate it's the "last week"
    int cardinal =
        config.IsLastCardinal(cardinalStr) ? DateTimeConstants.MaxWeekOfMonth : config.CardinalMap()[cardinalStr]!;

    return cardinal;
  }

  DateTimeResolutionResult ParseDecade(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    int? firstTwoNumOfYear = referenceDate.year ~/ 100;
    int? decade = 0;
    int decadeLastYear = 10;
    int swift = 1;
    var inputCentury = false;

    var trimmedText = text.trim();
    var match = RegExpComposer.matchExact(config.DecadeWithCenturyRegex(), trimmedText, true);

    if (match != null) {
      var decadeStr = match.getGroup("decade").value;
      decade = int.tryParse(decadeStr);
      if (decade == null) {
        if (config.WrittenDecades().containsKey(decadeStr)) {
          decade = config.WrittenDecades()[decadeStr];
        } else if (config.SpecialDecadeCases().containsKey(decadeStr)) {
          firstTwoNumOfYear = config.SpecialDecadeCases()[decadeStr]! ~/ 100;
          decade = config.SpecialDecadeCases()[decadeStr]! % 100;
          inputCentury = true;
        }
      }

      var centuryStr = match.getGroup("century").value;
      if (centuryStr.isNotEmpty) {
        firstTwoNumOfYear = int.tryParse(centuryStr);
        if (firstTwoNumOfYear == null) {
          if (config.Numbers().containsKey(centuryStr)) {
            firstTwoNumOfYear = config.Numbers()[centuryStr];
          } else {
            // handle the case like "one/two thousand", "one/two hundred", etc.
            var er = config.IntegerExtractor().extract(centuryStr);

            if (er.length == 0) {
              return ret;
            }

            firstTwoNumOfYear = (config.NumberParser().parse(er[0])?.value as double? ?? 0).toInt();
            if (firstTwoNumOfYear >= 100) {
              firstTwoNumOfYear = firstTwoNumOfYear ~/ 100;
            }
          }
        }

        inputCentury = true;
      }
    } else {
      // handle cases like "the last 2 decades", "the next decade"
      match = RegExpComposer.matchExact(config.RelativeDecadeRegex(), trimmedText, true);

      if (match != null) {
        inputCentury = true;

        swift = config.GetSwiftDayOrMonth(trimmedText);

        var numStr = match.getGroup("number").value;
        var er = config.IntegerExtractor().extract(numStr);
        if (er.length == 1) {
          var swiftNum = (config.NumberParser().parse(er[0])?.value as double? ?? 0).toInt();
          swift = swift * swiftNum;
        }

        var beginDecade = (referenceDate.year % 100) ~/ 10;
        if (swift < 0) {
          beginDecade += swift;
        } else if (swift > 0) {
          beginDecade += 1;
        }

        decade = beginDecade * 10;
      } else {
        return ret;
      }
    }

    var beginYear = (firstTwoNumOfYear! * 100) + decade!;

    // swift = 0 corresponding to the/this decade

    var totalLastYear = decadeLastYear * (swift == 0 ? 1 : swift).abs();

    ret.timex = TimexUtility.GenerateDecadeTimex(beginYear, totalLastYear, decade, inputCentury);

    int futureYear = beginYear, pastYear = beginYear;
    var startDate = DateUtil.createSafeDate(beginYear, 1, 1);
    if (!inputCentury && startDate.isBefore(referenceDate)) {
      futureYear += 100;
    }

    if (!inputCentury && !referenceDate.isAfter(startDate)) {
      pastYear -= 100;
    }

    ret.futureValue =
        (DateUtil.createSafeDate(futureYear, 1, 1), DateUtil.createSafeDate(futureYear + totalLastYear, 1, 1));

    ret.pastValue = (DateUtil.createSafeDate(pastYear, 1, 1), DateUtil.createSafeDate(pastYear + totalLastYear, 1, 1));

    ret.success = true;

    return ret;
  }

  (bool, bool) MatchWithinNextPrefix(String subStr, bool isAgo, bool isLessThanOrWithIn, bool isMoreThan) {
    var match = RegExpComposer.firstMatch(config.WithinNextPrefixRegex(), subStr);
    if (match != null) {
      var isNext = match.getGroup("next").value.isNotEmpty;

      // cases like "within the next 5 days before today" is not acceptable
      if (!(isNext && isAgo)) {
        isLessThanOrWithIn = true;
      }
    }

    isLessThanOrWithIn = isLessThanOrWithIn || config.LessThanRegex().hasMatch(subStr);
    isMoreThan = config.MoreThanRegex().hasMatch(subStr);

    return (isLessThanOrWithIn, isMoreThan);
  }
}

abstract interface class ISimpleDatePeriodParserConfiguration {
  RegExp YearRegex();

  RegExp RelativeRegex();

  IDateExtractor DateExtractor();
}

abstract interface class IDatePeriodParserConfiguration extends IDateTimeOptionsConfiguration
    implements ISimpleDatePeriodParserConfiguration {
  String TokenBeforeDate();

  IExtractor CardinalExtractor();

  IExtractor OrdinalExtractor();

  IExtractor IntegerExtractor();

  IParser NumberParser();

  IDateTimeExtractor DurationExtractor();

  IDateTimeParser DurationParser();

  IDateTimeParser DateParser();

  RegExp MonthFrontBetweenRegex();

  RegExp BetweenRegex();

  RegExp MonthFrontSimpleCasesRegex();

  RegExp SimpleCasesRegex();

  RegExp OneWordPeriodRegex();

  RegExp MonthWithYear();

  RegExp MonthNumWithYear();

  RegExp PastRegex();

  RegExp FutureRegex();

  RegExp FutureSuffixRegex();

  RegExp NumberCombinedWithUnit();

  RegExp WeekOfMonthRegex();

  RegExp WeekOfYearRegex();

  RegExp QuarterRegex();

  RegExp QuarterRegexYearFront();

  RegExp AllHalfYearRegex();

  RegExp SeasonRegex();

  RegExp WhichWeekRegex();

  RegExp WeekOfRegex();

  RegExp MonthOfRegex();

  RegExp InConnectorRegex();

  RegExp WithinNextPrefixRegex();

  RegExp NextPrefixRegex();

  RegExp PreviousPrefixRegex();

  RegExp ThisPrefixRegex();

  RegExp RestOfDateRegex();

  RegExp LaterEarlyPeriodRegex();

  RegExp WeekWithWeekDayRangeRegex();

  RegExp YearPlusNumberRegex();

  RegExp DecadeWithCenturyRegex();

  RegExp YearPeriodRegex();

  RegExp ComplexDatePeriodRegex();

  RegExp RelativeDecadeRegex();

  RegExp ReferenceDatePeriodRegex();

  RegExp AgoRegex();

  RegExp LaterRegex();

  RegExp LessThanRegex();

  RegExp MoreThanRegex();

  RegExp CenturySuffixRegex();

  RegExp UnspecificEndOfRangeRegex();

  RegExp? AmbiguousPointRangeRegex();

  RegExp NowRegex();

  RegExp SpecialDayRegex();

  RegExp TodayNowRegex();

  RegExp FirstLastRegex();

  RegExp OfYearRegex();

  Map<String, String> UnitMap();

  Map<String, int> CardinalMap();

  Map<String, int> DayOfMonth();

  Map<String, int> MonthOfYear();

  Map<String, String> SeasonMap();

  Map<String, String> SpecialYearPrefixesMap();

  Map<String, int> WrittenDecades();

  Map<String, int> Numbers();

  Map<String, int> SpecialDecadeCases();

  bool CheckBothBeforeAfter();

  bool IsFuture(String text);

  bool IsYearToDate(String text);

  bool IsMonthToDate(String text);

  bool IsWeekOnly(String text);

  bool IsFortnight(String text);

  bool IsWeekend(String text);

  bool IsMonthOnly(String text);

  bool IsYearOnly(String text);

  int GetSwiftYear(String text);

  int GetSwiftDayOrMonth(String text);

  bool IsLastCardinal(String text);
}
