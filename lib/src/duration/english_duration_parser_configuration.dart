import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/duration/duration_extractor.dart';

class EnglishDurationParserConfiguration extends BaseOptionsConfiguration implements IDurationParserConfiguration {
  EnglishDurationParserConfiguration(
    ICommonDateTimeParserConfiguration config, [
    super.options = DateTimeOptions.None,
    super.dmyDateFormat = false,
  ]) {
    cardinalExtractor = config.cardinalExtractor;
    numberParser = config.numberParser;
    durationExtractor = DurationExtractor(config: EnglishDurationExtractorConfiguration(), merge: false);
    numberCombinedWithUnit = EnglishDurationExtractorConfiguration.NumberCombinedWithDurationUnit;

    anUnitRegex = EnglishDurationExtractorConfiguration.AnUnitRegex;
    duringRegex = EnglishDurationExtractorConfiguration.DuringRegex;
    allDateUnitRegex = EnglishDurationExtractorConfiguration.AllRegex;
    halfDateUnitRegex = EnglishDurationExtractorConfiguration.HalfRegex;
    suffixAndRegex = EnglishDurationExtractorConfiguration.SuffixAndRegex;
    followedUnit = EnglishDurationExtractorConfiguration.DurationFollowedUnit;
    conjunctionRegex = EnglishDurationExtractorConfiguration.ConjunctionRegex;
    inexactNumberRegex = EnglishDurationExtractorConfiguration.InexactNumberRegex;
    inexactNumberUnitRegex = EnglishDurationExtractorConfiguration.InexactNumberUnitRegex;
    durationUnitRegex = EnglishDurationExtractorConfiguration.DurationUnitRegex;

    unitMap = config.unitMap;
    unitValueMap = config.unitValueMap;
    doubleNumbers = config.doubleNumbers;
  }

  late final IExtractor cardinalExtractor;
  late final IExtractor durationExtractor;
  late final IParser numberParser;

  late final RegExp numberCombinedWithUnit;
  late final RegExp anUnitRegex;
  late final RegExp duringRegex;
  late final RegExp allDateUnitRegex;
  late final RegExp halfDateUnitRegex;
  late final RegExp suffixAndRegex;
  late final RegExp followedUnit;
  late final RegExp conjunctionRegex;
  late final RegExp inexactNumberRegex;
  late final RegExp inexactNumberUnitRegex;
  late final RegExp durationUnitRegex;

  late final Map<String, String> unitMap;
  late final Map<String, int> unitValueMap;
  late final Map<String, double> doubleNumbers;

  @override
  IExtractor getCardinalExtractor() {
    return cardinalExtractor;
  }

  @override
  IExtractor getDurationExtractor() {
    return durationExtractor;
  }

  @override
  IParser? getNumberParser() {
    return numberParser;
  }

  @override
  RegExp getNumberCombinedWithUnit() {
    return numberCombinedWithUnit;
  }

  @override
  RegExp getAnUnitRegex() {
    return anUnitRegex;
  }

  @override
  RegExp getDuringRegex() {
    return duringRegex;
  }

  @override
  RegExp getAllDateUnitRegex() {
    return allDateUnitRegex;
  }

  @override
  RegExp getHalfDateUnitRegex() {
    return halfDateUnitRegex;
  }

  @override
  RegExp getSuffixAndRegex() {
    return suffixAndRegex;
  }

  @override
  RegExp getFollowedUnit() {
    return followedUnit;
  }

  @override
  RegExp getConjunctionRegex() {
    return conjunctionRegex;
  }

  @override
  RegExp getInexactNumberRegex() {
    return inexactNumberRegex;
  }

  @override
  RegExp getInexactNumberUnitRegex() {
    return inexactNumberUnitRegex;
  }

  @override
  RegExp getDurationUnitRegex() {
    return durationUnitRegex;
  }

  @override
  RegExp? getSpecialNumberUnitRegex() {
    return null;
  }

  @override
  Map<String, String> getUnitMap() {
    return unitMap;
  }

  @override
  Map<String, int> getUnitValueMap() {
    return unitValueMap;
  }

  @override
  Map<String, double> getDoubleNumbers() {
    return doubleNumbers;
  }
}
