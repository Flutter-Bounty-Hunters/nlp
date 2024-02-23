import 'package:nlp/nlp.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/numbers/number_constants.dart';
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

  static DateTimeResolutionResult ParseDurationWithAgoAndLater(
      String text,
      DateTime referenceTime,
      IDateTimeExtractor durationExtractor,
      IDateTimeParser durationParser,
      IParser numberParser,
      Map<String, String> unitMap,
      RegExp unitRegex,
      IDateTimeUtilityConfiguration utilityConfiguration,
      SwiftDayFunc swiftDay) {
    var ret = DateTimeResolutionResult();
    var durationRes = durationExtractor.extractDateTime(text, referenceTime);

    if (durationRes.isNotEmpty) {
      var pr = durationParser.parseDateTime(durationRes[0], referenceTime);
      var matches = RegExpComposer.getMatchesSimple(unitRegex, text);
      if (matches.isNotEmpty) {
        var afterStr = text.substring(durationRes[0].start + durationRes[0].length).trim();

        var beforeStr = text.substring(0, durationRes[0].start).trim();

        var mode = AgoLaterMode.Date;
        if (pr.timexStr!.contains("T")) {
          mode = AgoLaterMode.DateTime;
        }

        if (pr.value != null) {
          return GetAgoLaterResult(
              pr, afterStr, beforeStr, referenceTime, numberParser, utilityConfiguration, mode, swiftDay);
        }
      }
    }

    return ret;
  }

  static DateTimeResolutionResult GetAgoLaterResult(
      DateTimeParseResult durationParseResult,
      String afterStr,
      String beforeStr,
      DateTime referenceTime,
      IParser numberParser,
      IDateTimeUtilityConfiguration utilityConfiguration,
      AgoLaterMode mode,
      SwiftDayFunc swiftDay) {
    var ret = DateTimeResolutionResult();
    var resultDateTime = referenceTime;
    var timex = durationParseResult.timexStr;

    if ((durationParseResult.value as DateTimeResolutionResult).mod == DateTimeConstants.MORE_THAN_MOD) {
      ret.mod = DateTimeConstants.MORE_THAN_MOD;
    } else if ((durationParseResult.value as DateTimeResolutionResult).mod == DateTimeConstants.LESS_THAN_MOD) {
      ret.mod = DateTimeConstants.LESS_THAN_MOD;
    }

    int swift = 0;
    bool isMatch = false, isLater = false;
    String? dayStr;

    // Item2 is a label identifying the regex defined in Item1
    var agoLaterRegexTuples = <(RegExp, String)>[
      (utilityConfiguration.agoRegExp(), Constants.AGO_LABEL),
      (utilityConfiguration.laterRegExp(), Constants.LATER_LABEL),
    ];

    // AgoRegex and LaterRegex cases
    for (var regex in agoLaterRegexTuples) {
      // Match in afterStr
      if (MatchingUtil.ContainsAgoLaterIndex(afterStr, regex.$1, true)) {
        isMatch = true;
        isLater = regex.$2 == Constants.LATER_LABEL;
        var match = RegExpComposer.getMatchesSimple(regex.$1, afterStr).firstOrNull;
        dayStr = match?.getGroup("day").value;
      }

      if (utilityConfiguration.checkBothBeforeAfter()) {
        // Match split between beforeStr and afterStr
        if ((dayStr == null || dayStr.isEmpty) && isMatch) {
          var match = RegExpComposer.getMatchesSimple(regex.$1, "$beforeStr $afterStr").firstOrNull;
          dayStr = match?.getGroup("day").value;
        }

        // Match in beforeStr
        if ((dayStr == null || dayStr.isEmpty) && MatchingUtil.ContainsAgoLaterIndex(beforeStr, regex.$1, false)) {
          isMatch = true;
          isLater = regex.$2 == Constants.LATER_LABEL;
          var match = RegExpComposer.getMatchesSimple(regex.$1, beforeStr).firstOrNull;
          dayStr = match?.getGroup("day").value;
        }
      }

      if (isMatch) {
        break;
      }
    }

    // InConnectorRegex cases
    if (!isMatch) {
      if (MatchingUtil.ContainsTermIndex(beforeStr, utilityConfiguration.inConnectorRegExp())) {
        // Match in afterStr
        isMatch = isLater = true;
        var match = RegExpComposer.getMatchesSimple(utilityConfiguration.laterRegExp(), afterStr).firstOrNull;
        dayStr = match?.getGroup("day").value;
      } else if (utilityConfiguration.checkBothBeforeAfter() &&
          MatchingUtil.ContainsAgoLaterIndex(afterStr, utilityConfiguration.inConnectorRegExp(), true)) {
        // Match in beforeStr
        isMatch = isLater = true;
        var match = RegExpComposer.getMatchesSimple(utilityConfiguration.laterRegExp(), beforeStr).firstOrNull;
        dayStr = match?.getGroup("day").value;
      }
    }

    if (isMatch) {
      // Handle cases like "3 days before yesterday", "3 days after tomorrow"
      if (dayStr != null && dayStr.isNotEmpty) {
        swift = swiftDay(dayStr);
      }

      if (isLater) {
        var yearMatch =
            RegExpComposer.getMatchesSimple(utilityConfiguration.sinceYearSuffixRegExp(), afterStr).firstOrNull;
        if (yearMatch != null) {
          var yearString = yearMatch.getGroup(DateTimeConstants.YearGroupName).value;
          var yearEr = ExtractResult(start: yearMatch.index, length: yearMatch.length, text: yearString);
          var year = (numberParser.parse(yearEr)?.value as double?)?.toInt() ?? 0;
          referenceTime = DateTime(year, 1, 1);
        }
      }

      var isFuture = isLater;
      resultDateTime = DurationParsingUtil.shiftDateTime(timex ?? "", referenceTime.AddDays(swift), isFuture);

      (durationParseResult.value as DateTimeResolutionResult).mod =
          isLater ? DateTimeConstants.AFTER_MOD : DateTimeConstants.BEFORE_MOD;
    }

    if (resultDateTime != referenceTime) {
      if (mode == AgoLaterMode.Date) {
        ret.timex = DateTimeFormatUtil.luisDateFromDateTime(resultDateTime);
      } else if (mode == AgoLaterMode.DateTime) {
        ret.timex = DateTimeFormatUtil.luisDateTime(resultDateTime);
      }

      ret.futureValue = ret.pastValue = resultDateTime;
      ret.subDateTimeEntities = [durationParseResult];
      ret.success = true;
    }

    return ret;
  }
}

enum AgoLaterMode {
  Date,
  DateTime,
}

typedef SwiftDayFunc = int Function(String text);
