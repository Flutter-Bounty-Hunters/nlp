import 'package:nlp/nlp.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/regular_expressions/matching_util.dart';

class AgoLaterUtil {
  static int Function(String text)? SwiftDayDelegate;
  //public delegate int SwiftDayDelegate(string text);

  static List<Token> ExtractorDurationWithBeforeAndAfter(
      String text, ExtractResult er, List<Token> ret, IDateTimeUtilityConfiguration utilityConfiguration) {
    var pos = er.start + er.length;

    if (pos <= text.length) {
      var afterString = text.substring(pos);
      var beforeString = text.substring(0, er.start);
      var isTimeDuration = utilityConfiguration.timeUnitRegExp().firstMatch(er.text) != null;
      bool isMatch = false;
      var agoLaterRegexes = <RegExp>[
        utilityConfiguration.agoRegExp(),
        utilityConfiguration.laterRegExp(),
      ];

      for (var regex in agoLaterRegexes) {
        Token? tokAfter, tokBefore;
        bool isDayMatch = false;

        // Check afterString
        final index = MatchingUtil.GetAgoLaterIndex(afterString, regex, true);
        if (index != null) {
          // We don't support cases like "5 minutes from today" for now
          // Cases like "5 minutes ago" or "5 minutes from now" are supported
          // Cases like "2 days before today" or "2 weeks from today" are also supported
          final dayMatch = RegExpComposer.getMatchesSimple(regex, afterString).firstOrNull;
          isDayMatch = dayMatch != null && dayMatch.getGroup("day").value.isNotEmpty;

          if (!(isTimeDuration && isDayMatch)) {
            tokAfter = Token(er.start, (er.start + er.length) + index);
            isMatch = true;
          }
        }

        if (utilityConfiguration.checkBothBeforeAfter()) {
          // Check if regex match is split between beforeString and afterString
          if (!isDayMatch && isMatch) {
            String beforeAfterStr = beforeString + afterString.substring(0, index);
            var isRangeMatch =
                utilityConfiguration.rangePrefixRegExp().matchBegin(afterString.substring(index ?? 0), true) != null;
            final indexStart = MatchingUtil.GetAgoLaterIndex(beforeAfterStr, regex, false);
            if (!isRangeMatch && indexStart != null) {
              final dayMatch = RegExpComposer.getMatchesSimple(regex, beforeAfterStr).firstOrNull;
              isDayMatch = dayMatch != null && dayMatch.getGroup("day").value.isNotEmpty;

              if (isDayMatch && !(isTimeDuration && isDayMatch)) {
                ret.add(Token(indexStart, (er.start + er.length) + (index ?? 0)));
                isMatch = true;
              }
            }
          }

          // Check also beforeString
          final beforeIndex = MatchingUtil.GetAgoLaterIndex(beforeString, regex, false);
          if (beforeIndex != null) {
            final dayMatch = RegExpComposer.getMatchesSimple(regex, beforeString).firstOrNull;
            isDayMatch = dayMatch != null && dayMatch.getGroup("day").value.isNotEmpty;
            if (!(isTimeDuration && isDayMatch)) {
              tokBefore = Token(beforeIndex, er.start + er.length);
              isMatch = true;
            }
          }
        }

        if (tokAfter != null && tokBefore != null && tokBefore.start + tokBefore.length > tokAfter.start) {
          // Merge overlapping tokens
          ret.add(Token(tokBefore.start, tokAfter.start + tokAfter.length - tokBefore.start));
        } else if (tokAfter != null) {
          ret.add(tokAfter);
        } else if (tokBefore != null) {
          ret.add(tokBefore);
        }

        if (isMatch) {
          break;
        }
      }

      if (!isMatch) {
        // Item1 is the main regex to be tested
        // Item2 is a list of unit regexes used to validate the extraction (in case of match, the extraction is discarded)
        var inWithinRegexTuples = <(RegExp, List<RegExp>)>[
          (utilityConfiguration.inConnectorRegExp(), [utilityConfiguration.rangeUnitRegExp()]),
          (
            utilityConfiguration.withinNextPrefixRegExp(),
            [utilityConfiguration.dateUnitRegExp(), utilityConfiguration.timeUnitRegExp()]
          ),
        ];

        for (var regex in inWithinRegexTuples) {
          bool isMatchAfter = false;
          int? termIndex = MatchingUtil.GetTermIndex(beforeString, regex.$1);
          if (termIndex != null) {
            isMatch = true;
          } else if (utilityConfiguration.checkBothBeforeAfter()) {
            termIndex = MatchingUtil.GetAgoLaterIndex(afterString, regex.$1, true);
            if (termIndex != null) {
              // Check also afterString
              isMatch = isMatchAfter = true;
            }
          }

          if (isMatch) {
            // For InConnectorRegex and range unit like "week, month, year", it should output dateRange or datetimeRange
            // For WithinNextPrefixRegex and range unit like "week, month, year, day, second, minute, hour", it should output dateRange or datetimeRange
            bool isUnitMatch = false;
            for (var unitRegex in regex.$2) {
              isUnitMatch = isUnitMatch || unitRegex.hasMatch(er.text);
            }

            if (!isUnitMatch) {
              if (er.length > 0 && (er.start >= (termIndex ?? -1) || isMatchAfter)) {
                int start = er.start - (!isMatchAfter ? (termIndex ?? -1) : 0);
                int end = er.start + er.length + (isMatchAfter ? (termIndex ?? -1) : 0);
                ret.add(Token(start, end));
              }
            }

            break;
          }
        }
      }
    }

    return ret;
  }
}
