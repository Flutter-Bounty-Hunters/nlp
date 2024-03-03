abstract interface class IExtractor {
  List<ExtractResult> extract(String input);
}

class ExtractResult {
  ExtractResult({
    required this.start,
    required this.length,
    required this.text,
    this.type,
    this.data,
    this.metadata,
  });

  int start;
  int length;
  String? type;
  String text;
  Object? data;
  Metadata? metadata;

  bool isOverlap(ExtractResult er) {
    return _isOverlap(this, er);
  }

  _isOverlap(ExtractResult er1, ExtractResult er2) {
    return !(er1.start >= er2.start + er2.length) && !(er2.start >= er1.start + er1.length);
  }

  bool isCover(ExtractResult er) {
    return _isCover(this, er);
  }

  bool _isCover(ExtractResult er1, ExtractResult er2) {
    return ((er2.start < er1.start) && ((er2.start + er2.length) >= (er1.start + er1.length))) ||
        ((er2.start <= er1.start) && ((er2.start + er2.length) > (er1.start + er1.length)));
  }

  /// Serialized this [ExtractResult] into a form that can be compared with JSON test cases.
  Map<String, dynamic> toTestCaseJson() {
    return {
      if (type != null) //
        "Type": type,
      "Text": text,
      "Start": start,
      "Length": length,
      // We don't include "data" or "metadata" because either the test cases don't want them,
      // or we're incorrectly setting these properties and they're triggering test failures.
      // Either way, for now, we don't include them.
    };
  }
}

class Metadata {
  Metadata({
    this.isDurationWithBeforeAndAfter = false,
    this.isHoliday = false,
    this.isMealtime = false,
    this.possiblyIncludePeriodEnd = false,
  });

  bool isHoliday;

  bool hasMod = false;

  String offset = "";

  String relativeTo = "";

  // For cases like "from 2014 to 2018", the period end "2018" could be inclusive or exclusive
  // For extraction, we only mark this flag to avoid future duplicate judgment, whether to include the period end or not is not determined in the extraction step
  bool isPossiblyIncludePeriodEnd = false;

  // For cases like "2015年以前" (usually regards as "before 2015" in English), "5天以前"
  // (usually regards as "5 days ago" in English) in Chinese, we need to decide whether this is a "Date with Mode" or "Duration with Before and After".
  // We use this flag to avoid duplicate judgment both in the Extraction step and Parse step.
  // Currently, this flag is only used in Chinese DateTime as other languages don't have this ambiguity cases.
  bool isDurationWithBeforeAndAfter;

  bool isDurationDateWithWeekday = false;

  bool isHolidayRange = false;

  bool isHolidayWeekend = false;

  String holidayName = "";

  bool isOrdinalRelative = false;

  bool isMealtime = false;

  bool possiblyIncludePeriodEnd;
}

class Token {
  static List<ExtractResult> mergeAllTokens(List<Token> tokens, String text, String extractorName) {
    final result = <ExtractResult>[];
    final mergedTokens = <Token>[];

    tokens.sort((o1, o2) {
      if (o1.start != o2.start) {
        return o1.start - o2.start;
      }

      return o2.length - o1.length;
    });

    for (final token in tokens) {
      bool bAdd = true;
      for (int i = 0; i < mergedTokens.length && bAdd; i++) {
        // It is included in one of the current tokens
        if (token.start >= mergedTokens[i].start && token.end <= mergedTokens[i].end) {
          bAdd = false;
        }

        // If it contains overlaps
        if (token.start > mergedTokens[i].start && token.start < mergedTokens[i].end) {
          bAdd = false;
        }

        // It includes one of the tokens and should replace the included one
        if (token.start <= mergedTokens[i].start && token.end >= mergedTokens[i].end) {
          bAdd = false;
          mergedTokens[i] = token;
        }
      }

      if (bAdd) {
        mergedTokens.add(token);
      }
    }

    for (final token in mergedTokens) {
      String substring = text.substring(token.start, token.end);

      ExtractResult er = ExtractResult(
        start: token.start,
        length: token.length,
        text: substring,
        type: extractorName,
        data: null,
        metadata: token.metadata,
      );

      result.add(er);
    }

    return result;
  }

  static List<Token> getTokenFromRegex(RegExp pattern, String text) {
    final result = <Token>[];

    final matches = pattern.allMatches(text);
    for (final match in matches) {
      result.add(
        Token(match.start, match.end),
      );
    }

    return result;
  }

  Token(this.start, this.end, [this.text, this.metadata]);

  final int start;
  final int end;
  int get length => end < start ? 0 : end - start;
  final String? text;
  final Metadata? metadata;
}
