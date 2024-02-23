import 'package:nlp/src/date_time/base_datetime_options_configuration.dart';
import 'package:nlp/src/date_time/base_time_parser.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_date_time_utility_configuration.dart';
import 'package:nlp/src/date_time/english/english_time_extractor_configuration.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class EnglishTimeParserConfiguration extends BaseDateTimeOptionsConfiguration implements ITimeParserConfiguration {
  EnglishTimeParserConfiguration(this.config, {required super.options});

  final ICommonDateTimeParserConfiguration config;

  @override
  (int hour, int min, bool hasMin) AdjustByPrefix(String prefix, int hour, int min, bool hasMin) {
    int deltaMin;

    var trimedPrefix = prefix.trim();

    if (HalfTokenRegex().hasMatch(trimedPrefix)) {
      deltaMin = 30;
    } else if (QuarterTokenRegex().hasMatch(trimedPrefix)) {
      deltaMin = 15;
    } else if (ThreeQuarterTokenRegex().hasMatch(trimedPrefix)) {
      deltaMin = 45;
    } else {
      var match =
          RegExpComposer.getMatchesSimple(EnglishTimeExtractorConfiguration.LessThanOneHour(), trimedPrefix).first;
      var minStr = match.getGroup("deltamin").value;
      if (minStr.isNotEmpty) {
        deltaMin = int.parse(minStr);
      } else {
        minStr = match.getGroup("deltaminnum").value;
        deltaMin = Numbers()[minStr]!;
      }
    }

    if (ToTokenRegex().hasMatch(trimedPrefix)) {
      deltaMin = -deltaMin;
    }

    int adjustedMin = min;
    int adjustedHour = hour;

    adjustedMin += deltaMin;
    if (adjustedMin < 0) {
      adjustedMin += 60;
      adjustedHour -= 1;
    }

    return (adjustedHour, adjustedMin, true);
  }

  @override
  (int hour, int min, bool hasMin, bool hasAm, bool hasPm) AdjustBySuffix(
      String suffix, int hour, int min, bool hasMin, bool hasAm, bool hasPm) {
    var deltaHour = 0;
    var match = RegExpComposer.matchExact(TimeSuffixFull(), suffix, true);

    bool adjustedHasAm = hasAm;
    bool adjustedHasPm = hasPm;
    bool adjustedHasMin = hasMin;

    int adjustedHour = hour;
    int adjustedMin = min;

    if (match != null) {
      var oclockStr = match.getGroup("oclock").value;
      if (oclockStr.isEmpty) {
        var matchAmStr = match.getGroup(DateTimeConstants.AmGroupName).value;
        if (matchAmStr.isNotEmpty) {
          if (hour >= DateTimeConstants.HalfDayHourCount) {
            deltaHour = -DateTimeConstants.HalfDayHourCount;
          } else {
            adjustedHasAm = true;
          }
        }

        var matchPmStr = match.getGroup(DateTimeConstants.PmGroupName).value;
        if (matchPmStr.isNotEmpty) {
          if (hour < DateTimeConstants.HalfDayHourCount) {
            deltaHour = DateTimeConstants.HalfDayHourCount;
          }

          if (LunchRegex().hasMatch(matchPmStr)) {
            if (hour >= 10 && hour <= DateTimeConstants.HalfDayHourCount) {
              deltaHour = 0;
              if (hour == DateTimeConstants.HalfDayHourCount) {
                adjustedHasPm = true;
              } else {
                adjustedHasAm = true;
              }
            } else {
              adjustedHasPm = true;
            }
          } else if (NightRegex().hasMatch(matchPmStr)) {
            if (hour <= 3 || hour == DateTimeConstants.HalfDayHourCount) {
              if (hour == DateTimeConstants.HalfDayHourCount) {
                adjustedHour = 0;
              }

              deltaHour = 0;
              adjustedHasAm = true;
            } else {
              adjustedHasPm = true;
            }
          } else {
            adjustedHasPm = true;
          }
        }
      }
    }

    adjustedHour = (adjustedHour + deltaHour) % 24;

    return (adjustedHour, adjustedMin, adjustedHasMin, adjustedHasAm, adjustedHasPm);
  }

  @override
  RegExp AtRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AtRegex);

  @override
  Map<String, int> Numbers() => config.numbers;

  @override
  List<RegExp> TimeRegexes() => EnglishTimeExtractorConfiguration(config).TimeRegexList();

  @override
  String TimeTokenPrefix() => EnglishDateTime.TimeTokenPrefix;

  @override
  IDateTimeParser TimeZoneParser() {
    // TODO: implement TimeZoneParser
    throw UnimplementedError();
  }

  @override
  IDateTimeUtilityConfiguration UtilityConfiguration() => EnglishDatetimeUtilityConfiguration();

  RegExp HalfTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.HalfTokenRegex);

  RegExp QuarterTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.QuarterTokenRegex);

  RegExp ThreeQuarterTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ThreeQuarterTokenRegex);

  RegExp ToTokenRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.ToTokenRegex);

  RegExp TimeSuffixFull() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.TimeSuffixFull);

  RegExp LunchRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.LunchRegex);

  RegExp NightRegex() => RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.NightRegex);
}
