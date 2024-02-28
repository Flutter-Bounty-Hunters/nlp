import 'package:nlp/src/core/english_merged_extractor.dart';
import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/base_datetime_extractor.dart';
import 'package:nlp/src/date_time/base_datetime_parser.dart';
import 'package:nlp/src/date_time/base_holiday_extractor.dart';
import 'package:nlp/src/date_time/base_time_extractor.dart';
import 'package:nlp/src/date_time/base_time_parser.dart';
import 'package:nlp/src/date_time/base_time_period_extractor.dart';
import 'package:nlp/src/date_time/base_time_period_parser.dart';
import 'package:nlp/src/date_time/english/english_date_parser_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_parser_configuration.dart';
import 'package:nlp/src/date_time/english/english_holiday_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_parser_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_period_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_period_parser_configuration.dart';
import 'package:nlp/src/date_time/english_date_extractor.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/english_date_period_extraction.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/duration/english_duration_parser_configuration.dart';
import 'package:nlp/src/numbers/base_number_parser.dart';
import 'package:nlp/src/numbers/english_number_parser_configuration.dart';
import 'package:nlp/src/numbers/numbers.dart';

class EnglishMergedParserConfiguration extends EnglishCommonDateTimeParserConfiguration
    implements IMergedParserConfiguration {
  EnglishMergedParserConfiguration(super.options) {
    beforeRegex = EnglishMergedExtractorConfiguration.BeforeRegex;
    afterRegex = EnglishMergedExtractorConfiguration.AfterRegex;
    sinceRegex = EnglishMergedExtractorConfiguration.SinceRegex;
    aroundRegex = EnglishMergedExtractorConfiguration.AroundRegex;
    suffixAfterRegex = EnglishMergedExtractorConfiguration.SuffixAfterRegex;
    yearRegex = EnglishDatePeriodExtractorConfiguration.YearRegex;
    // TODO: bring back
    // superfluousWordMatcher = EnglishMergedExtractorConfiguration.SuperfluousWordMatcher;

    // TODO: bring back
    // getParser = BaseSetParser(EnglishSetParserConfiguration(this));
    // holidayParser = BaseHolidayParser(EnglishHolidayParserConfiguration());
  }

  late final RegExp beforeRegex;
  late final RegExp afterRegex;
  late final RegExp sinceRegex;
  late final RegExp aroundRegex;
  late final RegExp suffixAfterRegex;
  late final RegExp yearRegex;

  // TODO: bring back
  // late final IDateTimeParser getParser;
  // late final IDateTimeParser holidayParser;
  // final StringMatcher superfluousWordMatcher;

  @override
  RegExp getBeforeRegex() {
    return beforeRegex;
  }

  @override
  RegExp getAfterRegex() {
    return afterRegex;
  }

  @override
  RegExp getSinceRegex() {
    return sinceRegex;
  }

  @override
  RegExp getAroundRegex() {
    return aroundRegex;
  }

  @override
  RegExp getSuffixAfterRegex() {
    return suffixAfterRegex;
  }

  @override
  RegExp getYearRegex() {
    return yearRegex;
  }
}

