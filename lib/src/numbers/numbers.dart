// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:core';

import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/numbers/number_constants.dart';

class CardinalExtractor extends BaseNumberExtractor {
  static final _instances = <String, CardinalExtractor>{};

  static CardinalExtractor getInstance([String placeholder = EnglishNumeric.PlaceHolderDefault]) {
    if (!_instances.containsKey(placeholder)) {
      CardinalExtractor instance = CardinalExtractor._(placeholder);
      _instances[placeholder] = instance;
    }

    return _instances[placeholder]!;
  }

  CardinalExtractor._([String placeholder = EnglishNumeric.PlaceHolderDefault]) {
    regexes = Map.unmodifiable({
      ...IntegerExtractor.getInstance(placeholder).getRegexes(),
      ...DoubleExtractor.getInstance(placeholder).getRegexes(),
    });
  }

  late final Map<RegExp, String> regexes;

  @override
  Map<RegExp, String> getRegexes() {
    return regexes;
  }

  @override
  String getExtractType() {
    return Constants.SYS_NUM_CARDINAL;
  }

  @override
  NumberOptions getOptions() {
    return NumberOptions.None;
  }

  @override
  Pattern? getNegativeNumberTermsRegex() {
    return null;
  }
}

class IntegerExtractor extends BaseNumberExtractor {
  static final _instances = <String, IntegerExtractor>{};

  static IntegerExtractor getInstance([String placeholder = EnglishNumeric.PlaceHolderDefault]) {
    if (!_instances.containsKey(placeholder)) {
      IntegerExtractor instance = IntegerExtractor._(placeholder);
      _instances[placeholder] = instance;
    }

    return _instances[placeholder]!;
  }

  IntegerExtractor._([String placeholder = EnglishNumeric.PlaceHolderDefault]) {
    _regexes = {
      RegExp(EnglishNumeric.NumbersWithPlaceHolder(placeholder), unicode: true): "IntegerNum",
      RegExp(EnglishNumeric.NumbersWithSuffix): "IntegerNum",
      RegExp(EnglishNumeric.RoundNumberIntegerRegexWithLocks, unicode: true): "IntegerNum",
      RegExp(EnglishNumeric.NumbersWithDozenSuffix, unicode: true): "IntegerNum",
      RegExp(EnglishNumeric.AllIntRegexWithLocks, unicode: true): "IntegerEng",
      RegExp(EnglishNumeric.AllIntRegexWithDozenSuffixLocks, unicode: true): "IntegerEng",
      generateLongFormatNumberRegexes(LongFormatType.IntegerNumComma, placeholder): "IntegerNum",
      generateLongFormatNumberRegexes(LongFormatType.IntegerNumBlank, placeholder): "IntegerNum",
      generateLongFormatNumberRegexes(LongFormatType.IntegerNumNoBreakSpace, placeholder): "IntegerNum",
    };
  }

  @override
  Map<RegExp, String> getRegexes() => _regexes;
  late final Map<RegExp, String> _regexes;

  @override
  String getExtractType() => Constants.SYS_NUM_INTEGER;

  @override
  NumberOptions getOptions() => NumberOptions.None;

  @override
  Pattern? getNegativeNumberTermsRegex() => null;
}

class DoubleExtractor extends BaseNumberExtractor {
  static final _instances = <String, DoubleExtractor>{};

  static DoubleExtractor getInstance([String placeholder = EnglishNumeric.PlaceHolderDefault]) {
    if (!_instances.containsKey(placeholder)) {
      DoubleExtractor instance = DoubleExtractor._(placeholder);
      _instances[placeholder] = instance;
    }

    return _instances[placeholder]!;
  }

  DoubleExtractor._([String placeholder = EnglishNumeric.PlaceHolderDefault]) {
    _regexes = {
      RegExp(EnglishNumeric.DoubleDecimalPointRegex(placeholder), unicode: true): "DoubleNum",
      RegExp(EnglishNumeric.DoubleWithoutIntegralRegex(placeholder), unicode: true): "DoubleNum",
      RegExp(EnglishNumeric.DoubleWithMultiplierRegex): "DoubleNum",
      RegExp(EnglishNumeric.DoubleWithRoundNumber, unicode: true): "DoubleNum",
      RegExp(EnglishNumeric.DoubleAllFloatRegex, unicode: true): "DoubleEng",
      RegExp(EnglishNumeric.DoubleExponentialNotationRegex, unicode: true): "DoublePow",
      RegExp(EnglishNumeric.DoubleCaretExponentialNotationRegex, unicode: true): "DoublePow",
      generateLongFormatNumberRegexes(LongFormatType.DoubleNumCommaDot, placeholder): "DoubleNum",
      generateLongFormatNumberRegexes(LongFormatType.DoubleNumBlankDot, placeholder): "DoubleNum",
      generateLongFormatNumberRegexes(LongFormatType.DoubleNumNoBreakSpaceDot, placeholder): "DoubleNum",
    };
  }

  @override
  Map<RegExp, String> getRegexes() => _regexes;
  late final Map<RegExp, String> _regexes;

  @override
  String getExtractType() => Constants.SYS_NUM_DOUBLE;

  @override
  NumberOptions getOptions() => NumberOptions.None;

  @override
  Pattern? getNegativeNumberTermsRegex() => null;
}

class OrdinalExtractor extends BaseNumberExtractor {
  static final OrdinalExtractor _instance = OrdinalExtractor._();

  static OrdinalExtractor getInstance() {
    return _instance;
  }

  OrdinalExtractor._() {
    _regexes = <RegExp, String>{
      RegExp(EnglishNumeric.OrdinalSuffixRegex): "OrdinalNum",
      RegExp(EnglishNumeric.OrdinalNumericRegex): "OrdinalNum",
      RegExp(EnglishNumeric.OrdinalEnglishRegex): "OrdinalEng",
      RegExp(EnglishNumeric.OrdinalRoundNumberRegex): "OrdinalNum",
    };
  }

