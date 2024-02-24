import 'package:nlp/src/core/extraction.dart';

class ExtractResultExtension {
  static List<ExtractResult> FilterAmbiguity(
      List<ExtractResult> extractResults, String text, Map<RegExp, RegExp> ambiguityFiltersDict) {
    for (var regex in ambiguityFiltersDict.entries) {
      for (int i = extractResults.length - 1; i >= 0; i--) {
        var er = extractResults[i];
        if (regex.key.hasMatch(er.text)) {
          var matches = regex.value.allMatches(text);
          if (matches.any((match) => match.start < er.start + er.length && match.end > er.start)) {
            extractResults.removeAt(i);
          }
        }
      }
    }

    return extractResults;
  }
}
