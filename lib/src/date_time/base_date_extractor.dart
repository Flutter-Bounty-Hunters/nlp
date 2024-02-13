import 'package:nlp/nlp.dart';
import 'package:nlp/src/date_time/ago_later_util.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';
import 'package:nlp/src/numbers/number_constants.dart';
import 'package:nlp/src/regular_expressions/matching_util.dart';

class BaseDateExtractor implements IDateExtractor {
  BaseDateExtractor(this.config);

  final IDateExtractorConfiguration config;

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String input, DateTime reference) {
    return _performExtraction(input, reference);
  }

  @override
  String getExtractorName() {
    return DateTimeConstants.SYS_DATETIME_DATE;
  }

  @override
  int getYearFromText(NlpMatch match) {
    int year = DateTimeConstants.InvalidYear;

    final yearStr = match.getGroup("year").value;
    final writtenYearStr = match.getGroup("fullyear").value;

    if (yearStr.isNotEmpty && yearStr != writtenYearStr) {
      year = int.parse(yearStr);
      if (year < 100 && year >= DateTimeConstants.MinTwoDigitYearPastNum) {
        year += DateTimeConstants.BASE_YEAR_PAST_CENTURY;
      } else if (year >= 0 && year < DateTimeConstants.MaxTwoDigitYearFutureNum) {
        year += DateTimeConstants.BASE_YEAR_CURRENT_CENTURY;
      }
    } else {
      final firstTwoYearNumGroup = match.getGroup("firsttwoyearnum");
      final firstTwoYearNumStr = firstTwoYearNumGroup.value;
      if (firstTwoYearNumStr.isNotEmpty) {
        final er = ExtractResult(
          text: firstTwoYearNumStr,
          start: firstTwoYearNumGroup.index,
          length: firstTwoYearNumGroup.length,
        );

        final firstTwoYearNum = (config.numberParser().parse(er)?.value as double?)?.toInt() ?? 0;

        var lastTwoYearNum = 0;
        final lastTwoYearNumGroup = match.getGroup("lasttwoyearnum");
        final lastTwoYearNumStr = lastTwoYearNumGroup.value;
        if (lastTwoYearNumStr.isNotEmpty) {
          er.text = lastTwoYearNumStr;
          er.start = lastTwoYearNumGroup.index;
          er.length = lastTwoYearNumGroup.length;

          lastTwoYearNum = (config.numberParser().parse(er)?.value as double?)?.toInt() ?? 0;
        }

        // Exclude pure number like "nineteen", "twenty four"
        if ((firstTwoYearNum < 100 && lastTwoYearNum == 0) ||
            (firstTwoYearNum < 100 && firstTwoYearNum % 10 == 0 && lastTwoYearNumStr.trim().split(' ').length == 1)) {
          year = DateTimeConstants.InvalidYear;
          return year;
        }

        if (firstTwoYearNum >= 100) {
          year = firstTwoYearNum + lastTwoYearNum;
        } else {
          year = (firstTwoYearNum * 100) + lastTwoYearNum;
        }
      } else {
        if (writtenYearStr.isNotEmpty) {
          final fullYearGroup = match.getGroup("fullyear");

          final er = ExtractResult(
            text: writtenYearStr,
            start: fullYearGroup.index,
            length: fullYearGroup.length,
          );

          year = (config.numberParser().parse(er)?.value as double?)?.toInt() ?? 0;

          if (year < 100 && year >= DateTimeConstants.MinTwoDigitYearPastNum) {
            year += DateTimeConstants.BASE_YEAR_PAST_CENTURY;
          } else if (year >= 0 && year < DateTimeConstants.MaxTwoDigitYearFutureNum) {
            year += DateTimeConstants.BASE_YEAR_CURRENT_CENTURY;
          }
        }
      }
    }

    return year;
  }

  List<ExtractResult> _performExtraction(String text, DateTime reference) {
    var tokens = <Token>[];
    tokens.addAll(_basicRegExpMatch(text));
    tokens.addAll(_implicitDate(text));
    tokens.addAll(_numberWithMonth(text, reference));
    tokens.addAll(_extractRelativeDurationDate(text, tokens, reference));

    var results = Token.mergeAllTokens(tokens, text, getExtractorName());

    return results;
  }

  List<Token> _basicRegExpMatch(String text) {
    final results = <Token>[];

    for (final regex in config.dateRegExpList()) {
      final matches = RegExpComposer.getMatchesSimple(regex, text);

      for (final match in matches) {
        // some match might be part of the date range entity, and might be split in a wrong way
        if (DateUtil.validateMatch(match, text, config.dateRegExpList(), config.rangeConnectorSymbolRegExp())) {
          // Cases that the relative term is before the detected date entity, like "this 5/12", "next friday 5/12"
          var preText = text.substring(0, match.index);
          var relativeRegex = config.strictRelativeRegExp().matchEnd(preText, true);

          if (relativeRegex != null) {
            results.add(Token(relativeRegex.start, match.index + match.length));
          } else {
            results.add(Token(match.index, match.index + match.length));
          }
        }
      }
    }

    return results;
  }

  /// Matches cases like 'today', 'the day after tomorrow', 'on 13'.
  List<Token> _implicitDate(String text) {
    final ret = <Token>[];

    int i = 0;
    for (final regex in config.implicitDateList()) {
      ret.addAll(Token.getTokenFromRegex(regex, text));
      i++;
      if (i > 6) ;
    }

    return ret;
  }

  List<Token> _numberWithMonth(String text, DateTime reference) {
    final ret = <Token>[];

    var er = config.ordinalExtractor().extract(text);
    er.addAll(config.integerExtractor().extract(text));

    for (final result in er) {
      final num = int.tryParse((config.numberParser().parse(result)?.value ?? 0).toString());

      if (num == null || (num < 1 || num > 31)) {
        continue;
      }

      if (result.start >= 0) {
        // Handling cases like '(Monday,) Jan twenty two'
        final prefixStr = text.substring(0, result.start);

        // Check that the extracted number is not part of a decimal number, time expression or currency
        // (e.g. '123.24', '12:24', '$12')
        if (MatchingUtil.isInvalidDayNumberPrefix(prefixStr)) {
          continue;
        }

        final match = RegExpComposer.getMatchesSimple(config.monthEnd(), prefixStr).firstOrNull;
        if (match != null) {
          final startIndex = match.index;
          final endIndex = match.index + match.length + result.length;

          final monthGroup = match.getGroup("month");

          final (start, end) = _extendWithWeekdayAndYear(
              startIndex, endIndex, config.monthOfYear()[monthGroup.value] ?? reference.month, num, text, reference);

          ret.add(Token(start, end));
          continue;
        }

        // Handling cases like 'for the 25th'
        List<NlpMatch> matches = RegExpComposer.getMatchesSimple(config.forTheRegExp(), text);
        bool isFound = false;
        for (final matchCase in matches) {
          final group = matchCase.getGroup("DayOfMonth");

          var ordinalNum = group.value;
          if (ordinalNum == result.text) {
            final endGroup = matchCase.getGroup("end");
            var endLength = 0;
            if (endGroup.length > 0) {
              endLength = endGroup.length;
            }

            ret.add(Token(matchCase.index, matchCase.index + matchCase.length - endLength));
            isFound = true;
          }
        }

        if (isFound) {
          continue;
        }

        // Handling cases like 'Thursday the 21st', which both 'Thursday' and '21st' refer to a same date
        matches = RegExpComposer.getMatchesSimple(config.weekDayAndDayOfMonthRegExp(), text);

        for (final matchCase in matches) {
          final dayOfMonthGroup = matchCase.getGroup("DayOfMonth");
          var ordinalNum = dayOfMonthGroup.value;
          if (ordinalNum == result.text && dayOfMonthGroup.index == result.start) {
            // Get week of day for the ordinal number which is regarded as a date of reference month
            var date = DateTime(reference.year, reference.month, num);
            var numWeekDayInt = date.weekday;

            // Get week day from text directly, compare it with the weekday generated above
            // to see whether they refer to the same week day
            var extractedWeekDayStr = matchCase.getGroup("weekday").value;

            if (date != DateUtil.minValue() && numWeekDayInt == config.dayOfWeek()[extractedWeekDayStr]) {
              ret.add(Token(matchCase.index, matchCase.index + matchCase.length));

              isFound = true;
            }
          }
        }

        if (isFound) {
          continue;
        }

        // Handling cases like 'Monday 21', which both 'Monday' and '21' refer to the same date
        // The year of expected date can be different to the year of referenceDate.
        matches = RegExpComposer.getMatchesSimple(config.weekDayAndDayRegExp(), text);
        for (final matchCase in matches) {
          var matchLength = result.start + result.length - matchCase.index;

          if (matchLength == matchCase.length) {
            // check if day number is compatible with reference month
            if (DateUtil.isValidDate(reference.year, reference.month, num) || !config.checkBothBeforeAfter()) {
              ret.add(Token(matchCase.index, result.start + result.length));
              isFound = true;
            }
          }
        }

        if (isFound) {
          continue;
        }

        // Handling cases like '20th of next month'
        var suffixStr = text.substring(result.start + result.length);

        var beginMatch = RegExpComposer.matchBegin(config.relativeMonthRegExp(), suffixStr.trim(), true);

        if (beginMatch != null && beginMatch.index == 0) {
          var spaceLen = suffixStr.length - suffixStr.trim().length;
          var resStart = result.start;
          var resEnd = resStart + result.length + spaceLen + beginMatch.length;

          // Check if prefix contains 'the', include it if any
          var prefix = text.substring(0, resStart);
          var prefixMatch = config.prefixArticleRegExp().firstMatch(prefix);

          if (prefixMatch != null) {
            resStart = prefixMatch.start;
          }

          ret.add(Token(resStart, resEnd));
        }

        // Handling cases like 'second Sunday'
        suffixStr = text.substring(result.start + result.length);

        beginMatch = RegExpComposer.matchBegin(config.weekDayRegExp(), suffixStr.trim(), true);

        if (beginMatch != null &&
            num >= 1 &&
            num <= 5 &&
            result.type == Constants.SYS_NUM_ORDINAL &&
            (config.weekDayRegExp().matchBegin(result.text.trim(), true) == null ||
                config.weekDayRegExp().matchEnd(result.text.trim(), true) == null)) {
          var weekDayStr = beginMatch.getGroup("weekday").value;
          if (config.dayOfWeek().containsKey(weekDayStr)) {
            var spaceLen = suffixStr.length - suffixStr.trim().length;
            ret.add(Token(result.start, result.start + result.length + spaceLen + beginMatch.length));
          }
        }
      }

      // For cases like "I'll go back twenty second of June"
      if (result.start + result.length < text.length) {
        var afterStr = text.substring(result.start + result.length);

        var match = RegExpComposer.getMatchesSimple(config.ofMonth(), afterStr).firstOrNull;
        if (match != null) {
          var startIndex = result.start;
          var endIndex = (result.start + result.length) + match.length;

          final (start, end) = _extendWithWeekdayAndYear(startIndex, endIndex,
              config.monthOfYear()[match.getGroup("month").value] ?? reference.month, num, text, reference);

          ret.add(Token(start, end));
        }
      }
    }

    return ret;
  }

  List<Token> _extractRelativeDurationDate(String text, List<Token> tokens, DateTime reference) {
    final ret = <Token>[];

    var tempTokens = <Token>[...tokens];
    var durationEr = config.durationExtractor().extract(text);

    for (final er in durationEr) {
      // if it is a multiple duration but its type is not equal to Date, skip it here
      if (IsMultipleDuration(er) && !IsMultipleDurationDate(er)) {
        continue;
      }

      // Some types of duration can be compounded with "before", "after" or "from" suffix to create a "date"
      // While some other types of durations, when compounded with such suffix, it will not create a "date", but create a "dateperiod"
      // For example, durations like "3 days", "2 weeks", "1 week and 2 days", can be compounded with such suffix to create a "date"
      // But "more than 3 days", "less than 2 weeks", when compounded with such suffix, it will become cases like "more than 3 days from today" which is a "dateperiod", not a "date"
      // As this parent method is aimed to extract RelativeDurationDate, so for cases with "more than" or "less than", we remove the prefix so as to extract the expected RelativeDurationDate
      if (IsInequalityDuration(er)) {
        StripInequalityDuration(er);
      }

      var match = config.dateUnitRegExp().firstMatch(er.text);

      if (match != null) {
        AgoLaterUtil.ExtractorDurationWithBeforeAndAfter(text, er, ret, config.utilityConfiguration());
        //ret.addAll(extracted);

        // Take into account also holiday dates
        if (ret.isEmpty) {
          var holidayEr = config.holidayExtractor().extract(text);
          for (var holiday in holidayEr) {
            tempTokens.add(Token(holiday.start, (holiday.start + holiday.length)));
          }
        }

        // Check for combined patterns Duration + Date, e.g. '3 days before Monday', '4 weeks after January 15th'
        if (ret.isEmpty && tempTokens.isNotEmpty && er.text != match.input.substring(match.start, match.end)) {
          var afterStr = text.substring(er.start + er.length);
          var connector = config.beforeAfterRegExp().matchBegin(afterStr, true);
          if (connector != null) {
            for (var token in tempTokens) {
              var start = er.start + er.length + connector.start + connector.length;
              var length = token.start - start;
              if (length > 0 && start + length < text.length && text.substring(start, length).trim().isEmpty) {
                Token tok = Token(er.start, token.end);
                ret.add(tok);
              }
            }
          }
        }
      }
    }

    // Extract cases like "in 3 weeks", which equals to "3 weeks from today"
    var relativeDurationDateWithInPrefix = ExtractRelativeDurationDateWithInPrefix(text, durationEr, reference);

    // For cases like "in 3 weeks from today", we should choose "3 weeks from today" as the extract result rather than "in 3 weeks" or "in 3 weeks from today"
    for (var extractResultWithInPrefix in relativeDurationDateWithInPrefix) {
      if (!IsOverlapWithExistExtractions(extractResultWithInPrefix, ret)) {
        ret.add(extractResultWithInPrefix);
      }
    }

    // Extend extraction with weekdays like in "Friday two weeks from now", "in 3 weeks on Monday"
    ret.addAll(ExtendWithWeekDay(ret, text));

    return ret;
  }

  List<Token> ExtractRelativeDurationDateWithInPrefix(String text, List<ExtractResult> durationEr, DateTime reference) {
    var ret = <Token>[];

    var durations = <Token>[];

    for (var durationExtraction in durationEr) {
      var match = config.dateUnitRegExp().firstMatch(durationExtraction.text);
      if (match != null) {
        durations.add(Token(durationExtraction.start, durationExtraction.start + durationExtraction.length));
      }
    }

    for (var duration in durations) {
      var beforeStr = text.substring(0, duration.start);
      var afterStr = text.substring(duration.start + duration.length);

      if (beforeStr.trim().isEmpty && afterStr.trim().isEmpty) {
        continue;
      }

      final inConnectorTokens = ExtractInConnector(text, beforeStr, afterStr, duration, true);

      ret.addAll(inConnectorTokens);

      // Check also afterStr
      if (inConnectorTokens.isEmpty && config.checkBothBeforeAfter()) {
        ret.addAll(ExtractInConnector(text, afterStr, beforeStr, duration, false));
      }
    }

    return ret;
  }

  List<Token> ExtractInConnector(String text, String firstStr, String secondStr, Token duration, bool inPrefix) {
    final ret = <Token>[];

    var match = inPrefix
        ? config.inConnectorRegExp().matchEnd(firstStr, true)
        : config.inConnectorRegExp().matchBegin(firstStr, true);

    if (match != null) {
      var rangeUnitMatch = config.rangeUnitRegExp().firstMatch(text.substring(duration.start, duration.end));

      if (rangeUnitMatch != null) {
        var sinceYearMatch = config.sinceYearSuffixRegExp().firstMatch(secondStr);

        if (sinceYearMatch != null) {
          var start = inPrefix ? match.start : sinceYearMatch.start;
          var end = inPrefix ? duration.end + sinceYearMatch.length : duration.end + match.start + match.length;
          ret.add(Token(start, end));
        } else {
          var start = inPrefix ? match.start : duration.start;
          var end = inPrefix ? duration.end : duration.end + match.start + match.length;
          ret.add(Token(start, end));
        }
      }
    }

    return ret;
  }

  static bool IsOverlapWithExistExtractions(Token er, List<Token> existErs) {
    for (var existEr in existErs) {
      if (er.start < existEr.end && er.end > existEr.start) {
        return true;
      }
    }

    return false;
  }

  List<Token> ExtendWithWeekDay(List<Token> ret, String text) {
    var newRet = <Token>[];
    for (var er in ret) {
      var beforeStr = text.substring(0, er.start);
      var afterStr = text.substring(er.end);
      var beforeMatch = config.weekDayEnd().firstMatch(beforeStr);
      var afterMatch = config.weekDayStart().firstMatch(afterStr);
      if (beforeMatch != null || afterMatch != null) {
        var start = beforeMatch != null ? beforeMatch.start : er.start;
        var end = beforeMatch != null ? er.end : er.end + afterMatch!.start + afterMatch.length;
        Metadata metadata = Metadata(isDurationWithBeforeAndAfter: true);
        Token tok = Token(start, end, "", metadata);
        newRet.add(tok);
      }
    }

    return newRet;
  }

  (bool success, int index, int year) GetYearIndex(String affix, bool inPrefix) {
    int index = 0;
    int year = 0;

    final matchYear = RegExpComposer.getMatchesSimple(config.yearSuffix(), affix).firstOrNull;

    final success = !inPrefix
        ? matchYear != null && matchYear.index == 0
        : matchYear != null && matchYear.length == affix.trimRight().length;

    if (!success) {
      return (false, 0, 0);
    }

    year = getYearFromText(matchYear);

    if (year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum) {
      index = !inPrefix ? matchYear.length : matchYear.length + (affix.length - affix.trimRight().length);
    }

    return (success, index, year);
  }

  (int start, int end) _extendWithWeekdayAndYear(
      int startIndex, int endIndex, int month, int day, String text, DateTime reference) {
    var year = reference.year;

    // Check whether there's a year
    var suffix = text.substring(endIndex);
    var prefix = text.substring(0, startIndex);

    final (bool success, int index, int extractedYear) = GetYearIndex(suffix, false);

    if (success) {
      endIndex += index;
      year = extractedYear;
    }

    // Check also in prefix
    if (!success && config.checkBothBeforeAfter()) {
      final (bool success, int index, int extractedYear) = GetYearIndex(prefix, true);
      if (success) {
        startIndex -= index;
        year = extractedYear;
      }
    }

    var date = DateTime(year, month, day);

    // Check whether there's a weekday
    bool isMatchInSuffix = false;
    var matchWeekDay = RegExpComposer.getMatchesSimple(config.weekDayEnd(), prefix).firstOrNull;

    // Check for weekday in the suffix
    if (matchWeekDay == null) {
      matchWeekDay = RegExpComposer.getMatchesSimple(config.weekDayStart(), suffix).firstOrNull;
      isMatchInSuffix = matchWeekDay != null;
    }

    if (matchWeekDay != null) {
      // Get weekday from context directly, compare it with the weekday extraction above
      // to see whether they reference the same weekday
      final weekDayGroup = matchWeekDay.getGroup("weekday");
      var extractedWeekDayStr = weekDayGroup.value;
      //var numWeekDayStr = date.DayOfWeek.ToString().ToLowerInvariant();

      final weekDay1 = date.weekday == 7 ? 0 : date.weekday;
      final weekDay2 = config.dayOfWeek()[extractedWeekDayStr];
      if (weekDay2 != null) {
        if (date != DateUtil.minValue() && weekDay1 == weekDay2) {
          if (!isMatchInSuffix) {
            startIndex = matchWeekDay.index;
          } else {
            endIndex += matchWeekDay.length;
          }
        }
      }
    }

    return (startIndex, endIndex);
  }

  static bool IsMultipleDuration(ExtractResult er) {
    return er.data != null && er.data.toString().startsWith(DateTimeConstants.MultipleDuration_Prefix);
  }

  static bool IsMultipleDurationDate(ExtractResult er) {
    return er.data?.toString() == DateTimeConstants.MultipleDuration_Date;
  }

  static bool IsInequalityDuration(ExtractResult er) {
    return er.data?.toString() == DateTimeConstants.MORE_THAN_MOD ||
        er.data?.toString() == DateTimeConstants.LESS_THAN_MOD;
  }

  void StripInequalityDuration(ExtractResult er) {
    if (config.checkBothBeforeAfter()) {
      StripInequality(er, config.moreThanRegExp(), false);
      StripInequality(er, config.lessThanRegExp(), false);
    } else {
      StripInequality(er, config.moreThanRegExp(), true);
      StripInequality(er, config.lessThanRegExp(), true);
    }
  }

  static void StripInequality(ExtractResult er, RegExp regex, bool inPrefix) {
    if (regex.hasMatch(er.text)) {
      var originalLength = er.text.length;
      er.text = er.text.replaceAll(regex, "").trim();
      if (inPrefix) {
        er.start += originalLength - er.text.length;
      }

      er.length = er.text.length;
      er.data = "";
    }
  }
}