  @override
  String getExtractType() => Constants.SYS_NUM_ORDINAL;

  late final Map<RegExp, String> _regexes;

  @override
  Map<RegExp, String> getRegexes() => _regexes;
}

enum NumberOptions {
  None(0),
  PercentageMode(1),
  ExperimentalMode(4194304); // 2 ^22

  const NumberOptions(this.value);

  final int value;
}

abstract class BaseNumberExtractor implements IExtractor {
  Map<RegExp, String> getRegexes();

  Map<RegExp, RegExp>? getAmbiguityFiltersDict() => null;

  String getExtractType();

  NumberOptions getOptions() => NumberOptions.None;

  Pattern? getNegativeNumberTermsRegex() => null;

  @override
  List<ExtractResult> extract(String source) {
    print("BaseNumberExtractor - extract(): '$source'");
    if (source.isEmpty) {
      print("Didn't extract anything because the source text is empty.");
      return [];
    }

    var result = <ExtractResult>[];
    final matched = List<bool>.filled(source.length, false);
    final matchSource = <Match, String>{};

    getRegexes().forEach((regExp, dataType) {
      print(regExp.pattern);
      print("");
      final matches = regExp.allMatches(source);

      for (final match in matches) {
        int start = match.start;
        int length = match.end - match.start;
        for (int j = 0; j < length; j++) {
          matched[start + j] = true;
        }

        // Keep Source Data for extra information
        matchSource[match] = dataType;
      }
    });

    int last = -1;
    for (int i = 0; i < source.length; i++) {
      if (matched[i]) {
        if (i + 1 == source.length || !matched[i + 1]) {
          // This is the last character of a match.
          int start = last + 1;
          int length = i - last;
          String subStr = source.substring(start, start + length);

          int finalStart = start;
          int finalLength = length;

          final srcMatch =
              matchSource.keys.where((o) => o.start == finalStart && (o.end - o.start) == finalLength).firstOrNull;
          if (srcMatch != null) {
            // Extract negative numbers
            if (getNegativeNumberTermsRegex() != null) {
              final match = getNegativeNumberTermsRegex()!.allMatches(source.substring(0, start)).firstOrNull;
              if (match != null) {
                start = match.start;
                length = length + (match.end - match.start);
                subStr = match.group(0)! + subStr;
              }
            }

            ExtractResult er = ExtractResult(
              start: start,
              length: length,
              text: subStr,
              type: getExtractType(),
              data: matchSource[srcMatch],
            );

            // Add Metadata information for Ordinal
            if (getExtractType().contains(Constants.MODEL_ORDINAL)) {
              er.metadata = Metadata();
            }

            result.add(er);
          }
        }
      } else {
        last = i;
      }
    }

    result = _filterAmbiguity(result, source);
    print("Returning ${result.length} results from the base number extractor");
    print("");

    return result;
  }

  List<ExtractResult> _filterAmbiguity(List<ExtractResult> extractResults, String input) {
    final ambiguityFilters = getAmbiguityFiltersDict();
    if (ambiguityFilters != null) {
      for (final MapEntry<RegExp, RegExp> pair in ambiguityFilters.entries) {
        final RegExp key = pair.key;
        final RegExp value = pair.value;

        for (final extractResult in extractResults) {
          RegExpMatch? keyMatch = key.firstMatch(extractResult.text);
          if (keyMatch != null) {
            final matches = value.allMatches(input);
            extractResults = extractResults
                .where((ExtractResult extractResult) => !matches.any((match) =>
                    match.start < extractResult.start + extractResult.length && match.end > extractResult.start))
                .toList();
          }
        }
      }
    }

    return extractResults;
  }

  RegExp generateLongFormatNumberRegexes(LongFormatType type, [String placeholder = BaseNumbers.PlaceHolderDefault]) {
    String thousandsMark = RegExp.escape(type.thousandsMark);
    String decimalsMark = RegExp.escape(type.decimalsMark);

    String regexDefinition = type.decimalsMark == '\0'
        ? BaseNumbers.IntegerRegexDefinition(placeholder, thousandsMark)
        : BaseNumbers.DoubleRegexDefinition(placeholder, thousandsMark, decimalsMark);

    return RegExp(regexDefinition, unicode: true);
  }
}

class LongFormatType {
  // Reference Value : 1234567.89

  // 1,234,567
  static LongFormatType IntegerNumComma = LongFormatType(',', '\0');

  // 1.234.567
  static LongFormatType IntegerNumDot = LongFormatType('.', '\0');

  // 1 234 567
  static LongFormatType IntegerNumBlank = LongFormatType(' ', '\0');

  // 1 234 567
  static LongFormatType IntegerNumNoBreakSpace = LongFormatType(Constants.NO_BREAK_SPACE, '\0');

  // 1'234'567
  static LongFormatType IntegerNumQuote = LongFormatType('\'', '\0');

  // 1,234,567.89
  static LongFormatType DoubleNumCommaDot = LongFormatType(',', '.');

  // 1,234,567·89
  static LongFormatType DoubleNumCommaCdot = LongFormatType(',', '·');

  // 1 234 567,89
  static LongFormatType DoubleNumBlankComma = LongFormatType(' ', ',');

  // 1 234 567,89
  static LongFormatType DoubleNumNoBreakSpaceComma = LongFormatType(Constants.NO_BREAK_SPACE, ',');

  // 1 234 567.89
  static LongFormatType DoubleNumBlankDot = LongFormatType(' ', '.');

  // 1 234 567.89
  static LongFormatType DoubleNumNoBreakSpaceDot = LongFormatType(Constants.NO_BREAK_SPACE, '.');

  // 1.234.567,89
  static LongFormatType DoubleNumDotComma = LongFormatType('.', ',');

  // 1'234'567,89
  static LongFormatType DoubleNumQuoteComma = LongFormatType('\'', ',');

