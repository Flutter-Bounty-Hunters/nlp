import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/string_matcher.dart';
import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/regular_expressions/string_extensions.dart';

class NumberWithUnitTokenizer extends SimpleTokenizer {
  static final specialTokenCharacters = <String>{'\$'};

  /* The main difference between this strategy and SimpleTokenizer is for cases like
     * 'Bob's $ 100 cash'. 's' and '$' are independent tokens in SimpleTokenizer.
     * However, 's$' will return these two tokens too. Here, we let 's$' be a single
     * token to avoid the false positive.
     * Besides, letters and digits can't be mixed as a token. For cases like '200ml'.
     * '200ml' will be a token in SimpleTokenizer. Here, '200' and 'ml' are independent tokens.
     */

  @override
  List<Token> tokenize(String? input) {
    final tokens = <Token>[];

    if (StringUtility.isNullOrEmpty(input)) {
      return tokens;
    }

    bool inToken = false;
    int tokenStart = 0;
    for (int i = 0; i < input!.length; i++) {
      final c = input[i];
      if (c.isWhitespace) {
        if (inToken) {
          tokens.add(Token(tokenStart, i - tokenStart, input.substring(tokenStart, i)));
          inToken = false;
        }
      } else if ((!specialTokenCharacters.contains(c) && !c.isLetterOrDigit) || isChinese(c) || isJapanese(c)) {
        // Non-splittable currency units (as "$") are treated as regular letters. For instance, 'us$' should be a single token
        if (inToken) {
          tokens.add(Token(tokenStart, i - tokenStart, input.substring(tokenStart, i)));
          inToken = false;
        }

        tokens.add(Token(i, 1, input.substring(i, i + 1)));
      } else {
        if (inToken && i > 0) {
          final preChar = input[i - 1];
          if (isSplittableUnit(c, preChar)) {
            // Split if letters or non-splittable units are adjacent with digits.
            tokens.add(Token(tokenStart, i - tokenStart, input.substring(tokenStart, i)));
            tokenStart = i;
          }
        }

        if (!inToken) {
          tokenStart = i;
          inToken = true;
        }
      }
    }

    if (inToken) {
      tokens.add(Token(tokenStart, input.length - tokenStart, input.substring(tokenStart, input.length)));
    }

    return tokens;
  }

  bool isSplittableUnit(String curChar, String preChar) {
    // To handle cases like '200ml', digits and letters cannot be mixed as a single token. '200ml' will be tokenized to '200' and 'ml'.
    if ((curChar.isLetter && preChar.isDigit) || (curChar.isDigit && preChar.isLetter)) {
      return true;
    }

    // Non-splittable currency units can't be mixed with digits. For example, '$100' or '100$' will be tokenized to '$' and '100',
    // '1$50' will be tokenized to '1', '$', and '50'
    if ((curChar.isDigit && specialTokenCharacters.contains(preChar)) ||
        (specialTokenCharacters.contains(curChar) && preChar.isDigit)) {
      return true;
    }

    // Non-splittable currency units adjacent with letters are treated as regular token characters. For instance, 's$' or 'u$d' are single tokens.
    return false;
  }
}
