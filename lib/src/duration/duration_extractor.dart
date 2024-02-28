// ignore_for_file: non_constant_identifier_names

import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class DurationExtractor implements IDateTimeExtractor {
  DurationExtractor({
    required this.config,
    this.merge = true,
  });

  final EnglishDurationExtractorConfiguration config;
  final bool merge;

  String get extractorName => "duration";

  @override
  String getExtractorName() => extractorName;

  @override
  List<ExtractResult> extract(String query) => extractDateTime(query, DateTime.now());

  @override
  List<ExtractResult> extractDateTime(String query, DateTime referenceTime) {
    print("DurationExtractor - extract() - '$query'");
    final tokens = <Token>[];

    final numberWithUnitTokens = numberWithUnit(query);

    tokens.addAll(numberWithUnitTokens);
    tokens.addAll(numberWithUnitAndSuffix(query, numberWithUnitTokens));
    tokens.addAll(implicitDuration(query));

    List<ExtractResult> result = Token.mergeAllTokens(tokens, query, extractorName);

    // First MergeMultipleDuration then ResolveMoreThanOrLessThanPrefix so cases like
    // "more than 4 days and less than 1 week" will not be merged into one "multipleDuration"
    if (merge) {
      result = mergeMultipleDuration(query, result);
    }

    result = tagInequalityPrefix(query, result);

    print("DurationExtractor found ${result.length} results");

    return result;
  }

  List<Token> numberWithUnit(String text) {
    print("Running numberWithUnit() on text '$text'");
    final result = <Token>[];
    List<ExtractResult> ers = extractNumbersBeforeUnit(text);
    print("extractNumbersBeforeUnit() returned ${ers.length} results");
    for (ExtractResult er in ers) {
      print("Processing an ExtractResult: '${er.text}'");
      String afterStr = text.substring(er.start + er.length);
      final match = config.getFollowedUnit().matchBegin(afterStr, true);
      if (match != null && match.start == 0) {
        result.add(
          Token(er.start, er.start + er.length + match.length),
        );
      }
    }

    // handle "3hrs"
    result.addAll(Token.getTokenFromRegex(config.getNumberCombinedWithUnit(), text));

    // handle "an hour"
    result.addAll(Token.getTokenFromRegex(config.getAnUnitRegex(), text));

    // handle "few" related cases
    result.addAll(Token.getTokenFromRegex(config.getInexactNumberUnitRegex(), text));

    print("numberWithUnit() - returning ${result.length} results");

    return result;
  }

  List<ExtractResult> extractNumbersBeforeUnit(String text) {
    List<ExtractResult> ers = config.cardinalExtractor.extract(text);
    print("Cardinal extractor extracted ${ers.length} candidates");
    print("ers hashcode: ${ers.hashCode}");

    // In special cases some languages will treat "both" as a number to be combined with duration units.
    final specialNumberUnitRegex = config.getSpecialNumberUnitRegex();
    if (specialNumberUnitRegex == null) {
      return ers;
    }
    List<Token> specialNumberTokens = Token.getTokenFromRegex(specialNumberUnitRegex, text);

    for (final token in specialNumberTokens) {
      ExtractResult er = ExtractResult(
        start: token.start,
        length: token.length,
        text: text.substring(token.start, token.end),
      );

      print("Adding $er to $ers");
      ers.add(er);
    }

    print("extractNumbersBeforeUnit() is returning ${ers.length} results");
    print("ers hashcode: ${ers.hashCode}");

    return ers;
  }

  // handle cases look like: {number} {unit}? and {an|a} {half|quarter} {unit}?
  // define the part "and {an|a} {half|quarter}" as Suffix
  List<Token> numberWithUnitAndSuffix(String text, List<Token> tokens) {
    final result = <Token>[];

    for (Token token in tokens) {
      String afterStr = text.substring(token.start + token.length);
      final match = config.getSuffixAndRegex().matchBegin(afterStr, true);
      if (match != null && match.start == 0) {
        result.add(
          Token(token.start, token.start + token.length + match.length),
        );
      }
    }

    return result;
  }

  List<Token> implicitDuration(String text) {
    final result = <Token>[];

    // handle "all day", "all year"
    result.addAll(Token.getTokenFromRegex(config.getAllRegex(), text));

    // handle "half day", "half year"
    result.addAll(Token.getTokenFromRegex(config.getHalfRegex(), text));

    // handle "next day", "last year"
    result.addAll(Token.getTokenFromRegex(config.getRelativeDurationUnitRegex(), text));

    // handle "during/for the day/week/month/year"
    if (config.options.match(DateTimeOptions.CalendarMode)) {
      result.addAll(Token.getTokenFromRegex(config.getDuringRegex(), text));
    }

    return result;
  }

  List<ExtractResult> mergeMultipleDuration(String input, List<ExtractResult> extractResults) {
    if (extractResults.length <= 1) {
      return extractResults;
    }

    final unitMap = config.unitMap;
    final unitValueMap = config.unitValueMap;
    RegExp unitRegex = config.getDurationUnitRegex();

    final result = <ExtractResult>[];

    int firstExtractionIndex = 0;
    int timeUnit = 0;
    int totalUnit = 0;

    while (firstExtractionIndex < extractResults.length) {
      String? currentUnit;

      NlpMatch? unitMatch =
          RegExpComposer.getMatchesSimple(unitRegex, extractResults[firstExtractionIndex].text).firstOrNull;
      // Replaced below line with composed regex to de-dup names.
      // RegExpMatch? unitMatch = unitRegex.allMatches(extractResults[firstExtractionIndex].text).firstOrNull;

      // if (unitMatch != null && unitMap.containsKey(unitMatch.namedGroup("unit"))) {
      if (unitMatch != null && unitMap.containsKey(unitMatch.getGroup("unit").value)) {
        // currentUnit = unitMatch.namedGroup("unit");
        currentUnit = unitMatch.getGroup("unit").value;
        totalUnit++;
        if (DurationParsingUtil.isTimeDurationUnit(unitMap[currentUnit]!)) {
          timeUnit++;
        }
      }

      if (currentUnit == null || currentUnit.isEmpty) {
        firstExtractionIndex++;
        continue;
      }

      int secondExtractionIndex = firstExtractionIndex + 1;
      while (secondExtractionIndex < extractResults.length) {
        bool valid = false;
        int midStrBegin =
            extractResults[secondExtractionIndex - 1].start + extractResults[secondExtractionIndex - 1].length;
        int midStrEnd = extractResults[secondExtractionIndex].start;
        String midStr = input.substring(midStrBegin, midStrEnd);

        final match = config.getDurationConnectorRegex().allMatches(midStr).firstOrNull;
        if (match != null) {
          NlpMatch? unitMatch =
              RegExpComposer.getMatchesSimple(unitRegex, extractResults[secondExtractionIndex].text).firstOrNull;
          // Replaced below line with composed regex to de-dup names.
          // unitMatch = unitRegex.allMatches(extractResults[secondExtractionIndex].text).firstOrNull;

          // if (unitMatch != null && unitMap.containsKey(unitMatch.namedGroup("unit"))) {
          if (unitMatch != null && unitMap.containsKey(unitMatch.getGroup("unit").value)) {
            // final nextUnitStr = unitMatch.namedGroup("unit");
            final nextUnitStr = unitMatch.getGroup("unit").value;

            if (unitValueMap[nextUnitStr] != unitValueMap[currentUnit]) {
              valid = true;

              if (unitValueMap[nextUnitStr]! < unitValueMap[currentUnit]!) {
                currentUnit = nextUnitStr;
              }
            }

            totalUnit++;

            if (DurationParsingUtil.isTimeDurationUnit(unitMap[nextUnitStr]!)) {
              timeUnit++;
            }
          }
        }

        if (!valid) {
          break;
        }

        secondExtractionIndex++;
      }

      if (secondExtractionIndex - 1 > firstExtractionIndex) {
        int start = extractResults[firstExtractionIndex].start;
        int length =
            extractResults[secondExtractionIndex - 1].start + extractResults[secondExtractionIndex - 1].length - start;
        String text = input.substring(start, start + length);
        String? rType = extractResults[firstExtractionIndex].type;
        ExtractResult node = ExtractResult(start: start, length: length, text: text, type: rType);

        // add multiple duration type to extract result
        String type = DateTimeConstants.MultipleDuration_DateTime; // Default type

        if (timeUnit == totalUnit) {
          type = DateTimeConstants.MultipleDuration_Time;
        } else if (timeUnit == 0) {
          type = DateTimeConstants.MultipleDuration_Date;
        }

        node.data = type;
        result.add(node);

        timeUnit = 0;
        totalUnit = 0;
      } else {
        result.add(extractResults[firstExtractionIndex]);
      }

      firstExtractionIndex = secondExtractionIndex;
    }

    return result;
  }

  List<ExtractResult> tagInequalityPrefix(String input, List<ExtractResult> result) {
    print("tagInequalityPrefix() - input: '$input'");
    List<ExtractResult> resultStream = result.map((ExtractResult er) {
      print("Looking at a single result for inequality prefix: '${er.text}'");
      String beforeString = input.substring(0, er.start);
      print(" - before string: '$beforeString'");
      print(" - matching against: '${config.getMoreThanRegex().pattern}'");
      bool isInequalityPrefixMatched = false;

      var match = config.getMoreThanRegex().matchEnd(beforeString, true);
      print(" - match: $match");

      // The second condition is necessary so for "1 week" in "more than 4 days and less than 1 week",
      // it will not be tagged incorrectly as "more than"
      if (match != null) {
        print(" - matched MORE THAN");
        er.data = DateTimeConstants.MORE_THAN_MOD;
        isInequalityPrefixMatched = true;
      }

      if (!isInequalityPrefixMatched) {
        print(" - didn't match MORE, now trying LESS");
        match = config.getLessThanRegex().matchEnd(beforeString, true);

        if (match != null) {
          er.data = DateTimeConstants.LESS_THAN_MOD;
          isInequalityPrefixMatched = true;
        }
      }

      if (isInequalityPrefixMatched) {
        int length = er.length + er.start - match!.start;
        int start = match.start;
        String text = input.substring(start, start + length);
        er.start = start;
        er.length = length;
        er.text = text;
      }

      return er;
    }).toList();

    return resultStream;
  }
}

