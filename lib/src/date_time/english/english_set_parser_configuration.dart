import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/base_set_parser.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/date_time/set_handler.dart';
import 'package:nlp/src/date_time/task_mode_set_handler.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishSetParserConfiguration extends BaseDateTimeOptionsConfiguration implements ISetParserConfiguration {
  EnglishSetParserConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  IDateExtractor DateExtractor() => config.dateExtractor;

  @override
  IDateTimeParser DateParser() => config.dateParser;

  @override
  IDateTimeExtractor DatePeriodExtractor() => config.datePeriodExtractor;

  @override
  IDateTimeParser DatePeriodParser() => config.datePeriodParser;

  @override
  IDateTimeExtractor DateTimeExtractor() => config.dateTimeExtractor;

  @override
  IDateTimeParser DateTimeParser() => config.dateTimeParser;

  @override
  IDateTimeExtractor DateTimePeriodExtractor() => config.dateTimePeriodExtractor;

  @override
  IDateTimeParser DateTimePeriodParser() => config.dateTimePeriodParser;

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  IDateTimeParser DurationParser() => config.durationParser;

  @override
  RegExp EachDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.EachDayRegex);

  @override
  RegExp EachPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.EachPrefixRegex);

  @override
  RegExp EachUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.EachUnitRegex);

  @override
  String? GetMatchedDailyTimex(String text) {
    var trimmedText = text.trim();
    String? timex;

    double durationLength = 1; // Default value
    double multiplier = 1;
    String durationType;

    if (DoubleMultiplierRegex().hasMatch(trimmedText)) {
      multiplier = 2;
    } else if (HalfMultiplierRegex().hasMatch(trimmedText)) {
      multiplier = 0.5;
    }

    if (WeekDayTypeRegex().hasMatch(trimmedText)) {
      durationType = EnglishDateTime.UnitMap["weekday"]!;
    } else if (DayTypeRegex().hasMatch(trimmedText)) {
      durationType = EnglishDateTime.UnitMap["day"]!;
    } else if (WeekTypeRegex().hasMatch(trimmedText)) {
      durationType = EnglishDateTime.UnitMap["week"]!;
    } else if (WeekendTypeRegex().hasMatch(trimmedText)) {
      durationType = EnglishDateTime.UnitMap["weekend"]!;
    } else if (FortNightRegex().hasMatch(trimmedText)) {
      durationLength = 2;
      durationType = EnglishDateTime.UnitMap["week"]!;
    } else if (MonthTypeRegex().hasMatch(trimmedText)) {
      durationType = EnglishDateTime.UnitMap["m"]!;
    } else if (QuarterTypeRegex().hasMatch(trimmedText)) {
      durationLength = 3;
      durationType = EnglishDateTime.UnitMap["m"]!;
    } else if (YearTypeRegex().hasMatch(trimmedText)) {
      durationType = EnglishDateTime.UnitMap["y"]!;
    } else {
      return null;
    }

    timex = TimexUtility.GenerateSetTimex(durationType, durationLength, multiplier);

    return timex;
  }

  @override
  String? GetMatchedUnitTimex(String text) {
    return GetMatchedDailyTimex(text);
  }

  @override
  RegExp PeriodicRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PeriodicRegex);

  @override
  String ReplaceValueInTextWithFutTerm(String text, String value) {
    return TasksModeSetHandler.ReplaceValueInTextWithFutTerm(text, value, EnglishDateTime.FutureTerms);
  }

  @override
  RegExp SetEachRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SetEachRegex);

  @override
  RegExp SetWeekDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SetWeekDayRegex);

  @override
  IDateTimeExtractor TimeExtractor() => config.timeExtractor;

  @override
  IDateTimeParser TimeParser() => config.timeParser;

  @override
  IDateTimeExtractor TimePeriodExtractor() => config.timePeriodExtractor;

  @override
  IDateTimeParser TimePeriodParser() => config.timePeriodParser;

  @override
  Map<String, String> UnitMap() => config.unitMap;

  @override
  String WeekDayGroupMatchString(NlpMatch match) {
    return SetHandler.WeekDayGroupMatchString(match);
  }

  RegExp DoubleMultiplierRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DoubleMultiplierRegex);

  RegExp HalfMultiplierRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.HalfMultiplierRegex);

  RegExp YearTypeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearTypeRegex);

  RegExp MonthTypeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MonthTypeRegex);

  RegExp QuarterTypeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterTypeRegex);

  RegExp WeekTypeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekTypeRegex);

  RegExp WeekendTypeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekendTypeRegex);

  RegExp WeekDayTypeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayTypeRegex);

  RegExp DayTypeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DayTypeRegex);

  RegExp FortNightRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FortNightRegex);
}
