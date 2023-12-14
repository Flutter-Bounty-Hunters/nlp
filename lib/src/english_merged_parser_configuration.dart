import 'date_time_interfaces.dart';

class EnglishMergedParserConfiguration extends EnglishCommonDateTimeParserConfiguration implements IMergedParserConfiguration {

  EnglishMergedParserConfiguration(super.options) {
    beforeRegex = EnglishMergedExtractorConfiguration.BeforeRegex;
    afterRegex = EnglishMergedExtractorConfiguration.AfterRegex;
    sinceRegex = EnglishMergedExtractorConfiguration.SinceRegex;
    aroundRegex = EnglishMergedExtractorConfiguration.AroundRegex;
    suffixAfterRegex = EnglishMergedExtractorConfiguration.SuffixAfterRegex;
    yearRegex = EnglishDatePeriodExtractorConfiguration.YearRegex;
    superfluousWordMatcher = EnglishMergedExtractorConfiguration.SuperfluousWordMatcher;

    getParser = BaseSetParser(EnglishSetParserConfiguration(this));
    holidayParser = BaseHolidayParser(EnglishHolidayParserConfiguration());
  }

  late final Pattern beforeRegex;
  late final Pattern afterRegex;
  late final Pattern sinceRegex;
  late final Pattern aroundRegex;
  late final Pattern suffixAfterRegex;
  late final Pattern yearRegex;
  late final IDateTimeParser getParser;
  late final IDateTimeParser holidayParser;
  late final StringMatcher superfluousWordMatcher;

  Pattern getBeforeRegex() {
    return beforeRegex;
  }

  Pattern getAfterRegex() {
    return afterRegex;
  }

  Pattern getSinceRegex() {
    return sinceRegex;
  }

  Pattern getAroundRegex() {
    return aroundRegex;
  }

  Pattern getSuffixAfterRegex() {
    return suffixAfterRegex;
  }

  Pattern getYearRegex() {
    return yearRegex;
  }

  IDateTimeParser getGetParser() {
    return getParser;
  }

  IDateTimeParser getHolidayParser() {
    return holidayParser;
  }

  StringMatcher getSuperfluousWordMatcher() {
    return superfluousWordMatcher;
  }
}

interface IMergedParserConfiguration extends ICommonDateTimeParserConfiguration {
Pattern getBeforeRegex();

Pattern getAfterRegex();

Pattern getSinceRegex();

Pattern getAroundRegex();

Pattern getSuffixAfterRegex();

Pattern getYearRegex();

IDateTimeParser getGetParser();

IDateTimeParser getHolidayParser();

IDateTimeParser getTimeZoneParser();

StringMatcher getSuperfluousWordMatcher();
}

interface ICommonDateTimeParserConfiguration extends IOptionsConfiguration {
IExtractor getCardinalExtractor();

IExtractor getIntegerExtractor();

IExtractor getOrdinalExtractor();

IParser getNumberParser();

IDateExtractor getDateExtractor();

IDateTimeExtractor getTimeExtractor();

IDateTimeExtractor getDateTimeExtractor();

IDateTimeExtractor getDurationExtractor();

IDateTimeExtractor getDatePeriodExtractor();

IDateTimeExtractor getTimePeriodExtractor();

IDateTimeExtractor getDateTimePeriodExtractor();

IDateTimeParser getDateParser();

IDateTimeParser getTimeParser();

IDateTimeParser getDateTimeParser();

IDateTimeParser getDurationParser();

IDateTimeParser getDatePeriodParser();

IDateTimeParser getTimePeriodParser();

IDateTimeParser getDateTimePeriodParser();

IDateTimeParser getDateTimeAltParser();

IDateTimeParser getTimeZoneParser();

ImmutableMap<String, Integer> getMonthOfYear();

ImmutableMap<String, Integer> getNumbers();

ImmutableMap<String, Long> getUnitValueMap();

ImmutableMap<String, String> getSeasonMap();

ImmutableMap<String, String> getSpecialYearPrefixesMap();

ImmutableMap<String, String> getUnitMap();

ImmutableMap<String, Integer> getCardinalMap();

ImmutableMap<String, Integer> getDayOfMonth();

ImmutableMap<String, Integer> getDayOfWeek();

ImmutableMap<String, Double> getDoubleNumbers();

ImmutableMap<String, Integer> getWrittenDecades();

ImmutableMap<String, Integer> getSpecialDecadeCases();

IDateTimeUtilityConfiguration getUtilityConfiguration();
}