  const LongFormatType(this.thousandsMark, this.decimalsMark)
      : assert(thousandsMark.length == 1),
        assert(decimalsMark.length == 1);

  final String decimalsMark;
  final String thousandsMark;
}

class EnglishNumeric {
  static final String LangMarker = "Eng";

  static final bool CompoundNumberLanguage = false;

  static final bool MultiDecimalSeparatorCulture = true;

  static final NonStandardSeparatorVariants = <String>["en-za", "en-na", "en-zw"];

  static final String RoundNumberIntegerRegex =
      r"(?:hundred|thousand|million|mln|billion|bln|trillion|tln|lakh|crore)s?";

  static final String ZeroToNineIntegerRegex = r"(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six)";

  static final String TwoToNineIntegerRegex = r"(?:three|seven|eight|four|five|nine|two|six)";

  static final String NegativeNumberTermsRegex = r"(?<negTerm>(minus|negative)\s+)";

  static final String NegativeNumberSignRegex =
      r"^{NegativeNumberTermsRegex}.*".replaceAll("{NegativeNumberTermsRegex}", NegativeNumberTermsRegex);

  static final String AnIntRegex = r"(an?)(?=\s)";

  static final String TenToNineteenIntegerRegex =
      r"(?:seventeen|thirteen|fourteen|eighteen|nineteen|fifteen|sixteen|eleven|twelve|ten)";

  static final String TensNumberIntegerRegex = r"(?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)";

