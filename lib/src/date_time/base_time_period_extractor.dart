import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/timezone_utility.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseTimePeriodExtractor implements IDateTimeExtractor {
  BaseTimePeriodExtractor(this.config);

  final ITimePeriodExtractorConfiguration config;

  @override
  String getExtractorName() => DateTimeConstants.SYS_DATETIME_TIMEPERIOD;

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String text, DateTime reference) {
    var tokens = <Token>[];
    tokens.addAll(MatchSimpleCases(text));
    tokens.addAll(MergeTwoTimePoints(text, reference));
    tokens.addAll(MatchTimeOfDay(text));

    // Handle pure number cases like "from 6 to 7" cannot be extracted as time ranges under Calendar Mode
    if (config.options.match(DateTimeOptions.CalendarMode)) {
      tokens.addAll(MatchPureNumberCases(text));
    }

    var timePeriodErs = Token.mergeAllTokens(tokens, text, getExtractorName());

    if (config.options.match(DateTimeOptions.EnablePreview)) {
      timePeriodErs = TimeZoneUtility.MergeTimeZones(
          timePeriodErs, config.TimeZoneExtractor().extractDateTime(text, reference), text);
    }

    // Filter ambiguous extractions e.g. 'morgen' in German and Dutch
    timePeriodErs = config.ApplyPotentialPeriodAmbiguityHotfix(text, timePeriodErs);

    return timePeriodErs;
  }

  // Cases like "from 3 to 5am" or "between 3:30 and 5" are extracted here
  // Note that cases like "from 3 to 5" will not be extracted here because no "am/pm" or "hh:mm" to infer it's a time period
  // Also cases like "from 3:30 to 4 people" shuold not be extracted as a time period
  List<Token> MatchSimpleCases(String text) {
    var ret = <Token>[];
    for (var regex in config.SimpleCasesRegex()) {
      var matches = RegExpComposer.getMatchesSimple(regex, text);

      for (NlpMatch match in matches) {
        // Cases like "from 10:30 to 11", don't necessarily need "am/pm"
        if (match.getGroup(DateTimeConstants.MinuteGroupName).value.isNotEmpty ||
            match.getGroup(DateTimeConstants.SecondGroupName).value.isEmpty) {
          // Cases like "from 3:30 to 4" should be supported
          // Cases like "from 3:30 to 4 on 1/1/2015" should be supported
          // Cases like "from 3:30 to 4 people" is considered not valid
          bool endWithValidToken = false;

          // "No extra tokens after the time period"
          if (match.index + match.length == text.length) {
            endWithValidToken = true;
          } else {
            var afterStr = text.substring(match.index + match.length);

            // "End with general ending tokens or "TokenBeforeDate" (like "on")
            var endWithGeneralEndings = config.GeneralEndingRegex().hasMatch(afterStr);
            var endWithAmPm = match.getGroup(DateTimeConstants.RightAmPmGroupName).value.isNotEmpty;

            if (endWithGeneralEndings || endWithAmPm || afterStr.trimLeft().startsWith(config.TokenBeforeDate())) {
              endWithValidToken = true;
            } else if (config.options.match(DateTimeOptions.EnablePreview)) {
              endWithValidToken = StartsWithTimeZone(afterStr);
            }
          }

          if (endWithValidToken) {
            ret.add(Token(match.index, match.index + match.length));
          }
        } else {
          // Is there "pm" or "am"?
          var matchPmStr = match.getGroup(DateTimeConstants.PmGroupName).value;
          var matchAmStr = match.getGroup(DateTimeConstants.AmGroupName).value;
          var descStr = match.getGroup(DateTimeConstants.DescGroupName).value;

          // Check "pm", "am"
          if (matchPmStr.isNotEmpty || matchAmStr.isNotEmpty || descStr.isNotEmpty) {
            ret.add(Token(match.index, match.index + match.length));
          } else {
            var afterStr = text.substring(match.index + match.length);

            if (config.options.match(DateTimeOptions.EnablePreview) && StartsWithTimeZone(afterStr)) {
              ret.add(Token(match.index, match.index + match.length));
            }
          }
        }
      }
    }

    return ret;
  }

  bool StartsWithTimeZone(String afterText) {
    var startsWithTimeZone = false;

    var timeZoneErs = config.TimeZoneExtractor().extract(afterText);
    final sortedTimeZones = [...timeZoneErs];
    sortedTimeZones.sort((a, b) => a.start - b.start);
    var firstTimeZone = sortedTimeZones.firstOrNull;

    if (firstTimeZone != null) {
      var beforeText = afterText.substring(0, firstTimeZone.start);

      if (beforeText.isEmpty) {
        startsWithTimeZone = true;
      }
    }

    return startsWithTimeZone;
  }

  List<Token> MergeTwoTimePoints(String text, DateTime reference) {
    var ret = <Token>[];
    var ers = config.SingleTimeExtractor().extractDateTime(text, reference);

    // Merge "{TimePoint} to {TimePoint}", "between {TimePoint} and {TimePoint}"

    // Handling ending number as a time point.
    var numErs = config.integerExtractor().extract(text);

    // Check if it is an ending number
    if (numErs.isNotEmpty) {
      var timeNumbers = <ExtractResult>[];

      // check if it is a ending number
      var endingNumber = false;
      var num = numErs[numErs.length - 1];
      if (num.start + num.length == text.length) {
        endingNumber = true;
      } else {
        var afterStr = text.substring(num.start + num.length);
        var endingMatch = config.GeneralEndingRegex().firstMatch(afterStr);
        if (endingMatch != null) {
          endingNumber = true;
        }
      }

      if (endingNumber) {
        timeNumbers.add(num);
      }

      var i = 0;
      var j = 0;
      while (i < numErs.length) {
        // find subsequent time point
        var numEndPoint = numErs[i].start + numErs[i].length;
        while (j < ers.length && ers[j].start <= numEndPoint) {
          j++;
        }

        if (j >= ers.length) {
          break;
        }

        // check connector String
        var midStr = text.substring(numEndPoint, ers[j].start);

        if (config.TillRegex().matchExact(midStr, true) != null || config.IsConnectorToken(midStr.trim())) {
          timeNumbers.add(numErs[i]);
        }

        i++;
      }

      // check overlap
      for (var timeNum in timeNumbers) {
        var overlap = false;
        for (var er in ers) {
          if (er.start <= timeNum.start && er.start + er.length >= timeNum.start) {
            overlap = true;
          }
        }

        if (!overlap) {
          ers.add(timeNum);
        }
      }

      ers.sort((x, y) => x.start - y.start);
    }

    var idx = 0;
    while (idx < ers.length - 1) {
      var middleBegin = ers[idx].start + ers[idx].length;
      var middleEnd = ers[idx + 1].start;

      if (middleEnd - middleBegin <= 0) {
        idx++;
        continue;
      }

      var middleStr = text.substring(middleBegin, middleEnd).trim();

      // Handle "{TimePoint} to {TimePoint}"
      if (config.TillRegex().matchExact(middleStr, true) != null) {
        var periodBegin = ers[idx].start;
        var periodEnd = (ers[idx + 1].start) + (ers[idx + 1].length);

        // Handle "from"
        var beforeStr = text.substring(0, periodBegin).trimRight();
        var afterStr = text.substring(periodEnd, text.length);
        int? fromIndex = config.GetFromTokenIndex(beforeStr);
        int? betweenIndex = config.GetBetweenTokenIndex(beforeStr);
        int? afterIndex = config.CheckBothBeforeAfter() ? config.GetBetweenTokenIndex(afterStr) : null;
        if (fromIndex != null) {
          // Handle "from"
          periodBegin = fromIndex;
        } else if (betweenIndex != null) {
          // Handle "between"
          periodBegin = betweenIndex;
        } else if (afterIndex != null) {
          // Handle "between" in afterStr
          periodEnd += afterIndex;
        }

        ret.add(Token(periodBegin, periodEnd));
        idx += 2;
        continue;
      }

      // Handle "between {TimePoint} and {TimePoint}"
      if (config.IsConnectorToken(middleStr)) {
        var periodBegin = ers[idx].start;
        var periodEnd = (ers[idx + 1].start) + (ers[idx + 1].length);

        // Handle "between"
        var beforeStr = text.substring(0, periodBegin).trim();
        int? betweenIndex = config.GetBetweenTokenIndex(beforeStr);
        if (betweenIndex != null) {
          periodBegin = betweenIndex;
          ret.add(Token(periodBegin, periodEnd));
          idx += 2;
          continue;
        }

        // handle "between...and..." case when "between" follows the datepoints
        var afterStr = text.substring(periodEnd, text.length);
        int? afterIndex = config.CheckBothBeforeAfter() ? config.GetBetweenTokenIndex(afterStr) : null;
        if (afterIndex != null) {
          periodEnd += afterIndex;
          ret.add(Token(periodBegin, periodEnd));

          // merge two tokens here, increase the index by two
          idx += 2;
          continue;
        }
      }

      idx++;
    }

    return ret;
  }

  List<Token> MatchTimeOfDay(String text) {
    var ret = <Token>[];
    var matches = RegExpComposer.getMatchesSimple(config.TimeOfDayRegex(), text);
    for (NlpMatch match in matches) {
      Metadata? metadata;

      if (match.getGroup(DateTimeConstants.MealTimeGroupName).value.isNotEmpty) {
        metadata = Metadata(
          isMealtime: true,
        );
      }

      var token = Token(match.index, match.index + match.length, '', metadata);

      ret.add(token);
    }

    return ret;
  }

  // Support cases like "from 6 to 7" which are pure number ranges
  // Only when the number range is at the end of a sentence, it will be considered as a time range
  List<Token> MatchPureNumberCases(String text) {
    var ret = <Token>[];
    for (var regex in config.PureNumberRegex()) {
      var matches = regex.allMatches(text);
      for (Match match in matches) {
        var afterStr = text.substring(match.end);
        var endingMatch = config.GeneralEndingRegex().firstMatch(afterStr);
        if (endingMatch != null) {
          ret.add(Token(match.start, match.end));
        }
      }
    }

    return ret;
  }
}

abstract interface class ITimePeriodExtractorConfiguration extends IDateTimeOptionsConfiguration {
  String TokenBeforeDate();

  IExtractor integerExtractor();

  List<RegExp> SimpleCasesRegex();

  List<RegExp> PureNumberRegex();

  bool CheckBothBeforeAfter();

  RegExp TillRegex();

  RegExp TimeOfDayRegex();

  RegExp GeneralEndingRegex();

  IDateTimeExtractor SingleTimeExtractor();

  IDateTimeExtractor TimeZoneExtractor();

  int? GetFromTokenIndex(String text);

  bool IsConnectorToken(String text);

  int? GetBetweenTokenIndex(String text);

  List<ExtractResult> ApplyPotentialPeriodAmbiguityHotfix(String text, List<ExtractResult> timePeriodErs);
}