interface IOptionsConfiguration {
DateTimeOptions getOptions();

boolean getDmyDateFormat();

}

class EnglishCommonDateTimeParserConfiguration extends BaseDateParserConfiguration implements ICommonDateTimeParserConfiguration {

  private final IDateTimeUtilityConfiguration utilityConfiguration;

  private final ImmutableMap<String, String> unitMap;
  private final ImmutableMap<String, Long> unitValueMap;
  private final ImmutableMap<String, String> seasonMap;
  private final ImmutableMap<String, String> specialYearPrefixesMap;
  private final ImmutableMap<String, Integer> cardinalMap;
  private final ImmutableMap<String, Integer> dayOfWeekMap;
  private final ImmutableMap<String, Integer> dayOfMonth;
  private final ImmutableMap<String, Integer> monthOfYear;
  private final ImmutableMap<String, Integer> numbers;
  private final ImmutableMap<String, Double> doubleNumbers;
  private final ImmutableMap<String, Integer> writtenDecades;
  private final ImmutableMap<String, Integer> specialDecadeCases;

  private final IExtractor cardinalExtractor;
  private final IExtractor integerExtractor;
  private final IExtractor ordinalExtractor;
  private final IParser numberParser;

  private final IDateTimeExtractor durationExtractor;
  private final IDateExtractor dateExtractor;
  private final IDateTimeExtractor timeExtractor;
  private final IDateTimeExtractor dateTimeExtractor;
  private final IDateTimeExtractor datePeriodExtractor;
  private final IDateTimeExtractor timePeriodExtractor;
  private final IDateTimeExtractor dateTimePeriodExtractor;

  private final IDateTimeParser dateParser;
  private final IDateTimeParser timeParser;
  private final IDateTimeParser dateTimeParser;
  private final IDateTimeParser durationParser;
  private final IDateTimeParser datePeriodParser;
  private final IDateTimeParser timePeriodParser;
  private final IDateTimeParser dateTimePeriodParser;
  private final IDateTimeParser dateTimeAltParser;
  private final IDateTimeParser timeZoneParser;

  EnglishCommonDateTimeParserConfiguration(DateTimeOptions options) {

    super(options);

    utilityConfiguration = EnglishDatetimeUtilityConfiguration();

    unitMap = EnglishDateTime.UnitMap;
    unitValueMap = EnglishDateTime.UnitValueMap;
    seasonMap = EnglishDateTime.SeasonMap;
    specialYearPrefixesMap = EnglishDateTime.SpecialYearPrefixesMap;
    cardinalMap = EnglishDateTime.CardinalMap;
    dayOfWeekMap = EnglishDateTime.DayOfWeek;
    dayOfMonth = ImmutableMap.<String, Integer>builder().putAll(super.getDayOfMonth()).putAll(EnglishDateTime.DayOfMonth).build();
    monthOfYear = EnglishDateTime.MonthOfYear;
    numbers = EnglishDateTime.Numbers;
    doubleNumbers = EnglishDateTime.DoubleNumbers;
    writtenDecades = EnglishDateTime.WrittenDecades;
    specialDecadeCases = EnglishDateTime.SpecialDecadeCases;

    cardinalExtractor = CardinalExtractor.getInstance();
    integerExtractor = IntegerExtractor.getInstance();
    ordinalExtractor = OrdinalExtractor.getInstance();
    numberParser = BaseNumberParser(EnglishNumberParserConfiguration());

    durationExtractor = BaseDurationExtractor(EnglishDurationExtractorConfiguration());
    dateExtractor = BaseDateExtractor(EnglishDateExtractorConfiguration(this));
    timeExtractor = BaseTimeExtractor(EnglishTimeExtractorConfiguration(options));
    dateTimeExtractor = BaseDateTimeExtractor(EnglishDateTimeExtractorConfiguration(options));
    datePeriodExtractor = BaseDatePeriodExtractor(EnglishDatePeriodExtractorConfiguration(this));
    timePeriodExtractor = BaseTimePeriodExtractor(EnglishTimePeriodExtractorConfiguration(options));
    dateTimePeriodExtractor = BaseDateTimePeriodExtractor(EnglishDateTimePeriodExtractorConfiguration(options));

    timeZoneParser = BaseTimeZoneParser();
    durationParser = BaseDurationParser(EnglishDurationParserConfiguration(this));
    dateParser = BaseDateParser(EnglishDateParserConfiguration(this));
    timeParser = TimeParser(EnglishTimeParserConfiguration(this));
    dateTimeParser = BaseDateTimeParser(EnglishDateTimeParserConfiguration(this));
    datePeriodParser = BaseDatePeriodParser(EnglishDatePeriodParserConfiguration(this));
    timePeriodParser = BaseTimePeriodParser(EnglishTimePeriodParserConfiguration(this));
    dateTimePeriodParser = BaseDateTimePeriodParser(EnglishDateTimePeriodParserConfiguration(this));
    dateTimeAltParser = BaseDateTimeAltParser(EnglishDateTimeAltParserConfiguration(this));
  }

