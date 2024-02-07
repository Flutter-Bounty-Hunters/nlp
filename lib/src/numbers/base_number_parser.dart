import 'dart:collection';
import 'dart:math';

import 'package:nlp/src/core/cultures.dart';
import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/number_format_utility.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/numbers/number_constants.dart';
import 'package:nlp/src/numbers/numbers.dart';

class BaseNumberParser implements IParser {
  BaseNumberParser(this.config) {
    final singleIntFrac =
        "${config.getWordSeparatorToken()}| -|${_getKeyRegex(config.getCardinalNumberMap().keys.toSet())}|${_getKeyRegex(config.getOrdinalNumberMap().keys.toSet())}";

    // Necessary for the german language because bigger numbers are not separated by whitespaces or special characters like in other languages
    if (config.getCultureInfo().cultureCode.toLowerCase() == "de-DE".toLowerCase()) {
      textNumberRegex = RegExp("($singleIntFrac)", caseSensitive: false, unicode: true);
    } else {
      textNumberRegex = RegExp("(?<=\\b)($singleIntFrac)(?=\\b)", caseSensitive: false, unicode: true);
    }

    longFormatRegex = RegExp(r"\d+", caseSensitive: false, unicode: true);

    roundNumberSet = config.getRoundNumberMap().keys.toSet();
  }

  final INumberParserConfiguration config;

  late final Pattern textNumberRegex;

  late final Pattern longFormatRegex;

  late final Set<String> roundNumberSet;

  List<String>? supportedTypes;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    // check if the parser is configured to support specific types
    if (supportedTypes != null && !supportedTypes!.contains(extractResult.type)) {
      return null;
    }

    String? extra;
    ParseResult? ret;

    if (extractResult.data is String) {
      extra = extractResult.data as String;
    } else {
      if (longFormatRegex.allMatches(extractResult.text).isNotEmpty) {
        extra = "Num";
      } else {
        extra = config.getLangMarker();
      }
    }

    // Resolve symbol prefix
    bool isNegative = false;
    final matchNegative = config.getNegativeNumberSignRegex().allMatches(extractResult.text).firstOrNull;
    if (matchNegative != null) {
      isNegative = true;
      extractResult = ExtractResult(
        start: extractResult.start,
        length: extractResult.length,
        text: extractResult.text.substring(matchNegative.group(1)!.length),
        type: extractResult.type,
        data: extractResult.data,
        metadata: extractResult.metadata,
      );
    }

    if (extra.contains("Num")) {
      ret = digitNumberParse(extractResult);
    } else if (extra.contains("Frac${config.getLangMarker()}")) {
      // Frac is a special number, parse via another method
      ret = _fracLikeNumberParse(extractResult);
    } else if (extra.contains(config.getLangMarker())) {
      ret = _textNumberParse(extractResult);
    } else if (extra.contains("Pow")) {
      ret = _powerNumberParse(extractResult);
    }

    if (ret != null && ret.value != null) {
      if (isNegative) {
        // Recover to the original extracted Text
        ret = ParseResult(
          start: ret.start,
          length: ret.length,
          text: matchNegative!.group(1)! + extractResult.text,
          type: ret.type,
          data: ret.data,
          value: -(ret.value as double),
          resolutionStr: ret.resolutionStr,
        );
      }

      String resolutionStr = config.getCultureInfo() != null
          ? NumberFormatUtility.format(ret.value!, config.getCultureInfo())
          : ret.value.toString();
      ret.resolutionStr = resolutionStr;
    }

    // Add "offset" and "relativeTo" for ordinal
    if (StringUtility.isNotNullOrWhiteSpace(ret!.type) && ret.type!.contains(Constants.MODEL_ORDINAL)) {
      ret.metadata!.offset = ret.resolutionStr!;
      // Every ordinal number is relative to the start
      ret.metadata!.relativeTo = Constants.RELATIVE_START;
    }

