import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/core/task_mode_processing.dart';
import 'package:nlp/src/date_time/base_date_time_period_parser.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDateTimePeriodParserConfiguration extends BaseDateTimeOptionsConfiguration
    implements IDateTimePeriodParserConfiguration {
  EnglishDateTimePeriodParserConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp AfterRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AfterRegex);

  @override
  RegExp AmDescRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AmDescRegex);

  @override
  RegExp BeforeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BeforeRegex);

  @override
  IExtractor CardinalExtractor() => config.cardinalExtractor;

  @override
  bool CheckBothBeforeAfter() => EnglishDateTime.CheckBothBeforeAfter;

  @override
  IDateExtractor DateExtractor() => config.dateExtractor;

  @override
  IDateTimeParser DateParser() => config.dateParser;

  @override
  IDateTimeExtractor DateTimeExtractor() => config.dateTimeExtractor;

  @override
  IDateTimeParser DateTimeParser() => config.dateTimeParser;

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  IDateTimeParser DurationParser() => config.durationParser;

  @override
  RegExp FutureRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);

  @override
  RegExp FutureSuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FutureSuffixRegex);

  @override
  (String, int, int, int) GetMatchedTimeRange(String text) {
    var trimmedText = text.trim();
    int beginHour = 0;
    int endHour = 0;
    int endMin = 0;
    String todSymbol = "";

    if (MorningStartEndRegex().hasMatch(trimmedText)) {
      todSymbol = "TMO";
      beginHour = 8;
      endHour = DateTimeConstants.HalfDayHourCount;
    } else if (AfternoonStartEndRegex().hasMatch(trimmedText)) {
      todSymbol = "TAF";
      beginHour = DateTimeConstants.HalfDayHourCount;
      endHour = 16;
    } else if (EveningStartEndRegex().hasMatch(trimmedText)) {
      todSymbol = "TEV";
      beginHour = 16;
      endHour = 20;
    } else if (NightStartEndRegex().hasMatch(trimmedText)) {
      todSymbol = "TNI";
      beginHour = 20;
      endHour = 23;
      endMin = 59;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeBreakfastTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeBreakfast;
      beginHour = DateTimeConstants.MealtimeBreakfastBeginHour;
      endHour = DateTimeConstants.MealtimeBreakfastEndHour;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeBrunchTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeBrunch;
      beginHour = DateTimeConstants.MealtimeBrunchBeginHour;
      endHour = DateTimeConstants.MealtimeBrunchEndHour;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeLunchTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeLunch;
      beginHour = DateTimeConstants.MealtimeLunchBeginHour;
      endHour = DateTimeConstants.MealtimeLunchEndHour;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeDinnerTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeDinner;
      beginHour = DateTimeConstants.MealtimeDinnerBeginHour;
      endHour = DateTimeConstants.MealtimeDinnerEndHour;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeBreakfastTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeBreakfast;
      beginHour = DateTimeConstants.MealtimeBreakfastBeginHour;
      endHour = DateTimeConstants.MealtimeBreakfastEndHour;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeBrunchTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeBrunch;
      beginHour = DateTimeConstants.MealtimeBrunchBeginHour;
      endHour = DateTimeConstants.MealtimeBrunchEndHour;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeLunchTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeLunch;
      beginHour = DateTimeConstants.MealtimeLunchBeginHour;
      endHour = DateTimeConstants.MealtimeLunchEndHour;
    } else if ((options.match(DateTimeOptions.TasksMode)) &&
        EnglishDateTime.MealtimeDinnerTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      todSymbol = DateTimeConstants.MealtimeDinner;
      beginHour = DateTimeConstants.MealtimeDinnerBeginHour;
      endHour = DateTimeConstants.MealtimeDinnerEndHour;
    } else {
      return ("", 0, 0, 0);
    }

    // TasksMode modifies the values of Ambiguous time refrences like morning, lunchtime etc.
    if (options.match(DateTimeOptions.TasksMode)) {
      (beginHour, endHour, endMin) = TasksModeProcessing.GetMatchedTimeRangeForTasksMode(text, todSymbol);
    }

    return (todSymbol, beginHour, endHour, endMin);
  }

  @override
  int GetSwiftPrefix(String text) {
    var trimmedText = text.trim();

    // @TODO Move hardcoded terms to resource file

    var swift = 0;
    if (trimmedText.startsWith("next")) {
      swift = 1;
    } else if (trimmedText.startsWith("last")) {
      swift = -1;
    }

    return swift;
  }

  @override
  IDateTimeExtractor HolidayExtractor() => config.holidayExtractor;

  @override
  IDateTimeParser HolidayTimeParser() {
    // TODO: implement HolidayTimeParser
    throw UnimplementedError();
  }

  @override
  RegExp HyphenDateRegex() => RegExpComposer.sanitizeGroupsAndCompile(BaseDateTime.HyphenDateRegex);

  @override
  RegExp NumberCombinedWithUnitRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeNumberCombinedWithUnit);

  @override
  IParser NumberParser() => config.numberParser;

  @override
  Map<String, int> Numbers() => EnglishDateTime.Numbers;

  @override
  RegExp PeriodTimeOfDayWithDateRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PeriodTimeOfDayWithDateRegex);

  @override
  RegExp PmDescRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PmDescRegex);

  @override
  RegExp PrefixDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PrefixDayRegex);

  @override
  RegExp PreviousPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);

  @override
  RegExp PureNumberBetweenAndRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumBetweenAnd);

  @override
  RegExp PureNumberFromToRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumFromTo);

  @override
  RegExp RelativeTimeUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeTimeUnitRegex);

  @override
  RegExp RestOfDateTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RestOfDateTimeRegex);

  @override
  RegExp SpecificTimeOfDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificTimeOfDayRegex);

  @override
  RegExp TasksmodeMealTimeofDayRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TasksmodeMealTimeofDayRegex);

  @override
  IDateTimeExtractor TimeExtractor() => config.timeExtractor;

  @override
  RegExp TimeOfDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeOfDayRegex);
  @override
  IDateTimeParser TimeParser() => config.timeParser;

  @override
  IDateTimeExtractor TimePeriodExtractor() => config.timePeriodExtractor;

  @override
  IDateTimeParser TimePeriodParser() => config.timePeriodParser;

  @override
  IDateTimeParser TimeZoneParser() {
    // TODO: implement TimeZoneParser
    throw UnimplementedError();
  }

  @override
  String TokenBeforeDate() => EnglishDateTime.TokenBeforeDate;

  @override
  String TokenBeforeTime() => EnglishDateTime.TokenBeforeTime;

  @override
  Map<String, String> UnitMap() => EnglishDateTime.UnitMap;

  @override
  RegExp UnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeUnitRegex);

  @override
  RegExp WithinNextPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WithinNextPrefixRegex);

  RegExp MorningStartEndRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MorningStartEndRegex);

  RegExp AfternoonStartEndRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AfternoonStartEndRegex);

  RegExp EveningStartEndRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.EveningStartEndRegex);

  RegExp NightStartEndRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NightStartEndRegex);
}