  @Override
  IExtractor getCardinalExtractor() {
    return cardinalExtractor;
  }

  @Override
  IExtractor getIntegerExtractor() {
    return integerExtractor;
  }

  @Override
  IExtractor getOrdinalExtractor() {
    return ordinalExtractor;
  }

  @Override
  IParser getNumberParser() {
    return numberParser;
  }

  @Override
  IDateExtractor getDateExtractor() {
    return dateExtractor;
  }

  @Override
  IDateTimeExtractor getTimeExtractor() {
    return timeExtractor;
  }

  @Override
  IDateTimeExtractor getDateTimeExtractor() {
    return dateTimeExtractor;
  }

  @Override
  IDateTimeExtractor getDurationExtractor() {
    return durationExtractor;
  }

  @Override
  IDateTimeExtractor getDatePeriodExtractor() {
    return datePeriodExtractor;
  }

  @Override
  IDateTimeExtractor getTimePeriodExtractor() {
    return timePeriodExtractor;
  }

  @Override
  IDateTimeExtractor getDateTimePeriodExtractor() {
    return dateTimePeriodExtractor;
  }

  @Override
  IDateTimeParser getDateParser() {
    return dateParser;
  }

  @Override
  IDateTimeParser getTimeParser() {
    return timeParser;
  }

  @Override
  IDateTimeParser getDateTimeParser() {
    return dateTimeParser;
  }

  @Override
  IDateTimeParser getDurationParser() {
    return durationParser;
  }

  @Override
  IDateTimeParser getDatePeriodParser() {
    return datePeriodParser;
  }

  @Override
  IDateTimeParser getTimePeriodParser() {
    return timePeriodParser;
  }

  @Override
  IDateTimeParser getDateTimePeriodParser() {
    return dateTimePeriodParser;
  }

  @Override
  IDateTimeParser getDateTimeAltParser() {
    return dateTimeAltParser;
  }

  @Override
  IDateTimeParser getTimeZoneParser() {
    return timeZoneParser;
  }

  @Override
  ImmutableMap<String, Integer> getMonthOfYear() {
    return monthOfYear;
  }

  @Override
  ImmutableMap<String, Integer> getNumbers() {
    return numbers;
  }

  @Override
  ImmutableMap<String, Long> getUnitValueMap() {
    return unitValueMap;
  }

  @Override
  ImmutableMap<String, String> getSeasonMap() {
    return seasonMap;
  }

  @Override
  ImmutableMap<String, String> getSpecialYearPrefixesMap() {
    return specialYearPrefixesMap;
  }

  @Override
  ImmutableMap<String, String> getUnitMap() {
    return unitMap;
  }

  @Override
  ImmutableMap<String, Integer> getCardinalMap() {
    return cardinalMap;
  }

  @Override
  ImmutableMap<String, Integer> getDayOfWeek() {
    return dayOfWeekMap;
  }

  @Override
  ImmutableMap<String, Double> getDoubleNumbers() {
    return doubleNumbers;
  }

  @Override
  ImmutableMap<String, Integer> getWrittenDecades() {
    return writtenDecades;
  }

  @Override
  ImmutableMap<String, Integer> getSpecialDecadeCases() {
    return specialDecadeCases;
  }

  @Override
  IDateTimeUtilityConfiguration getUtilityConfiguration() {
    return utilityConfiguration;
  }

  @Override
  ImmutableMap<String, Integer> getDayOfMonth() {
    return dayOfMonth;
  }
}

abstract class BaseDateParserConfiguration extends BaseOptionsConfiguration implements ICommonDateTimeParserConfiguration {
  protected BaseDateParserConfiguration(DateTimeOptions options) {
    super(options);
  }

  @Override
  ImmutableMap<String, Integer> getDayOfMonth() {
    return BaseDateTime.DayOfMonthDictionary;
  }
}

class BaseOptionsConfiguration implements IOptionsConfiguration {
  private final DateTimeOptions options;
  private final boolean dmyDateFormat;