// class BaseDurationExtractor implements IDateTimeExtractor {
//   BaseDurationExtractor(this._config, [this._merge = true]);
//
//   final IDurationExtractorConfiguration _config;
//   final bool _merge;
//
//   @override
//   String getExtractorName() {
//     return DateTimeConstants.SYS_DATETIME_DURATION;
//   }
//
//   @override
//   List<ExtractResult> extract(String input, DateTime reference) {
//     final tokens = <Token>[];
//
//     final numberWithUnitTokens = numberWithUnit(input);
//     print("BaseDurationExtractor - numberWithUnitTokens: " + numberWithUnitTokens.size());
//
//     tokens.addAll(numberWithUnitTokens);
//     tokens.addAll(numberWithUnitAndSuffix(input, numberWithUnitTokens));
//     print("BaseDurationExtractor - numberWithUnitAndSuffix(): " + numberWithUnitAndSuffix(input, numberWithUnitTokens).size());
//     tokens.addAll(implicitDuration(input));
//     print("BaseDurationExtractor - implicitDuration(): " + implicitDuration(input).size());
//
//     var result = Token.mergeAllTokens(tokens, input, getExtractorName());
//
//     // First MergeMultipleDuration then ResolveMoreThanOrLessThanPrefix so cases like "more than 4 days and less than 1 week" will not be merged into one "multipleDuration"
//     if (_merge) {
//       result = mergeMultipleDuration(input, result);
//     }
//
//     result = _tagInequalityPrefix(input, result);
//
//     print("BaseDurationExtractor - found " + result.size() + " results");
//
//     return result;
//   }
//
//   List<ExtractResult> _tagInequalityPrefix(String input, List<ExtractResult> result) {
//     Stream<ExtractResult> resultStream = result.stream().map((er) {
//     String beforeString = input.substring(0, er.getStart());
//     bool isInequalityPrefixMatched = false;
//
//     final match = _config.getMoreThanRegex().matchEnd(beforeString, true);
//
//     // The second condition is necessary so for "1 week" in "more than 4 days and less than 1 week", it will not be tagged incorrectly as "more than"
//     if (match != null) {
//       er.data = DateTimeConstants.MORE_THAN_MOD;
//       isInequalityPrefixMatched = true;
//     }
//
//     if (!isInequalityPrefixMatched) {
//     match = RegexExtension.matchEnd(this.config.getLessThanRegex(), beforeString, true);
//
//     if (match.getSuccess()) {
//     er.setData(Constants.LESS_THAN_MOD);
//     isInequalityPrefixMatched = true;
//     }
//     }
//
//     if (isInequalityPrefixMatched) {
//     int length = er.getLength() + er.getStart() - match.getMatch().get().index;
//     int start = match.getMatch().get().index;
//     String text = input.substring(start, start + length);
//     er.setStart(start);
//     er.setLength(length);
//     er.setText(text);
//     }
//
//     return er;
//     });
//     return resultStream.collect(Collectors.toList());
//   }
//
//   private List<ExtractResult> mergeMultipleDuration(String input, List<ExtractResult> extractResults) {
//     if (extractResults.size() <= 1) {
//       return extractResults;
//     }
//
//     ImmutableMap<String, String> unitMap = _config.getUnitMap();
//     ImmutableMap<String, Long> unitValueMap = _config.getUnitValueMap();
//     Pattern unitRegex = _config.getDurationUnitRegex();
//
//     List<ExtractResult> result = new ArrayList<>();
//
//     int firstExtractionIndex = 0;
//     int timeUnit = 0;
//     int totalUnit = 0;
//
//     while (firstExtractionIndex < extractResults.size()) {
//       String currentUnit = null;
//       Optional<Match> unitMatch = Arrays.stream(RegExpUtility.getMatches(unitRegex, extractResults.get(firstExtractionIndex).getText())).findFirst();
//
//       if (unitMatch.isPresent() && unitMap.containsKey(unitMatch.get().getGroup("unit").value)) {
//         currentUnit = unitMatch.get().getGroup("unit").value;
//         totalUnit++;
//         if (DurationParsingUtil.isTimeDurationUnit(unitMap.get(currentUnit))) {
//           timeUnit++;
//         }
//       }
//
//       if (StringUtility.isNullOrEmpty(currentUnit)) {
//         firstExtractionIndex++;
//         continue;
//       }
//
//       int secondExtractionIndex = firstExtractionIndex + 1;
//       while (secondExtractionIndex < extractResults.size()) {
//         bool valid = false;
//         int midStrBegin = extractResults.get(secondExtractionIndex - 1).getStart() + extractResults.get(secondExtractionIndex - 1).getLength();
//         int midStrEnd = extractResults.get(secondExtractionIndex).getStart();
//         String midStr = input.substring(midStrBegin, midStrEnd);
//         Optional<Match> match = Arrays.stream(RegExpUtility.getMatches(this._config.getDurationConnectorRegex(), midStr)).findFirst();
//
//         if (match.isPresent()) {
//           unitMatch = Arrays.stream(RegExpUtility.getMatches(unitRegex, extractResults.get(secondExtractionIndex).getText())).findFirst();
//
//           if (unitMatch.isPresent() && unitMap.containsKey(unitMatch.get().getGroup("unit").value)) {
//             String nextUnitStr = unitMatch.get().getGroup("unit").value;
//
//             if (unitValueMap.get(nextUnitStr) != unitValueMap.get(currentUnit)) {
//               valid = true;
//
//               if (unitValueMap.get(nextUnitStr) < unitValueMap.get(currentUnit)) {
//                 currentUnit = nextUnitStr;
//               }
//             }
//
//             totalUnit++;
//
//             if (DurationParsingUtil.isTimeDurationUnit(unitMap.get(nextUnitStr))) {
//               timeUnit++;
//             }
//           }
//         }
//
//         if (!valid) {
//           break;
//         }
//
//         secondExtractionIndex++;
//       }
//
//       if (secondExtractionIndex - 1 > firstExtractionIndex) {
//         int start = extractResults.get(firstExtractionIndex).getStart();
//         int length = extractResults.get(secondExtractionIndex - 1).getStart() + extractResults.get(secondExtractionIndex - 1).getLength() - start;
//         String text = input.substring(start, start + length);
//         String rType = extractResults.get(firstExtractionIndex).getType();
//         ExtractResult node = new ExtractResult(start, length, text, rType, null);
//
//         // add multiple duration type to extract result
//         String type = Constants.MultipleDuration_DateTime; // Default type
//
//         if (timeUnit == totalUnit) {
//           type = Constants.MultipleDuration_Time;
//         } else if (timeUnit == 0) {
//           type = Constants.MultipleDuration_Date;
//         }
//
//         node.setData(type);
//         result.add(node);
//
//         timeUnit = 0;
//         totalUnit = 0;
//
//       } else {
//         result.add(extractResults.get(firstExtractionIndex));
//       }
//
//       firstExtractionIndex = secondExtractionIndex;
//     }
//
//     return result;
//   }
//
//   // handle cases that don't contain nubmer
//   private Collection<Token> implicitDuration(String text) {
//     Collection<Token> result = new ArrayList<>();
//
//     // handle "all day", "all year"
//     result.addAll(Token.getTokenFromRegex(_config.getAllRegex(), text));
//
//     // handle "half day", "half year"
//     result.addAll(Token.getTokenFromRegex(_config.getHalfRegex(), text));
//
//     // handle "next day", "last year"
//     result.addAll(Token.getTokenFromRegex(_config.getRelativeDurationUnitRegex(), text));
//
//     // handle "during/for the day/week/month/year"
//     if (_config.getOptions().match(DateTimeOptions.CalendarMode)) {
//       result.addAll(Token.getTokenFromRegex(_config.getDuringRegex(), text));
//     }
//
//     return result;
//   }
//
//   // simple cases made by a number followed an unit
//   private List<Token> numberWithUnit(String text) {
//     System.out.println("Running numberWithUnit() on text: '" + text + "'");
//     List<Token> result = new ArrayList<>();
//     List<ExtractResult> ers = extractNumbersBeforeUnit(text);
//     for (ExtractResult er : ers) {
//       System.out.println("Processing an ExtractResult: '" + er.getText() + "'");
//       String afterStr = text.substring(er.getStart() + er.getLength());
//       ConditionalMatch match = RegexExtension.matchBegin(this._config.getFollowedUnit(), afterStr, true);
//       if (match.getSuccess() && match.getMatch().get().index == 0) {
//         System.out.println("Found numberWithUnit match: '" + match.getMatch().get().value + "'");
//         result.add(new Token(er.getStart(), er.getStart() + er.getLength() + match.getMatch().get().length));
//       }
//     }
//
//     // handle "3hrs"
//     System.out.println("Number combined with unit regex:");
//     System.out.println(this._config.getNumberCombinedWithUnit().pattern());
//     result.addAll(Token.getTokenFromRegex(this._config.getNumberCombinedWithUnit(), text));
//
//     // handle "an hour"
//     result.addAll(Token.getTokenFromRegex(this._config.getAnUnitRegex(), text));
//
//     // handle "few" related cases
//     result.addAll(Token.getTokenFromRegex(this._config.getInexactNumberUnitRegex(), text));
//
//     return result;
//   }
//
//   private List<ExtractResult> extractNumbersBeforeUnit(String text) {
//     List<ExtractResult> ers = this._config.getCardinalExtractor().extract(text);
//     System.out.println("Cardinal extractor extracted " + ers.size() + " candidates");
//
//     // In special cases some languages will treat "both" as a number to be combined with duration units.
//     Collection<Token> specialNumberTokens = Token.getTokenFromRegex(_config.getSpecialNumberUnitRegex(), text);
//
//     for (Token token: specialNumberTokens) {
//       ExtractResult er = new ExtractResult();
//       er.setStart(token.getStart());
//       er.setLength(token.getLength());
//       er.setText(text.substring(token.getStart(), token.getEnd()));
//
//       ers.add(er);
//     }
//
//     return ers;
//   }
//
//   // handle cases look like: {number} {unit}? and {an|a} {half|quarter} {unit}?
//   // define the part "and {an|a} {half|quarter}" as Suffix
//   private Collection<Token> numberWithUnitAndSuffix(String text, Collection<Token> tokens) {
//     Collection<Token> result = new ArrayList<>();
//
//     for (Token token : tokens) {
//       String afterStr = text.substring(token.getStart() + token.getLength());
//       ConditionalMatch match = RegexExtension.matchBegin(this._config.getSuffixAndRegex(), afterStr, true);
//       if (match.getSuccess() && match.getMatch().get().index == 0) {
//         result.add(new Token(token.getStart(), token.getStart() + token.getLength() + match.getMatch().get().length));
//       }
//     }
//
//     return result;
//   }
// }

