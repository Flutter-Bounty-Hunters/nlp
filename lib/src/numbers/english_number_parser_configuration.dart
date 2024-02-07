import 'package:nlp/src/core/cultures.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/numbers/base_number_parser.dart';
import 'package:nlp/src/numbers/numbers.dart';

class EnglishNumberParserConfiguration extends BaseNumberParserConfiguration {
  static const _defaultCulture = CultureInfo(Culture.English);

  EnglishNumberParserConfiguration(
      [CultureInfo cultureInfo = _defaultCulture, NumberOptions options = NumberOptions.None])
      : super(
          EnglishNumeric.LangMarker,
          cultureInfo,
          EnglishNumeric.CompoundNumberLanguage,
          EnglishNumeric.MultiDecimalSeparatorCulture,
          options,
          EnglishNumeric.NonDecimalSeparatorChar,
          EnglishNumeric.DecimalSeparatorChar,
          EnglishNumeric.FractionMarkerToken,
          EnglishNumeric.HalfADozenText,
          EnglishNumeric.WordSeparatorToken,
          EnglishNumeric.WrittenDecimalSeparatorTexts,
          EnglishNumeric.WrittenGroupSeparatorTexts,
          EnglishNumeric.WrittenIntegerSeparatorTexts,
          EnglishNumeric.WrittenFractionSeparatorTexts,
          EnglishNumeric.CardinalNumberMap,
          EnglishNumeric.OrdinalNumberMap,
          EnglishNumeric.RoundNumberMap,
          RegExp(EnglishNumeric.HalfADozenRegex, caseSensitive: false, unicode: true),
          RegExp(EnglishNumeric.DigitalNumberRegex, caseSensitive: false, unicode: true),
          RegExp(EnglishNumeric.NegativeNumberSignRegex, caseSensitive: false, unicode: true),
          RegExp(EnglishNumeric.FractionPrepositionRegex, caseSensitive: false, unicode: true),
        );

  @override
  List<String> normalizeTokenSet(List<String> tokens, ParseResult context) {
    final words = <String>[];

    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i].contains("-")) {
        final splitTokens = tokens[i].split(RegExp.escape("-"));
        if (splitTokens.length == 2 && getOrdinalNumberMap().containsKey(splitTokens[1])) {
          words.add(splitTokens[0]);
          words.add(splitTokens[1]);
        } else {
          words.add(tokens[i]);
        }
      } else if (i < tokens.length - 2 && tokens[i + 1] == "-") {
        if (getOrdinalNumberMap().containsKey(tokens[i + 2])) {
          words.add(tokens[i]);
          words.add(tokens[i + 2]);
        } else {
          words.add(tokens[i] + tokens[i + 1] + tokens[i + 2]);
        }

        i += 2;
      } else {
        words.add(tokens[i]);
      }
    }

    return words;
  }

  @override
  int resolveCompositeNumber(String numberStr) {
    if (numberStr.contains("-")) {
      final numbers = numberStr.split(RegExp.escape("-"));
      int ret = 0;
      for (final number in numbers) {
        if (getOrdinalNumberMap().containsKey(number)) {
          ret += getOrdinalNumberMap()[number]!;
        } else if (getCardinalNumberMap().containsKey(number)) {
          ret += getCardinalNumberMap()[number]!;
        }
      }

      return ret;
    }

    if (getOrdinalNumberMap().containsKey(numberStr)) {
      return getOrdinalNumberMap()[numberStr]!;
    }

    if (getCardinalNumberMap().containsKey(numberStr)) {
      return getCardinalNumberMap()[numberStr]!;
    }

    return 0;
  }
}

