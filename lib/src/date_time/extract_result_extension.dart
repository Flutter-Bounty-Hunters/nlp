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

  static List<ExtractResult> MergeAllResults(List<ExtractResult> res) {
    var ret = <ExtractResult>[];
    final results = [...res];

    results.sort((a, b) => a.start - b.start);
    results.sort((a, b) => b.length - a.length);

    var mergedResults = <ExtractResult>[];
    for (var result in results) {
      if (result != null) {
        bool shouldAdd = true;
        var resStart = result.start;
        var resEnd = resStart + result.length;
        for (var index = 0; index < mergedResults.length && shouldAdd; index++) {
          var mergedStart = mergedResults[index].start;
          var mergedEnd = mergedStart + mergedResults[index].length;

          // It is included in one of the current results
          if (resStart >= mergedStart && resEnd <= mergedEnd) {
            shouldAdd = false;
          }

          // If it contains overlaps
          if (resStart > mergedStart && resStart < mergedEnd) {
            shouldAdd = false;
          }

          // It includes one of the results and should replace the included one
          if (resStart <= mergedStart && resEnd >= mergedEnd) {
            shouldAdd = false;
            mergedResults[index] = result;
          }
        }

        if (shouldAdd) {
          mergedResults.add(result);
        }
      }
    }

    return mergedResults;
  }
}