  BaseOptionsConfiguration() {
    this(DateTimeOptions.None, false);
  }

  BaseOptionsConfiguration(DateTimeOptions options) {
    this(options, false);
  }

  BaseOptionsConfiguration(DateTimeOptions options, boolean dmyDateFormat) {
    this.options = options;
    this.dmyDateFormat = dmyDateFormat;
  }

  @Override
  DateTimeOptions getOptions() {
    return options;
  }

  @Override
  boolean getDmyDateFormat() {
    return dmyDateFormat;
  }
}

interface ICommonDateTimeParserConfiguration extends IOptionsConfiguration {
IExtractor getCardinalExtractor();

IExtractor getIntegerExtractor();

IExtractor getOrdinalExtractor();

IParser getNumberParser();

IDateExtractor getDateExtractor();

IDateTimeExtractor getTimeExtractor();

IDateTimeExtractor getDateTimeExtractor();

IDateTimeExtractor getDurationExtractor();

IDateTimeExtractor getDatePeriodExtractor();

IDateTimeExtractor getTimePeriodExtractor();

IDateTimeExtractor getDateTimePeriodExtractor();

IDateTimeParser getDateParser();

IDateTimeParser getTimeParser();

IDateTimeParser getDateTimeParser();

IDateTimeParser getDurationParser();

IDateTimeParser getDatePeriodParser();

IDateTimeParser getTimePeriodParser();

IDateTimeParser getDateTimePeriodParser();

IDateTimeParser getDateTimeAltParser();

IDateTimeParser getTimeZoneParser();

ImmutableMap<String, Integer> getMonthOfYear();

ImmutableMap<String, Integer> getNumbers();

ImmutableMap<String, Long> getUnitValueMap();

ImmutableMap<String, String> getSeasonMap();

ImmutableMap<String, String> getSpecialYearPrefixesMap();

ImmutableMap<String, String> getUnitMap();

ImmutableMap<String, Integer> getCardinalMap();

ImmutableMap<String, Integer> getDayOfMonth();

ImmutableMap<String, Integer> getDayOfWeek();

ImmutableMap<String, Double> getDoubleNumbers();

ImmutableMap<String, Integer> getWrittenDecades();

ImmutableMap<String, Integer> getSpecialDecadeCases();

IDateTimeUtilityConfiguration getUtilityConfiguration();
}

class EnglishMergedExtractorConfiguration extends BaseOptionsConfiguration implements IMergedExtractorConfiguration {

  static final Pattern AfterRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.AfterRegex);
  static final Pattern SinceRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.SinceRegex);
  static final Pattern AroundRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.AroundRegex);
  static final Pattern BeforeRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.BeforeRegex);
  static final Pattern FromToRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.FromToRegex);
  static final Pattern SuffixAfterRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.SuffixAfterRegex);
  static final Pattern NumberEndingPattern = RegExpUtility.getSafeRegExp(EnglishDateTime.NumberEndingPattern);
  static final Pattern PrepositionSuffixRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.PrepositionSuffixRegex);
  static final Pattern AmbiguousRangeModifierPrefix = RegExpUtility.getSafeRegExp(EnglishDateTime.AmbiguousRangeModifierPrefix);
  static final Pattern SingleAmbiguousMonthRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.SingleAmbiguousMonthRegex);
  static final Pattern UnspecificDatePeriodRegex = RegExpUtility.getSafeRegExp(EnglishDateTime.UnspecificDatePeriodRegex);
  private final Iterable<Pair<Pattern, Pattern>> ambiguityFiltersDict;

  static final StringMatcher SuperfluousWordMatcher = new StringMatcher();
  private static final Iterable<Pattern> filterWordRegexList = new ArrayList<Pattern>() {
  {
  // one on one
  add(RegExpUtility.getSafeRegExp(EnglishDateTime.OneOnOneRegex));

  // (the)? (day|week|month|year)
  add(RegExpUtility.getSafeRegExp(EnglishDateTime.SingleAmbiguousTermsRegex));
  }
};

final Iterable<Pattern> getFilterWordRegexList() {
return filterWordRegexList;
}

final StringMatcher getSuperfluousWordMatcher() {
return SuperfluousWordMatcher;
}

private IDateTimeExtractor setExtractor;

final IDateTimeExtractor getSetExtractor() {
return setExtractor;
}

private IExtractor integerExtractor;

final IExtractor getIntegerExtractor() {
return integerExtractor;
}

private IDateExtractor dateExtractor;

final IDateExtractor getDateExtractor() {
return dateExtractor;
}