abstract class IDateExtractorConfiguration extends IDateTimeOptionsConfiguration {
  List<RegExp> dateRegExpList();

  List<RegExp> implicitDateList();

  bool checkBothBeforeAfter();

  RegExp ofMonth();

  RegExp monthEnd();

  RegExp weekDayEnd();

  RegExp weekDayStart();

  RegExp dateUnitRegExp();

  RegExp forTheRegExp();

  RegExp weekDayAndDayOfMonthRegExp();

  RegExp weekDayAndDayRegExp();

  RegExp relativeMonthRegExp();

  RegExp strictRelativeRegExp();

  RegExp weekDayRegExp();

  RegExp prefixArticleRegExp();

  RegExp yearSuffix();

  RegExp moreThanRegExp();

  RegExp lessThanRegExp();

  RegExp inConnectorRegExp();

  RegExp sinceYearSuffixRegExp();

  RegExp rangeUnitRegExp();

  RegExp rangeConnectorSymbolRegExp();

  RegExp beforeAfterRegExp();

  IExtractor integerExtractor();

  IExtractor ordinalExtractor();

  IParser numberParser();

  IDateTimeExtractor durationExtractor();

  IDateTimeExtractor holidayExtractor();

  IDateTimeUtilityConfiguration utilityConfiguration();

  Map<String, int> dayOfWeek(); // should be immutable

  Map<String, int> monthOfYear(); // should be immutable
}

abstract class IDateTimeOptionsConfiguration implements IOptionsConfiguration {}
