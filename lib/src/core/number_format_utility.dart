// ignore_for_file: non_constant_identifier_names

import 'package:nlp/src/core/cultures.dart';
import 'package:nlp/src/numbers/number_constants.dart';

class NumberFormatUtility {
  static final _supportedCultures = <String, LongFormatType?>{
    Culture.English: LongFormatType.DoubleNumCommaDot,
    Culture.Spanish: LongFormatType.DoubleNumDotComma,
    Culture.Portuguese: LongFormatType.DoubleNumDotComma,
    Culture.French: LongFormatType.DoubleNumDotComma,
    Culture.German: LongFormatType.DoubleNumDotComma,
    Culture.Chinese: null,
    Culture.Japanese: LongFormatType.DoubleNumDotComma,
  };

  static String format(Object value, CultureInfo culture) {
    double doubleValue = value as double;
    String result;

    // EXPONENTIAL_AT: [-5, 15] });
    // For small positive decimal places. E.g.: 0,000015 or 0,0000015 -> 1.5E-05 or 1.5E-06
    try {
      if (doubleValue > 0 && doubleValue != doubleValue.round() && doubleValue < 1E-4) {
        result = doubleValue.toString();
      } else {
        // FIXME (Matt): I wasn't sure what the following code was trying to achieve so I
        //               replaced it with a direct toString() on the double.
        // BigDecimal bc = BigDecimal(doubleValue, MathContext(15, RoundingMode.HALF_EVEN));
        // result = bc.toString();
        result = doubleValue.toString();
      }
    } catch (exception) {
      return value.toString();
    }

    result = result.replaceAll('e', 'E');
    if (result.contains("E-")) {
      final parts = result.split(RegExp.escape("E-"));
      parts[0] = QueryProcessor.trimEnd(parts[0], ".0");
      parts[1] = parts[1].padLeft(2, '0');
      result = parts.join("E-");
    }

    if (result.contains("E+")) {
      final parts = result.split(RegExp.escape("E+"));
      parts[0] = QueryProcessor.trimEnd(parts[0], "0");
      result = parts.join("E+");
    }

    if (result.contains(".")) {
      result = QueryProcessor.trimEnd(result, "0");
      result = QueryProcessor.trimEnd(result, ".");
    }

    if (_supportedCultures.containsKey(culture.cultureCode)) {
      final longFormat = _supportedCultures[culture.cultureCode];
      if (longFormat != null) {
        final buffer = StringBuffer();
        for (int i = 0; i < result.length; i += 1) {
          buffer.write(_changeMark(result[i], longFormat));
        }

        result = buffer.toString();
      }
    }

    return result;
  }

  static String _changeMark(String c, LongFormatType longFormat) {
    if (c == '.') {
      return longFormat.decimalsMark;
    } else if (c == ',') {
      return longFormat.thousandsMark;
    }

    return c;
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

  LongFormatType(this.thousandsMark, this.decimalsMark);

  final String decimalsMark;
  final String thousandsMark;
}

class QueryProcessor {
  static String trimEnd(String input, String chars) {
    return input.replaceAll("[${RegExp.escape(chars)}]+\$", "");
  }

  static List<String> split(String input, List<String> delimiters) {
    final delimitersRegex = delimiters.map((s) => RegExp.escape(s)).join("|");

    return input.split(delimitersRegex).where((s) => s.isNotEmpty).toList();
  }
}
