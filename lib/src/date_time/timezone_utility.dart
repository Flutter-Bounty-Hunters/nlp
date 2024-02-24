import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/string_matcher.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/english_date_time.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/numbers/number_with_unit_tokenizer.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class TimeZoneUtility {
  // private const RegexOptions RegexFlags = RegexOptions.Singleline | RegexOptions.ExplicitCapture;

  // private static readonly Regex BracketRegex =
  //     new Regex(BaseDateTime.BracketRegex, RegexFlags, RegexTimeOut);

  static RegExp BracketRegex = RegExpComposer.sanitizeGroupsAndCompile(BaseDateTime.BracketRegex);

  // private static TimeSpan RegexTimeOut => DateTimeRecognizer.GetTimeout(MethodBase.GetCurrentMethod().DeclaringType);

  static List<ExtractResult> MergeTimeZones(
      List<ExtractResult> originalErs, List<ExtractResult> timeZoneErs, String text) {
    for (var er in originalErs) {
      for (var timeZoneEr in timeZoneErs) {
        // Extend timezone extraction to include brackets if any.
        var tzEr = ExtendTimeZoneExtraction(timeZoneEr, text);

        var begin = er.start + er.length;
        var end = tzEr.start;

        if (begin < end) {
          var gapText = text.substring(begin, end);

          if (gapText.trim().isEmpty) {
            var newLength = (tzEr.start + tzEr.length - er.start);

            er.text = text.substring(er.start, er.start + newLength);
            er.length = newLength;
            er.data = <String, Object>{
              DateTimeConstants.SYS_DATETIME_TIMEZONE: timeZoneEr,
            };
          }
        }

        // Make sure timezone info propagates to longer span entity.
        if (er.isOverlap(timeZoneEr)) {
          er.data = <String, Object>{
            DateTimeConstants.SYS_DATETIME_TIMEZONE: timeZoneEr,
          };
        }
      }
    }

    return originalErs;
  }

  static bool ShouldResolveTimeZone(ExtractResult er, DateTimeOptions options) {
    var enablePreview = options.match(DateTimeOptions.EnablePreview);
    if (!enablePreview) {
      return false;
    }

    var hasTimeZoneData = false;

    if (er.data is Map<String, Object>) {
      var metaData = er.data as Map<String, Object>;

      if (metaData.containsKey(DateTimeConstants.SYS_DATETIME_TIMEZONE)) {
        hasTimeZoneData = true;
      }
    }

    return hasTimeZoneData;
  }

  static StringMatcher BuildMatcherFromLists(List<List<String>> collections) {
    StringMatcher matcher = StringMatcher(strategy: MatchStrategy.TrieTree, tokenizer: NumberWithUnitTokenizer());
    List<String> matcherList = <String>[];

    for (List<String> collection in collections) {
      for (final matcher in collection) {
        matcherList.add(matcher.trim().toLowerCase());
      }
    }

    matcherList = matcherList.toSet().toList();

    matcher.initFromValues(matcherList);

    return matcher;
  }

  static ExtractResult ExtendTimeZoneExtraction(ExtractResult timeZoneEr, String text) {
    var beforeStr = text.substring(0, timeZoneEr.start + 1);
    var afterStr = text.substring(timeZoneEr.start + timeZoneEr.length);
    var matchLeft = BracketRegex.firstMatch(beforeStr);
    var matchRight = BracketRegex.firstMatch(afterStr);
    if (matchLeft != null && matchRight != null) {
      timeZoneEr.start -= matchLeft.length;
      timeZoneEr.length += matchLeft.length + matchRight.length;
    }

    return timeZoneEr;
  }
}
