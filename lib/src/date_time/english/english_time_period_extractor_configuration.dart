import 'package:nlp/nlp.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/base_time_extractor.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english/english_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/time_period_functions.dart';

class EnglishTimePeriodExtractorConfiguration extends BaseDateTimeOptionsConfiguration
    implements ITimePeriodExtractorConfiguration {
  EnglishTimePeriodExtractorConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  List<ExtractResult> ApplyPotentialPeriodAmbiguityHotfix(String text, List<ExtractResult> timePeriodErs) =>
      TimePeriodFunctions.ApplyPotentialPeriodAmbiguityHotfix(text, timePeriodErs);

  @override
  bool CheckBothBeforeAfter() => EnglishDateTime.CheckBothBeforeAfter;

  @override
  RegExp GeneralEndingRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.GeneralEndingRegex);

  @override
  int? GetBetweenTokenIndex(String text) {
    if (text.endsWith("between")) {
      return text.lastIndexOf("between");
    }

    return null;
  }

  @override
  int? GetFromTokenIndex(String text) {
    if (text.endsWith("from")) {
      return text.lastIndexOf("from");
    }

    return null;
  }

  @override
  IExtractor integerExtractor() => IntegerExtractor.getInstance();

  @override
  bool IsConnectorToken(String text) {
    return text == "and";
  }

  @override
  List<RegExp> PureNumberRegex() => [PureNumFromTo(), PureNumBetweenAnd()];

  @override
  List<RegExp> SimpleCasesRegex() =>
      [PureNumFromTo(), PureNumBetweenAnd(), SpecificTimeFromTo(), SpecificTimeBetweenAnd()];

  @override
  IDateTimeExtractor SingleTimeExtractor() => BaseTimeExtractor(EnglishTimeExtractorConfiguration(config));

  @override
  RegExp TillRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TillRegex);

  @override
  RegExp TimeOfDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeOfDayRegex);

  @override
  IDateTimeExtractor TimeZoneExtractor() => BaseTimeZoneExtractor(EnglishTimeZoneExtractorConfiguration());

  @override
  String TokenBeforeDate() => EnglishDateTime.TokenBeforeDate;

  RegExp PureNumFromTo() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumFromTo);

  RegExp PureNumBetweenAnd() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PureNumBetweenAnd);

  RegExp SpecificTimeFromTo() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificTimeFromTo);

  RegExp SpecificTimeBetweenAnd() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificTimeBetweenAnd);
}
