import 'dart:math';

import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/numbers/numbers.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseSetExtractor implements IDateTimeExtractor {
  BaseSetExtractor(this.config);

  final ISetExtractorConfiguration config;

  @override
  String getExtractorName() => DateTimeConstants.SYS_DATETIME_SET;

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String input, DateTime reference) {
    final text = input.toLowerCase();

    var tokens = <Token>[];
    tokens.addAll(MatchEachUnit(text));
    tokens.addAll(MatchEachDuration(text, reference));
    tokens.addAll(TimeEveryday(text, reference));

    if (config.options.match(DateTimeOptions.TasksMode)) {
      tokens.addAll(DayEveryweek(text, reference));
    }

    tokens.addAll(MatchEach(config.DateExtractor(), text, reference));
    tokens.addAll(MatchEach(config.TimeExtractor(), text, reference));
    tokens.addAll(MatchEach(config.DateTimeExtractor(), text, reference));
    tokens.addAll(MatchEach(config.DatePeriodExtractor(), text, reference));
    tokens.addAll(MatchEach(config.TimePeriodExtractor(), text, reference));
    tokens.addAll(MatchEach(config.DateTimePeriodExtractor(), text, reference));

    return Token.mergeAllTokens(tokens, text, getExtractorName());
  }

  List<Token> MatchEachDuration(String text, DateTime reference) {
    var ret = <Token>[];

    var ers = config.DurationExtractor().extractDateTime(text, reference);
    for (var er in ers) {
      // "each last summer" doesn't make sense
      if (config.LastRegex().hasMatch(er.text)) {
        continue;
      }

      var beforeStr = text.substring(0, er.start);
      var match = config.EachPrefixRegex().firstMatch(beforeStr);
      if (match != null) {
        ret.add(Token(match.start, er.start + er.length));
      }
    }

    return ret;
  }

  // every month, weekly, quarterly etc
  List<Token> MatchEachUnit(String text) {
    var ret = <Token>[];

    // handle "daily", "monthly"
    var matches = RegExpComposer.getMatchesSimple(config.PeriodicRegex(), text);
    for (final match in matches) {
      ret.add(Token(match.index, match.index + match.length));
    }

    // handle "each month"
    matches = RegExpComposer.getMatchesSimple(config.EachUnitRegex(), text);
    for (final match in matches) {
      if (match.getGroup("unit").value == "month") {
        var beforeStr = text.substring(0, match.index);
        var dayMatch = config.BeforeEachDayRegex().firstMatch(beforeStr);

        if (dayMatch != null) {
          ret.add(Token(dayMatch.start, match.index + match.length));
        } else {
          ret.add(Token(match.index, match.index + match.length));
        }
      } else {
        ret.add(Token(match.index, match.index + match.length));
      }
    }

    return ret;
  }

  List<Token> TimeEveryday(String text, DateTime reference) {
    var ret = <Token>[];
    var ers = config.TimeExtractor().extractDateTime(text, reference);

    if (config.options.match(DateTimeOptions.TasksMode)) {
      var ersTimePeriod = config.TimePeriodExtractor().extractDateTime(text, reference);
      if (ers.isEmpty && ersTimePeriod.length == 1) {
        ers = ersTimePeriod;
      }
    }

    for (var er in ers) {
      var afterStr = text.substring(er.start + er.length ?? 0);
      var beforeStr = text.substring(0, er.start ?? 0);
      var beforeMatch = config.EachDayRegex().firstMatch(beforeStr);
      if (beforeMatch != null) {
        var startIndexBeforeMatch = beforeMatch.end - beforeMatch.value.trimLeft().length;
        ret.add(Token(startIndexBeforeMatch, er.start + er.length ?? 0));
      }

      var match = config.EachDayRegex().firstMatch(afterStr);
      if (match != null) {
        ret.add(Token(er.start ?? 0, (er.start + er.length ?? 0) + match.length + match.start));
      }
    }

    return ret;
  }

  // Handle cases like 19th of every month: For now specific to TasksMode
  List<Token> DayEveryweek(String text, DateTime reference) {
    var ret = <Token>[];
    var ers = config.DateExtractor().extractDateTime(text, reference);

    // @TODO change call to the Number recognizer, it has to config specific.
    if (OrdinalExtractor.getInstance().extract(text).isNotEmpty) {
      return ret;
    }

    if (ers.length != 1) {
      return ret;
    }

    for (var er in ers) {
      var afterStr = text.substring(er.start + er.length ?? 0);
      var beforeStr = text.substring(0, er.start ?? 0);
      var beforeMatch = MatchEachUnit(beforeStr);
      var timeBeforeErs = config.TimeExtractor().extractDateTime(beforeStr, reference);
      var timePeriodBeforeErs = config.TimePeriodExtractor().extractDateTime(beforeStr, reference);
      if (timeBeforeErs.isEmpty && (timePeriodBeforeErs.isNotEmpty)) {
        timeBeforeErs = timePeriodBeforeErs;
      }

      var match = MatchEachUnit(afterStr);
      var timeErs = config.TimeExtractor().extractDateTime(afterStr, reference);
      var timePeriodErs = config.TimePeriodExtractor().extractDateTime(afterStr, reference);
      if (timeErs.isEmpty && (timePeriodErs.isNotEmpty)) {
        timeErs = timePeriodErs;
      }

      if (beforeMatch.length > 0) {
        var beforeMatchInd = beforeMatch[0].start;
        if (timeBeforeErs.isNotEmpty) {
          beforeMatchInd = min(beforeMatchInd, timeBeforeErs[0].start);
        }

        var erEnd = er.start + er.length ?? 0;
        if (timeErs.isNotEmpty) {
          erEnd += timeErs[0].start + timeErs[0].length;
        }

        ret.add(Token(beforeMatchInd, erEnd));
      }

      if (match.length > 0) {
        var matchInd = match[0].length + match[0].start;
        if (timeErs.isNotEmpty) {
          matchInd = max(matchInd, timeErs[0].start + timeErs[0].length);
        }

        var erStart = er.start ?? 0;
        if (timeBeforeErs.isNotEmpty) {
          erStart = min(erStart, timeBeforeErs[0].start);
        }

        ret.add(Token(erStart, (er.start + er.length ?? 0) + matchInd));
      }
    }

    return ret;
  }

  List<Token> MatchEach(IDateTimeExtractor extractor, String text, DateTime reference) {
    var ret = <Token>[];
    var matches = RegExpComposer.getMatchesSimple(config.SetEachRegex(), text);

    for (final match in matches) {
      // "3pm *each* day"
      var trimmedText = text.replaceRange(match.index, match.index + match.length, '');

      var ers = extractor.extractDateTime(trimmedText, reference);
      for (var er in ers) {
        if (er.start <= match.index && (er.start + er.length) > match.index) {
          ret.add(Token(er.start ?? 0, (er.start + match.length + er.length) ?? 0));
        }
      }
    }

    // handle "Mondays"
    matches = RegExpComposer.getMatchesSimple(config.SetWeekDayRegex(), text);
    for (final match in matches) {
      (String, int) weekdayTuple = config.WeekDayGroupMatchTuple(match);
      String weekday = weekdayTuple.$1;
      int del = weekdayTuple.$2;

      var trimmedText = text.replaceRange(match.index, match.index + match.length, '');
      trimmedText = trimmedText.substring(0, match.index) + weekday + trimmedText.substring(match.index);
      //trimmedText = trimmedText.Insert(match.index, weekday);

      var ers = extractor.extractDateTime(trimmedText, reference);
      for (var er in ers) {
        if (er.start <= match.index && er.text.contains(match.getGroup("weekday").value)) {
          var len = (er.length ?? 0) + del;
          if (match.getGroup(DateTimeConstants.PrefixGroupName).value.length > 0) {
            len += match.getGroup(DateTimeConstants.PrefixGroupName).value.length;
          }

          if (match.getGroup(DateTimeConstants.SuffixGroupName).value.isNotEmpty) {
            len += match.getGroup(DateTimeConstants.SuffixGroupName).value.length;
          }

          ret.add(Token(er.start ?? 0, er.start + len ?? 0));
        }
      }
    }

    return ret;
  }
}

abstract interface class ISetExtractorConfiguration extends IDateTimeOptionsConfiguration {
  RegExp LastRegex();

  RegExp EachPrefixRegex();

  RegExp PeriodicRegex();

  RegExp EachUnitRegex();

  RegExp EachDayRegex();

  RegExp BeforeEachDayRegex();

  RegExp SetWeekDayRegex();

  RegExp SetEachRegex();

  bool CheckBothBeforeAfter();

  IDateTimeExtractor DurationExtractor();

  IDateTimeExtractor TimeExtractor();

  IDateExtractor DateExtractor();

  IDateTimeExtractor DateTimeExtractor();

  IDateTimeExtractor DatePeriodExtractor();

  IDateTimeExtractor TimePeriodExtractor();

  IDateTimeExtractor DateTimePeriodExtractor();

  (String, int) WeekDayGroupMatchTuple(NlpMatch match);
}
