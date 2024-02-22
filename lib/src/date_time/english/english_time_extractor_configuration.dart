import 'package:nlp/src/core/definition_loader.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/base_time_extractor.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishTimeExtractorConfiguration extends BaseDateTimeOptionsConfiguration
    implements ITimeExtractorConfiguration {
  EnglishTimeExtractorConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  Map<RegExp, RegExp> AmbiguityFiltersDict() =>
      DefinitionLoader.LoadAmbiguityFilters(EnglishDateTime.AmbiguityDurationFiltersDict);

  @override
  RegExp AtRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AtRegex);

  @override
  RegExp IshRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.IshRegex);

  @override
  RegExp TimeBeforeAfterRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeBeforeAfterRegex);

  @override
  List<RegExp> TimeRegexList() => [
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex1),

        // (three min past)? 3:00(:00)? (pm)?
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex2),

        // (three min past)? 3.00 (pm)
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex3),

        // (three min past) (five thirty|seven|7|7:00(:00)?) (pm)? (in the night)
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex4),

        // (three min past) (five thirty|seven|7|7:00(:00)?) (pm)?
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex5),

        // (five thirty|seven|7|7:00(:00)?) (pm)? (in the night)
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex6),

        // (in the night) at? (five thirty|seven|7|7:00(:00)?) (pm)?
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex7),

        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex9),

        // (three min past)? 3h00 (pm)?
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex10),

        // at 2.30, "at" prefix is required here
        // 3.30pm, "am/pm" suffix is required here
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeRegex11),

        // 340pm
        RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ConnectNumRegex),
      ];

  @override
  RegExp TimeTokenPrefix() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeTokenPrefix);

  @override
  IDateTimeExtractor TimeZoneExtractor() {
    // TODO: implement TimeZoneExtractor
    throw UnimplementedError();
  }
}