abstract class BaseNumberParserConfiguration implements INumberParserConfiguration {
  BaseNumberParserConfiguration(
    String langMarker,
    CultureInfo cultureInfo,
    bool isCompoundNumberLanguage,
    bool isMultiDecimalSeparatorCulture,
    NumberOptions options,
    String nonDecimalSeparatorChar,
    String decimalSeparatorChar,
    String fractionMarkerToken,
    String halfADozenText,
    String wordSeparatorToken,
    List<String> writtenDecimalSeparatorTexts,
    List<String> writtenGroupSeparatorTexts,
    List<String> writtenIntegerSeparatorTexts,
    List<String> writtenFractionSeparatorTexts,
    Map<String, int> cardinalNumberMap,
    Map<String, int> ordinalNumberMap,
    Map<String, int> roundNumberMap,
    RegExp halfADozenRegex,
    RegExp digitalNumberRegex,
    RegExp negativeNumberSignRegex,
    RegExp fractionPrepositionRegex,
  ) {
    _langMarker = langMarker;
    _cultureInfo = cultureInfo;
    _isCompoundNumberLanguage = isCompoundNumberLanguage;
    _isMultiDecimalSeparatorCulture = isMultiDecimalSeparatorCulture;
    _options = options;
    _nonDecimalSeparatorChar = nonDecimalSeparatorChar;
    _decimalSeparatorChar = decimalSeparatorChar;
    _fractionMarkerToken = fractionMarkerToken;
    _halfADozenText = halfADozenText;
    _wordSeparatorToken = wordSeparatorToken;
    _writtenDecimalSeparatorTexts = writtenDecimalSeparatorTexts;
    _writtenGroupSeparatorTexts = writtenGroupSeparatorTexts;
    _writtenIntegerSeparatorTexts = writtenIntegerSeparatorTexts;
    _writtenFractionSeparatorTexts = writtenFractionSeparatorTexts;
    _cardinalNumberMap = cardinalNumberMap;
    _ordinalNumberMap = ordinalNumberMap;
    _roundNumberMap = roundNumberMap;
    _halfADozenRegex = halfADozenRegex;
    _digitalNumberRegex = digitalNumberRegex;
    _negativeNumberSignRegex = negativeNumberSignRegex;
    _fractionPrepositionRegex = fractionPrepositionRegex;
  }

  late final String _langMarker;
  late final CultureInfo _cultureInfo;
  late final NumberOptions _options;

  late final String _nonDecimalSeparatorChar;
  late final String _decimalSeparatorChar;
  late final String _fractionMarkerToken;
  late final String _halfADozenText;
  late final String _wordSeparatorToken;

  late final List<String> _writtenDecimalSeparatorTexts;
  late final List<String> _writtenGroupSeparatorTexts;
  late final List<String> _writtenIntegerSeparatorTexts;
  late final List<String> _writtenFractionSeparatorTexts;

  late final Map<String, int> _cardinalNumberMap;
  late final Map<String, int> _ordinalNumberMap;
  late final Map<String, int> _roundNumberMap;
  late final RegExp _halfADozenRegex;
  late final RegExp _digitalNumberRegex;
  late final RegExp _negativeNumberSignRegex;
  late final RegExp _fractionPrepositionRegex;

  late final bool _isCompoundNumberLanguage;
  late final bool _isMultiDecimalSeparatorCulture;

  @override
  Map<String, int> getCardinalNumberMap() {
    return _cardinalNumberMap;
  }

  @override
  Map<String, int> getOrdinalNumberMap() {
    return _ordinalNumberMap;
  }

  @override
  Map<String, int> getRoundNumberMap() {
    return _roundNumberMap;
  }

  @override
  NumberOptions getOptions() {
    return _options;
  }

  @override
  CultureInfo getCultureInfo() {
    return _cultureInfo;
  }

  @override
  RegExp getDigitalNumberRegex() {
    return _digitalNumberRegex;
  }

  @override
  RegExp getFractionPrepositionRegex() {
    return _fractionPrepositionRegex;
  }

  @override
  String getFractionMarkerToken() {
    return _fractionMarkerToken;
  }

  @override
  RegExp getHalfADozenRegex() {
    return _halfADozenRegex;
  }

  @override
  String getHalfADozenText() {
    return _halfADozenText;
  }

  @override
  String getLangMarker() {
    return _langMarker;
  }

  @override
  String getNonDecimalSeparatorChar() {
    return _nonDecimalSeparatorChar;
  }

  @override
  String getDecimalSeparatorChar() {
    return _decimalSeparatorChar;
  }

  @override
  String getWordSeparatorToken() {
    return _wordSeparatorToken;
  }

  @override
  List<String> getWrittenDecimalSeparatorTexts() {
    return _writtenDecimalSeparatorTexts;
  }

  @override
  List<String> getWrittenGroupSeparatorTexts() {
    return _writtenGroupSeparatorTexts;
  }

  @override
  List<String> getWrittenIntegerSeparatorTexts() {
    return _writtenIntegerSeparatorTexts;
  }

  @override
  List<String> getWrittenFractionSeparatorTexts() {
    return _writtenFractionSeparatorTexts;
  }

  @override
  RegExp getNegativeNumberSignRegex() {
    return _negativeNumberSignRegex;
  }

  @override
  bool isCompoundNumberLanguage() {
    return _isCompoundNumberLanguage;
  }

  @override
  bool isMultiDecimalSeparatorCulture() {
    return _isMultiDecimalSeparatorCulture;
  }
}
