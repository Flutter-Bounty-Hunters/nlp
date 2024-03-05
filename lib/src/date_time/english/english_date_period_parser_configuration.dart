import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_period_parser.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDatePeriodParserConfiguration extends BaseDateTimeOptionsConfiguration
    implements IDatePeriodParserConfiguration {
  EnglishDatePeriodParserConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp AgoRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AgoRegex);

  @override
  RegExp AllHalfYearRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AllHalfYearRegex);

  @override
  RegExp? AmbiguousPointRangeRegex() => null;

  @override
  RegExp BetweenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BetweenRegex);

  @override
  IExtractor CardinalExtractor() => config.cardinalExtractor;

  @override
  Map<String, int> CardinalMap() => EnglishDateTime.CardinalMap;

  @override
  RegExp CenturySuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.CenturySuffixRegex);

  @override
  bool CheckBothBeforeAfter() => EnglishDateTime.CheckBothBeforeAfter;

  @override
  RegExp ComplexDatePeriodRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ComplexDatePeriodRegex);

  @override
  IDateExtractor DateExtractor() => config.dateExtractor;

  @override
  IDateTimeParser DateParser() => config.dateParser;

  @override
  Map<String, int> DayOfMonth() => config.dayOfMonth;

  @override
  RegExp DecadeWithCenturyRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DecadeWithCenturyRegex);

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  IDateTimeParser DurationParser() => config.durationParser;

  @override
  RegExp FirstLastRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FirstLastRegex);

  @override
  RegExp FutureRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);

  @override
  RegExp FutureSuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FutureSuffixRegex);

  @override
  int GetSwiftDayOrMonth(String text) {
    var swift = 0;

    var trimmedText = text.trim();

    if (AfterNextSuffixRegex().hasMatch(trimmedText)) {
      swift = 2;
    } else if (NextPrefixRegex().hasMatch(trimmedText)) {
      swift = 1;
    } else if (PreviousPrefixRegex().hasMatch(trimmedText)) {
      swift = -1;
    }

    return swift;
  }

  @override
  int GetSwiftYear(String text) {
    var swift = -10;

    var trimmedText = text.trim();

    if (AfterNextSuffixRegex().hasMatch(trimmedText)) {
      swift = 2;
    } else if (NextPrefixRegex().hasMatch(trimmedText)) {
      swift = 1;
    } else if (PreviousPrefixRegex().hasMatch(trimmedText)) {
      swift = -1;
    } else if (ThisPrefixRegex().hasMatch(trimmedText)) {
      swift = 0;
    }

    return swift;
  }

  @override
  RegExp InConnectorRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.InConnectorRegex);

  @override
  IExtractor IntegerExtractor() => config.intExtractor;

  @override
  bool IsFortnight(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.FortnightTerms.where((o) => trimmedText.endsWith(o)).isNotEmpty ||
        (fortnightTermsPadded.where((o) => trimmedText.contains(o)).isNotEmpty &&
            AfterNextSuffixRegex().hasMatch(trimmedText));
  }

  @override
  bool IsFuture(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.FutureTerms.where((o) => trimmedText.startsWith(o)).isNotEmpty;
  }

  @override
  bool IsLastCardinal(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.LastCardinalTerms.where((o) => trimmedText == o).isNotEmpty;
  }

  @override
  bool IsMonthOnly(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.MonthTerms.where((o) => trimmedText.endsWith(o)).isNotEmpty ||
        (monthTermsPadded.where((o) => trimmedText.contains(o)).isNotEmpty &&
            AfterNextSuffixRegex().hasMatch(trimmedText));
  }

  @override
  bool IsMonthToDate(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.MonthToDateTerms.where((o) => trimmedText == o).isNotEmpty;
  }

  @override
  bool IsWeekOnly(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.WeekTerms.where((o) => trimmedText.endsWith(o)).isNotEmpty ||
        (weekTermsPadded.where((o) => trimmedText.contains(o)).isNotEmpty &&
            AfterNextSuffixRegex().hasMatch(trimmedText));
  }

  @override
  bool IsWeekend(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.WeekendTerms.where((o) => trimmedText.endsWith(o)).isNotEmpty ||
        (weekendTermsPadded.where((o) => trimmedText.contains(o)).isNotEmpty &&
            AfterNextSuffixRegex().hasMatch(trimmedText));
  }

  @override
  bool IsYearOnly(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.YearTerms.where((o) => trimmedText.endsWith(o)).isNotEmpty ||
        (yearTermsPadded.where((o) => trimmedText.contains(o)).isNotEmpty &&
            AfterNextSuffixRegex().hasMatch(trimmedText)) ||
        (EnglishDateTime.GenericYearTerms.where((o) => trimmedText.endsWith(o)).isNotEmpty &&
            UnspecificEndOfRangeRegex().hasMatch(trimmedText));
  }

  @override
  bool IsYearToDate(String text) {
    var trimmedText = text.trim();
    return EnglishDateTime.YearToDateTerms.where((o) => trimmedText == o).isNotEmpty;
  }

  @override
  RegExp LaterEarlyPeriodRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LaterEarlyPeriodRegex);

  @override
  RegExp LaterRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LaterRegex);

  @override
  RegExp LessThanRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LessThanRegex);

  @override
  RegExp MonthFrontBetweenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthFrontBetweenRegex);

  @override
  RegExp MonthFrontSimpleCasesRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthFrontSimpleCasesRegex);

  @override
  RegExp MonthNumWithYear() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthNumWithYear);

  @override
  RegExp MonthOfRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthOfRegex);

  @override
  Map<String, int> MonthOfYear() => config.monthOfYear;

  @override
  RegExp MonthWithYear() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthWithYear);

  @override
  RegExp MoreThanRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MoreThanRegex);

  @override
  RegExp NextPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);

  @override
  RegExp NowRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NowRegex);

  @override
  RegExp NumberCombinedWithUnit() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NumberCombinedWithDurationUnit);

  @override
  IParser NumberParser() => config.numberParser;

  @override
  Map<String, int> Numbers() => EnglishDateTime.Numbers;

  @override
  RegExp OfYearRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OfYearRegex);

  @override
  RegExp OneWordPeriodRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OneWordPeriodRegex);

  @override
  IExtractor OrdinalExtractor() => config.ordinalExtractor;

  @override
  RegExp PastRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);

  @override
  RegExp PreviousPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);

  @override
  RegExp QuarterRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterRegex);

  @override
  RegExp QuarterRegexYearFront() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterRegexYearFront);

  @override
  RegExp ReferenceDatePeriodRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ReferenceDatePeriodRegex);

  @override
  RegExp RelativeDecadeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeDecadeRegex);

  @override
  RegExp RelativeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeRegex);

  @override
  RegExp RestOfDateRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RestOfDateRegex);

  @override
  Map<String, String> SeasonMap() => config.seasonMap;

  @override
  RegExp SeasonRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SeasonRegex);

  @override
  RegExp SimpleCasesRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SimpleCasesRegex);

  @override
  RegExp SpecialDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecialDayRegex);

  @override
  Map<String, int> SpecialDecadeCases() => config.specialDecadeCases;

  @override
  Map<String, String> SpecialYearPrefixesMap() => config.specialYearPrefixesMap;

  @override
  RegExp ThisPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ThisPrefixRegex);

  @override
  RegExp TodayNowRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TodayNowRegex);

  @override
  String TokenBeforeDate() => EnglishDateTime.TokenBeforeDate;

  @override
  Map<String, String> UnitMap() => config.unitMap;

  @override
  RegExp UnspecificEndOfRangeRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.UnspecificEndOfRangeRegex);

  @override
  RegExp WeekOfMonthRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfMonthRegex);

  @override
  RegExp WeekOfRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfRegex);

  @override
  RegExp WeekOfYearRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfYearRegex);

  @override
  RegExp WeekWithWeekDayRangeRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekWithWeekDayRangeRegex);

  @override
  RegExp WhichWeekRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WhichWeekRegex);

  @override
  RegExp WithinNextPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WithinNextPrefixRegex);

  @override
  Map<String, int> WrittenDecades() => config.writtenDecades;

  @override
  RegExp YearPeriodRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearPeriodRegex);

  @override
  RegExp YearPlusNumberRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearPlusNumberRegex);

  @override
  RegExp YearRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearRegex);

  RegExp AfterNextSuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AfterNextSuffixRegex);

  List<String> fortnightTermsPadded = EnglishDateTime.FortnightTerms.map((str) => " $str ").toList();

  List<String> weekTermsPadded = EnglishDateTime.WeekTerms.map((str) => " $str ").toList();

  List<String> weekendTermsPadded = EnglishDateTime.WeekendTerms.map((str) => " $str ").toList();

  List<String> yearTermsPadded = EnglishDateTime.YearTerms.map((str) => " $str ").toList();

  List<String> monthTermsPadded = EnglishDateTime.MonthTerms.map((str) => " ${str} ").toList();
}