class EnglishCommonDateTimeParserConfiguration extends BaseDateParserConfiguration
    implements ICommonDateTimeParserConfiguration {
  EnglishCommonDateTimeParserConfiguration(this.options) {
    // utilityConfiguration = EnglishDatetimeUtilityConfiguration();

    unitMap = EnglishDateTime.UnitMap;
    unitValueMap = EnglishDateTime.UnitValueMap;
    seasonMap = EnglishDateTime.SeasonMap;
    specialYearPrefixesMap = EnglishDateTime.SpecialYearPrefixesMap;
    cardinalMap = EnglishDateTime.CardinalMap;
    dayOfWeekMap = EnglishDateTime.DayOfWeek;
    dayOfMonth = {
      ...super.getDayOfMonth(),
      ...EnglishDateTime.DayOfMonth,
    };
    monthOfYear = EnglishDateTime.MonthOfYear;
    numbers = EnglishDateTime.Numbers;
    doubleNumbers = EnglishDateTime.DoubleNumbers;
    writtenDecades = EnglishDateTime.WrittenDecades;
    specialDecadeCases = EnglishDateTime.SpecialDecadeCases;

    cardinalExtractor = CardinalExtractor.getInstance();
    // intExtractor = intExtractor.getInstance();
    ordinalExtractor = OrdinalExtractor.getInstance();
    numberParser = BaseNumberParser(EnglishNumberParserConfiguration());

    durationExtractor = DurationExtractor(config: EnglishDurationExtractorConfiguration());
    dateExtractor = BaseDateExtractor(EnglishDateExtractorConfiguration(this));
    timeExtractor = BaseTimeExtractor(EnglishTimeExtractorConfiguration(this));
    dateTimeExtractor = BaseDateTimeExtractor(EnglishDateTimeExtractorConfiguration(this, options));
    // datePeriodExtractor = BaseDatePeriodExtractor(EnglishDatePeriodExtractorConfiguration(this));
    timePeriodExtractor = BaseTimePeriodExtractor(EnglishTimePeriodExtractorConfiguration(this, options: options));
    // dateTimePeriodExtractor = BaseDateTimePeriodExtractor(EnglishDateTimePeriodExtractorConfiguration(options));
    holidayExtractor = BaseHolidayExtractor(config: EnglishHolidayExtractorConfiguration(options));

    // timeZoneParser = BaseTimeZoneParser();
    durationParser = BaseDurationParser(EnglishDurationParserConfiguration(this));
    dateParser = BaseDateParser(EnglishDateParserConfiguration(this));
    timeParser = BaseTimeParser(EnglishTimeParserConfiguration(this, options: options));
    dateTimeParser = BaseDateTimeParser(EnglishDateTimeParserConfiguration(this, options: options));
    //datePeriodParser = BaseDatePeriodParser(EnglishDatePeriodParserConfiguration(this));
    timePeriodParser = BaseTimePeriodParser(EnglishTimePeriodParserConfiguration(this));
    // dateTimePeriodParser = BaseDateTimePeriodParser(EnglishDateTimePeriodParserConfiguration(this));
    // dateTimeAltParser = BaseDateTimeAltParser(EnglishDateTimeAltParserConfiguration(this));
  }

  @override
  DateTimeOptions options;

  // TODO: bring back
  // late final IDateTimeUtilityConfiguration utilityConfiguration;

  @override
  late final Map<String, String> unitMap;
  @override
  late final Map<String, int> unitValueMap;
  @override
  late final Map<String, String> seasonMap;
  @override
  late final Map<String, String> specialYearPrefixesMap;
  @override
  late final Map<String, int> cardinalMap;
  late final Map<String, int> dayOfWeekMap;
  @override
  late final Map<String, int> dayOfMonth;
  @override
  late final Map<String, int> monthOfYear;
  @override
  late final Map<String, int> numbers;
  @override
  late final Map<String, double> doubleNumbers;
  @override
  late final Map<String, int> writtenDecades;
  @override
  late final Map<String, int> specialDecadeCases;

  @override
  late final IExtractor cardinalExtractor;
  // @override
  // late final IExtractor intExtractor;
  @override
  late final IExtractor ordinalExtractor;

  @override
  late final IParser numberParser;

  @override
  late final IDateTimeExtractor durationExtractor;

  @override
  late final IDateExtractor dateExtractor;

  @override
  late final IDateTimeExtractor timeExtractor;
  @override
  late final IDateTimeExtractor dateTimeExtractor;
  // @override
  // late final IDateTimeExtractor datePeriodExtractor;
  @override
  late final IDateTimeExtractor timePeriodExtractor;
  // @override
  // late final IDateTimeExtractor dateTimePeriodExtractor;

  @override
  late final IDateTimeExtractor holidayExtractor;

  @override
  late final IDateTimeParser dateParser;
  @override
  late final IDateTimeParser timeParser;
  // @override
  // late final IDateTimeParser dateTimeParser;
  @override
  late final IDateTimeParser durationParser;
  @override
  late final IDateTimeParser datePeriodParser;
  @override
  late final IDateTimeParser timePeriodParser;

  @override
  late final IDateTimeParser dateTimeParser;

  // @override
  // late final IDateTimeParser dateTimePeriodParser;
  // @override
  // late final IDateTimeParser dateTimeAltParser;
  // @override
  // late final IDateTimeParser timeZoneParser;
}

abstract class BaseDateParserConfiguration extends BaseOptionsConfiguration
    implements ICommonDateTimeParserConfiguration {
  Map<String, int> getDayOfMonth() {
    return BaseDateTime.DayOfMonthDictionary;
  }
}

abstract interface class ICommonDateTimeParserConfiguration implements IOptionsConfiguration {
  IExtractor get cardinalExtractor;

  // IExtractor get intExtractor;

  IExtractor get ordinalExtractor;

  IParser get numberParser;

  IDateExtractor get dateExtractor;

  IDateTimeExtractor get timeExtractor;

  IDateTimeExtractor get dateTimeExtractor;

  IDateTimeExtractor get durationExtractor;

  // IDateTimeExtractor get datePeriodExtractor;

  IDateTimeExtractor get timePeriodExtractor;

  // IDateTimeExtractor get dateTimePeriodExtractor;

  IDateTimeExtractor get holidayExtractor;
  IDateTimeParser get dateParser;

  IDateTimeParser get timeParser;

  IDateTimeParser get dateTimeParser;

  IDateTimeParser get durationParser;

  IDateTimeParser get datePeriodParser;

  IDateTimeParser get timePeriodParser;

  // IDateTimeParser get dateTimePeriodParser;

  // IDateTimeParser get dateTimeAltParser;

  // IDateTimeParser get timeZoneParser;

  Map<String, int> get monthOfYear;

  Map<String, int> get numbers;

  Map<String, int> get unitValueMap;

  Map<String, String> get seasonMap;

  Map<String, String> get specialYearPrefixesMap;

  Map<String, String> get unitMap;

  Map<String, int> get cardinalMap;

  Map<String, int> get dayOfMonth;

  // Map<String, int> get dayOfWeek;

  Map<String, double> get doubleNumbers;

  Map<String, int> get writtenDecades;

  Map<String, int> get specialDecadeCases;

  // TODO: bring back
  // IDateTimeUtilityConfiguration getUtilityConfiguration();
}
