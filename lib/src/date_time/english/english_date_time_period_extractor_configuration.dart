import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/base_date_time_period_extractor.dart';
import 'package:nlp/src/date_time/base_datetime_extractor.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/base_time_extractor.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english/english_date_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/english_date_extractor.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDateTimePeriodExtractorConfiguration extends BaseDateTimeOptionsConfiguration
    implements IDateTimePeriodExtractorConfiguration {
  EnglishDateTimePeriodExtractorConfiguration(this.config, {super.options = DateTimeOptions.None});

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
  RegExp DateUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateUnitRegex);

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  RegExp FollowedUnit() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FollowedDateUnit);

  @override
  RegExp FutureSuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FutureSuffixRegex);

  @override
  RegExp GeneralEndingRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.GeneralEndingRegex);

  @override
  int? GetBetweenTokenIndex(String text) {
    var betweenMatch = BetweenTokenRegex().firstMatch(text);
    if (betweenMatch != null) {
      return betweenMatch.start;
    }

    return null;
  }

  @override
  int? GetFromTokenIndex(String text) {
    var fromMatch = FromTokenRegex().firstMatch(text);
    if (fromMatch != null) {
      return fromMatch.start;
    }

    return null;
  }

  @override
  bool HasConnectorToken(String text) {
    return RangeConnectorRegex().matchExact(text, true) != null;
  }

  @override
  IDateTimeExtractor HolidayExtractor() => config.holidayExtractor;

  @override
  RegExp MiddlePauseRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.MiddlePauseRegex);

  @override
  RegExp NextPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);

  @override
  RegExp NumberCombinedWithUnit() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NumberCombinedWithDateUnit);

  @override
  RegExp PeriodTimeOfDayWithDateRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PeriodTimeOfDayWithDateRegex);

  @override
  RegExp PmDescRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PmDescRegex);

  @override
  RegExp PrefixDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PrefixDayRegex);

  @override
  RegExp PrepositionRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PrepositionRegex);

  @override
  RegExp PreviousPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);

  @override
  RegExp RelativeTimeUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RelativeTimeUnitRegex);

  @override
  RegExp RestOfDateTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RestOfDateTimeRegex);

  @override
  List<RegExp> SimpleCasesRegex() => [
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumFromTo),
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumBetweenAnd),
      ];

  @override
  IDateTimeExtractor SingleDateExtractor() => BaseDateExtractor(EnglishDateExtractorConfiguration(config));

  @override
  IDateTimeExtractor SingleDateTimeExtractor() => BaseDateTimeExtractor(EnglishDateTimeExtractorConfiguration(config));

  @override
  IDateTimeExtractor SingleTimeExtractor() => BaseTimeExtractor(EnglishTimeExtractorConfiguration(config));

  @override
  RegExp SpecificTimeOfDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificTimeOfDayRegex);

  @override
  RegExp SuffixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SuffixRegex);

  @override
  RegExp TasksmodeMealTimeofDayRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TasksmodeMealTimeofDayRegex);

  @override
  RegExp TillRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TillRegex);

  @override
  RegExp TimeOfDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeOfDayRegex);

  @override
  IDateTimeExtractor TimePeriodExtractor() => config.timePeriodExtractor;

  @override
  RegExp TimeUnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeUnitRegex);

  @override
  IDateTimeExtractor TimeZoneExtractor() {
    // TODO: implement TimeZoneExtractor
    throw UnimplementedError();
  }

  @override
  String TokenBeforeDate() => EnglishDateTime.TokenBeforeDate;

  @override
  RegExp WeekDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WeekDayRegex);

  @override
  RegExp WithinNextPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.WithinNextPrefixRegex);

  RegExp BetweenTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.BetweenTokenRegex);

  RegExp FromTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.FromRegex);

  RegExp RangeConnectorRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RangeConnectorRegex);
}
