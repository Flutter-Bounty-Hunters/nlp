import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_utility_configuration.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDateExtractorConfiguration extends BaseOptionsConfiguration implements IDateExtractorConfiguration {
  EnglishDateExtractorConfiguration(
    ICommonDateTimeParserConfiguration config, [
    super.options = DateTimeOptions.None,
  ]) : _config = config;

  final ICommonDateTimeParserConfiguration _config;

  @override
  RegExp beforeAfterRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BeforeAfterRegex);
  }

  @override
  bool checkBothBeforeAfter() {
    return EnglishDateTime.CheckBothBeforeAfter;
  }

  @override
  List<RegExp> dateRegExpList() {
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
  RegExp dateUnitRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateUnitRegex);
  }

  @override
  Map<String, int> dayOfWeek() => EnglishDateTime.DayOfWeek;

  @override
  IDateTimeExtractor durationExtractor() {
    return _config.durationExtractor;
  }

  @override
  RegExp forTheRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ForTheRegex);
  }

  @override
  IDateTimeExtractor holidayExtractor() => _config.holidayExtractor;

  @override
  List<RegExp> implicitDateList() {
    return <RegExp>[
      // extract "12" from "on 12"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OnRegex),

      // extract "12th" from "on/at/in 12th"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelaxedOnRegex),

      // "the day before yesterday", "previous day", "today", "yesterday", "tomorrow"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecialDayRegex),

      // "this Monday", "Tuesday of this week"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ThisRegex),

      // "last/previous Monday", "Monday of last week"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LastDateRegex),

      // "next/following Monday", "Monday of next week"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextDateRegex),

      // "Sunday", "Weds"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SingleWeekDayRegex),

      // "2nd Monday of April"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayOfMonthRegex),

      // "on the 12th"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecialDate),

      // "two days from today", "five days from tomorrow"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecialDayWithNumRegex),

      // "three Monday from now"
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeWeekDayRegex),
    ];
  }

  @override
  RegExp inConnectorRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.InConnectorRegex);
  }

  @override
  IExtractor integerExtractor() {
    return IntegerExtractor.getInstance();
  }

  @override
  RegExp lessThanRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LessThanRegex);
  }

  @override
  RegExp monthEnd() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthEnd);
  }

  @override
  Map<String, int> monthOfYear() {
    return _config.monthOfYear;
  }

  @override
  RegExp moreThanRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MoreThanRegex);
  }

  @override
  IParser numberParser() {
    return _config.numberParser;
  }

  @override
  RegExp ofMonth() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.OfMonth);
  }

  @override
  IExtractor ordinalExtractor() {
    return _config.ordinalExtractor;
  }

  @override
  RegExp prefixArticleRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PrefixArticleRegex);
  }

  @override
  RegExp rangeConnectorSymbolRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(BaseDateTime.RangeConnectorSymbolRegex);
  }

  @override
  RegExp rangeUnitRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RangeUnitRegex);
  }

  @override
  RegExp relativeMonthRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeMonthRegex);
  }

  @override
  RegExp sinceYearSuffixRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SinceYearSuffixRegex);
  }

  @override
  RegExp strictRelativeRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.StrictRelativeRegex);
  }

  @override
  RegExp weekDayAndDayOfMonthRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayAndDayOfMonthRegex);
  }

  @override
  RegExp weekDayAndDayRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayAndDayRegex);
  }

  @override
  RegExp weekDayEnd() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayEnd);
  }

  @override
  RegExp weekDayRegExp() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayRegex);
  }

  @override
  RegExp weekDayStart() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayStart);
  }

  @override
  RegExp yearSuffix() {
    return RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearSuffix);
  }

  @override
  IDateTimeUtilityConfiguration utilityConfiguration() {
    return EnglishDatetimeUtilityConfiguration();
  }
}
