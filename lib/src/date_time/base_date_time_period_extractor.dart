import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/timezone_utility.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseDateTimePeriodExtractor implements IDateTimeExtractor {
  BaseDateTimePeriodExtractor(this.config);

  final IDateTimePeriodExtractorConfiguration config;

  @override
  String getExtractorName() => DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String input, DateTime reference) {
    final text = input.toLowerCase();

    var tokens = <Token>[];

    // Date and time Extractions should be extracted from the text only once, and shared in the methods below, passed by value
    var dateErs = config.SingleDateExtractor().extractDateTime(text, reference);

    // adding support for merging holiday dates with timerange references.

    if (config.options.match(DateTimeOptions.TasksMode)) {
      var holidates = config.HolidayExtractor().extractDateTime(text, reference);
      dateErs.addAll(holidates);
    }

    var timeErs = config.SingleTimeExtractor().extractDateTime(text, reference);

    tokens.addAll(MatchSimpleCases(text, reference));
    tokens.addAll(MergeTwoTimePoints(text, reference, dateErs, timeErs));
    tokens.addAll(MatchDuration(text, reference));
    tokens.addAll(MatchTimeOfDay(text, reference, dateErs));
    tokens.addAll(MatchRelativeUnit(text));
    tokens.addAll(MatchDateWithPeriodPrefix(text, reference, dateErs));
    tokens.addAll(MergeDateWithTimePeriodSuffix(text, dateErs, timeErs));

    var ers = Token.mergeAllTokens(tokens, text, getExtractorName());

    if (config.options.match(DateTimeOptions.EnablePreview)) {
      ers = TimeZoneUtility.MergeTimeZones(ers, config.TimeZoneExtractor().extractDateTime(text, reference), text);
    }

    return ers;
  }

  static bool MatchPrefixRegexInSegment(String text, Match? match, bool inPrefix) {
    if (match == null) {
      return false;
    }
    String subStr = inPrefix ? text.substring(match.start + (match.end - match.start)) : text.substring(0, match.start);
    var result = subStr.isEmpty;
    return result;
  }

  // Cases like "today after 2:00pm", "1/1/2015 before 2:00 in the afternoon"
  List<Token> MergeDateWithTimePeriodSuffix(String text, List<ExtractResult> dateErs, List<ExtractResult> timeErs) {
    var ret = <Token>[];

    if (dateErs.isEmpty) {
      return ret;
    }

    if (timeErs.isEmpty) {
      return ret;
    }

    var ers = dateErs;
    ers.addAll(timeErs);

    ers.sort((a, b) => a.start - b.start);

    var i = 0;
    while (i < ers.length - 1) {
      var j = i + 1;
      while (j < ers.length && ers[i].isOverlap(ers[j])) {
        j++;
      }

      if (j >= ers.length) {
        break;
      }

      if (ers[i].type == DateTimeConstants.SYS_DATETIME_DATE && ers[j].type == DateTimeConstants.SYS_DATETIME_TIME) {
        var middleBegin = ers[i].start + ers[i].length;
        var middleEnd = ers[j].start;
        if (middleBegin > middleEnd) {
          i = j + 1;
          continue;
        }

        var middleStr = text.substring(middleBegin, middleEnd).trim();

        int length = GetValidConnectorIndexForDateAndTimePeriod(middleStr, true);
        if (length != DateTimeConstants.INVALID_CONNECTOR_CODE) {
          var begin = ers[i].start;
          var end = (ers[j].start) + (ers[j].length);

          ret.add(Token(begin, end));
        } else if (config.CheckBothBeforeAfter()) {
          // Check also afterStr
          var afterStart = ers[j].start + ers[j].length;
          var afterStr = text.substring(afterStart);

          length = GetValidConnectorIndexForDateAndTimePeriod(afterStr, false);
          if (length != DateTimeConstants.INVALID_CONNECTOR_CODE &&
              config.PrepositionRegex().matchExact(middleStr, true) != null) {
            var begin = ers[i].start;
            var end = (ers[j].start) + (ers[j].length) + length;
            ret.add(Token(begin, end));
          }
        }

        i = j + 1;
        continue;
      }

      i = j;
    }

    // Handle "in the afternoon" at the end of entity
    for (var idx = 0; idx < ret.length; idx++) {
      var afterStr = text.substring(ret[idx].end);
      var match = config.SuffixRegex().firstMatch(afterStr);
      if (match != null) {
        ret[idx] = Token(ret[idx].start, ret[idx].end + match.length);
      }
    }

    return ret;
  }

  // Cases like "today after 2:00pm", "1/1/2015 before 2:00 in the afternoon"
  // Valid connector in English for Before include: "before", "no later than", "in advance of", "prior to", "earlier than", "sooner than", "by", "till", "until"...
  // Valid connector in English for After include: "after", "later than"
  int GetValidConnectorIndexForDateAndTimePeriod(String text, bool inPrefix) {
    int length = DateTimeConstants.INVALID_CONNECTOR_CODE;
    var beforeAfterRegexes = <RegExp>[
      config.BeforeRegex(),
      config.AfterRegex(),
    ];

    for (var RegExp in beforeAfterRegexes) {
      var match = inPrefix ? RegExp.matchExact(text, true) : RegExp.matchBegin(text, true);
      if (match != null) {
        length = match.end - match.start;
        return length;
      }
    }

    return length;
  }

  // For cases like "Early in the day Wednesday"
  List<Token> MatchDateWithPeriodPrefix(String text, DateTime reference, List<ExtractResult> dateErs) {
    var ret = <Token>[];

    for (var dateEr in dateErs) {
      var dateStrEnd = (dateEr.start + dateEr.length);
      var beforeStr = text.substring(0, dateEr.start).trimRight();
      var match = config.PrefixDayRegex().firstMatch(beforeStr);
      if (match != null) {
        ret.add(Token(match.start, dateStrEnd));
      } else if (config.CheckBothBeforeAfter()) {
        // Check also afterStr
        var afterStr = text.substring(dateStrEnd, text.length - dateStrEnd);
        var matchAfter = config.PrefixDayRegex().matchBegin(afterStr, true);
        if (matchAfter != null) {
          ret.add(Token(dateEr.start, dateStrEnd + matchAfter.start + matchAfter.length));
        }
      }
    }

    return ret;
  }

  List<Token> MatchSimpleCases(String text, DateTime reference) {
    var ret = <Token>[];
    for (var RegExp in config.SimpleCasesRegex()) {
      var matches = RegExp.allMatches(text);
      for (Match match in matches) {
        // Is there a date before it?
        var hasBeforeDate = false;
        var beforeStr = text.substring(0, match.start);
        if (beforeStr.isNotEmpty) {
          var ers = config.SingleDateExtractor().extractDateTime(beforeStr, reference);

          // adding support for merging holiday with timeperiod
          if (config.options.match(DateTimeOptions.TasksMode)) {
            var holidates = config.HolidayExtractor().extractDateTime(beforeStr, reference);
            ers.addAll(holidates);
          }

          if (ers.isNotEmpty) {
            var er = ers.last;
            var begin = er.start;

            var middleStr = beforeStr.substring(begin + (er.length)).trim();
            if (middleStr.isEmpty || config.PrepositionRegex().matchExact(middleStr, true) != null) {
              ret.add(Token(begin, match.end));
              hasBeforeDate = true;
            }
          }
        }

        var followedStr = text.substring(match.end);
        if (followedStr.isNotEmpty && !hasBeforeDate) {
          // Is it followed by a date?
          var er = config.SingleDateExtractor().extractDateTime(followedStr, reference);

          // check if follwed by holiday?
          if (config.options.match(DateTimeOptions.TasksMode)) {
            var holidates = config.HolidayExtractor().extractDateTime(followedStr, reference);
            er.addAll(holidates);
          }

          if (er.isNotEmpty) {
            var begin = er[0].start;
            var end = (er[0].start) + (er[0].length);
            var middleStr = followedStr.substring(0, begin).trim();
            if (middleStr.isEmpty || config.PrepositionRegex().matchExact(middleStr, true) != null) {
              ret.add(Token(match.start, match.end + end));
            }
          }
        }
      }
    }

    return ret;
  }

  List<Token> MergeTwoTimePoints(
      String text, DateTime reference, List<ExtractResult> dateErs, List<ExtractResult> timeErs) {
    var ret = <Token>[];
    var dateTimeErs = config.SingleDateTimeExtractor().extractDateTime(text, reference);
    var timePoints = <ExtractResult>[];

    // Handle the overlap problem
    var j = 0;
    for (var er in dateTimeErs) {
      timePoints.add(er);

      while (j < timeErs.length && timeErs[j].start + timeErs[j].length < er.start) {
        timePoints.add(timeErs[j]);
        j++;
      }

      while (j < timeErs.length && timeErs[j].isOverlap(er)) {
        j++;
      }
    }

    for (; j < timeErs.length; j++) {
      timePoints.add(timeErs[j]);
    }

    timePoints.sort((a, b) => a.start - b.start);

    // Merge "{TimePoint} to {TimePoint}", "between {TimePoint} and {TimePoint}"
    var idx = 0;
    while (idx < timePoints.length - 1) {
      // If both ends are Time. then this is a TimePeriod, not a DateTimePeriod
      if (timePoints[idx].type == DateTimeConstants.SYS_DATETIME_TIME &&
          timePoints[idx + 1].type == DateTimeConstants.SYS_DATETIME_TIME) {
        idx++;
        continue;
      }

      var middleBegin = timePoints[idx].start + timePoints[idx].length ?? 0;
      var middleEnd = timePoints[idx + 1].start;

      var middleStr = text.substring(middleBegin, middleEnd).trim();

      // Handle "{TimePoint} to {TimePoint}"
      if (config.TillRegex().matchExact(middleStr, true) != null) {
        var periodBegin = timePoints[idx].start;
        var periodEnd = (timePoints[idx + 1].start) + (timePoints[idx + 1].length);

        // Handle "from"
        var beforeStr = text.substring(0, periodBegin).trim();

        int? fromIndex = config.GetFromTokenIndex(beforeStr) ?? config.GetBetweenTokenIndex(beforeStr);
        if (fromIndex != null) {
          periodBegin = fromIndex;
        } else if (config.CheckBothBeforeAfter()) {
          var afterStr = text.substring(periodEnd, text.length - periodEnd);
          final afterIndex = config.GetBetweenTokenIndex(afterStr);
          if (afterIndex != null) {
            // Handle "between" in afterStr
            periodEnd += afterIndex;
          }
        }

        ret.add(Token(periodBegin, periodEnd));
        idx += 2;
        continue;
      }

      // Handle "between {TimePoint} and {TimePoint}"
      if (config.HasConnectorToken(middleStr)) {
        var periodBegin = timePoints[idx].start;
        var periodEnd = (timePoints[idx + 1].start) + (timePoints[idx + 1].length);

        // Handle "between"
        var beforeStr = text.substring(0, periodBegin).trim();
        final beforeIndex = config.GetBetweenTokenIndex(beforeStr);
        if (beforeIndex != null) {
          periodBegin = beforeIndex;
          ret.add(Token(periodBegin, periodEnd));
          idx += 2;
          continue;
        }
      }

      idx++;
    }

    // Regarding the phrase as-- {Date} {TimePeriod}, like "2015-9-23 1pm to 4"
    // Or {TimePeriod} on {Date}, like "1:30 to 4 on 2015-9-23"
    var timePeriodErs = config.TimePeriodExtractor().extractDateTime(text, reference);

    // Mealtime periods (like "dinnertime") are not currently fully supported in merging.
    for (var timePeriod in timePeriodErs) {
      if (timePeriod.metadata == null || timePeriod.metadata?.isMealtime != true) {
        dateErs.add(timePeriod);
      }
    }

    // under tasksmode add mealtime support only when no occurence of time
    if (config.options.match(DateTimeOptions.TasksMode)) {
      for (var timePeriod in timePeriodErs) {
        if ((timeErs.isEmpty) && (timePeriod.metadata != null) && timePeriod.metadata?.isMealtime == true) {
          dateErs.add(timePeriod);
        }
      }
    }

    var points = [...dateErs];
    points.sort((a, b) => a.start - b.start);

    for (idx = 0; idx < points.length - 1; idx++) {
      if (points[idx].type == points[idx + 1].type) {
        continue;
      }

      var midBegin = points[idx].start + points[idx].length;
      var midEnd = points[idx + 1].start;

      if (midEnd - midBegin > 0) {
        var midStr = text.substring(midBegin, midEnd);
        bool isMatchTokenBeforeDate = midStr.trim().isEmpty ||
            (midStr.trimLeft().startsWith(config.TokenBeforeDate()) &&
                (points[idx + 1].type == DateTimeConstants.SYS_DATETIME_DATE ||
                    points[idx + 1].type == DateTimeConstants.SYS_DATETIME_DATETIME));

        if (config.CheckBothBeforeAfter() && midStr.trim().isNotEmpty) {
          List<String> tokenListBeforeDate = config.TokenBeforeDate().split('|');
          for (String token in tokenListBeforeDate.where((n) => n.isNotEmpty)) {
            if (midStr.trim() == token) {
              isMatchTokenBeforeDate = true;
              break;
            }
          }
        }

        if (isMatchTokenBeforeDate) {
          // Extend date extraction for cases like "Monday evening next week"
          var extendedStr = points[idx].text + text.substring((points[idx + 1].start + points[idx + 1].length));
          var extendedDateEr = config.SingleDateExtractor().extractDateTime(extendedStr, reference).firstOrNull;
          var offset = 0;
          if (extendedDateEr != null && extendedDateEr.start == 0 && !config.CheckBothBeforeAfter()) {
            offset = (extendedDateEr.length - points[idx].length);
          }

          ret.add(Token(points[idx].start, offset + points[idx + 1].start + points[idx + 1].length));
          idx += 2;
        }
      }
    }

    return ret;
  }

  List<Token> MatchTimeOfDay(String text, DateTime reference, List<ExtractResult> dateErs) {
    var ret = <Token>[];

    var matches = config.SpecificTimeOfDayRegex().allMatches(text);
    for (Match match in matches) {
      ret.add(Token(match.start, match.end));
    }

    // Date followed by morning, afternoon or morning, afternoon followed by Date
    if (dateErs.isEmpty && ret.isEmpty) {
      return ret;
    }

    for (var er in dateErs) {
      var afterStr = text.substring(er.start + er.length ?? 0);

      var match = RegExpComposer.getMatchesSimple(config.PeriodTimeOfDayWithDateRegex(), afterStr).firstOrNull;

      if (match != null) {
        // For cases like "Friday afternoon between 1PM and 4 PM" which "Friday afternoon" need to be extracted first
        if (afterStr.substring(0, match.index).trim().isEmpty) {
          var start = er.start;
          var end = er.start +
              er.length +
              match.getGroup(DateTimeConstants.TimeOfDayGroupName).index +
              match.getGroup(DateTimeConstants.TimeOfDayGroupName).length;

          ret.add(Token(start, end));
          continue;
        }

        var connectorStr = afterStr.substring(0, match.index);

        // trim here is set to false as the RegExp might catch white spaces before or after the text
        if (config.MiddlePauseRegex().matchExact(connectorStr) != null) {
          var suffix = afterStr.substring(match.index + match.length).trimLeft();

          var endingMatch = config.GeneralEndingRegex().firstMatch(suffix);
          if (endingMatch != null) {
            ret.add(Token(er.start, er.start + er.length + match.index + match.length));
          }
        }
      }

      match ??= RegExpComposer.getMatchesSimple(config.AmDescRegex(), afterStr).firstOrNull;

      if (match == null || afterStr.substring(0, match.index).trim().isNotEmpty) {
        match = RegExpComposer.getMatchesSimple(config.PmDescRegex(), afterStr).firstOrNull;
      }

      if (match != null) {
        if (afterStr.substring(0, match.index).trim().isEmpty) {
          ret.add(Token(er.start, er.start + er.length + match.index + match.length));
        }
      }

      var prefixStr = text.substring(0, er.start);

      match = RegExpComposer.getMatchesSimple(config.PeriodTimeOfDayWithDateRegex(), prefixStr).firstOrNull;
      if (match != null) {
        if (prefixStr.substring(match.index + match.length).trim().isEmpty) {
          var midStr = text.substring(match.index + match.length, er.start);
          if (midStr.isNotEmpty && midStr.trim().isEmpty) {
            ret.add(Token(match.index, er.start + er.length ?? 0));
          }
        } else {
          var connectorStr = prefixStr.substring(match.index + match.length);

          // trim here is set to false as the RegExp might catch white spaces before or after the text
          if (config.MiddlePauseRegex().matchExact(connectorStr, false) != null) {
            var suffix = text.substring(er.start + er.length).trimLeft();

            var endingMatch = config.GeneralEndingRegex().firstMatch(suffix);
            if (endingMatch != null) {
              ret.add(Token(match.index, er.start + er.length));
            }
          }
        }
      }
    }

    // Check whether there are adjacent time period strings, before or after
    for (var e in ret) {
      // Try to extract a time period in before-String
      if (e.start > 0) {
        var beforeStr = text.substring(0, e.start);
        if (beforeStr.isNotEmpty) {
          var timeErs = config.TimePeriodExtractor().extractDateTime(beforeStr, reference);
          if (timeErs.isNotEmpty) {
            for (var tp in timeErs) {
              var midStr = beforeStr.substring(tp.start + tp.length);
              if (midStr.trim().isEmpty && (tp.metadata == null || tp.metadata?.isMealtime != true)) {
                ret.add(Token(tp.start, tp.start + tp.length + midStr.length + e.length));
              }
            }
          }
        }
      }

      // Try to extract a time period in after-String
      if (e.start + e.length <= text.length) {
        var afterStr = text.substring(e.start + e.length);
        if (afterStr.isNotEmpty) {
          var timeErs = config.TimePeriodExtractor().extractDateTime(afterStr, reference);
          if (timeErs.isNotEmpty) {
            for (var tp in timeErs) {
              var midStr = afterStr.substring(0, tp.start);
              if (midStr.trim().isEmpty && (tp.metadata == null || tp.metadata?.isMealtime != true)) {
                ret.add(Token(e.start, e.start + e.length + midStr.length + tp.length));
              }
            }
          }
        }
      }

      // Try to extract a pure number period in before-String
      if (e.start > 0) {
        var beforeStr = text.substring(0, e.start);
        if (beforeStr.isEmpty) {
          ret.addAll(MatchPureNumberCases(beforeStr, e, true));
        }
      }

      // Try to extract a pure number period in after-String
      if (e.end < text.length) {
        var afterStr = text.substring(e.end);
        if (afterStr.isNotEmpty) {
          ret.addAll(MatchPureNumberCases(afterStr, e, false));
        }
      }
    }

    return ret;
  }

  // TODO: this can be abstracted with the similar method in BaseDatePeriodExtractor
  List<Token> MatchDuration(String text, DateTime reference) {
    var ret = <Token>[];

    var durations = <Token>[];
    var durationExtractions = config.DurationExtractor().extractDateTime(text, reference);

    for (var durationExtraction in durationExtractions) {
      var timeUnitMatch = RegExpComposer.getMatchesSimple(config.TimeUnitRegex(), durationExtraction.text).firstOrNull;
      if (timeUnitMatch == null) {
        continue;
      }

      var isPlurarUnit = timeUnitMatch.getGroup(DateTimeConstants.PluralUnit).value.isNotEmpty;
      var duration = Token(durationExtraction.start ?? 0, durationExtraction.start + durationExtraction.length ?? 0);
      var beforeStr = text.substring(0, duration.start);
      var afterStr = text.substring(duration.start + duration.length);

      if (beforeStr.trim().isEmpty && afterStr.trim().isEmpty) {
        continue;
      }

      // within (the) (next) "Seconds/Minutes/Hours" should be handled as datetimeRange here
      // within (the) (next) XX days/months/years + "Seconds/Minutes/Hours" should also be handled as datetimeRange here
      Token token = MatchWithinNextPrefix(beforeStr, text, duration, true);
      if (token.start >= 0) {
        ret.add(token);
        continue;
      }

      // check also afterStr
      if (config.CheckBothBeforeAfter()) {
        token = MatchWithinNextPrefix(afterStr, text, duration, false);
        if (token.start >= 0) {
          ret.add(token);
          continue;
        }
      }

      var match = config.PreviousPrefixRegex().firstMatch(beforeStr);
      var index = -1;
      if (match != null && beforeStr.substring(match.start + match.length).trim().isEmpty) {
        index = match.start;
      }

      if (index < 0) {
        match = config.NextPrefixRegex().firstMatch(beforeStr);
        if (match != null && beforeStr.substring(match.start + match.length).trim().isEmpty) {
          index = match.start;
        }
      }

      if (index >= 0) {
        var prefix = beforeStr.substring(0, index).trim();
        var durationText = text.substring(duration.start, duration.end);
        var numbersInPrefix = config.CardinalExtractor().extract(prefix);
        var numbersInDuration = config.CardinalExtractor().extract(durationText);

        // Cases like "2 upcoming days", should be supported here
        // Cases like "2 upcoming 3 days" is invalid, only extract "upcoming 3 days" by default
        if (numbersInPrefix.isNotEmpty && numbersInDuration.isEmpty && isPlurarUnit) {
          final sortedNumbers = [...numbersInPrefix];
          sortedNumbers.sort((a, b) => (a.start + a.length) - (b.start + b.length));
          var lastNumber = sortedNumbers.last;

          // Prefix should ends with the last number
          if (lastNumber.start + lastNumber.length == prefix.length) {
            ret.add(Token(lastNumber.start, duration.end));
          }
        } else {
          ret.add(Token(index, duration.end));
        }

        continue;
      }

      var matchDateUnit = config.DateUnitRegex().firstMatch(afterStr);
      if (matchDateUnit == null) {
        match = config.PreviousPrefixRegex().firstMatch(afterStr);
        if (match != null && afterStr.substring(0, match.start).trim().isEmpty) {
          ret.add(Token(duration.start, duration.start + duration.length + match.start + match.length));
          continue;
        }

        match = config.NextPrefixRegex().firstMatch(afterStr);
        if (match != null && afterStr.substring(0, match.start).trim().isEmpty) {
          ret.add(Token(duration.start, duration.start + duration.length + match.start + match.length));
        }

        match = config.FutureSuffixRegex().firstMatch(afterStr);
        if (match != null && afterStr.substring(0, match.start).trim().isEmpty) {
          ret.add(Token(duration.start, duration.start + duration.length + match.start + match.length));
        }
      }
    }

    return ret;
  }

  List<Token> MatchRelativeUnit(String text) {
    var ret = <Token>[];

    var matches = config.RelativeTimeUnitRegex().allMatches(text);
    if (matches.isEmpty) {
      matches = config.RestOfDateTimeRegex().allMatches(text);
    }

    for (Match match in matches) {
      ret.add(Token(match.start, match.end));
    }

    return ret;
  }

  Token MatchWithinNextPrefix(String subStr, String text, Token duration, bool inPrefix) {
    var startOut = -1;
    var endOut = -1;
    bool success = false;
    var match = config.WithinNextPrefixRegex().firstMatch(subStr);
    if (MatchPrefixRegexInSegment(subStr, match, inPrefix)) {
      var startToken = inPrefix ? match!.start : duration.start;
      var endToken = duration.end + (inPrefix ? 0 : match!.start + match.length);
      match = config.TimeUnitRegex().firstMatch(text.substring(duration.start, duration.length));
      success = match != null;

      if (!inPrefix) {
        // Match prefix for "next"
        var beforeStr = text.substring(0, duration.start);
        var matchNext = config.NextPrefixRegex().firstMatch(beforeStr);
        success = match != null || matchNext != null;
        if (MatchPrefixRegexInSegment(beforeStr, matchNext!, true)) {
          startToken = matchNext.start;
        }
      }

      if (success) {
        startOut = startToken;
        endOut = endToken;
      }
    }

    return Token(startOut, endOut);
  }

  // The method matches pure number ranges. It is used inside MatchTimeOfDay, so the condition IsNullOrWhiteSpace(midStr) implies
  // that the range must be contiguous to a TimeOfDay expression (e.g. "last night from 7 to 9").
  List<Token> MatchPureNumberCases(String text, Token tok, bool before) {
    var ret = <Token>[];
    for (var RegExp in config.SimpleCasesRegex()) {
      var matches = RegExp.allMatches(text);
      for (Match match in matches) {
        var midStr = before ? text.substring(match.end) : text.substring(0, match.start);
        if (midStr.trim().isEmpty) {
          if (before) {
            ret.add(Token(match.start, tok.start + tok.length));
          } else {
            ret.add(Token(tok.start, tok.end + match.end));
          }
        }
      }
    }

    return ret;
  }
}

