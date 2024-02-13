import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/holiday_extractor_configuration.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishHolidayExtractorConfiguration extends BaseDateTimeOptionsConfiguration
    implements IHolidayExtractorConfiguration {
  static RegExp H = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.HolidayRegex);

  EnglishHolidayExtractorConfiguration([DateTimeOptions options = DateTimeOptions.None])
      : _holidayRegexes = [H],
        super(options: options);

  final List<RegExp> _holidayRegexes;
  @override
  List<RegExp> holidayRegexes() => _holidayRegexes;
}
