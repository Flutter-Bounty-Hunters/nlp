// ignore_for_file: non_constant_identifier_names

import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

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

  // TODO: bring back
  // static final StringMatcher SuperfluousWordMatcher = StringMatcher();

  static final filterWordRegexList = <RegExp>[
    // one on one
    RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OneOnOneRegex),

    // (the)? (day|week|month|year)
    RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SingleAmbiguousTermsRegex),
  ];

  EnglishMergedExtractorConfiguration(super.options) {
    // TODO: bring back
    // setExtractor = BaseSetExtractor(EnglishSetExtractorConfiguration(options));
    // dateExtractor = BaseDateExtractor(EnglishDateExtractorConfiguration(this));
    // timeExtractor = BaseTimeExtractor(EnglishTimeExtractorConfiguration(options));
    // holidayExtractor = BaseHolidayExtractor(EnglishHolidayExtractorConfiguration());
    // datePeriodExtractor = BaseDatePeriodExtractor(EnglishDatePeriodExtractorConfiguration(this));
    // dateTimeExtractor = BaseDateTimeExtractor(EnglishDateTimeExtractorConfiguration(options));
    durationExtractor = DurationExtractor(config: EnglishDurationExtractorConfiguration(options));
    // timeZoneExtractor = BaseTimeZoneExtractor(EnglishTimeZoneExtractorConfiguration(options));
    // dateTimeAltExtractor = BaseDateTimeAltExtractor(EnglishDateTimeAltExtractorConfiguration(this));
    // timePeriodExtractor = BaseTimePeriodExtractor(EnglishTimePeriodExtractorConfiguration(options));
    // dateTimePeriodExtractor = BaseDateTimePeriodExtractor(EnglishDateTimePeriodExtractorConfiguration(options));
    // integerExtractor = IntegerExtractor.getInstance();

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
  // late final IDateTimeZoneExtractor timeZoneExtractor;

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

  // TODO: bring back
  // StringMatcher getSuperfluousWordMatcher();

  // TODO: bring back
  // Iterable<(RegExp, RegExp)> getAmbiguityFiltersDict();
}
