// ignore_for_file: non_constant_identifier_names

import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_date_period_extractor.dart';
import 'package:nlp/src/date_time/base_date_time_period_extractor.dart';
import 'package:nlp/src/date_time/base_datetime_extractor.dart';
import 'package:nlp/src/date_time/base_holiday_extractor.dart';
import 'package:nlp/src/date_time/base_set_extractor.dart';
import 'package:nlp/src/date_time/base_time_extractor.dart';
import 'package:nlp/src/date_time/base_time_period_extractor.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english/english_date_period_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_period_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_holiday_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_set_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_period_extractor_configuration.dart';
import 'package:nlp/src/date_time/english_date_extractor.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';
import 'package:nlp/src/time/english_time_zone_extractor.dart';
import 'package:nlp/src/time/time_zone_extractor.dart';

class EnglishMergedExtractorConfiguration extends BaseOptionsConfiguration implements IMergedExtractorConfiguration {
  static final AfterRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AfterRegex);
  static final SinceRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SinceRegex);
  static final AroundRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AroundRegex);
  static final BeforeRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BeforeRegex);
  static final FromToRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FromToRegex);
  static final SuffixAfterRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SuffixAfterRegex);
  static final NumberEndingRegExp = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NumberEndingRegex);
  static final PrepositionSuffixRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PrepositionSuffixRegex);
  static final AmbiguousRangeModifierPrefix =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AmbiguousRangeModifierPrefix);
  static final SingleAmbiguousMonthRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SingleAmbiguousMonthRegex);
  static final UnspecificDatePeriodRegex =
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.UnspecificDatePeriodRegex);

  static final YearRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearRegex);

  static final EqualRegex = RegExpComposer.sanitizeGroupsAndCompile(BaseDateTime.EqualRegex);

  static final FailFastRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FailFastRegex);

  static final TermFilterRegexes = <RegExp>[
    RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OneOnOneRegex),
    RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SingleAmbiguousTermsRegex),
  ];

  // TODO: bring back
  // static final StringMatcher SuperfluousWordMatcher = StringMatcher();

  static final filterWordRegexList = <RegExp>[
    // one on one
    RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OneOnOneRegex),

    // (the)? (day|week|month|year)
    RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SingleAmbiguousTermsRegex),
  ];

  EnglishMergedExtractorConfiguration(super.options) {
    final config = EnglishCommonDateTimeParserConfiguration(options);
    setExtractor = BaseSetExtractor(EnglishSetExtractorConfiguration(config, options: options));
    dateExtractor = BaseDateExtractor(EnglishDateExtractorConfiguration(config, options));
    timeExtractor = BaseTimeExtractor(EnglishTimeExtractorConfiguration(config, options: options));
    holidayExtractor = BaseHolidayExtractor(config: EnglishHolidayExtractorConfiguration(options));
    datePeriodExtractor = BaseDatePeriodExtractor(EnglishDatePeriodExtractorConfiguration(config, options: options));
    dateTimeExtractor = BaseDateTimeExtractor(EnglishDateTimeExtractorConfiguration(config, options));
    durationExtractor = DurationExtractor(config: EnglishDurationExtractorConfiguration(options));
    timeZoneExtractor = BaseTimeZoneExtractor(EnglishTimeZoneExtractorConfiguration(options));
    // dateTimeAltExtractor = BaseDateTimeAltExtractor(EnglishDateTimeAltExtractorConfiguration(this));
    timePeriodExtractor = BaseTimePeriodExtractor(EnglishTimePeriodExtractorConfiguration(config, options: options));
    dateTimePeriodExtractor =
        BaseDateTimePeriodExtractor(EnglishDateTimePeriodExtractorConfiguration(config, options: options));
    integerExtractor = IntegerExtractor.getInstance();

    // TODO: Bring back
    // ambiguityFiltersDict = EnglishDateTime.AmbiguityFiltersDict.entrySet().stream().map((pair) {
    //   RegExp key = RegExpUtility.getSafeRegExp(pair.getKey());
    //   RegExp val = RegExpUtility.getSafeRegExp(pair.getValue());
    //   return Pair<RegExp, RegExp>(key, val);
    // }).collect(Collectors.toList());

    // TODO: Bring back
    // if (!this.getOptions().match(DateTimeOptions.EnablePreview)) {
    //   getSuperfluousWordMatcher().init(EnglishDateTime.SuperfluousWordList);
    // }
  }

  // TODO: bring back
  // late final Iterable<(RegExp, RegExp)> ambiguityFiltersDict;

  @override
  Iterable<RegExp> getFilterWordRegexList() {
    return filterWordRegexList;
  }

  // TODO: brin back
  // StringMatcher getSuperfluousWordMatcher() {
  //   return SuperfluousWordMatcher;
  // }

  @override
  late final IDateTimeExtractor setExtractor;

  @override
  late final IExtractor integerExtractor;

  @override
  late final IDateExtractor dateExtractor;

  @override
  late final IDateTimeExtractor timeExtractor;

  @override
  late final IDateTimeExtractor holidayExtractor;

  @override
  late final IDateTimeExtractor dateTimeExtractor;

  @override
  late final DurationExtractor durationExtractor;

  @override
  late final IDateTimeExtractor datePeriodExtractor;

  @override
  late final IDateTimeExtractor timePeriodExtractor;

  // TODO: Bring back
  late final IDateTimeZoneExtractor timeZoneExtractor;

  // TODO: Bring back
  // late final IDateTimeListExtractor dateTimeAltExtractor;

  @override
  late final IDateTimeExtractor dateTimePeriodExtractor;

  @override
  RegExp getAfterRegex() => AfterRegex;

  @override
  RegExp getSinceRegex() => SinceRegex;

  @override
  RegExp getAroundRegex() => AroundRegex;

  @override
  RegExp getBeforeRegex() => BeforeRegex;

  @override
  RegExp getFromToRegex() => FromToRegex;

  @override
  RegExp getSuffixAfterRegex() => SuffixAfterRegex;

  @override
  RegExp getNumberEndingRegExp() => NumberEndingRegExp;

  @override
  RegExp getPrepositionSuffixRegex() => PrepositionSuffixRegex;

  @override
  RegExp getAmbiguousRangeModifierPrefix() => AmbiguousRangeModifierPrefix;

  @override
  RegExp getPotentialAmbiguousRangeRegex() => FromToRegex;

  @override
  RegExp getSingleAmbiguousMonthRegex() => SingleAmbiguousMonthRegex;

  @override
  RegExp getUnspecificDatePeriodRegex() => UnspecificDatePeriodRegex;

  @override
  bool get checkBothBeforeAfter => EnglishDateTime.CheckBothBeforeAfter;

  @override
  RegExp getEqualRegex() => EqualRegex;

  @override
  RegExp? getFailFastRegex() => FailFastRegex;

  @override
  List<RegExp> getTermFilterRegexes() => TermFilterRegexes;

  @override
  RegExp getYearRegex() => YearRegex;
}

