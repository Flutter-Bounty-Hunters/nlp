import 'package:nlp/src/core/string_matcher.dart';

class MatchingUtil {
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
}
