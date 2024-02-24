import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_datetime_extractor.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_utility_configuration.dart';
import 'package:nlp/src/date_time/english_date_extractor.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDateTimeExtractorConfiguration extends BaseOptionsConfiguration
    implements IDateTimeExtractorConfiguration {
  EnglishDateTimeExtractorConfiguration(this.config, [super.options = DateTimeOptions.None])
      : _datePointExtractor = BaseDateExtractor(EnglishDateExtractorConfiguration(config));

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp DateNumberConnectorRegExp() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateNumberConnectorRegex);

  final IDateExtractor _datePointExtractor;
  @override
  IDateExtractor DatePointExtractor() => _datePointExtractor;

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  IDateTimeExtractor HolidayExtractor() => config.holidayExtractor;

  @override
  IExtractor integerExtractor() => IntegerExtractor.getInstance();

  @override
  bool IsConnector(String text) {
    text = text.trim();
    return text.isEmpty ||
        RegExp(EnglishDateTime.PrepositionRegex).hasMatch(text) ||
        RegExp(EnglishDateTime.ConnectorRegex).hasMatch(text);
  }

  @override
  RegExp NowRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NowRegex);

  @override
  RegExp NumberAsTimeRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NumberAsTimeRegex);

  @override
  RegExp SimpleTimeOfTodayAfterRegExp() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SimpleTimeOfTodayAfterRegex);

  @override
  RegExp SimpleTimeOfTodayBeforeRegExp() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SimpleTimeOfTodayBeforeRegex);

  @override
  RegExp SpecificEndOfRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificEndOfRegex);

  @override
  RegExp SuffixAfterRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SuffixAfterRegex);

  @override
  RegExp SuffixRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SuffixRegex);

  @override
  RegExp TimeOfDayRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeOfDayRegex);

  @override
  RegExp TimeOfTodayAfterRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeOfTodayAfterRegex);

  @override
  RegExp TimeOfTodayBeforeRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeOfTodayBeforeRegex);

  @override
  IDateTimeExtractor TimePointExtractor() => config.timeExtractor;

  @override
  RegExp UnitRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeUnitRegex);

  @override
  RegExp UnspecificEndOfRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.UnspecificEndOfRegex);

  @override
  IDateTimeUtilityConfiguration UtilityConfiguration() => EnglishDatetimeUtilityConfiguration();

  @override
  RegExp YearRegExp() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearRegex);

  @override
  RegExp YearSuffix() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearSuffix);
}
