import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/ago_later_util.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/numbers/number_constants.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseDateTimeExtractor implements IDateTimeExtractor {
  static String ExtractorName = DateTimeConstants.SYS_DATETIME_DATETIME; // "DateTime";

  BaseDateTimeExtractor(this.config);

  final IDateTimeExtractorConfiguration config;

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String text, DateTime reference) {
    final normalizedText = text.toLowerCase();

    var tokens = <Token>[];
    tokens.addAll(MergeDateAndTime(normalizedText, reference));

    if (config.options.match(DateTimeOptions.TasksMode)) {
      tokens.addAll(MergeHolidayAndTime(normalizedText, reference));
    }

    tokens.addAll(BasicRegexMatch(normalizedText));
    tokens.addAll(TimeOfTodayBefore(normalizedText, reference));
    tokens.addAll(TimeOfTodayAfter(normalizedText, reference));
    tokens.addAll(SpecialTimeOfDate(normalizedText, reference));
    tokens.addAll(DurationWithBeforeAndAfter(normalizedText, reference));

    return Token.mergeAllTokens(tokens, text, ExtractorName);
  }

  @override
  String getExtractorName() => ExtractorName;

  // Match "now"
  List<Token> BasicRegexMatch(String text) {
    var ret = <Token>[];

    // Handle "now"
    var matches = RegExpComposer.getMatchesSimple(config.NowRegExp(), text);
    for (final match in matches) {
      ret.add(Token(match.index, match.index + match.length));
    }

    return ret;
  }

  // Merge a Date entity and a Time entity, like "at 7 tomorrow"
  List<Token> MergeDateAndTime(String text, DateTime reference) {
    var ret = <Token>[];
    var dateErs = config.DatePointExtractor().extractDateTime(text, reference);
    if (dateErs.isEmpty) {
      return ret;
    }

    var timeErs = config.TimePointExtractor().extractDateTime(text, reference);
    var timeNumMatches = RegExpComposer.getMatchesSimple(config.NumberAsTimeRegExp(), text);
    if (timeErs.isEmpty && timeNumMatches.isEmpty) {
      return ret;
    }

    var ers = dateErs;
    ers.addAll(timeErs);

    // handle cases which use numbers as time points
    // only enabled in CalendarMode
    if ((config.options.match(DateTimeOptions.CalendarMode))) {
      var numErs = <ExtractResult>[];
      for (var idx = 0; idx < timeNumMatches.length; idx++) {
        var match = timeNumMatches[idx];
        var node = ExtractResult(
          start: match.index,
          length: match.length,
          text: match.value,
          type: Constants.SYS_NUM_INTEGER,
        );

        numErs.add(node);
      }

      ers.addAll(numErs);
    }

    // handle cases which use numbers + desc as time points
    if (timeNumMatches.any((match) => match.getGroup(DateTimeConstants.DescGroupName).length > 0)) {
      var numDescErs = <ExtractResult>[];
      for (var match in timeNumMatches.where((match) => match.getGroup(DateTimeConstants.DescGroupName).length > 0)) {
        var node = ExtractResult(
          start: match.index,
          length: match.length,
          text: match.value,
          type: DateTimeConstants.SYS_DATETIME_TIME,
        );

        numDescErs.add(node);
      }

      ers.addAll(numDescErs);
    }

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

      if ((ers[i].type == DateTimeConstants.SYS_DATETIME_DATE) && ers[j].type == DateTimeConstants.SYS_DATETIME_TIME ||
          (ers[i].type == DateTimeConstants.SYS_DATETIME_TIME && ers[j].type == DateTimeConstants.SYS_DATETIME_DATE) ||
          (ers[i].type == DateTimeConstants.SYS_DATETIME_DATE) && ers[j].type == Constants.SYS_NUM_INTEGER) {
        var middleBegin = ers[i].start + ers[i].length;
        var middleEnd = ers[j].start;
        if (middleBegin > middleEnd) {
          i = j + 1;
          continue;
        }

        var middleStr = text.substring(middleBegin, middleEnd).trim();
        var valid = false;

        // for cases like "tomorrow 3",  "tomorrow at 3"
        if (ers[j].type == Constants.SYS_NUM_INTEGER) {
          var match = RegExpComposer.getMatchesSimple(config.DateNumberConnectorRegExp(), middleStr).firstOrNull;
          if (middleStr.isEmpty || match != null) {
            valid = true;
          }
        } else {
          // For case like "3 pm or later on monday"
          var match = config.SuffixAfterRegExp().firstMatch(middleStr);
          if (match != null) {
            middleStr = middleStr.substring(match.start + match.length, middleStr.length - match.length).trim();
          }

          if (!(match != null && middleStr.isEmpty)) {
            if (config.IsConnector(middleStr)) {
              valid = true;
            }
          }
        }

        if (valid) {
          var begin = ers[i].start;
          var end = (ers[j].start) + (ers[j].length ?? 0);

          end = ExtendWithDateTimeAndYear(begin, end, text, reference);

          ret.add(Token(begin, end));
          i = j + 1;
          continue;
        }
      }

      i = j;
    }

    // Handle "in the afternoon" at the end of entity
    for (var idx = 0; idx < ret.length; idx++) {
      var afterStr = text.substring(ret[idx].end);
      var match = config.SuffixRegExp().firstMatch(afterStr);
      if (match != null) {
        ret[idx] = Token(ret[idx].start, ret[idx].end + match.length);
      }
    }

    // Handle "day" prefixes
    for (var idx = 0; idx < ret.length; idx++) {
      var beforeStr = text.substring(0, ret[idx].start);
      var match = config.UtilityConfiguration().commonDatePrefixRegExp().firstMatch(beforeStr);
      if (match != null) {
        ret[idx] = Token(ret[idx].start - match.length, ret[idx].end);
      }
    }

    return ret;
  }

  // Merge a Holiday entity and a Time entity, like "on christmas at 5"
  List<Token> MergeHolidayAndTime(String text, DateTime reference) {
    var ret = <Token>[];
    var dateErs = config.HolidayExtractor().extractDateTime(text, reference);
    if (dateErs.isEmpty) {
      return ret;
    }

    var timeErs = config.TimePointExtractor().extractDateTime(text, reference);
    var timeNumMatches = config.NumberAsTimeRegExp().allMatches(text).toList();
    if (timeErs.isEmpty && timeNumMatches.isEmpty) {
      return ret;
    }

    var ers = dateErs;
    ers.addAll(timeErs);

    // handle cases which use numbers as time points
    // only enabled in CalendarMode
    if (config.options.match(DateTimeOptions.CalendarMode)) {
      var numErs = <ExtractResult>[];
      for (var idx = 0; idx < timeNumMatches.length; idx++) {
        var match = timeNumMatches[idx];
        var node = ExtractResult(
          start: match.start,
          length: match.length,
          text: match.input.substring(match.start, match.end),
          type: Constants.SYS_NUM_INTEGER,
        );

        numErs.add(node);
      }

      ers.addAll(numErs);
    }

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

      if (((ers[i].type == DateTimeConstants.SYS_DATETIME_DATE) &&
              ers[j].type == DateTimeConstants.SYS_DATETIME_TIME) ||
          ((ers[i].type == DateTimeConstants.SYS_DATETIME_TIME) &&
              ers[j].type == DateTimeConstants.SYS_DATETIME_DATE) ||
          (ers[i].type == DateTimeConstants.SYS_DATETIME_DATE) && ers[j].type == Constants.SYS_NUM_INTEGER) {
        var middleBegin = ers[i].start + ers[i].length;
        var middleEnd = ers[j].start;
        if (middleBegin > middleEnd) {
          i = j + 1;
          continue;
        }

        var middleStr = text.substring(middleBegin, middleEnd - middleBegin).trim();
        var valid = false;

        // for cases like "christmas 3",  "chritmas at 3"
        if (ers[j].type == Constants.SYS_NUM_INTEGER) {
          var match = config.DateNumberConnectorRegExp().firstMatch(middleStr);
          if (middleStr.isEmpty || match != null) {
            valid = true;
          }
        } else {
          // For case like "3 pm or later on christmas"
          var match = config.SuffixAfterRegExp().firstMatch(middleStr);
          if (match != null) {
            middleStr = middleStr.substring(match.start + match.length, middleStr.length - match.length).trim();
          }

          if (!(match != null && middleStr.isEmpty)) {
            if (config.IsConnector(middleStr)) {
              valid = true;
            }
          }
        }

        if (valid) {
          var begin = ers[i].start;
          var end = (ers[j].start) + (ers[j].length);

          end = ExtendWithDateTimeAndYear(begin, end, text, reference);

          ret.add(Token(begin, end));
          i = j + 1;
          continue;
        }
      }

      i = j;
    }

    // Handle "in the afternoon" at the end of entity
    for (var idx = 0; idx < ret.length; idx++) {
      var afterStr = text.substring(ret[idx].end);
      var match = config.SuffixRegExp().firstMatch(afterStr);
      if (match != null) {
        ret[idx] = Token(ret[idx].start, ret[idx].end + match.length);
      }
    }

    // Handle "day" prefixes
    for (var idx = 0; idx < ret.length; idx++) {
      var beforeStr = text.substring(0, ret[idx].start);
      var match = config.UtilityConfiguration().commonDatePrefixRegExp().firstMatch(beforeStr);
      if (match != null) {
        ret[idx] = Token(ret[idx].start - match.length, ret[idx].end);
      }
    }

    return ret;
  }

  // Parses a specific time of today, tonight, this afternoon, like "seven this afternoon"
  List<Token> TimeOfTodayAfter(String text, DateTime reference) {
    var ret = <Token>[];

    var ers = config.TimePointExtractor().extractDateTime(text, reference);

    for (var er in ers) {
      var afterStr = text.substring(er.start + er.length);
      if (afterStr.isEmpty) {
        continue;
      }

      var match = config.TimeOfTodayAfterRegExp().firstMatch(afterStr);
      if (match != null) {
        var begin = er.start;
        var end = (er.start) + (er.length) + match.length;
        ret.add(Token(begin, end));
      }
    }

    var matches = config.SimpleTimeOfTodayAfterRegExp().allMatches(text);
    for (final match in matches) {
      ret.add(Token(match.start, match.start + match.length));
    }

    return ret;
  }

  // Parse a specific time of today, tonight, this afternoon, "this afternoon at 7"
  List<Token> TimeOfTodayBefore(String text, DateTime reference) {
    var ret = <Token>[];
    var ers = config.TimePointExtractor().extractDateTime(text, reference);
    for (var er in ers) {
      var beforeStr = text.substring(0, er.start);

      // handle "this morning at 7am"
      var innerMatch = config.TimeOfDayRegExp().matchBegin(er.text, true);

      if (innerMatch != null) {
        beforeStr = text.substring(0, (er.start) + innerMatch.length);
      }

      if (beforeStr.isEmpty) {
        continue;
      }

      var match = config.TimeOfTodayBeforeRegExp().firstMatch(beforeStr);
      if (match != null) {
        var begin = match.start;
        var end = er.start + er.length;
        ret.add(Token(begin, end));
      }
    }

    var matches = config.SimpleTimeOfTodayBeforeRegExp().allMatches(text);
    for (Match match in matches) {
      ret.add(Token(match.start, match.end));
    }

    return ret;
  }

  List<Token> SpecialTimeOfDate(String text, DateTime reference) {
    var ret = <Token>[];
    var ers = config.DatePointExtractor().extractDateTime(text, reference);

    // Handle "the end of the day"
    for (var er in ers) {
      var beforeStr = text.substring(0, er.start);

      var match = config.SpecificEndOfRegExp().matchEnd(beforeStr, true);
      if (match != null) {
        ret.add(Token(match.start, er.start + er.length));
      } else {
        var afterStr = text.substring(er.start + er.length);

        match = config.SpecificEndOfRegExp().matchBegin(afterStr, true);
        if (match != null) {
          ret.add(Token(er.start, er.start + er.length + match.start + match.length));
        }
      }
    }

    // Handle "eod, end of day"
    final eod = config.UnspecificEndOfRegExp().allMatches(text);
    for (Match match in eod) {
      ret.add(Token(match.start, match.end));
    }

    return ret;
  }

  // Process case like "two minutes ago" "three hours later"
  List<Token> DurationWithBeforeAndAfter(String text, DateTime reference) {
    var ret = <Token>[];

    var durationEr = config.DurationExtractor().extractDateTime(text, reference);
    for (var er in durationEr) {
      // if it is a multiple duration and its type is equal to Date then skip it.
      if (er.data != null && er.data.toString() == DateTimeConstants.MultipleDuration_Date) {
        continue;
      }

      var match = config.UnitRegExp().firstMatch(er.text);
      if (match == null) {
        continue;
      }

      ret = AgoLaterUtil.ExtractorDurationWithBeforeAndAfter(text, er, ret, config.UtilityConfiguration());
    }

    return ret;
  }

  // Handle case like "Wed Oct 26 15:50:06 2016" which year and month separated by time.
  int ExtendWithDateTimeAndYear(int startIndex, int endIndex, String text, DateTime reference) {
    // Check whether there's a year behind.
    var suffix = text.substring(endIndex);
    var matchYear = RegExpComposer.getMatchesSimple(config.YearSuffix(), suffix).firstOrNull;
    if (matchYear != null && matchYear.index == 0) {
      var checkYear =
          config.DatePointExtractor().getYearFromText(RegExpComposer.getMatchesSimple(config.YearRegExp(), text).first);
      var year = config.DatePointExtractor().getYearFromText(matchYear);
      if (year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum && checkYear == year) {
        return endIndex + matchYear.length;
      }
    }

    return endIndex;
  }
}

abstract interface class IDateTimeExtractorConfiguration extends IDateTimeOptionsConfiguration {
  RegExp NowRegExp();

  RegExp SuffixRegExp();

  RegExp TimeOfTodayAfterRegExp();

  RegExp SimpleTimeOfTodayAfterRegExp();

  RegExp TimeOfTodayBeforeRegExp();

  RegExp SimpleTimeOfTodayBeforeRegExp();

  RegExp TimeOfDayRegExp();

  RegExp SpecificEndOfRegExp();

  RegExp UnspecificEndOfRegExp();

  RegExp UnitRegExp();

  RegExp NumberAsTimeRegExp();

  RegExp DateNumberConnectorRegExp();

  RegExp YearRegExp();

  RegExp YearSuffix();

  RegExp SuffixAfterRegExp();

  IDateTimeExtractor DurationExtractor();

  IDateExtractor DatePointExtractor();

  IDateTimeExtractor TimePointExtractor();

  IExtractor integerExtractor();

  IDateTimeUtilityConfiguration UtilityConfiguration();

  IDateTimeExtractor HolidayExtractor();

  bool IsConnector(String text);
}