    // FIXME (Matt): Figure out how to lookup the "root" locale
    //               From Java docs: Useful constant for the root locale. The root locale is the locale whose language, country, and variant are empty ("") strings. This is regarded as the base locale of all locales, and is used as the language/country neutral locale for the locale sensitive operations.
    // if (ret != null) {
    //   ret.text = ret.text.toLowerCase(Locale.ROOT);
    // }

    return ret;
  }

  /// Precondition: ExtResult must have arabic numerals.
  ParseResult digitNumberParse(ExtractResult extractResult) {
    ParseResult result = ParseResult(
      start: extractResult.start,
      length: extractResult.length,
      text: extractResult.text,
      type: extractResult.type,
    );
    result.metadata = extractResult.metadata ?? Metadata();

    //[1] 24
    //[2] 12 32/33
    //[3] 1,000,000
    //[4] 234.567
    //[5] 44/55
    //[6] 2 hundred
    //dot occurred.
    double power = 1;
    String handle = extractResult.text.toLowerCase();
    final matches = config.getDigitalNumberRegex().allMatches(handle);
    int startIndex = 0;
    for (final match in matches) {
      int tmpIndex = -1;
      String matched = match.group(0)!;
      double rep = config.getRoundNumberMap()[matched]!.toDouble();

      // \\s+ for filter the spaces.
      power *= rep;

      while ((tmpIndex = handle.indexOf(matched.toLowerCase(), startIndex)) >= 0) {
        String front = handle.substring(0, tmpIndex).trimRight();
        startIndex = front.length;
        handle = front + handle.substring(tmpIndex + matched.length);
      }
    }

    // Scale used in the calculate of double
    result.value = _getDigitalValue(handle, power);

    return result;
  }

  ParseResult _fracLikeNumberParse(ExtractResult extractResult) {
    ParseResult result = ParseResult(
      start: extractResult.start,
      length: extractResult.length,
      text: extractResult.text,
      type: extractResult.type,
    );
    String resultText = extractResult.text.toLowerCase();

    final match = config.getFractionPrepositionRegex().allMatches(resultText).firstOrNull;
    if (match != null) {
      String numerator = match.namedGroup("numerator")!;
      String denominator = match.namedGroup("denominator")!;

      double smallValue =
          StringUtility.isDigit(numerator[0]) ? _getDigitalValue(numerator, 1) : _getIntValue(_getMatches(numerator));

      double bigValue = StringUtility.isDigit(denominator[0])
          ? _getDigitalValue(denominator, 1)
          : _getIntValue(_getMatches(denominator));

      result.value = smallValue / bigValue;
    } else {
      List<String> fracWords = config.normalizeTokenSet(resultText.split(" "), result);

      // Split fraction with integer
      int splitIndex = fracWords.length - 1;
      int currentValue = config.resolveCompositeNumber(fracWords[splitIndex]);
      int roundValue = 1;

      // For case like "half"
      if (fracWords.length == 1) {
        result.value = 1 / _getIntValue(fracWords);
        return result;
      }

      for (splitIndex = fracWords.length - 2; splitIndex >= 0; splitIndex--) {
        String fracWord = fracWords[splitIndex];
        if (config.getWrittenFractionSeparatorTexts().contains(fracWord) ||
            config.getWrittenIntegerSeparatorTexts().contains(fracWord)) {
          continue;
        }

        int previousValue = currentValue;
        currentValue = config.resolveCompositeNumber(fracWord);

        int smHundreds = 100;

        // previous : hundred
        // current : one
        if ((previousValue >= smHundreds && previousValue > currentValue) ||
            (previousValue < smHundreds && _isComposable(currentValue, previousValue))) {
          if (previousValue < smHundreds && currentValue >= roundValue) {
            roundValue = currentValue;
          } else if (previousValue < smHundreds && currentValue < roundValue) {
            splitIndex++;
            break;
          }

          // current is the first word
          if (splitIndex == 0) {
            // scan, skip the first word
            splitIndex = 1;
            while (splitIndex <= fracWords.length - 2) {
              // e.g. one hundred thousand
              // frac[i+1] % 100 && frac[i] % 100 = 0
              if (config.resolveCompositeNumber(fracWords[splitIndex]) >= smHundreds &&
                  !config.getWrittenFractionSeparatorTexts().contains(fracWords[splitIndex + 1]) &&
                  config.resolveCompositeNumber(fracWords[splitIndex + 1]) < smHundreds) {
                splitIndex++;
                break;
              }
              splitIndex++;
            }
            break;
          }
          continue;
        }
        splitIndex++;
        break;
      }

      if (splitIndex < 0) {
        splitIndex = 0;
      }

      final fracPart = <String>[];
      for (int i = splitIndex; i < fracWords.length; i++) {
        if (fracWords[i].contains("-")) {
          final split = fracWords[i].split(RegExp.escape("-"));
          fracPart.add(split[0]);
          fracPart.add("-");
          fracPart.add(split[1]);
        } else {
          fracPart.add(fracWords[i]);
        }
      }

      // FIXME: The following Dart line was created from the following Java line, I don't know if it's right.
      //
      //        fracWords.subList(splitIndex, fracWords.length).clear()
      //
      //        The subList() in Java creates a view into the list. clear() says it removes the
      //        elements. So my assumption is that the line above is equivalent to setting fracWords
      //        to a new list from [0, splitIndex].
      fracWords = fracWords.sublist(0, splitIndex + 1);

      // denomi = denominator
      double denomiValue = _getIntValue(fracPart);
      // Split mixed number with fraction
      double numerValue = 0;
      double intValue = 0;

      int mixedIndex = fracWords.length;
      for (int i = fracWords.length - 1; i >= 0; i--) {
        if (i < fracWords.length - 1 && config.getWrittenFractionSeparatorTexts().contains(fracWords[i])) {
          String numerStr = fracWords.sublist(i + 1, fracWords.length).join(" ");
          numerValue = _getIntValue(_getMatches(numerStr));
          mixedIndex = i + 1;
          break;
        }
      }

      String intStr = fracWords.sublist(0, mixedIndex).join(" ");
      intValue = _getIntValue(_getMatches(intStr));

      // Find mixed number
      if (mixedIndex != fracWords.length && numerValue < denomiValue) {
        result.value = intValue + numerValue / denomiValue;
      } else {
        result.value = (intValue + numerValue) / denomiValue;
      }
    }

    return result;
  }

  ParseResult _textNumberParse(ExtractResult extractResult) {
    ParseResult result = ParseResult(
      start: extractResult.start,
      length: extractResult.length,
      text: extractResult.text,
      type: extractResult.type,
    );
    result.metadata = extractResult.metadata;
    String handle = extractResult.text.toLowerCase();

    //region Special case for "dozen"
    // FIXME: I retained the following source line because I don't know if I wrote equivalent Dart
    //        or not.
    // handle = config.getHalfADozenRegex().matcher(handle).replaceAll(config.getHalfADozenText());
    handle = handle.replaceAll(config.getHalfADozenRegex(), config.getHalfADozenText());
    //endregion

    List<String> numGroup = QueryProcessor.split(handle, config.getWrittenDecimalSeparatorTexts());

    //region IntegerPart
    String intPart = numGroup[0];

    //Store all match str.
    final matchStrs = <String>[];
    var smatch = textNumberRegex.allMatches(intPart);
    for (final match in smatch) {
      String matchStr = match.group(0)!.toLowerCase();
      matchStrs.add(matchStr);
    }

    // Get the value recursively
    double intPartRet = _getIntValue(matchStrs);
    //endregion

    //region DecimalPart
    double pointPartRet = 0;
    if (numGroup.length == 2) {
      String pointPart = numGroup[1];
      smatch = textNumberRegex.allMatches(pointPart);
      matchStrs.clear();
      for (final match in smatch) {
        String matchStr = match.group(0)!.toLowerCase();
        matchStrs.add(matchStr);
      }
      pointPartRet += _getPointValue(matchStrs);
    }
    //endregion

    result.value = intPartRet + pointPartRet;

    return result;
  }

  ParseResult _powerNumberParse(ExtractResult extractResult) {
    ParseResult result = ParseResult(
      start: extractResult.start,
      length: extractResult.length,
      text: extractResult.text,
      type: extractResult.type,
    );

    String handle = extractResult.text.toUpperCase();
    bool isE = !extractResult.text.contains("^");

    //[1] 1e10
    //[2] 1.1^-23
    final calStack = Stack<double>();

    double scale = 10;
    bool dot = false;
    bool isNegative = false;
    double tmp = 0;
    for (int i = 0; i < handle.length; i++) {
      final ch = handle[i];
      final chCodeUnit = ch.codeUnitAt(0);
      if (ch == '^' || ch == 'E') {
        if (isNegative) {
          calStack.add(-tmp);
        } else {
          calStack.add(tmp);
        }
        tmp = 0;
        scale = 10;
        dot = false;
        isNegative = false;
      } else if (chCodeUnit >= '0'.codeUnitAt(0) && chCodeUnit <= '9'.codeUnitAt(0)) {
        if (dot) {
          tmp = tmp + scale * (chCodeUnit - '0'.codeUnitAt(0));
          scale *= 0.1;
        } else {
          tmp = tmp * scale + (chCodeUnit - '0'.codeUnitAt(0));
        }
      } else if (ch == config.getDecimalSeparatorChar()) {
        dot = true;
        scale = 0.1;
      } else if (ch == '-') {
        isNegative = !isNegative;
      } else if (ch == '+') {
        continue;
      }

      if (i == handle.length - 1) {
        if (isNegative) {
          calStack.add(-tmp);
        } else {
          calStack.add(tmp);
        }
      }
    }

    double ret;
    if (isE) {
      final multiplier = calStack.remove(0);
      final power = calStack.remove(0);
      ret = multiplier * pow(10, power);
    } else {
      final base = calStack.remove(0);
      final power = calStack.remove(0);
      ret = pow(base, power).toDouble();
    }

    result.value = ret;
    result.resolutionStr = NumberFormatUtility.format(ret, config.getCultureInfo());

    return result;
  }

  String _getKeyRegex(Set<String> keyCollection) {
    final keys = List.from(keyCollection).reversed;
    return keys.join("|");
  }

  bool _skipNonDecimalSeparator(String ch, int distance, CultureInfo culture) {
    int decimalLength = 3;

    // @TODO: Add this to project level configuration file to be kept in sync
    // Special cases for multi-language countries where decimal separators can be used interchangeably. Mostly informally.
    // Ex: South Africa, Namibia; Puerto Rico in ES; or in Canada for EN and FR.
    // "me pidio $5.00 prestados" and "me pidio $5,00 prestados" -> currency $5
    Pattern cultureRegex = RegExp(r"^(en|es|fr)(-)?\b", caseSensitive: false, unicode: true);

    return (ch == config.getNonDecimalSeparatorChar() &&
        !(distance <= decimalLength && cultureRegex.allMatches(culture.cultureCode).isNotEmpty));
  }

  double _getDigitalValue(String digitsStr, double power) {
    double temp = 0;
    double scale = 10;
    bool decimalSeparator = false;
    int strLength = digitsStr.length;
    bool isNegative = false;
    bool isFrac = digitsStr.contains("/");

    final calStack = Stack<double>();

    for (int i = 0; i < digitsStr.length; i++) {
      final ch = digitsStr[i];
      final chCodeUnit = ch.codeUnitAt(0);
      bool skippableNonDecimal = _skipNonDecimalSeparator(ch, strLength - i, config.getCultureInfo());

      if (!isFrac && (ch == ' ' || ch == Constants.NO_BREAK_SPACE || skippableNonDecimal)) {
        continue;
      }

      if (ch == ' ' || ch == '/') {
        calStack.push(temp);
        temp = 0;
      } else if (chCodeUnit >= '0'.codeUnitAt(0) && chCodeUnit <= '9'.codeUnitAt(0)) {
        if (decimalSeparator) {
          temp = temp + scale * (chCodeUnit - '0'.codeUnitAt(0));
          scale *= 0.1;
        } else {
          temp = temp * scale + (chCodeUnit - '0'.codeUnitAt(0));
        }
      } else if (ch == config.getDecimalSeparatorChar() ||
          (!skippableNonDecimal && ch == config.getNonDecimalSeparatorChar())) {
        decimalSeparator = true;
        scale = 0.1;
      } else if (ch == '-') {
        isNegative = true;
      }
    }
    calStack.push(temp);

    // is the number is a fraction.
    double calResult = 0;
    if (isFrac) {
      double deno = calStack.pop();
      double mole = calStack.pop();
      calResult += mole / deno;
    }

    while (calStack.isNotEmpty) {
      calResult += calStack.pop();
    }
    calResult *= power;

    if (isNegative) {
      return -calResult;
    }

    return calResult;
  }

  double _getIntValue(List<String> matchStrs) {
    final isEnd = List.filled(matchStrs.length, false);

    double tempValue = 0;
    int endFlag = 1;

    //Scan from end to start, find the end word
    for (int i = matchStrs.length - 1; i >= 0; i--) {
      if (roundNumberSet.contains(matchStrs[i])) {
        //if false,then continue
        //You will meet hundred first, then thousand.
        if (endFlag > config.getRoundNumberMap()[matchStrs[i]]!) {
          continue;
        }

        isEnd[i] = true;
        endFlag = config.getRoundNumberMap()[matchStrs[i]]!;
      }
    }

    if (endFlag == 1) {
      final tempStack = Stack<double>();
      String oldSym = "";
      for (final matchStr in matchStrs) {
        bool isCardinal = config.getCardinalNumberMap().containsKey(matchStr);
        bool isOrdinal = config.getOrdinalNumberMap().containsKey(matchStr);

        if (isCardinal || isOrdinal) {
          double matchValue =
              (isCardinal ? config.getCardinalNumberMap()[matchStr]! : config.getOrdinalNumberMap()[matchStr]!)
                  .toDouble();

          //This is just for ordinal now. Not for fraction ever.
          if (isOrdinal) {
            double fracPart = config.getOrdinalNumberMap()[matchStr]!.toDouble();
            if (tempStack.isNotEmpty) {
              double intPart = tempStack.pop();

              // if intPart >= fracPart, it means it is an ordinal number
              // it begins with an integer, ends with an ordinal
              // e.g. ninety-ninth
              if (intPart >= fracPart) {
                tempStack.push(intPart + fracPart);
              } else {
                // another case of the type is ordinal
                // e.g. three hundredth
                while (tempStack.isNotEmpty) {
                  intPart = intPart + tempStack.pop();
                }
                tempStack.push(intPart * fracPart);
              }
            } else {
              tempStack.push(fracPart);
            }
          } else if (config.getCardinalNumberMap().containsKey(matchStr)) {
            if (oldSym == "-") {
              double sum = tempStack.pop() + matchValue;
              tempStack.push(sum);
            } else if (oldSym.toLowerCase() == config.getWrittenIntegerSeparatorTexts()[0].toLowerCase() ||
                tempStack.length < 2) {
              tempStack.push(matchValue);
            } else if (tempStack.length >= 2) {
              double sum = tempStack.pop() + matchValue;
              sum = tempStack.pop() + sum;
              tempStack.push(sum);
            }
          }
        } else {
          int complexValue = config.resolveCompositeNumber(matchStr);
          if (complexValue != 0) {
            tempStack.push(complexValue as double);
          }
        }
        oldSym = matchStr;
      }

      for (final stackValue in tempStack) {
        tempValue += stackValue;
      }
    } else {
      int lastIndex = 0;
      double mulValue = 1;
      double partValue = 1;
      for (int i = 0; i < isEnd.length; i++) {
        if (isEnd[i]) {
          mulValue = config.getRoundNumberMap()[matchStrs[i]]!.toDouble();
          partValue = 1;

          if (i != 0) {
            partValue = _getIntValue(matchStrs.sublist(lastIndex, i));
          }

          tempValue += mulValue * partValue;
          lastIndex = i + 1;
        }
      }

      //Calculate the part like "thirty-one"
      mulValue = 1;
      if (lastIndex != isEnd.length) {
        partValue = _getIntValue(matchStrs.sublist(lastIndex, isEnd.length));
        tempValue += mulValue * partValue;
      }
    }

    return tempValue;
  }

  double _getPointValue(List<String> matchStrs) {
    double ret = 0;
    String firstMatch = matchStrs[0];

    if (config.getCardinalNumberMap().containsKey(firstMatch) && config.getCardinalNumberMap()[firstMatch]! >= 10) {
      String prefix = "0.";
      int tempInt = _getIntValue(matchStrs).toInt();
      String all = "$prefix$tempInt";
      ret = double.parse(all);
    } else {
      double scale = 0.1;
      for (final matchStr in matchStrs) {
        ret += config.getCardinalNumberMap()[matchStr]! * scale;
        scale *= 0.1;
      }
    }

    return ret;
  }

  List<String> _getMatches(String input) {
    final smatch = textNumberRegex.allMatches(input);
    final matchStrs = <String>[];

    //Store all match str.
    for (final match in smatch) {
      String matchStr = match.group(0)!;
      matchStrs.add(matchStr);
    }

    return matchStrs;
  }

  //Test if big and combine with small.
  //e.g. "hundred" can combine with "thirty" but "twenty" can't combine with "thirty".
  bool _isComposable(int big, int small) {
    int baseNumber = small > 10 ? 100 : 10;
    return big % baseNumber == 0 && big / baseNumber >= 1;
  }
}

