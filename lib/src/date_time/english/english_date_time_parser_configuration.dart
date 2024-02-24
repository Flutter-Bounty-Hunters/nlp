import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/base_datetime_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_holiday_extractor_configuration.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishDateTimeParserConfiguration extends BaseDateTimeOptionsConfiguration
    implements IDateTimeParserConfiguration {
  EnglishDateTimeParserConfiguration(this.config, {super.options = DateTimeOptions.None});

  final ICommonDateTimeParserConfiguration config;

  @override
  RegExp AMTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AMTimeRegex);

  @override
  IExtractor CardinalExtractor() => config.cardinalExtractor;

  @override
  bool ContainsAmbiguousToken(String text, String matchedText) => false;

  @override
  IDateExtractor DateExtractor() => config.dateExtractor;

  @override
  RegExp DateNumberConnectorRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DateNumberConnectorRegex);

  @override
  IDateTimeParser DateParser() => config.dateParser;

  @override
  IDateTimeExtractor DurationExtractor() => config.durationExtractor;

  @override
  IDateTimeParser DurationParser() => config.durationParser;

  @override
  int GetHour(String text, int hour) {
    int result = hour;

    var trimmedText = text.trim();

    if (AMTimeRegex().matchEnd(trimmedText, true) != null && hour >= DateTimeConstants.HalfDayHourCount) {
      result -= DateTimeConstants.HalfDayHourCount;
    } else if (AMTimeRegex().matchEnd(trimmedText, true) == null &&
        hour < DateTimeConstants.HalfDayHourCount &&
        !(NightTimeRegex().matchEnd(trimmedText, true) != null && hour < DateTimeConstants.QuarterDayHourCount)) {
      result += DateTimeConstants.HalfDayHourCount;
    }

    return result;
  }

  @override
  String? GetMatchedNowTimex(String text) {
    var trimmedText = text.trim();

    if (NowTimeRegex().matchEnd(trimmedText, true) != null) {
      return "PRESENT_REF";
    } else if (RecentlyTimeRegex().matchExact(trimmedText, true) != null) {
      return "PAST_REF";
    } else if (AsapTimeRegex().matchExact(trimmedText, true) != null) {
      return "FUTURE_REF";
    } else {
      return null;
    }
  }

  @override
  int GetSwiftDay(String text) {
    var trimmedText = text.trim();

    var swift = 0;
    if (NextPrefixRegex().matchBegin(trimmedText, true) != null) {
      swift = 1;
    } else if (PreviousPrefixRegex().matchBegin(trimmedText, true) != null) {
      swift = -1;
    }

    return swift;
  }

  @override
  IDateTimeExtractor HolidayExtractor() => config.holidayExtractor;

  @override
  IDateTimeParser HolidayTimeParser() {
    // TODO: implement HolidayTimeParser
    throw UnimplementedError();
  }

  @override
  IExtractor integerExtractor() => IntegerExtractor.getInstance();

  @override
  RegExp NowRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NowRegex);

  @override
  IParser NumberParser() => config.numberParser;

  @override
  Map<String, int> Numbers() => config.numbers;

  @override
  RegExp PMTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PMTimeRegex);

  @override
  RegExp SimpleTimeOfTodayAfterRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SimpleTimeOfTodayAfterRegex);

  @override
  RegExp SimpleTimeOfTodayBeforeRegex() =>
      RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SimpleTimeOfTodayBeforeRegex);

  @override
  RegExp SpecificEndOfRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificEndOfRegex);

  @override
  RegExp SpecificTimeOfDayRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.SpecificTimeOfDayRegex);

  @override
  IDateTimeExtractor TimeExtractor() => config.timeExtractor;

  @override
  IDateTimeParser TimeParser() => config.timeParser;

  @override
  String TokenBeforeDate() => EnglishDateTime.TokenBeforeDate;

  @override
  String TokenBeforeTime() => EnglishDateTime.TokenBeforeTime;

  @override
  Map<String, String> UnitMap() => config.unitMap;

  @override
  RegExp UnitRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeUnitRegex);

  @override
  RegExp UnspecificEndOfRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.UnspecificEndOfRegex);

  @override
  IDateTimeUtilityConfiguration UtilityConfiguration() => EnglishDatetimeUtilityConfiguration();

  @override
  RegExp YearRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.YearRegex);

  RegExp NightTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NightTimeRegex);

  RegExp NowTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NowTimeRegex);

  RegExp RecentlyTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.RecentlyTimeRegex);

  RegExp AsapTimeRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AsapTimeRegex);

  RegExp NextPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NextPrefixRegex);

  RegExp PreviousPrefixRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.PreviousPrefixRegex);
}
