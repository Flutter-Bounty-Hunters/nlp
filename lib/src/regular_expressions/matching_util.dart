import 'package:nlp/src/core/string_matcher.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class MatchingUtil {
  static RegExp invalidDayNumberPrefix = RegExp(BaseDateTime.InvalidDayNumberPrefix);

  static List<MatchResult<String>> removeSubMatches(Iterable<MatchResult<String>> matchResults) {
    return matchResults
        .where(
          (item) => matchResults
              .where(
                (ritem) =>
                    (ritem.start < item.start && (ritem.start + ritem.length) >= (item.start + item.length)) ||
                    (ritem.start <= item.start && (ritem.start + ritem.length) > (item.start + item.length)),
              )
              .isNotEmpty,
        )
        .toList();

    // Original code
    // return StreamSupport.stream(matchResults.spliterator(), false)
    //     .filter(item -> !StreamSupport.stream(matchResults.spliterator(), false)
    //     .anyMatch(ritem -> (ritem.getStart() < item.getStart() && ritem.getEnd() >= item.getEnd()) ||
    // (ritem.getStart() <= item.getStart() && ritem.getEnd() > item.getEnd())))
    //     .collect(Collectors.toCollection(ArrayList::new));
  }

  static int? GetAgoLaterIndex(String text, RegExp regex, bool inSuffix) {
    var match = inSuffix ? regex.matchBegin(text, true) : regex.matchEnd(text, true);

    if (match != null) {
      return match.start + (inSuffix ? match.length : 0);
    }

    return null;
  }

  static int? GetTermIndex(String text, RegExp regex) {
    var match = regex.firstMatch(text.trim().split(' ').last);
    if (match != null) {
      return text.length - text.lastIndexOf(match.input.substring(match.start, match.end));
    }

    return null;
  }

  static bool ContainsAgoLaterIndex(String text, RegExp regex, bool inSuffix) {
    return GetAgoLaterIndex(text, regex, inSuffix) != null;
  }

  static bool ContainsTermIndex(String text, RegExp regex) {
    return GetTermIndex(text, regex) != null;
  }

  static bool isInvalidDayNumberPrefix(String prefix) {
    return invalidDayNumberPrefix.hasMatch(prefix);
  }
}