  static final String SeparaIntRegex =
      r"(?:(({TenToNineteenIntegerRegex}|({TensNumberIntegerRegex}(\s+(and\s+)?|\s*-\s*){ZeroToNineIntegerRegex})|{TensNumberIntegerRegex}|{ZeroToNineIntegerRegex})(\s+{RoundNumberIntegerRegex})*))|(({AnIntRegex}(\s+{RoundNumberIntegerRegex})+))"
          .replaceAll("{TenToNineteenIntegerRegex}", TenToNineteenIntegerRegex)
          .replaceAll("{TensNumberIntegerRegex}", TensNumberIntegerRegex)
          .replaceAll("{ZeroToNineIntegerRegex}", ZeroToNineIntegerRegex)
          .replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex)
          .replaceAll("{AnIntRegex}", AnIntRegex);

  static final String AllIntRegex =
      r"(?:((({TenToNineteenIntegerRegex}|({TensNumberIntegerRegex}(\s+(and\s+)?|\s*-\s*){ZeroToNineIntegerRegex})|{TensNumberIntegerRegex}|{ZeroToNineIntegerRegex}|{AnIntRegex})(\s+{RoundNumberIntegerRegex})+)\s+(and\s+)?)*{SeparaIntRegex})"
          .replaceAll("{TenToNineteenIntegerRegex}", TenToNineteenIntegerRegex)
          .replaceAll("{TensNumberIntegerRegex}", TensNumberIntegerRegex)
          .replaceAll("{ZeroToNineIntegerRegex}", ZeroToNineIntegerRegex)
          .replaceAll("{AnIntRegex}", AnIntRegex)
          .replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex)
          .replaceAll("{SeparaIntRegex}", SeparaIntRegex);

  static final String PlaceHolderPureNumber = r"\b";

  static const String PlaceHolderDefault = r"(?=\d)|\b";

  static final String PlaceHolderMixed = r"\d|\b";

  static String NumbersWithPlaceHolder(String placeholder) {
    print("NumbersWithPlaceholder - placeholder: $placeholder");
    return r"(((?<!(\d+(\s*(K|k|MM?|mil|G|T|B|b))?\s*|\p{L}))-\s*)|(?<={placeholder}))\d+(?!([\.,]\d+[a-zA-Z]))(?={placeholder})"
        .replaceAll("{placeholder}", placeholder);
  }

  static final String IndianNumberingSystemRegex = r"(?<=\b)((?:\d{1,2},(?:\d{2},)*\d{3})(?=\b))";

  static final String NumbersWithSuffix =
      r"(((?<!\d+(\s*{BaseNumbers.NumberMultiplierRegex})?\s*)-\s*)|(?<=\b))\d+\s*{BaseNumbers.NumberMultiplierRegex}(?=\b)"
          .replaceAll("{BaseNumbers.NumberMultiplierRegex}", BaseNumbers.NumberMultiplierRegex);

  static final String RoundNumberIntegerRegexWithLocks =
      r"(?<=\b)\d+\s+{RoundNumberIntegerRegex}(?=\b)".replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex);

  static final String NumbersWithDozenSuffix =
      r"(((?<!\d+(\s*{BaseNumbers.NumberMultiplierRegex})?\s*)-\s*)|(?<=\b))\d+\s+(doz(en)?|dz)s?(?=\b)"
          .replaceAll("{BaseNumbers.NumberMultiplierRegex}", BaseNumbers.NumberMultiplierRegex);

  static final String AllIntRegexWithLocks = r"((?<=\b){AllIntRegex}(?=\b))".replaceAll("{AllIntRegex}", AllIntRegex);

  static final String AllIntRegexWithDozenSuffixLocks =
      r"(?<=\b)(((half\s+)?a\s+dozen)|({AllIntRegex}\s+(doz(en)?|dz)s?))(?=\b)"
          .replaceAll("{AllIntRegex}", AllIntRegex);

  static final String RoundNumberOrdinalRegex = r"(?:hundredth|thousandth|millionth|billionth|trillionth)";

  static final String NumberOrdinalRegex =
      r"(?:first|second|third|fourth|fifth|sixth|seventh|eighth|nine?th|tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth|eighteenth|nineteenth|twentieth|thirtieth|fortieth|fiftieth|sixtieth|seventieth|eightieth|ninetieth)";

  static final String RelativeOrdinalRegex =
      r"(?<relativeOrdinal>(next|previous|current)\s+one|(the\s+second|next)\s+to\s+last|the\s+one\s+before\s+the\s+last(\s+one)?|the\s+last\s+but\s+one|(ante)?penultimate|last|next|previous|current)";

  static final String SuffixBasicOrdinalRegex =
      r"(?:(((({TensNumberIntegerRegex}(\s+(and\s+)?|\s*-\s*){ZeroToNineIntegerRegex})|{TensNumberIntegerRegex}|{ZeroToNineIntegerRegex}|{AnIntRegex})(\s+{RoundNumberIntegerRegex})+)\s+(and\s+)?)*({TensNumberIntegerRegex}(\s+|\s*-\s*))?{NumberOrdinalRegex})"
          .replaceAll("{TensNumberIntegerRegex}", TensNumberIntegerRegex)
          .replaceAll("{ZeroToNineIntegerRegex}", ZeroToNineIntegerRegex)
          .replaceAll("{AnIntRegex}", AnIntRegex)
          .replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex)
          .replaceAll("{NumberOrdinalRegex}", NumberOrdinalRegex);

  static final String SuffixRoundNumberOrdinalRegex = r"(?:({AllIntRegex}\s+){RoundNumberOrdinalRegex})"
      .replaceAll("{AllIntRegex}", AllIntRegex)
      .replaceAll("{RoundNumberOrdinalRegex}", RoundNumberOrdinalRegex);

  static final String AllOrdinalNumberRegex = r"(?:{SuffixBasicOrdinalRegex}|{SuffixRoundNumberOrdinalRegex})"
      .replaceAll("{SuffixBasicOrdinalRegex}", SuffixBasicOrdinalRegex)
      .replaceAll("{SuffixRoundNumberOrdinalRegex}", SuffixRoundNumberOrdinalRegex);

  static final String AllOrdinalRegex = r"(?:{AllOrdinalNumberRegex}|{RelativeOrdinalRegex})"
      .replaceAll("{AllOrdinalNumberRegex}", AllOrdinalNumberRegex)
      .replaceAll("{RelativeOrdinalRegex}", RelativeOrdinalRegex);

  static final String OrdinalSuffixRegex = r"(?<=\b)(?:(\d*(1st|2nd|3rd|[4-90]th))|(1[1-2]th))(?=\b)";

  static final String OrdinalNumericRegex = r"(?<=\b)(?:\d{1,3}(\s*,\s*\d{3})*\s*th)(?=\b)";

  static final String OrdinalRoundNumberRegex =
      r"(?<!an?\s+){RoundNumberOrdinalRegex}".replaceAll("{RoundNumberOrdinalRegex}", RoundNumberOrdinalRegex);

  static final String OrdinalEnglishRegex =
      r"(?<=\b){AllOrdinalRegex}(?=\b)".replaceAll("{AllOrdinalRegex}", AllOrdinalRegex);

  static final String FractionNotationWithSpacesRegex = r"(((?<=\W|^)-\s*)|(?<=\b))\d+\s+\d+[/]\d+(?=(\b[^/]|$))";

  static final String FractionNotationRegex = r"{BaseNumbers.FractionNotationRegex}"
      .replaceAll("{BaseNumbers.FractionNotationRegex}", BaseNumbers.FractionNotationRegex);

  static final String FractionMultiplierRegex =
      r"(?<fracMultiplier>\s+and\s+(a|one|{TwoToNineIntegerRegex})\s+(half|quarter|third|fourth|fifth|sixth|seventh|eighth|nine?th|tenth)s?)"
          .replaceAll("{TwoToNineIntegerRegex}", TwoToNineIntegerRegex);

  static final String RoundMultiplierWithFraction =
      r"(?<=(?<!{RoundNumberIntegerRegex}){FractionMultiplierRegex}\s+)?(?<multiplier>(?:million|mln|billion|bln|trillion|tln)s?)(?={FractionMultiplierRegex}?$)"
          .replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex)
          .replaceAll("{FractionMultiplierRegex}", FractionMultiplierRegex);

  static final String RoundMultiplierRegex =
      r"\b\s*((of\s+)?a\s+)?({RoundMultiplierWithFraction}|(?<multiplier>(?:hundred|thousand|lakh|crore)s?)$)"
          .replaceAll("{RoundMultiplierWithFraction}", RoundMultiplierWithFraction);

  static final String FractionNounRegex =
      r"(?<=\b)({AllIntRegex}\s+(and\s+)?)?(({AllIntRegex})(\s+|\s*-\s*)((({AllOrdinalNumberRegex})|({RoundNumberOrdinalRegex}))s|halves|quarters)((\s+of\s+a)?\s+{RoundNumberIntegerRegex})?|(half(\s+a)?|quarter(\s+of\s+a)?)\s+{RoundNumberIntegerRegex})(?=\b)"
          .replaceAll("{AllIntRegex}", AllIntRegex)
          .replaceAll("{AllOrdinalNumberRegex}", AllOrdinalNumberRegex)
          .replaceAll("{RoundNumberOrdinalRegex}", RoundNumberOrdinalRegex)
          .replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex);

  static final String FractionNounWithArticleRegex =
      r"(?<=\b)(((({AllIntRegex}|{RoundNumberIntegerRegexWithLocks})\s+(and\s+)?)?(an?|one)(\s+|\s*-\s*)(?!\bfirst\b|\bsecond\b)(({AllOrdinalNumberRegex})|({RoundNumberOrdinalRegex})|(half|quarter)(((\s+of)?\s+a)?\s+{RoundNumberIntegerRegex})?))|(half))(?=\b)"
          .replaceAll("{AllIntRegex}", AllIntRegex)
          .replaceAll("{AllOrdinalNumberRegex}", AllOrdinalNumberRegex)
          .replaceAll("{RoundNumberOrdinalRegex}", RoundNumberOrdinalRegex)
          .replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex)
          .replaceAll("{RoundNumberIntegerRegexWithLocks}", RoundNumberIntegerRegexWithLocks);

  static final String FractionPrepositionRegex =
      r"(?<!{BaseNumbers.CommonCurrencySymbol}\s*)(?<=\b)(?<numerator>({AllIntRegex})|((?<![\.,])\d+))\s+(over|(?<ambiguousSeparator>in|out\s+of))\s+(?<denominator>({AllIntRegex})|(\d+)(?![\.,]))(?=\b)"
          .replaceAll("{AllIntRegex}", AllIntRegex)
          .replaceAll("{BaseNumbers.CommonCurrencySymbol}", BaseNumbers.CommonCurrencySymbol);

  static final String FractionPrepositionWithinPercentModeRegex =
      r"(?<!{BaseNumbers.CommonCurrencySymbol}\s*)(?<=\b)(?<numerator>({AllIntRegex})|((?<![\.,])\d+))\s+over\s+(?<denominator>({AllIntRegex})|(\d+)(?![\.,]))(?=\b)"
          .replaceAll("{AllIntRegex}", AllIntRegex)
          .replaceAll("{BaseNumbers.CommonCurrencySymbol}", BaseNumbers.CommonCurrencySymbol);

  static final String AllPointRegex = r"((\s+{ZeroToNineIntegerRegex})+|(\s+{SeparaIntRegex}))"
      .replaceAll("{ZeroToNineIntegerRegex}", ZeroToNineIntegerRegex)
      .replaceAll("{SeparaIntRegex}", SeparaIntRegex);

  static final String AllFloatRegex = r"{AllIntRegex}(\s+point){AllPointRegex}"
      .replaceAll("{AllIntRegex}", AllIntRegex)
      .replaceAll("{AllPointRegex}", AllPointRegex);

  static final String DoubleWithMultiplierRegex =
      r"(((?<!\d+(\s*{BaseNumbers.NumberMultiplierRegex})?\s*)-\s*)|((?<=\b)(?<!\d+[\.,])))(\d{1,3}(,\d{3})+(\.\d+)?|\d+[\.,]\d+)\s*{BaseNumbers.NumberMultiplierRegex}(?=\b)"
          .replaceAll("{BaseNumbers.NumberMultiplierRegex}", BaseNumbers.NumberMultiplierRegex);

  static final String DoubleExponentialNotationRegex =
      r"(((?<!\d+(\s*{BaseNumbers.NumberMultiplierRegex})?\s*)-\s*)|((?<=\b)(?<!\d+[\.,])))(\d+([\.,]\d+)?)(e|x10\^)([+-]*[1-9]\d*)(?=\b)"
          .replaceAll("{BaseNumbers.NumberMultiplierRegex}", BaseNumbers.NumberMultiplierRegex);

  static final String DoubleCaretExponentialNotationRegex =
      r"(((?<!\d+(\s*{BaseNumbers.NumberMultiplierRegex})?\s*)-\s*)|((?<=\b)(?<!\d+[\.,])))(\d+([\.,]\d+)?)\^([+-]*[1-9]\d*)(?=\b)"
          .replaceAll("{BaseNumbers.NumberMultiplierRegex}", BaseNumbers.NumberMultiplierRegex);

  static String DoubleDecimalPointRegex(String placeholder) {
    print("DoubleDecimalPointRegex - placeholder: $placeholder");
    return r"(((?<!(\d+(\s*(K|k|MM?|mil|G|T|B|b))?\s*|\p{L}))-\s*)|((?<={placeholder})(?<!\d+[\.,])))(\d{1,3}(,\d{3})+(\.\d+)?|\d+[\.,]\d+)(?!([\.,]\d+))(?={placeholder})"
        .replaceAll("{placeholder}", placeholder);
  }

  static final String DoubleIndianDecimalPointRegex = r"(?<=\b)((?:\d{1,2},(?:\d{2},)*\d{3})(?:\.\d{2})(?=\b))";

  static String DoubleWithoutIntegralRegex(String placeholder) {
    return r"(?<=\s|^)(?<!(\d+))[\.,]\d+(?!([\.,]\d+))(?={placeholder})".replaceAll("{placeholder}", placeholder);
  }

  static final String DoubleWithRoundNumber =
      r"(((?<!\d+(\s*{BaseNumbers.NumberMultiplierRegex})?\s*)-\s*)|((?<=\b)(?<!\d+[\.,])))(\d{1,3}(,\d{3})+(\.\d+)?|\d+[\.,]\d+)\s+{RoundNumberIntegerRegex}(?=\b)"
          .replaceAll("{RoundNumberIntegerRegex}", RoundNumberIntegerRegex)
          .replaceAll("{BaseNumbers.NumberMultiplierRegex}", BaseNumbers.NumberMultiplierRegex);

  static final String DoubleAllFloatRegex =
      r"((?<=\b){AllFloatRegex}(?=\b))".replaceAll("{AllFloatRegex}", AllFloatRegex);

  static final String ConnectorRegex = r"(?<spacer>and)";

  static final String NumberWithSuffixPercentage =
      r"(?<!%({BaseNumbers.NumberReplaceToken})?)({BaseNumbers.NumberReplaceToken}(\s*))?(%(?!{BaseNumbers.NumberReplaceToken})|(per\s*cents?|percentage|cents?)\b)"
          .replaceAll("{BaseNumbers.NumberReplaceToken}", BaseNumbers.NumberReplaceToken);

  static final String FractionNumberWithSuffixPercentage = r"(({BaseNumbers.FractionNumberReplaceToken})\s+of)"
      .replaceAll("{BaseNumbers.FractionNumberReplaceToken}", BaseNumbers.FractionNumberReplaceToken);

  static final String NumberWithPrefixPercentage = r"(per\s*cents?\s+of)(\s*)({BaseNumbers.NumberReplaceToken})"
      .replaceAll("{BaseNumbers.NumberReplaceToken}", BaseNumbers.NumberReplaceToken);

  static final String NumberWithPrepositionPercentage =
      r"({BaseNumbers.NumberReplaceToken})\s*(in|out\s+of)\s*({BaseNumbers.NumberReplaceToken})"
          .replaceAll("{BaseNumbers.NumberReplaceToken}", BaseNumbers.NumberReplaceToken);

  static final String TillRegex = r"((?<!\bequal\s+)to|through|--|-|—|——|~|–)";

  static final String MoreRegex =
      r"(?:(bigger|greater|more|higher|larger)(\s+than)?|above|over|beyond|exceed(ed|ing)?|surpass(ed|ing)?|(?<!<|=)>)";

  static final String LessRegex = r"(?:(less|lower|smaller|fewer)(\s+than)?|below|under|(?<!>|=)<)";

  static final String EqualRegex = r"(equal(s|ing)?(\s+(to|than))?|(?<!<|>)=)";

  static final String MoreOrEqualPrefix = r"((no\s+{LessRegex})|(at\s+least))".replaceAll("{LessRegex}", LessRegex);

  static final String MoreOrEqual =
      r"(?:({MoreRegex}\s+(or)?\s+{EqualRegex})|({EqualRegex}\s+(or)?\s+{MoreRegex})|{MoreOrEqualPrefix}(\s+(or)?\s+{EqualRegex})?|({EqualRegex}\s+(or)?\s+)?{MoreOrEqualPrefix}|>\s*=|≥)"
          .replaceAll("{MoreRegex}", MoreRegex)
          .replaceAll("{EqualRegex}", EqualRegex)
          .replaceAll("{LessRegex}", LessRegex)
          .replaceAll("{MoreOrEqualPrefix}", MoreOrEqualPrefix);

  static final String MoreOrEqualSuffix =
      r"((and|or)\s+(((more|greater|higher|larger|bigger)((?!\s+than)|(\s+than(?!((\s+or\s+equal\s+to)?\s*\d+)))))|((over|above)(?!\s+than))))";

  static final String LessOrEqualPrefix =
      r"((no\s+{MoreRegex})|(at\s+most)|(up\s+to))".replaceAll("{MoreRegex}", MoreRegex);

  static final String LessOrEqual =
      r"(({LessRegex}\s+(or)?\s+{EqualRegex})|({EqualRegex}\s+(or)?\s+{LessRegex})|{LessOrEqualPrefix}(\s+(or)?\s+{EqualRegex})?|({EqualRegex}\s+(or)?\s+)?{LessOrEqualPrefix}|<\s*=|≤)"
          .replaceAll("{LessRegex}", LessRegex)
          .replaceAll("{EqualRegex}", EqualRegex)
          .replaceAll("{MoreRegex}", MoreRegex)
          .replaceAll("{LessOrEqualPrefix}", LessOrEqualPrefix);

  static final String LessOrEqualSuffix = r"((and|or)\s+(less|lower|smaller|fewer)((?!\s+than)|(\s+than(?!(\s*\d+)))))";

  static final String NumberSplitMark = r"(?![,.](?!\d+))(?!\s*\b(and\s+({LessRegex}|{MoreRegex})|but|or|to)\b)"
      .replaceAll("{MoreRegex}", MoreRegex)
      .replaceAll("{LessRegex}", LessRegex);

  static final String MoreRegexNoNumberSucceed =
      r"((bigger|greater|more|higher|larger)((?!\s+than)|\s+(than(?!(\s*\d+))))|(above|over)(?!(\s*\d+)))";

  static final String LessRegexNoNumberSucceed =
      r"((less|lower|smaller|fewer)((?!\s+than)|\s+(than(?!(\s*\d+))))|(below|under)(?!(\s*\d+)))";

  static final String EqualRegexNoNumberSucceed = r"(equal(s|ing)?((?!\s+(to|than))|(\s+(to|than)(?!(\s*\d+)))))";

  static final String OneNumberRangeMoreRegex1 =
      r"({MoreOrEqual}|{MoreRegex})\s*(the\s+)?(?<number1>({NumberSplitMark}.)+)"
          .replaceAll("{MoreOrEqual}", MoreOrEqual)
          .replaceAll("{MoreRegex}", MoreRegex)
          .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String OneNumberRangeMoreRegex1LB =
      r"(?<!no\s+){OneNumberRangeMoreRegex1}".replaceAll("{OneNumberRangeMoreRegex1}", OneNumberRangeMoreRegex1);

  static final String OneNumberRangeMoreRegex2 = r"(?<number1>({NumberSplitMark}.)+)\s*{MoreOrEqualSuffix}"
      .replaceAll("{MoreOrEqualSuffix}", MoreOrEqualSuffix)
      .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String OneNumberRangeMoreSeparateRegex =
      r"({EqualRegex}\s+(?<number1>({NumberSplitMark}.)+)(\s+or\s+){MoreRegexNoNumberSucceed})|({MoreRegex}\s+(?<number1>({NumberSplitMark}.)+)(\s+or\s+){EqualRegexNoNumberSucceed})"
          .replaceAll("{EqualRegex}", EqualRegex)
          .replaceAll("{MoreRegex}", MoreRegex)
          .replaceAll("{EqualRegexNoNumberSucceed}", EqualRegexNoNumberSucceed)
          .replaceAll("{MoreRegexNoNumberSucceed}", MoreRegexNoNumberSucceed)
          .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String OneNumberRangeLessRegex1 =
      r"({LessOrEqual}|{LessRegex})\s*(the\s+)?(?<number2>({NumberSplitMark}.)+)"
          .replaceAll("{LessOrEqual}", LessOrEqual)
          .replaceAll("{LessRegex}", LessRegex)
          .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String OneNumberRangeLessRegex1LB =
      r"(?<!no\s+){OneNumberRangeLessRegex1}".replaceAll("{OneNumberRangeLessRegex1}", OneNumberRangeLessRegex1);

  static final String OneNumberRangeLessRegex2 = r"(?<number2>({NumberSplitMark}.)+)\s*{LessOrEqualSuffix}"
      .replaceAll("{LessOrEqualSuffix}", LessOrEqualSuffix)
      .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String OneNumberRangeLessSeparateRegex =
      r"({EqualRegex}\s+(?<number1>({NumberSplitMark}.)+)(\s+or\s+){LessRegexNoNumberSucceed})|({LessRegex}\s+(?<number1>({NumberSplitMark}.)+)(\s+or\s+){EqualRegexNoNumberSucceed})"
          .replaceAll("{EqualRegex}", EqualRegex)
          .replaceAll("{LessRegex}", LessRegex)
          .replaceAll("{EqualRegexNoNumberSucceed}", EqualRegexNoNumberSucceed)
          .replaceAll("{LessRegexNoNumberSucceed}", LessRegexNoNumberSucceed)
          .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String OneNumberRangeEqualRegex =
      r"(?<!\bthan\s+or\s+){EqualRegex}\s*(the\s+)?(?<number1>({NumberSplitMark}.)+)"
          .replaceAll("{EqualRegex}", EqualRegex)
          .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String TwoNumberRangeRegex1 =
      r"between\s*(the\s+)?(?<number1>({NumberSplitMark}.)+)\s*and\s*(the\s+)?(?<number2>({NumberSplitMark}.)+)"
          .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String TwoNumberRangeRegex2 =
      r"({OneNumberRangeMoreRegex1}|{OneNumberRangeMoreRegex2})\s*(and|but|,)\s*({OneNumberRangeLessRegex1}|{OneNumberRangeLessRegex2})"
          .replaceAll("{OneNumberRangeMoreRegex1}", OneNumberRangeMoreRegex1)
          .replaceAll("{OneNumberRangeMoreRegex2}", OneNumberRangeMoreRegex2)
          .replaceAll("{OneNumberRangeLessRegex1}", OneNumberRangeLessRegex1)
          .replaceAll("{OneNumberRangeLessRegex2}", OneNumberRangeLessRegex2);

  static final String TwoNumberRangeRegex3 =
      r"({OneNumberRangeLessRegex1}|{OneNumberRangeLessRegex2})\s*(and|but|,)\s*({OneNumberRangeMoreRegex1}|{OneNumberRangeMoreRegex2})"
          .replaceAll("{OneNumberRangeMoreRegex1}", OneNumberRangeMoreRegex1)
          .replaceAll("{OneNumberRangeMoreRegex2}", OneNumberRangeMoreRegex2)
          .replaceAll("{OneNumberRangeLessRegex1}", OneNumberRangeLessRegex1)
          .replaceAll("{OneNumberRangeLessRegex2}", OneNumberRangeLessRegex2);

  static final String TwoNumberRangeRegex4 =
      r"(from\s+)?(?<number1>({NumberSplitMark}(?!\bfrom\b).)+)\s*{TillRegex}\s*(the\s+)?(?<number2>({NumberSplitMark}.)+)"
          .replaceAll("{TillRegex}", TillRegex)
          .replaceAll("{NumberSplitMark}", NumberSplitMark);

  static final String AmbiguousFractionConnectorsRegex = r"(\bin\b)";

  static final String DecimalSeparatorChar = '.';

  static final String FractionMarkerToken = "over";

  static final String NonDecimalSeparatorChar = ',';

  static final String HalfADozenText = "six";

  static final String WordSeparatorToken = "and";

  static final WrittenDecimalSeparatorTexts = <String>["point"];

  static final WrittenGroupSeparatorTexts = <String>["punto"];

  static final WrittenIntegerSeparatorTexts = <String>["and"];

  static final WrittenFractionSeparatorTexts = <String>["and"];

  static final String HalfADozenRegex = r"half\s+a\s+dozen";

  static final String DigitalNumberRegex =
      r"((?<=\b)(hundred|thousand|[mb]illion|trillion|[mbt]ln|lakh|crore|(doz(en)?|dz)s?)(?=\b))|((?<=(\d|\b)){BaseNumbers.MultiplierLookupRegex}(?=\b))"
          .replaceAll("{BaseNumbers.MultiplierLookupRegex}", BaseNumbers.MultiplierLookupRegex);

  static final CardinalNumberMap = Map<String, int>.unmodifiable({
    "a": 1,
    "zero": 0,
    "naught": 0,
    "nought": 0,
    "an": 1,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9,
    "ten": 10,
    "eleven": 11,
    "twelve": 12,
    "dozen": 12,
    "dozens": 12,
    "dz": 12,
    "doz": 12,
    "dzs": 12,
    "dozs": 12,
    "thirteen": 13,
    "fourteen": 14,
    "fifteen": 15,
    "sixteen": 16,
    "seventeen": 17,
    "eighteen": 18,
    "nineteen": 19,
    "twenty": 20,
    "thirty": 30,
    "forty": 40,
    "fifty": 50,
    "sixty": 60,
    "seventy": 70,
    "eighty": 80,
    "ninety": 90,
    "hundred": 100,
    "thousand": 1000,
    "million": 1000000,
    "mln": 1000000,
    "billion": 1000000000,
    "bln": 1000000000,
    "trillion": 1000000000000,
    "tln": 1000000000000,
    "lakh": 100000,
    "crore": 10000000,
    "hundreds": 100,
    "thousands": 1000,
    "millions": 1000000,
    "billions": 1000000000,
    "trillions": 1000000000000,
    "lakhs": 100000,
    "crores": 10000000,
  });

  static final OrdinalNumberMap = Map<String, int>.unmodifiable({
    "first": 1,
    "second": 2,
    "secondary": 2,
    "half": 2,
    "third": 3,
    "fourth": 4,
    "quarter": 4,
    "fifth": 5,
    "sixth": 6,
    "seventh": 7,
    "eighth": 8,
    "ninth": 9,
    "nineth": 9,
    "tenth": 10,
    "eleventh": 11,
    "twelfth": 12,
    "thirteenth": 13,
    "fourteenth": 14,
    "fifteenth": 15,
    "sixteenth": 16,
    "seventeenth": 17,
    "eighteenth": 18,
    "nineteenth": 19,
    "twentieth": 20,
    "thirtieth": 30,
    "fortieth": 40,
    "fiftieth": 50,
    "sixtieth": 60,
    "seventieth": 70,
    "eightieth": 80,
    "ninetieth": 90,
    "hundredth": 100,
    "thousandth": 1000,
    "millionth": 1000000,
    "billionth": 1000000000,
    "trillionth": 1000000000000,
    "firsts": 1,
    "halves": 2,
    "thirds": 3,
    "fourths": 4,
    "quarters": 4,
    "fifths": 5,
    "sixths": 6,
    "sevenths": 7,
    "eighths": 8,
    "ninths": 9,
    "nineths": 9,
    "tenths": 10,
    "elevenths": 11,
    "twelfths": 12,
    "thirteenths": 13,
    "fourteenths": 14,
    "fifteenths": 15,
    "sixteenths": 16,
    "seventeenths": 17,
    "eighteenths": 18,
    "nineteenths": 19,
    "twentieths": 20,
    "thirtieths": 30,
    "fortieths": 40,
    "fiftieths": 50,
    "sixtieths": 60,
    "seventieths": 70,
    "eightieths": 80,
    "ninetieths": 90,
    "hundredths": 100,
    "thousandths": 1000,
    "millionths": 1000000,
    "billionths": 1000000000,
    "trillionths": 1000000000000,
  });

  static final RoundNumberMap = Map<String, int>.unmodifiable({
    "hundred": 100,
    "thousand": 1000,
    "million": 1000000,
    "mln": 1000000,
    "billion": 1000000000,
    "bln": 1000000000,
    "trillion": 1000000000000,
    "tln": 1000000000000,
    "lakh": 100000,
    "crore": 10000000,
    "hundreds": 100,
    "thousands": 1000,
    "millions": 1000000,
    "billions": 1000000000,
    "trillions": 1000000000000,
    "lakhs": 100000,
    "crores": 10000000,
    "hundredth": 100,
    "thousandth": 1000,
    "millionth": 1000000,
    "billionth": 1000000000,
    "trillionth": 1000000000000,
    "hundredths": 100,
    "thousandths": 1000,
    "millionths": 1000000,
    "billionths": 1000000000,
    "trillionths": 1000000000000,
    "dozen": 12,
    "dozens": 12,
    "dz": 12,
    "doz": 12,
    "dzs": 12,
    "dozs": 12,
    "k": 1000,
    "m": 1000000,
    "mm": 1000000,
    "mil": 1000000,
    "g": 1000000000,
    "b": 1000000000,
    "t": 1000000000000,
  });

  static final AmbiguityFiltersDict = Map<String, String>.unmodifiable({
    r"\bone\b": r"\b(the|this|that|which)\s+(one)\b",
  });

  static final RelativeReferenceOffsetMap = Map<String, String>.unmodifiable({
    "last": "0",
    "next one": "1",
    "current": "0",
    "current one": "0",
    "previous one": "-1",
    "the second to last": "-1",
    "the one before the last one": "-1",
    "the one before the last": "-1",
    "next to last": "-1",
    "penultimate": "-1",
    "the last but one": "-1",
    "antepenultimate": "-2",
    "next": "1",
    "previous": "-1",
  });

  static final RelativeReferenceRelativeToMap = Map<String, String>.unmodifiable({
    "last": "end",
    "next one": "current",
    "previous one": "current",
    "current": "current",
    "current one": "current",
    "the second to last": "end",
    "the one before the last one": "end",
    "the one before the last": "end",
    "next to last": "end",
    "penultimate": "end",
    "the last but one": "end",
    "antepenultimate": "end",
    "next": "current",
    "previous": "current",
  });
}

