import 'package:nlp/src/date_time/base_datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/english_date_time.dart';

class EnglishDatetimeUtilityConfiguration extends BaseDatetimeUtilityConfiguration {
  EnglishDatetimeUtilityConfiguration()
      : super(
          EnglishDateTime.AgoRegex,
          EnglishDateTime.LaterRegex,
          EnglishDateTime.InConnectorRegex,
          EnglishDateTime.SinceYearSuffixRegex,
          EnglishDateTime.WithinNextPrefixRegex,
          EnglishDateTime.AmDescRegex,
          EnglishDateTime.PmDescRegex,
          EnglishDateTime.AmPmDescRegex,
          EnglishDateTime.RangeUnitRegex,
          EnglishDateTime.TimeUnitRegex,
          EnglishDateTime.DateUnitRegex,
          EnglishDateTime.CommonDatePrefixRegex,
          EnglishDateTime.RangePrefixRegex,
          EnglishDateTime.CheckBothBeforeAfter,
        );
}
