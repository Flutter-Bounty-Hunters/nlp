import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';
import 'package:nlp/src/date_time/base_set_extractor.dart';
import 'package:nlp/src/date_time/set_handler.dart';

class EnglishSetExtractorConfiguration extends BaseDateTimeOptionsConfiguration implements ISetExtractorConfiguration {
  EnglishSetExtractorConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp BeforeEachDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DayRegex);

  @override
  bool CheckBothBeforeAfter() => EnglishDateTime.CheckBothBeforeAfter;

  @override
  IDateExtractor DateExtractor() => config.dateExtractor;

  @override
  IDateTimeExtractor DatePeriodExtractor() => config.datePeriodExtractor;

  @override
  IDateTimeExtractor DateTimeExtractor() => config.dateTimeExtractor;

  @override
  IDateTimeExtractor DateTimePeriodExtractor() => config.dateTimePeriodExtractor;

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  RegExp EachDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.EachDayRegex);

  @override
  RegExp EachPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.EachPrefixRegex);

  @override
  RegExp EachUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.EachUnitRegex);

  @override
  RegExp LastRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FirstLastRegex);

  @override
  RegExp PeriodicRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PeriodicRegex);

  @override
  RegExp SetEachRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SetEachRegex);

  @override
  RegExp SetWeekDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SetWeekDayRegex);

  @override
  IDateTimeExtractor TimeExtractor() => config.timeExtractor;

  @override
  IDateTimeExtractor TimePeriodExtractor() => config.timePeriodExtractor;

  @override
  (String, int) WeekDayGroupMatchTuple(NlpMatch match) => SetHandler.WeekDayGroupMatchTuple(match);
}