class BaseNumbers {
  static final String NumberReplaceToken = "@builtin.num";

  static final String FractionNumberReplaceToken = "@builtin.num.fraction";

  static String IntegerRegexDefinition(String placeholder, String thousandsmark) {
    return r"(((?<!\d+\s*)-\s*)|((?<=\b)(?<!\d+[\.,])))\d{1,3}({thousandsmark}\d{3})+(?={placeholder})"
        .replaceFirst("{placeholder}", placeholder)
        .replaceFirst("{thousandsmark}", thousandsmark);
  }

  static final String FractionNotationRegex =
      r"((((?<=\W|^)-\s*)|(?<![/-])(?<=\b))\d+[/]\d+(?=(\b[^/]|$))|[\u00BC-\u00BE\u2150-\u215E])";

  static String DoubleRegexDefinition(String placeholder, String thousandsmark, String decimalmark) {
    return r"(((?<!\d+\s*)-\s*)|((?<=\b)(?<!\d+[\.,])))\d{1,3}(({thousandsmark}\d{3})+{decimalmark}|({decimalmark}\d{3})+{thousandsmark})\d+(?={placeholder})"
        .replaceFirst("{placeholder}", placeholder)
        .replaceAll("{thousandsmark}", thousandsmark)
        .replaceAll("{decimalmark}", decimalmark);
  }

  static const String PlaceHolderDefault = r"(?=\d)|\b";

  static final String PlaceHolderMixed = r"\d|\b";

  static final String CaseSensitiveTerms = r"(?<=(\s|\d))(kB|K[Bb]?|M[BbM]?|G[Bb]?|B)\b";

  static final String NumberMultiplierRegex = r"(K|k|MM?|mil|G|T|B|b)";

  static final String MultiplierLookupRegex = r"(k|m(il|m)?|t|g|b)";

  static final String CurrencyRegex = r"(((?<=\W|^)-\s*)|(?<=\b))\d+\s*(b|m|t|g)(?=\b)";

  static final String CommonCurrencySymbol = r"(¥|\$|€|£|₩)";
}