abstract interface class INumberParserConfiguration {
//region language dictionaries

  Map<String, int> getCardinalNumberMap();

  Map<String, int> getOrdinalNumberMap();

  Map<String, int> getRoundNumberMap();

//endregion

//region language settings

  NumberOptions getOptions();

  CultureInfo getCultureInfo();

  RegExp getDigitalNumberRegex();

  RegExp getFractionPrepositionRegex();

  String getFractionMarkerToken();

  RegExp getHalfADozenRegex();

  String getHalfADozenText();

  String getLangMarker();

  String getNonDecimalSeparatorChar();

  String getDecimalSeparatorChar();

  String getWordSeparatorToken();

  List<String> getWrittenDecimalSeparatorTexts();

  List<String> getWrittenGroupSeparatorTexts();

  List<String> getWrittenIntegerSeparatorTexts();

  List<String> getWrittenFractionSeparatorTexts();

  RegExp getNegativeNumberSignRegex();

  bool _isCompoundNumberLanguage();

  bool _isMultiDecimalSeparatorCulture();

//endregion

/**
 * Used when requiring to normalize a token to a valid expression supported by the ImmutableDictionaries (language dictionaries)
 *
 * @param tokens  list of tokens to normalize
 * @param context context of the call
 * @return list of normalized tokens
 */
  List<String> normalizeTokenSet(List<String> tokens, ParseResult context);

/**
 * Used when requiring to convert a String to a valid number supported by the language
 *
 * @param numberStr composite number
 * @return value of the String
 */
  int resolveCompositeNumber(String numberStr);
}

class Stack<T> with IterableMixin<T> implements Iterable<T> {
  final _items = <T>[];

  @override
  int get length => _items.length;

  void push(T item) => _items.add(item);

  void add(T item) => push(item);

  T pop() => _items.removeLast();

  T remove(int index) => _items.removeAt(index);

  @override
  Iterator<T> get iterator => List<T>.from(_items).reversed.iterator;
}
