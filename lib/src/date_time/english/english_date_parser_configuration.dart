import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_parser_configuration.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_utility_configuration.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDateParserConfiguration extends BaseOptionsConfiguration implements IDateParserConfiguration {
  EnglishDateParserConfiguration(this.config);

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp beforeAfterRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BeforeAfterRegex);

  @override
  IExtractor cardinalExtractor() => config.cardinalExtractor;

  @override
  Map<String, int> cardinalMap() => EnglishDateTime.CardinalMap;

  @override
  bool checkBothBeforeAfter() => EnglishDateTime.CheckBothBeforeAfter;

  @override
  IDateExtractor dateExtractor() => config.dateExtractor;

  @override
  List<RegExp> dateRegexes() {
    final enableDmy =
        dmyDateFormat || EnglishDateTime.DefaultLanguageFallback == DateTimeConstants.DefaultLanguageFallback_DMY;

    return <RegExp>[
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor1),
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor3),
      if (enableDmy) ...[
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor5),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor8),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor9L),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor4),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor6),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor7L),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor7S),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractorA),
      ] else ...[
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor4),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor6),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor7L),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor7S),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor5),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor8),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor9L),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractor9S),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateExtractorA),
      ],
    ];
  }

  @override
  String dateTokenPrefix() => EnglishDateTime.DateTokenPrefix;

  @override
  Map<String, int> dayOfMonth() => {...BaseDateTime.DayOfMonthDictionary, ...EnglishDateTime.DayOfMonth};

  @override
  Map<String, int> dayOfWeek() => EnglishDateTime.DayOfWeek;

  @override
  IDateTimeExtractor durationExtractor() => config.durationExtractor;

  @override
  IDateTimeParser durationParser() => config.durationParser;

  @override
  RegExp forTheRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ForTheRegex);

  @override
  int getSwiftMonthOrYear(String text) {
    var trimmedText = text.trim();
    var swift = 0;

    if (nextPrefixRegExp().hasMatch(trimmedText)) {
      swift = 1;
    }

    if (previousPrefixRegExp().hasMatch(trimmedText)) {
      swift = -1;
    }

    return swift;
  }

  @override
  IDateTimeParser holidayParser() {
    // TODO: implement holidayParser
    throw UnimplementedError();
  }

  @override
  IExtractor integerExtractor() => IntegerExtractor.getInstance();

  @override
  bool isCardinalLast(String text) {
    var trimmedText = text.trim();

    return trimmedText == "last";
  }

  @override
  RegExp lastRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LastDateRegex);

  @override
  List<String> minusOneDayTerms() => EnglishDateTime.MinusOneDayTerms;

  @override
  List<String> minusTwoDayTerms() => EnglishDateTime.MinusTwoDayTerms;

  @override
  Map<String, int> monthOfYear() => config.monthOfYear;

  @override
  RegExp monthRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthRegex);

  @override
  RegExp nextPrefixRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);

  @override
  RegExp nextRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextDateRegex);

  @override
  String normalize(String text) => text;

  @override
  IParser numberParser() => config.numberParser;

  @override
  RegExp onRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OnRegex);

  @override
  IExtractor ordinalExtractor() => config.ordinalExtractor;

  @override
  RegExp pastPrefixRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PastPrefixRegex);

  @override
  List<String> plusOneDayTerms() => EnglishDateTime.PlusOneDayTerms;

  @override
  List<String> plusTwoDayTerms() => EnglishDateTime.PlusTwoDayTerms;

  @override
  RegExp previousPrefixRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);

  @override
  RegExp relativeDayRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeDayRegex);

  @override
  RegExp relativeMonthRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeMonthRegex);

  @override
  RegExp relativeWeekDayRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeWeekDayRegex);

  @override
  List<String> sameDayTerms() => EnglishDateTime.SameDayTerms;

  @override
  RegExp specialDayRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecialDayRegex);

  @override
  RegExp specialDayWithNumRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecialDayWithNumRegex);

  @override
  RegExp strictRelativeRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.StrictRelativeRegex);

  @override
  RegExp tasksModeDurationToDatePatterns() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TasksModeDurationToDatePatterns);

  @override
  RegExp thisRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ThisRegex);

  @override
  Map<String, String> unitMap() => EnglishDateTime.UnitMap;

  @override
  RegExp unitRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateUnitRegex);

  @override
  RegExp upcomingPrefixRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.UpcomingPrefixRegex);

  @override
  IDateTimeUtilityConfiguration utilityConfiguration() => EnglishDatetimeUtilityConfiguration();

  @override
  RegExp weekDayAndDayOfMothRegExp() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayAndDayOfMonthRegex);

  @override
  RegExp weekDayAndDayRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayAndDayRegex);

  @override
  RegExp weekDayOfMonthRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayOfMonthRegex);

  @override
  RegExp weekDayRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayRegex);

  @override
  RegExp yearSuffix() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearSuffix);
}
