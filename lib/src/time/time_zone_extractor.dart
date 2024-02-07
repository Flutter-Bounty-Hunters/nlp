import 'package:diacritic/diacritic.dart';
import 'package:nlp/nlp.dart';
import 'package:nlp/src/core/string_matcher.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/regular_expressions/matching_util.dart';

class BaseTimeZoneExtractor implements IDateTimeZoneExtractor {
  BaseTimeZoneExtractor(this._config);

  final ITimeZoneExtractorConfiguration _config;

  @override
  String getExtractorName() {
    return DateTimeConstants.SYS_DATETIME_TIMEZONE;
  }

  @override
  List<ExtractResult> extract(String input) {
    return extractTimeZone(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String input, DateTime reference) {
    return extractTimeZone(input, reference);
  }

  List<ExtractResult> extractTimeZone(String input, DateTime reference) {
    String normalizedText = removeDiacritics(input);
    final tokens = <Token>[];
    tokens.addAll(_matchTimeZones(normalizedText));
    tokens.addAll(_matchLocationTimes(normalizedText, tokens));
    return Token.mergeAllTokens(tokens, input, getExtractorName());
  }

  @override
  List<ExtractResult> removeAmbiguousTimezone(List<ExtractResult> extractResults) {
    return extractResults
        .where(
          (result) => !_config.getAmbiguousTimezoneList().contains(result.text.toLowerCase()),
        )
        .toList();
  }

  List<Token> _matchTimeZones(String text) {
    final ret = <Token>[];

    // Direct UTC matches
    final directUtcMatches = RegExpComposer.getMatchesSimple(_config.getDirectUtcRegex(), text.toLowerCase());
    // List<Match> directUtcMatches = RegExpUtility.getMatches(_config.getDirectUtcRegex(), text.toLowerCase());
    if (directUtcMatches.isNotEmpty) {
      for (final match in directUtcMatches) {
        ret.add(Token(match.index, match.index + match.length));
      }
    }

    Iterable<MatchResult<String>> matches = _config.getTimeZoneMatcher().findByQueryText(text.toLowerCase());
    for (MatchResult<String> match in matches) {
      ret.add(Token(match.start, match.start + match.length));
    }

    return ret;
  }

  List<Token> _matchLocationTimes(String text, List<Token> tokens) {
    final ret = <Token>[];

    if (_config.getLocationTimeSuffixRegex() == null) {
      return ret;
    }

    final timeMatch = RegExpComposer.getMatchesSimple(_config.getLocationTimeSuffixRegex()!, text);

    // Before calling a Find() in location matcher, check if all the matched suffixes by
    // LocationTimeSuffixRegex are already inside tokens extracted by TimeZone matcher.
    // If so, don't call the Find() as they have been extracted by TimeZone matcher, otherwise, call it.

    bool isAllSuffixInsideTokens = true;

    for (final match in timeMatch) {
      bool isInside = false;
      for (Token token in tokens) {
        if (token.start <= match.index && token.end >= match.index + match.length) {
          isInside = true;
          break;
        }
      }

      if (!isInside) {
        isAllSuffixInsideTokens = false;
      }

      if (!isAllSuffixInsideTokens) {
        break;
      }
    }

    if (timeMatch.isNotEmpty && !isAllSuffixInsideTokens) {
      int lastMatchIndex = timeMatch[timeMatch.length - 1].index;
      Iterable<MatchResult<String>> matches =
          _config.getLocationMatcher().findByQueryText(text.substring(0, lastMatchIndex).toLowerCase());
      List<MatchResult<String>> locationMatches = MatchingUtil.removeSubMatches(matches);

      int i = 0;
      for (final match in timeMatch) {
        bool hasCityBefore = false;

        while (i < locationMatches.length && locationMatches[i].getEnd() <= match.index) {
          hasCityBefore = true;
          i++;

          if (i == locationMatches.length) {
            break;
          }
        }

        if (hasCityBefore && locationMatches[i - 1].getEnd() == match.index) {
          ret.add(Token(locationMatches[i - 1].start, match.index + match.length));
        }

        if (i == locationMatches.length) {
          break;
        }
      }
    }

    return ret;
  }
}

abstract interface class IDateTimeZoneExtractor implements IDateTimeExtractor {
  List<ExtractResult> removeAmbiguousTimezone(List<ExtractResult> extractResults);
}

abstract interface class ITimeZoneExtractorConfiguration implements IOptionsConfiguration {
  RegExp getDirectUtcRegex();

  RegExp? getLocationTimeSuffixRegex();

  StringMatcher getLocationMatcher();

  StringMatcher getTimeZoneMatcher();

  List<String> getAmbiguousTimezoneList();
}
