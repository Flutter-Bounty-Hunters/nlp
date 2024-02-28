import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/task_mode_processing.dart';
import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/base_time_period_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_utility_configuration.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishTimePeriodParserConfiguration extends BaseDateTimeOptionsConfiguration
    implements ITimePeriodParserConfiguration {
  EnglishTimePeriodParserConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp GeneralEndingRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.GeneralEndingRegex);

  @override
  (String, int, int, int) GetMatchedTimeRange(String text) {
    var trimmedText = text.trim();
    if (trimmedText.endsWith("s")) {
      trimmedText = trimmedText.substring(0, trimmedText.length - 1);
    }

    int beginHour = 0;
    int endHour = 0;
    int endMin = 0;
    String timex = '';

    var timeOfDay = '';
    if (EnglishDateTime.MorningTermList.where((o) => trimmedText.endsWith(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.Morning;
    } else if (EnglishDateTime.AfternoonTermList.where((o) => trimmedText.endsWith(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.Afternoon;
    } else if (EnglishDateTime.EveningTermList.where((o) => trimmedText.endsWith(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.Evening;
    } else if (EnglishDateTime.DaytimeTermList.where((o) => trimmedText.endsWith(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.Daytime;
    } else if (EnglishDateTime.NighttimeTermList.where((o) => trimmedText.endsWith(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.Nighttime;
    } else if (EnglishDateTime.NightTermList.where((o) => trimmedText.endsWith(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.Night;
    } else if (EnglishDateTime.BusinessHourSplitStrings.where((o) => trimmedText.contains(o)).length ==
        EnglishDateTime.BusinessHourSplitStrings.length) {
      timeOfDay = DateTimeConstants.BusinessHour;
    } else if (EnglishDateTime.MealtimeBreakfastTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.MealtimeBreakfast;
    } else if (EnglishDateTime.MealtimeBrunchTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.MealtimeBrunch;
    } else if (EnglishDateTime.MealtimeLunchTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.MealtimeLunch;
    } else if (EnglishDateTime.MealtimeDinnerTermList.where((o) => trimmedText.contains(o)).isNotEmpty) {
      timeOfDay = DateTimeConstants.MealtimeDinner;
    } else {
      return ('', 0, 0, 0);
    }

    var parseResult = TimexUtility.ResolveTimeOfDay(timeOfDay);
    timex = parseResult.Timex;
    beginHour = parseResult.BeginHour;
    endHour = parseResult.EndHour;
    endMin = parseResult.EndMin;

    if (options.match(DateTimeOptions.TasksMode)) {
      beginHour = 0;
      endHour = 0;
      endMin = 0;
      parseResult = TasksModeProcessing.TasksModeResolveTimeOfDay(timeOfDay);
      timex = parseResult.Timex;
      beginHour = parseResult.BeginHour;
      endHour = parseResult.EndHour;
      endMin = parseResult.EndMin;
    }

    return (timex, beginHour, endHour, endMin);
  }

  @override
  IExtractor integerExtractor() => IntegerExtractor.getInstance();

  @override
  Map<String, int> Numbers() => config.numbers;

  @override
  RegExp PureNumberBetweenAndRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumBetweenAnd);

  @override
  RegExp PureNumberFromToRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumFromTo);

  @override
  RegExp SpecificTimeBetweenAndRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificTimeBetweenAnd);

  @override
  RegExp SpecificTimeFromToRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificTimeFromTo);

  @override
  RegExp TillRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TillRegex);

  @override
  IDateTimeExtractor TimeExtractor() => config.timeExtractor;

  @override
  RegExp TimeOfDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeOfDayRegex);

  @override
  IDateTimeParser TimeParser() => config.timeParser;

  @override
  IDateTimeParser TimeZoneParser() {
    // TODO: implement TimeZoneParser
    throw UnimplementedError();
  }

  @override
  IDateTimeUtilityConfiguration UtilityConfiguration() => EnglishDatetimeUtilityConfiguration();
}