private IDateTimeExtractor timeExtractor;

final IDateTimeExtractor getTimeExtractor() {
return timeExtractor;
}

private IDateTimeExtractor holidayExtractor;

final IDateTimeExtractor getHolidayExtractor() {
return holidayExtractor;
}

private IDateTimeExtractor dateTimeExtractor;

final IDateTimeExtractor getDateTimeExtractor() {
return dateTimeExtractor;
}

private IDateTimeExtractor durationExtractor;

final IDateTimeExtractor getDurationExtractor() {
return durationExtractor;
}

private IDateTimeExtractor datePeriodExtractor;

final IDateTimeExtractor getDatePeriodExtractor() {
return datePeriodExtractor;
}

private IDateTimeExtractor timePeriodExtractor;

final IDateTimeExtractor getTimePeriodExtractor() {
return timePeriodExtractor;
}

private IDateTimeZoneExtractor timeZoneExtractor;

final IDateTimeZoneExtractor getTimeZoneExtractor() {
return timeZoneExtractor;
}

private IDateTimeListExtractor dateTimeAltExtractor;

final IDateTimeListExtractor getDateTimeAltExtractor() {
return dateTimeAltExtractor;
}

private IDateTimeExtractor dateTimePeriodExtractor;

final IDateTimeExtractor getDateTimePeriodExtractor() {
return dateTimePeriodExtractor;
}

EnglishMergedExtractorConfiguration(DateTimeOptions options) {
  super(options);

  setExtractor = new BaseSetExtractor(new EnglishSetExtractorConfiguration(options));
  dateExtractor = new BaseDateExtractor(new EnglishDateExtractorConfiguration(this));
  timeExtractor = new BaseTimeExtractor(new EnglishTimeExtractorConfiguration(options));
  holidayExtractor = new BaseHolidayExtractor(new EnglishHolidayExtractorConfiguration());
  datePeriodExtractor = new BaseDatePeriodExtractor(new EnglishDatePeriodExtractorConfiguration(this));
  dateTimeExtractor = new BaseDateTimeExtractor(new EnglishDateTimeExtractorConfiguration(options));
  durationExtractor = new BaseDurationExtractor(new EnglishDurationExtractorConfiguration(options));
  timeZoneExtractor = new BaseTimeZoneExtractor(new EnglishTimeZoneExtractorConfiguration(options));
  dateTimeAltExtractor = new BaseDateTimeAltExtractor(new EnglishDateTimeAltExtractorConfiguration(this));
  timePeriodExtractor = new BaseTimePeriodExtractor(new EnglishTimePeriodExtractorConfiguration(options));
  dateTimePeriodExtractor = new BaseDateTimePeriodExtractor(new EnglishDateTimePeriodExtractorConfiguration(options));
  integerExtractor = IntegerExtractor.getInstance();

  ambiguityFiltersDict = EnglishDateTime.AmbiguityFiltersDict.entrySet().stream().map(pair -> {
  Pattern key = RegExpUtility.getSafeRegExp(pair.getKey());
  Pattern val = RegExpUtility.getSafeRegExp(pair.getValue());
  return new Pair<Pattern, Pattern>(key, val);
  }).collect(Collectors.toList());

  if (!this.getOptions().match(DateTimeOptions.EnablePreview)) {
    getSuperfluousWordMatcher().init(EnglishDateTime.SuperfluousWordList);
  }
}

final Pattern getAfterRegex() {
return AfterRegex;
}

final Pattern getSinceRegex() {
return SinceRegex;
}


final Pattern getAroundRegex() {
return AroundRegex;
}

final Pattern getBeforeRegex() {
return BeforeRegex;
}

final Pattern getFromToRegex() {
return FromToRegex;
}

final Pattern getSuffixAfterRegex() {
return SuffixAfterRegex;
}

final Pattern getNumberEndingPattern() {
return NumberEndingPattern;
}

final Pattern getPrepositionSuffixRegex() {
return PrepositionSuffixRegex;
}

final Pattern getAmbiguousRangeModifierPrefix() {
return AmbiguousRangeModifierPrefix;
}

final Pattern getPotentialAmbiguousRangeRegex() {
return FromToRegex;
}

final Pattern getSingleAmbiguousMonthRegex() {
return SingleAmbiguousMonthRegex;
}

final Pattern getUnspecificDatePeriodRegex() {
return UnspecificDatePeriodRegex;
}

final Iterable<Pair<Pattern, Pattern>> getAmbiguityFiltersDict() {
return ambiguityFiltersDict;
}
}