abstract interface class IDateTimePeriodExtractorConfiguration extends IDateTimeOptionsConfiguration {
  String TokenBeforeDate();

  List<RegExp> SimpleCasesRegex();

  RegExp PrepositionRegex();

  RegExp TillRegex();

  RegExp SpecificTimeOfDayRegex();

  RegExp TimeOfDayRegex();

  RegExp FollowedUnit();

  RegExp NumberCombinedWithUnit();

  RegExp TimeUnitRegex();

  RegExp PreviousPrefixRegex();

  RegExp NextPrefixRegex();

  RegExp FutureSuffixRegex();

  RegExp WeekDayRegex();

  RegExp PeriodTimeOfDayWithDateRegex();

  RegExp RelativeTimeUnitRegex();

  RegExp RestOfDateTimeRegex();

  RegExp GeneralEndingRegex();

  RegExp MiddlePauseRegex();

  RegExp AmDescRegex();

  RegExp PmDescRegex();

  RegExp WithinNextPrefixRegex();

  RegExp DateUnitRegex();

  RegExp PrefixDayRegex();

  RegExp SuffixRegex();

  RegExp BeforeRegex();

  RegExp AfterRegex();

  RegExp TasksmodeMealTimeofDayRegex();

  bool CheckBothBeforeAfter();

  IExtractor CardinalExtractor();

  IDateTimeExtractor SingleDateExtractor();

  IDateTimeExtractor SingleTimeExtractor();

  IDateTimeExtractor SingleDateTimeExtractor();

  IDateTimeExtractor DurationExtractor();

  IDateTimeExtractor TimePeriodExtractor();

  IDateTimeExtractor TimeZoneExtractor();

  IDateTimeExtractor HolidayExtractor();

  int? GetFromTokenIndex(String text);

  bool HasConnectorToken(String text);

  int? GetBetweenTokenIndex(String text);
}
