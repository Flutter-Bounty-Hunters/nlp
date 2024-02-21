import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';

abstract interface class IDateParserConfiguration extends IDateTimeOptionsConfiguration {
  String dateTokenPrefix();

  IExtractor integerExtractor();

  IExtractor ordinalExtractor();

  IExtractor cardinalExtractor();

  IParser numberParser();

  IDateTimeExtractor durationExtractor();

  IDateExtractor dateExtractor();

  IDateTimeParser durationParser();

  IDateTimeParser holidayParser();

  List<RegExp> dateRegexes();

  RegExp onRegExp();

  RegExp specialDayRegExp();

  RegExp specialDayWithNumRegExp();

  RegExp nextRegExp();

  RegExp thisRegExp();

  RegExp lastRegExp();

  RegExp unitRegExp();

  RegExp upcomingPrefixRegExp();

  RegExp pastPrefixRegExp();

  RegExp weekDayRegExp();

  RegExp monthRegExp();

  RegExp weekDayOfMonthRegExp();

  RegExp forTheRegExp();

  RegExp weekDayAndDayOfMothRegExp();

  RegExp weekDayAndDayRegExp();

  RegExp relativeMonthRegExp();

  RegExp strictRelativeRegExp();

  RegExp yearSuffix();

  RegExp relativeWeekDayRegExp();

  RegExp relativeDayRegExp();

  RegExp nextPrefixRegExp();

  RegExp previousPrefixRegExp();

  RegExp beforeAfterRegExp();

  RegExp tasksModeDurationToDatePatterns();

  Map<String, String> unitMap();

  Map<String, int> dayOfMonth();

  Map<String, int> dayOfWeek();

  Map<String, int> monthOfYear();

  Map<String, int> cardinalMap();

  List<String> sameDayTerms();

  List<String> plusOneDayTerms();

  List<String> minusOneDayTerms();

  List<String> plusTwoDayTerms();

  List<String> minusTwoDayTerms();

  bool checkBothBeforeAfter();

  IDateTimeUtilityConfiguration utilityConfiguration();

  int getSwiftMonthOrYear(String text);

  bool isCardinalLast(String text);

  String normalize(String text);
}
