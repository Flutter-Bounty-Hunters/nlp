// ignore_for_file: non_constant_identifier_names

import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDatePeriodExtractorConfiguration
    extends BaseOptionsConfiguration /*implements IDatePeriodExtractorConfiguration*/ {
  static final RegExp YearRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearRegex);
  static final RegExp TillRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TillRegex);
  static final RegExp DateUnitRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateUnitRegex);
  static final RegExp TimeUnitRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeUnitRegex);
  static final RegExp FollowedDateUnit = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FollowedDateUnit);
  static final RegExp NumberCombinedWithDateUnit =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NumberCombinedWithDateUnit);
  static final RegExp PreviousPrefixRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);
  static final RegExp NextPrefixRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);
  static final RegExp FutureSuffixRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FutureSuffixRegex);
  static final RegExp WeekOfRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfRegex);
  static final RegExp MonthOfRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthOfRegex);
  static final RegExp RangeUnitRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RangeUnitRegex);
  static final RegExp InConnectorRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.InConnectorRegex);
  static final RegExp WithinNextPrefixRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WithinNextPrefixRegex);
  static final RegExp YearPeriodRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearPeriodRegex);
  static final RegExp RelativeDecadeRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeDecadeRegex);
  static final RegExp ComplexDatePeriodRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ComplexDatePeriodRegex);
  static final RegExp ReferenceDatePeriodRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ReferenceDatePeriodRegex);
  static final RegExp AgoRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AgoRegex);
  static final RegExp LaterRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LaterRegex);
  static final RegExp LessThanRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LessThanRegex);
  static final RegExp MoreThanRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MoreThanRegex);
  static final RegExp CenturySuffixRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.CenturySuffixRegex);
  static final RegExp IllegalYearRegex = RegExpComposer.sanitizeGroupsAndCompile(BaseDateTime.IllegalYearRegex);
  static final RegExp NowRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NowRegex);

  // composite regexes
  static final RegExp SimpleCasesRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SimpleCasesRegex);
  static final RegExp BetweenRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BetweenRegex);
  static final RegExp OneWordPeriodRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OneWordPeriodRegex);
  static final RegExp MonthWithYear = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthWithYear);
  static final RegExp MonthNumWithYear = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthNumWithYear);
  static final RegExp WeekOfMonthRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfMonthRegex);
  static final RegExp WeekOfYearRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekOfYearRegex);
  static final RegExp MonthFrontBetweenRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthFrontBetweenRegex);
  static final RegExp MonthFrontSimpleCasesRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthFrontSimpleCasesRegex);
  static final RegExp QuarterRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterRegex);
  static final RegExp QuarterRegexYearFront =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterRegexYearFront);
  static final RegExp AllHalfYearRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AllHalfYearRegex);
  static final RegExp SeasonRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SeasonRegex);
  static final RegExp WhichWeekRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WhichWeekRegex);
  static final RegExp RestOfDateRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RestOfDateRegex);
  static final RegExp LaterEarlyPeriodRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LaterEarlyPeriodRegex);
  static final RegExp WeekWithWeekDayRangeRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekWithWeekDayRangeRegex);
  static final RegExp YearPlusNumberRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearPlusNumberRegex);
  static final RegExp DecadeWithCenturyRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DecadeWithCenturyRegex);

  static final SimpleCasesRegexes = [
    SimpleCasesRegex,
    BetweenRegex,
    OneWordPeriodRegex,
    MonthWithYear,
    MonthNumWithYear,
    YearRegex,
    WeekOfMonthRegex,
    WeekOfYearRegex,
    MonthFrontBetweenRegex,
    MonthFrontSimpleCasesRegex,
    QuarterRegex,
    QuarterRegexYearFront,
    AllHalfYearRegex,
    SeasonRegex,
    WhichWeekRegex,
    RestOfDateRegex,
    LaterEarlyPeriodRegex,
    WeekWithWeekDayRangeRegex,
    YearPlusNumberRegex,
    DecadeWithCenturyRegex,
    RelativeDecadeRegex,
    ReferenceDatePeriodRegex,
  ];

  static final RegExp rangeConnectorRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RangeConnectorRegex);

  EnglishDatePeriodExtractorConfiguration(super.config) {
    //datePointExtractor = BaseDateExtractor(EnglishDateExtractorConfiguration(EnglishDateExtractorConfiguration(super.config)));
    cardinalExtractor = CardinalExtractor.getInstance();
    // ordinalExtractor = OrdinalExtractor.getInstance();
    durationExtractor = DurationExtractor(config: EnglishDurationExtractorConfiguration());
    // numberParser = BaseNumberParser(EnglishNumberParserConfiguration());
  }

  final List<String> durationDateRestrictions = List.from(EnglishDateTime.DurationDateRestrictions);

  // late final IDateTimeExtractor datePointExtractor;
  late final IExtractor cardinalExtractor;
  // late final IExtractor ordinalExtractor;
  late final DurationExtractor durationExtractor;
  // late final IParser numberParser;

  Iterable<RegExp> getSimpleCasesRegexes() => SimpleCasesRegexes;

  RegExp getIllegalYearRegex() => IllegalYearRegex;

  RegExp getYearRegex() => YearRegex;

  RegExp getTillRegex() => TillRegex;

  RegExp getDateUnitRegex() => DateUnitRegex;

  RegExp getTimeUnitRegex() => TimeUnitRegex;

  RegExp getFollowedDateUnit() => FollowedDateUnit;

  RegExp getNumberCombinedWithDateUnit() => NumberCombinedWithDateUnit;

  RegExp getPastRegex() => PreviousPrefixRegex;

  RegExp getFutureRegex() => NextPrefixRegex;

  RegExp getFutureSuffixRegex() => FutureSuffixRegex;

  RegExp getWeekOfRegex() => WeekOfRegex;

  RegExp getMonthOfRegex() => MonthOfRegex;

  RegExp getRangeUnitRegex() => RangeUnitRegex;

  RegExp getInConnectorRegex() => InConnectorRegex;

  RegExp getWithinNextPrefixRegex() => WithinNextPrefixRegex;

  RegExp getYearPeriodRegex() => YearPeriodRegex;

  RegExp getRelativeDecadeRegex() => RelativeDecadeRegex;

  RegExp getComplexDatePeriodRegex() => ComplexDatePeriodRegex;

  RegExp getReferenceDatePeriodRegex() => ReferenceDatePeriodRegex;

  RegExp getAgoRegex() => AgoRegex;

  RegExp getLaterRegex() => LaterRegex;

  RegExp getLessThanRegex() => LessThanRegex;

  RegExp getMoreThanRegex() => MoreThanRegex;

  RegExp getCenturySuffixRegex() => CenturySuffixRegex;

  RegExp getNowRegex() => NowRegex;

  // TODO: bring back
  // @override
  // IDateTimeExtractor getDatePointExtractor() {
  // return datePointExtractor;
  // }

  IExtractor getCardinalExtractor() => cardinalExtractor;

  // TODO: bring back
  // @override
  // IExtractor getOrdinalExtractor() => ordinalExtractor;

  // TODO: bring back
  // @override
  // IDateTimeExtractor getDurationExtractor() {
  // return durationExtractor;
  // }

  // TODO: Bring back
  // @override
  // IParser getNumberParser() => numberParser;

  List<String> getDurationDateRestrictions() => durationDateRestrictions;

  // TODO: bring back
  // @override
  // ResultIndex getFromTokenIndex(String text) {
  //   int index = -1;
  //   boolean result = false;
  //   if (text.endsWith("from")) {
  //     result = true;
  //     index = text.lastIndexOf("from");
  //   }
  //
  //   return ResultIndex(result, index);
  // }
  //
  // @override
  // ResultIndex getBetweenTokenIndex(String text) {
  //   int index = -1;
  //   boolean result = false;
  //   if (text.endsWith("between")) {
  //     result = true;
  //     index = text.lastIndexOf("between");
  //   }
  //
  //   return ResultIndex(result, index);
  // }
  //
  // @override
  // bool hasConnectorToken(String text) {
  //   return RegexExtension.isExactMatch(rangeConnectorRegex, text, true);
  // }
}