class EnglishDurationExtractorConfiguration extends BaseOptionsConfiguration
    implements IDurationExtractorConfiguration {
  static final DurationUnitRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.DurationUnitRegex);
  static final SuffixAndRegex = RegExp(EnglishDateTime.SuffixAndRegex);
  static final DurationFollowedUnit = RegExp(RegExpComposer.sanitizeGroups(EnglishDateTime.DurationFollowedUnit));
  static final NumberCombinedWithDurationUnit =
      RegExp(RegExpComposer.sanitizeGroups(EnglishDateTime.NumberCombinedWithDurationUnit));
  static final AnUnitRegex = RegExp(RegExpComposer.sanitizeGroups(EnglishDateTime.AnUnitRegex));
  static final DuringRegex = RegExp(EnglishDateTime.DuringRegex);
  static final AllRegex = RegExpComposer.sanitizeGroupsAndCompile(EnglishDateTime.AllRegex);
  static final HalfRegex = RegExp(EnglishDateTime.HalfRegex);
  static final ConjunctionRegex = RegExp(EnglishDateTime.ConjunctionRegex);
  static final InexactNumberRegex = RegExp(EnglishDateTime.InexactNumberRegex);
  static final InexactNumberUnitRegex = RegExp(RegExpComposer.sanitizeGroups(EnglishDateTime.InexactNumberUnitRegex));
  static final RelativeDurationUnitRegex =
      RegExp(RegExpComposer.sanitizeGroups(EnglishDateTime.RelativeDurationUnitRegex));
  static final DurationConnectorRegex = RegExp(EnglishDateTime.DurationConnectorRegex);
  static final MoreThanRegex = RegExp(EnglishDateTime.MoreThanRegex);
  static final LessThanRegex = RegExp(EnglishDateTime.LessThanRegex);

  EnglishDurationExtractorConfiguration([super.options = DateTimeOptions.None])
      : cardinalExtractor = CardinalExtractor.getInstance(),
        unitMap = EnglishDateTime.UnitMap,
        unitValueMap = EnglishDateTime.UnitValueMap;

  @override
  final IExtractor cardinalExtractor;
  @override
  final Map<String, String> unitMap; // Should be unmodifiable map
  @override
  final Map<String, int> unitValueMap; // Should be unmodifiable map

  @override
  RegExp getFollowedUnit() {
    return DurationFollowedUnit;
  }

  @override
  RegExp getNumberCombinedWithUnit() {
    return NumberCombinedWithDurationUnit;
  }

  @override
  RegExp getAnUnitRegex() {
    return AnUnitRegex;
  }

  @override
  RegExp getDuringRegex() {
    return DuringRegex;
  }

  @override
  RegExp getAllRegex() {
    return AllRegex;
  }

  @override
  RegExp getHalfRegex() {
    return HalfRegex;
  }

  @override
  RegExp getSuffixAndRegex() {
    return SuffixAndRegex;
  }

  @override
  RegExp getConjunctionRegex() {
    return ConjunctionRegex;
  }

  @override
  RegExp getInexactNumberRegex() {
    return InexactNumberRegex;
  }

  @override
  RegExp getInexactNumberUnitRegex() {
    return InexactNumberUnitRegex;
  }

  @override
  RegExp getRelativeDurationUnitRegex() {
    return RelativeDurationUnitRegex;
  }

  @override
  RegExp getDurationUnitRegex() {
    return DurationUnitRegex;
  }

  @override
  RegExp getDurationConnectorRegex() {
    return DurationConnectorRegex;
  }

  @override
  RegExp getLessThanRegex() {
    return LessThanRegex;
  }

  @override
  RegExp getMoreThanRegex() {
    return MoreThanRegex;
  }

  @override
  RegExp? getSpecialNumberUnitRegex() {
    return null;
  }
}

class BaseOptionsConfiguration implements IOptionsConfiguration {
  BaseOptionsConfiguration([
    this.options = DateTimeOptions.None,
    this.dmyDateFormat = false,
  ]);

  @override
  final DateTimeOptions options;
  @override
  final bool dmyDateFormat;
}
