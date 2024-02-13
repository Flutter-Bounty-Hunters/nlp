import 'package:nlp/src/date_time/base_date_extractor.dart';

abstract interface class IHolidayExtractorConfiguration extends IDateTimeOptionsConfiguration {
  List<RegExp> holidayRegexes();
}
