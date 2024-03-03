import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_period_extractor.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDatePeriodExtractorConfiguration extends BaseDateTimeOptionsConfiguration
    implements IDatePeriodExtractorConfiguration {
  EnglishDatePeriodExtractorConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp AgoRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AgoRegex);

  @override
  IExtractor CardinalExtractor() => config.cardinalExtractor;

  @override
  RegExp CenturySuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.CenturySuffixRegex);

  @override
  bool CheckBothBeforeAfter() => EnglishDateTime.CheckBothBeforeAfter;

  @override
  RegExp ComplexDatePeriodRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ComplexDatePeriodRegex);

  @override
  IDateExtractor DatePointExtractor() => config.dateExtractor;

  @override
  RegExp DateUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateUnitRegex);

  @override
  List<String> DurationDateRestrictions() => EnglishDateTime.DurationDateRestrictions;

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  RegExp FirstLastRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FirstLastRegex);

  @override
  RegExp FollowedDateUnit() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FollowedDateUnit);

  @override
  RegExp FutureRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);

  @override
  RegExp FutureSuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FutureSuffixRegex);

  @override
  int? GetBetweenTokenIndex(String text) {
    int? index;
    var betweenMatch = BetweenTokenRegex().firstMatch(text);
    if (betweenMatch != null) {
      index = betweenMatch.start;
    }

    return index;
  }

  @override
  int? GetFromTokenIndex(String text) {
    int? index;
    var fromMatch = FromTokenRegex().firstMatch(text);
    if (fromMatch != null) {
      index = fromMatch.start;
    }

    return index;
  }

  @override
  bool HasConnectorToken(String text) {
    return RangeConnectorRegex().matchExact(text, true) != null;
  }

  @override
  RegExp IllegalYearRegex() => RegExpComposer.sanitizeGroupsAndCompile(BaseDateTime.IllegalYearRegex);

  @override
  RegExp InConnectorRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.InConnectorRegex);

  @override
  RegExp LaterRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LaterRegex);

  @override
  RegExp LessThanRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LessThanRegex);

  @override
  RegExp MonthNumRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthNumRegex);

  @override
  RegExp MonthOfRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthOfRegex);

  @override
  RegExp MoreThanRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MoreThanRegex);

  @override
  RegExp NowRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NowRegex);

  @override
  RegExp NumberCombinedWithDateUnit() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NumberCombinedWithDateUnit);

  @override
  IParser NumberParser() => config.numberParser;

  @override
  RegExp OfYearRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OfYearRegex);

  @override
  IExtractor OrdinalExtractor() => config.ordinalExtractor;

  @override
  RegExp PreviousPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);

  @override
  RegExp RangeUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RangeUnitRegex);

  @override
  RegExp ReferenceDatePeriodRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ReferenceDatePeriodRegex);

  @override
  RegExp RelativeDecadeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeDecadeRegex);

  @override
  List<RegExp> SimpleCasesRegexes() {
    return [
// "3-5 Jan, 2018",
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SimpleCasesRegex),

      // "between 3 and 5 Jan, 2018"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BetweenRegex),

      // "next april", "year to date", "previous year"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OneWordPeriodRegex),

      // "January, 2018", "this year Feb"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthWithYear),

      // "2018-3", "2018.3", "5-2015", only FourDigitYear is allow in this Regex
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthNumWithYear),

      // "2018", "two thousand and ten"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearRegex),

      // "4th week of Feb"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfMonthRegex),

      // "3rd week of 2018", "4th week last year"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfYearRegex),

      // "Jan between 8-10"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthFrontBetweenRegex),

      // "from Jan 5th-10th", "Feb from 5-10"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthFrontSimpleCasesRegex),

      // "Q1 2018", "2nd quarter"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterRegex),

      // "2016 Q1", "last year the 4th quarter"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterRegexYearFront),

      // "2015 the H1", "H2 of 2016", "1st half 2018", "2nd half this year"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AllHalfYearRegex),

      // "last summer", "fall of 2018", "early this summer"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SeasonRegex),

      // "week 25", "week 06"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WhichWeekRegex),

      // "rest of this week", "rest of current year"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RestOfDateRegex),

      // "early this year", "late next April"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LaterEarlyPeriodRegex),

      // "this week between Mon and Wed", "next week from Tuesday to Wednesday"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekWithWeekDayRangeRegex),

      // "year 834", "two thousand and nine"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearPlusNumberRegex),

      // "21st century 30's"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DecadeWithCenturyRegex),

      // "next five decades", "previous 2 decades"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeDecadeRegex),

      // "this week", "same year"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ReferenceDatePeriodRegex),
    ];
  }

  @override
  RegExp TillRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TillRegex);

  @override
  RegExp TimeUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeUnitRegex);

  @override
  RegExp WeekOfRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfRegex);

  @override
  RegExp WithinNextPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WithinNextPrefixRegex);

  @override
  RegExp YearPeriodRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearPeriodRegex);

  @override
  RegExp YearRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearRegex);

  RegExp BetweenTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BetweenTokenRegex);

  RegExp FromTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FromRegex);

  RegExp RangeConnectorRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RangeConnectorRegex);
}