abstract interface class IMergedExtractorConfiguration implements IOptionsConfiguration {
  IDateTimeExtractor get dateExtractor;

  IDateTimeExtractor get timeExtractor;

  IDateTimeExtractor get dateTimeExtractor;

  IDateTimeExtractor get datePeriodExtractor;

  IDateTimeExtractor get timePeriodExtractor;

  IDateTimeExtractor get dateTimePeriodExtractor;

  DurationExtractor get durationExtractor;

  IDateTimeExtractor get setExtractor;

  IDateTimeExtractor get holidayExtractor;

// TODO: Bring back
// IDateTimeZoneExtractor getTimeZoneExtractor();

// TODO: Bring back
// IDateTimeListExtractor getDateTimeAltExtractor();

  IExtractor get integerExtractor;

  Iterable<RegExp> getFilterWordRegexList();

  RegExp getAfterRegex();

  RegExp getBeforeRegex();

  RegExp getSinceRegex();

  RegExp getAroundRegex();

  RegExp getFromToRegex();

  RegExp getSingleAmbiguousMonthRegex();

  RegExp getAmbiguousRangeModifierPrefix();

  RegExp getPotentialAmbiguousRangeRegex();

  RegExp getPrepositionSuffixRegex();

  RegExp getNumberEndingRegExp();

  RegExp getSuffixAfterRegex();

  RegExp getUnspecificDatePeriodRegex();

  RegExp? getFailFastRegex();

  RegExp getYearRegex();

  RegExp getEqualRegex();

  List<RegExp> getTermFilterRegexes();

  // TODO: bring back
  // StringMatcher getSuperfluousWordMatcher();

  // TODO: bring back
  // Iterable<(RegExp, RegExp)> getAmbiguityFiltersDict();

  bool get checkBothBeforeAfter;
}
