import 'dart:math';

import 'package:nlp/nlp.dart';

import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/ago_later_util.dart';
import 'package:nlp/src/date_time/date_context.dart';
import 'package:nlp/src/date_time/date_parser_configuration.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_util.dart';

class BaseDateParser implements IDateTimeParser {
  BaseDateParser(this.config);

  final IDateParserConfiguration config;

  @override
  String getParserName() => DateTimeConstants.SYS_DATETIME_DATE;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime reference) {
    var referenceDate = reference;

    final normalizedText = er.text.toLowerCase();

    Object? value;
    if (er.type == getParserName()) {
      var innerResult = ParseBasicRegexMatch(normalizedText, referenceDate);
      if (!innerResult.success) {
        innerResult = ParseImplicitDate(normalizedText, referenceDate);
      }

      if (!innerResult.success && ((config.options.match(DateTimeOptions.TasksMode)))) {
        innerResult = ParseTasksModeDurationToDatePattern(normalizedText, referenceDate);
      }

      if (!innerResult.success) {
        innerResult = ParseWeekdayOfMonth(normalizedText, referenceDate);
      }

      if (!innerResult.success) {
        innerResult = ParseDurationWithAgoAndLater(normalizedText, referenceDate);
      }

      if (!innerResult.success) {
        innerResult = ParseDurationWithDate(normalizedText, referenceDate);
      }

      // NumberWithMonth must be the second last one, because it only need to find a number and a month to get a "success"
      if (!innerResult.success) {
        innerResult = ParseNumberWithMonth(normalizedText, referenceDate);
      }

      // SingleNumber last one
      if (!innerResult.success) {
        innerResult = ParseSingleNumber(normalizedText, referenceDate);
      }

      // In cases like "Monday two weeks from now", the resolution of "two weeks from now" needs to be shifted
      // to correspond to the weekday "Monday".
      if (innerResult.success && er.metadata != null && er.metadata?.isDurationDateWithWeekday == true) {
        innerResult = SwiftResolutionByWeekday(innerResult, normalizedText);
      }

      if (innerResult.success) {
        innerResult.futureResolution = <String, String>{
          TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(innerResult.futureValue as DateTime),
        };

        innerResult.pastResolution = <String, String>{
          TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(innerResult.pastValue as DateTime),
        };

        value = innerResult;
      }
    }

    var ret = DateTimeParseResult(
      text: er.text,
      start: er.start,
      length: er.length,
      type: er.type,
      data: er.data,
      value: value,
      timexStr: value == null ? "" : (value as DateTimeResolutionResult).timex,
      resolutionStr: "",
    );

    return ret;
  }

  // Parse basic patterns in DateRegexList
  DateTimeResolutionResult ParseBasicRegexMatch(String text, DateTime referenceDate) {
    var trimmedText = text.trim();

    for (var regex in config.dateRegexes()) {
      int offset = 0;
      String? relativeStr;

      NlpMatch? match = RegExpComposer.getMatchesSimple(regex, trimmedText).firstOrNull;

      if (match == null) {
        match = RegExpComposer.getMatchesSimple(regex, config.dateTokenPrefix() + trimmedText).firstOrNull;

        // Handing cases like "(this)? 5.12" which only be recognized in "on (this)? 5.12"
        if (match != null) {
          offset = config.dateTokenPrefix().length;
          relativeStr = match.getGroup("order").value;
        }
      }

      if (match != null) {
        var relativeRegex = config.strictRelativeRegExp().matchEnd(text.substring(0, match.index), true);

        if ((match.index == offset && match.length == trimmedText.length) ||
            (relativeRegex != null && match.index + match.length == trimmedText.length)) {
          // Handing cases which contain relative term like "this 5/12"
          if (match.index != offset && relativeRegex != null) {
            relativeStr = relativeRegex.input.substring(relativeRegex.start, relativeRegex.end);
          }

          // Value string will be set in Match2Date method
          var ret = Match2Date(match, referenceDate, relativeStr ?? '');

          return ret;
        }
      }
    }

    return DateTimeResolutionResult();
  }

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) {
    // TODO: implement filterResults
    throw UnimplementedError();
  }

  // Parse a regex match which includes 'day', 'month' and 'year' (optional) group
  DateTimeResolutionResult Match2Date(NlpMatch match, DateTime referenceDate, String relativeStr) {
    var ret = DateTimeResolutionResult();
    int month = 0, day = 0, year = 0;

    var monthStr = match.getGroup("month").value;
    var dayStr = match.getGroup("day").value;
    var weekdayStr = match.getGroup("weekday").value;
    var yearStr = match.getGroup("year").value;
    var writtenYear = match.getGroup("fullyear").value;
    var ambiguousCentury = false;

    if (config.monthOfYear().containsKey(monthStr) && config.dayOfMonth().containsKey(dayStr)) {
      month = config.monthOfYear()[monthStr]!;
      day = config.dayOfMonth()[dayStr]!;

      if (writtenYear.isNotEmpty) {
        year = config.dateExtractor().getYearFromText(match);
      } else if (yearStr.isNotEmpty) {
        year = int.parse(yearStr);
        if (year < 100 && year >= DateTimeConstants.MinTwoDigitYearPastNum) {
          year += DateTimeConstants.BASE_YEAR_PAST_CENTURY;
        } else if (year >= 0 && year < DateTimeConstants.MaxTwoDigitYearFutureNum) {
          year += DateTimeConstants.BASE_YEAR_CURRENT_CENTURY;
        } else if (year >= DateTimeConstants.MaxTwoDigitYearFutureNum &&
            year < DateTimeConstants.MinTwoDigitYearPastNum) {
          // Two-digit years in the range [30, 40) are ambiguos
          ambiguousCentury = true;
        }
      }
    }

    var noYear = false;
    if (year == 0) {
      year = referenceDate.year;
      if (relativeStr.isNotEmpty) {
        var swift = config.getSwiftMonthOrYear(relativeStr);

        // @TODO Improve handling of next/last in particular cases "next friday 5/12" when the next friday is not 5/12.
        if (weekdayStr.isNotEmpty) {
          swift = 0;
        }

        year += swift;
      } else {
        noYear = true;
      }

      ret.timex = DateTimeFormatUtil.luisDateFromComponents(-1, month, day);
    } else {
      ret.timex = DateTimeFormatUtil.luisDateFromComponents(year, month, day);
    }

    var (future, past) = DateContext.GenerateDates(noYear, referenceDate, year, month, day);
    ret.futureValue = future;
    ret.pastValue = past;
    ret.success = true;

    // Ambiguous two-digit years are assigned values in both centuries (e.g. 35 -> 1935, 2035)
    if (ambiguousCentury) {
      ret.pastValue = past.AddYears(DateTimeConstants.BASE_YEAR_PAST_CENTURY);
      ret.futureValue = future.AddYears(DateTimeConstants.BASE_YEAR_CURRENT_CENTURY);
      ret.timex = TimexUtility.modifyAmbiguousCenturyTimex(ret.timex!);
    }

    return ret;
  }

  /*
     under tasksmode parse addtitonal Implicit date references under tasksmode.
     eg next week will get mapped to same day of next week,
     next month will get mapped to starting day of comming month,
     next year will get mapped to starting date of coming year.

     Input text : meet me next week (refrence time 01-08-2022)
     Tasksmode: next week --> 08-08-2022 datetime type: date
     Default mode: next week --> (08-08-2022 - 15-08-2022) datetime type: daterange
  */
  DateTimeResolutionResult ParseTasksModeDurationToDatePattern(String text, DateTime referenceDate) {
    var trimmedText = text.trim();
    var ret = DateTimeResolutionResult();

    var match = RegExpComposer.getMatchesSimple(config.tasksModeDurationToDatePatterns(), trimmedText).firstOrNull;
    if (match != null) {
      if (match.getGroup("week").value.trim().isNotEmpty) {
        var value = referenceDate.AddDays(TasksModeConstants.WeekDayCount);
        ret.timex = DateTimeFormatUtil.luisDateFromDateTime(value);
        ret.futureValue = ret.pastValue = DateTime(value.year, value.month, value.day);
        ret.success = true;
        return ret;
      } else if (match.getGroup("month").value.trim().isNotEmpty) {
        var value = referenceDate.AddMonths(1);
        ret.timex = DateTimeFormatUtil.luisDateFromComponents(value.year, value.month, 1);
        ret.futureValue = ret.pastValue = DateTime(value.year, value.month, 1);
        ret.success = true;
        return ret;
      } else if (match.getGroup("year").value.trim().isNotEmpty) {
        var value = referenceDate.AddYears(1);
        ret.timex = DateTimeFormatUtil.luisDateFromComponents(value.year, 1, 1);
        ret.futureValue = ret.pastValue = DateTime(value.year, 1, 1);
        ret.success = true;
        return ret;
      }
    }

    return ret;
  }

  DateTimeResolutionResult ParseWeekdayOfMonth(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();

    var trimmedText = text.trim();
    var match = RegExpComposer.getMatchesSimple(config.weekDayOfMonthRegExp(), trimmedText).firstOrNull;
    if (match == null) {
      return ret;
    }

    var cardinalStr = match.getGroup("cardinal").value;
    var weekdayStr = match.getGroup("weekday").value;
    var monthStr = match.getGroup("month").value;
    var noYear = false;
    int year;

    var cardinal = config.isCardinalLast(cardinalStr) ? 5 : config.cardinalMap()[cardinalStr]!;

    var weekday = config.dayOfWeek()[weekdayStr]!;
    int month;
    if (monthStr.isEmpty) {
      var swift = config.getSwiftMonthOrYear(trimmedText);

      month = referenceDate.AddMonths(swift).month;
      year = referenceDate.AddMonths(swift).year;
    } else {
      month = config.monthOfYear()[monthStr]!;
      year = referenceDate.year;
      noYear = true;
    }

    var value = computeDate(cardinal, weekday, month, year);
    if (value.month != month) {
      cardinal -= 1;
      value = value.subtract(Duration(days: 7));
    }

    var futureDate = value;
    var pastDate = value;
    if (noYear && futureDate.isBefore(referenceDate)) {
      futureDate = computeDate(cardinal, weekday, month, year + 1);
      if (futureDate.month != month) {
        futureDate = futureDate.subtract(Duration(days: 7));
      }
    }

    if (noYear && !referenceDate.isAfter(pastDate)) {
      pastDate = computeDate(cardinal, weekday, month, year - 1);
      if (pastDate.month != month) {
        pastDate = pastDate.subtract(Duration(days: 7));
      }
    }

    // Here is a very special case, timeX follow future date
    ret.timex = "XXXX-${month.toString().padLeft(2, "0")}-WXX-$weekday-#$cardinal";
    ret.futureValue = futureDate;
    ret.pastValue = pastDate;
    ret.success = true;

    return ret;
  }

  static DateTime computeDate(int cardinal, int weekday, int month, int year) {
    var firstDay = DateUtil.createSafeDate(year, month, 1);
    var firstWeekday = firstDay.This(weekday);
    int dayOfWeekOfFirstDay = firstDay.weekday;

    if (weekday == 0) {
      weekday = 7;
    }

    if (dayOfWeekOfFirstDay == 0) {
      dayOfWeekOfFirstDay = 7;
    }

    if (weekday < dayOfWeekOfFirstDay) {
      firstWeekday = firstDay.Next(weekday);
    }

    return firstWeekday.AddDays(7 * (cardinal - 1));
  }

  // Handle cases like "two days ago"
  DateTimeResolutionResult ParseDurationWithAgoAndLater(String text, DateTime referenceDate) {
    return AgoLaterUtil.ParseDurationWithAgoAndLater(
        text,
        referenceDate,
        config.durationExtractor(),
        config.durationParser(),
        config.numberParser(),
        config.unitMap(),
        config.unitRegExp(),
        config.utilityConfiguration(),
        GetSwiftDay);
  }

  int GetSwiftDay(String text) {
    var trimmedText = config.normalize(text.trim());
    var swift = 0;

    var match = config.relativeDayRegExp().firstMatch(text);

    // The sequence here is important
    // As suffix "day before yesterday" should be matched before suffix "day before" or "yesterday"
    if (config.sameDayTerms().contains(trimmedText)) {
      swift = 0;
    } else if (EndsWithTerms(trimmedText, config.plusTwoDayTerms())) {
      swift = 2;
    } else if (EndsWithTerms(trimmedText, config.minusTwoDayTerms())) {
      swift = -2;
    } else if (EndsWithTerms(trimmedText, config.plusOneDayTerms())) {
      swift = 1;
    } else if (EndsWithTerms(trimmedText, config.minusOneDayTerms())) {
      swift = -1;
    } else if (match != null) {
      swift = GetSwift(text);
    }

    return swift;
  }

  int GetSwift(String text) {
    var trimmedText = text.trim();

    var swift = 0;
    if (config.nextPrefixRegExp().hasMatch(trimmedText)) {
      swift = 1;
    } else if (config.previousPrefixRegExp().hasMatch(trimmedText)) {
      swift = -1;
    }

    return swift;
  }

  static bool EndsWithTerms(String text, List<String> terms) {
    var result = false;

    for (var term in terms) {
      if (text.endsWith(term)) {
        result = true;
        break;
      }
    }

    return result;
  }

// Match several other cases
  // Including 'today', 'the day after tomorrow', 'on 13'
  DateTimeResolutionResult ParseImplicitDate(String text, DateTime referenceDate) {
    var trimmedText = text.trim();

    var ret = DateTimeResolutionResult();

    // Handle "on 12"
    var match = RegExpComposer.getMatchesSimple(config.onRegExp(), config.dateTokenPrefix() + trimmedText).firstOrNull;
    if (match != null && match.index == 3 && match.length == trimmedText.length) {
      int month = referenceDate.month, year = referenceDate.year;
      var dayStr = match.getGroup("day").value;
      var day = config.dayOfMonth()[dayStr]!;

      ret.timex = DateTimeFormatUtil.luisDateFromComponents(-1, -1, day);

      DateTime futureDate, pastDate;
      var tryStr = DateTimeFormatUtil.luisDateFromComponents(year, month, day);
      if (DateTime.tryParse(tryStr) != null) {
        futureDate = DateUtil.createSafeDate(year, month, day);
        pastDate = DateUtil.createSafeDate(year, month, day);

        if (futureDate.isBefore(referenceDate)) {
          futureDate = futureDate.AddMonths(1);
        }

        if (!referenceDate.isAfter(pastDate)) {
          pastDate = pastDate.AddMonths(-1);
        }
      } else {
        futureDate = DateUtil.createSafeDate(year, month + 1, day);
        pastDate = DateUtil.createSafeDate(year, month - 1, day);
      }

      ret.futureValue = futureDate;
      ret.pastValue = pastDate;
      ret.success = true;

      return ret;
    }

    // Handle "today", "the day before yesterday"
    var exactMatch = RegExpComposer.matchExact(config.specialDayRegExp(), trimmedText, true);

    if (exactMatch != null) {
      var swift = GetSwiftDay(exactMatch.value);

      var value = referenceDate.AddDays(swift);

      ret.timex = DateTimeFormatUtil.luisDateFromDateTime(value);
      ret.futureValue = ret.pastValue = value;
      ret.success = true;

      return ret;
    }

    // Handle "two days from tomorrow"
    exactMatch = RegExpComposer.matchExact(config.specialDayWithNumRegExp(), trimmedText, true);

    if (exactMatch != null) {
      var swift = GetSwiftDay(exactMatch.getGroup("day").value);
      var numErs = config.integerExtractor().extract(trimmedText);
      var numOfDays = (config.numberParser().parse(numErs[0])?.value as double?)?.toInt() ?? 0;

      var value = referenceDate.AddDays(numOfDays + swift);

      ret.timex = DateTimeFormatUtil.luisDateFromDateTime(value);
      ret.futureValue = ret.pastValue = DateUtil.createSafeDate(value.year, value.month, value.day);
      ret.success = true;

      return ret;
    }

    // Handle "two sundays from now"
    exactMatch = RegExpComposer.matchExact(config.relativeWeekDayRegExp(), trimmedText, true);

    if (exactMatch != null) {
      var numErs = config.integerExtractor().extract(trimmedText);
      var num = (config.numberParser().parse(numErs[0])?.value as double?)?.toInt() ?? 0;
      var weekdayStr = exactMatch.getGroup("weekday").value;
      var value = referenceDate;

      // Check whether the determined day of this week has passed.
      // TODO : check this
      if (value.weekday > config.dayOfWeek()[weekdayStr]!) {
        num--;
      }

      while (num-- > 0) {
        value = value.Next(config.dayOfWeek()[weekdayStr]!);
      }

      ret.timex = DateTimeFormatUtil.luisDateFromDateTime(value);
      ret.futureValue = ret.pastValue = DateUtil.createSafeDate(value.year, value.month, value.day);
      ret.success = true;

      return ret;
    }

    // Handle "next Sunday", "upcoming Sunday"
    // We define "upcoming Sunday" as the nearest Sunday to come (not include today)
    // We define "next Sunday" as Sunday of next week
    exactMatch = RegExpComposer.matchExact(config.nextRegExp(), trimmedText, true);
    if (exactMatch != null) {
      var weekdayStr = exactMatch.getGroup("weekday").value;
      var value = referenceDate.Next(config.dayOfWeek()[weekdayStr]!);

      if (config.upcomingPrefixRegExp().matchBegin(trimmedText, true) != null) {
        value = referenceDate.Upcoming(config.dayOfWeek()[weekdayStr]!);
      } else if (config.getSwiftMonthOrYear(trimmedText) == 2) {
        value = value.AddDays(7);
      }

      ret.timex = DateTimeFormatUtil.luisDateFromDateTime(value);
      ret.futureValue = ret.pastValue = DateUtil.createSafeDate(value.year, value.month, value.day);
      ret.success = true;

      return ret;
    }

    // Handle "this Friday"
    exactMatch = RegExpComposer.matchExact(config.thisRegExp(), trimmedText, true);

    if (exactMatch != null) {
      var weekdayStr = exactMatch.getGroup("weekday").value;
      var value = referenceDate.This(config.dayOfWeek()[weekdayStr]!);

      ret.timex = DateTimeFormatUtil.luisDateFromDateTime(value);
      ret.futureValue = ret.pastValue = DateUtil.createSafeDate(value.year, value.month, value.day);
      ret.success = true;

      return ret;
    }

    // Handle "last Friday", "last mon"
    // We define "past Sunday" as the nearest Sunday that has already passed (not include today)
    // We define "previous Sunday" as Sunday of previous week
    exactMatch = RegExpComposer.matchExact(config.lastRegExp(), trimmedText, true);

    if (exactMatch != null) {
      var weekdayStr = exactMatch.getGroup("weekday").value;
      var value = referenceDate.Last(config.dayOfWeek()[weekdayStr]!);

      if (config.pastPrefixRegExp().matchBegin(trimmedText, true) != null) {
        value = referenceDate.Past(config.dayOfWeek()[weekdayStr]!);
      }

      ret.timex = DateTimeFormatUtil.luisDateFromDateTime(value);
      ret.futureValue = ret.pastValue = DateUtil.createSafeDate(value.year, value.month, value.day);
      ret.success = true;

      return ret;
    }

    // Handle "Friday"
    exactMatch = RegExpComposer.matchExact(config.weekDayRegExp(), trimmedText, true);

    if (exactMatch != null) {
      var weekdayStr = exactMatch.getGroup("weekday").value;
      var weekDay = config.dayOfWeek()[weekdayStr]!;
      var value = referenceDate.This(config.dayOfWeek()[weekdayStr]!);

      if (weekDay == 0) {
        weekDay = 7;
      }

      if (weekDay < referenceDate.weekday) {
        value = referenceDate.Next(weekDay);
      }

      ret.timex = "XXXX-WXX-$weekDay";
      var futureDate = value;
      var pastDate = value;
      if (futureDate.isBefore(referenceDate)) {
        futureDate = futureDate.AddDays(7);
      }

      if (!referenceDate.isAfter(pastDate)) {
        pastDate = pastDate.AddDays(-7);
      }

      ret.futureValue = DateUtil.createSafeDate(futureDate.year, futureDate.month, futureDate.day);
      ret.pastValue = DateUtil.createSafeDate(pastDate.year, pastDate.month, pastDate.day);
      ret.success = true;

      return ret;
    }

    // Handle "for the 27th."
    match = RegExpComposer.getMatchesSimple(config.forTheRegExp(), text).firstOrNull;

    if (match != null) {
      int day = 0, month = referenceDate.month, year = referenceDate.year;
      var dayStr = match.getGroup("DayOfMonth").value;

      // Create a extract result which content ordinal string of text
      ExtractResult er = ExtractResult(
        text: dayStr,
        start: match.getGroup("DayOfMonth").index,
        length: match.getGroup("DayOfMonth").length,
      );

      day = (config.numberParser().parse(er)?.value as double?)?.toInt() ?? 0;

      ret.timex = DateTimeFormatUtil.luisDateFromComponents(-1, -1, day);

      DateTime futureDate, pastDate;
      var tryStr = DateTimeFormatUtil.luisDateFromComponents(year, month, day);
      if (DateTime.tryParse(tryStr) != null) {
        futureDate = DateUtil.createSafeDate(year, month, day);
        pastDate = DateUtil.createSafeDate(year, month, day);

        if (futureDate.isBefore(referenceDate)) {
          futureDate = futureDate.AddMonths(1);
        }

        if (!referenceDate.isAfter(pastDate)) {
          pastDate = pastDate.AddMonths(-1);
        }
      } else {
        futureDate = DateUtil.createSafeDate(year, month + 1, day);
        pastDate = DateUtil.createSafeDate(year, month - 1, day);
      }

      ret.futureValue = futureDate;
      ret.pastValue = pastDate;
      ret.success = true;

      return ret;
    }

    // Handling cases like 'Thursday the 21st', which both 'Thursday' and '21st' refer to a same date
    match = RegExpComposer.getMatchesSimple(config.weekDayAndDayOfMothRegExp(), text).firstOrNull;
    if (match != null) {
      int month = referenceDate.month, year = referenceDate.year;

      // create a extract result which content ordinal string of text
      ExtractResult extractResultTmp = ExtractResult(
        text: match.getGroup("DayOfMonth").value,
        start: match.getGroup("DayOfMonth").index,
        length: match.getGroup("DayOfMonth").length,
      );

      // parse the day in text into number
      var day = (config.numberParser().parse(extractResultTmp)?.value as double?)?.toInt() ?? 0;

      // The validity of the phrase is guaranteed in the Date Extractor
      ret.timex = DateTimeFormatUtil.luisDateFromComponents(year, month, day);
      ret.futureValue = DateUtil.createSafeDate(year, month, day);
      ret.pastValue = DateUtil.createSafeDate(year, month, day);
      ret.success = true;

      return ret;
    }

    // Handling cases like 'Monday 21', which both 'Monday' and '21' refer to the same date.
    // The year of expected date can be different to the year of referenceDate.
    match = RegExpComposer.getMatchesSimple(config.weekDayAndDayRegExp(), text).firstOrNull;
    if (match != null) {
      // avoid parsing "Monday 3" from "Monday 3 weeks from now"
      var afterStr = text.substring(match.index + match.length);
      if (config.unitRegExp().matchBegin(afterStr, true) != null) {
        return ret;
      }

      int month = referenceDate.month, year = referenceDate.year;

      // Create a extract result which content ordinal string of text
      ExtractResult ertmp = ExtractResult(
        text: match.getGroup("day").value,
        start: match.getGroup("day").index,
        length: match.getGroup("day").length,
      );

      // Parse the day in text into number
      var day = (config.numberParser().parse(ertmp)?.value as double?)?.toInt() ?? 0;

      // Firstly, find a latest date with the "day" as pivotDate.
      // Secondly, if the pivotDate equals the referenced date, in other word, the day of the referenced date is exactly the "day".
      // In this way, check if the pivotDate is the weekday. If so, then the futureDate and the previousDate are the same date (referenced date).
      // Otherwise, increase the pivotDate month by month to find the latest futureDate and decrease the pivotDate month
      // by month to the latest previousDate.
      // Notice: if the "day" is larger than 28, some months should be ignored in the increase or decrease procedure.
      var pivotDate = DateUtil.createSafeDate(year, month, 1);

      var daysInMonth = DateUtil.daysInMonth(pivotDate.year, pivotDate.month);
      if (daysInMonth >= day) {
        pivotDate = DateUtil.createSafeDate(year, month, day);
      } else {
        // Add 1 month is enough, since 1, 3, 5, 7, 8, 10, 12 months has 31 days
        pivotDate = pivotDate.AddMonths(1);
        pivotDate = DateUtil.createSafeDate(pivotDate.year, pivotDate.month, day);
      }

      var numWeekDayInt = pivotDate.weekday;
      var extractedWeekDayStr = match.getGroup("weekday").value;
      var weekDay = config.dayOfWeek()[extractedWeekDayStr]!;
      if (pivotDate != DateUtil.minValue()) {
        if (day == referenceDate.day && numWeekDayInt == weekDay) {
          // The referenceDate is the weekday and with the "day".
          ret.futureValue = DateUtil.createSafeDate(year, month, day);
          ret.pastValue = DateUtil.createSafeDate(year, month, day);
          ret.timex = DateTimeFormatUtil.luisDateFromComponents(year, month, day);
        } else {
          var futureDate = pivotDate;
          var pastDate = pivotDate;

          while (futureDate.weekday != weekDay || futureDate.day != day || futureDate.isBefore(referenceDate)) {
            // Increase the futureDate month by month to find the expected date (the "day" is the weekday) and
            // make sure the futureDate not less than the referenceDate.
            futureDate = futureDate.AddMonths(1);
            var tmp = DateUtil.daysInMonth(futureDate.year, futureDate.month);
            if (tmp >= day) {
              // For months like January 31, after add 1 month, February 31 won't be returned, so the day should be revised ASAP.
              futureDate = DateUtil.createSafeDate(futureDate.year, futureDate.month, day);
            }
          }

          ret.futureValue = futureDate;

          while (pastDate.weekday != weekDay || pastDate.day != day || pastDate.isAfter(referenceDate)) {
            // Decrease the pastDate month by month to find the expected date (the "day" is the weekday) and
            // make sure the pastDate not larger than the referenceDate.
            pastDate = pastDate.AddMonths(-1);
            var tmp = DateUtil.daysInMonth(pastDate.year, pastDate.month);
            if (tmp >= day) {
              // For months like March 31, after minus 1 month, February 31 won't be returned, so the day should be revised ASAP.
              pastDate = DateUtil.createSafeDate(pastDate.year, pastDate.month, day);
            }
          }

          ret.pastValue = pastDate;

          if (weekDay == 0) {
            weekDay = 7;
          }

          ret.timex = "XXXX-WXX-$weekDay";
        }
      }

      ret.success = true;

      return ret;
    }

    return ret;
  }

  // Parse combined patterns Duration + Date, e.g. '3 days before Monday', '4 weeks after January 15th'
  DateTimeResolutionResult ParseDurationWithDate(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();
    var durationRes = config.durationExtractor().extractDateTime(text, referenceDate);

    for (var duration in durationRes) {
      var matches = RegExpComposer.getMatchesSimple(config.unitRegExp(), duration.text);
      if (matches.isNotEmpty) {
        var afterStr = text.substring(duration.start + duration.length);

        // Check if the Duration entity is followed by "before|from|after"
        var connector = RegExpComposer.matchBegin(config.beforeAfterRegExp(), afterStr, true);
        if (connector != null) {
          // Parse Duration
          var pr = config.durationParser().parseDateTime(duration, referenceDate);

          // Parse Date
          if (pr.value != null) {
            var dateString = afterStr.substring(connector.index + connector.length).trim();
            var innerResult = ParseBasicRegexMatch(dateString, referenceDate);
            if (!innerResult.success) {
              innerResult = ParseImplicitDate(dateString, referenceDate);
            }

            if (!innerResult.success && config.options.match(DateTimeOptions.TasksMode)) {
              innerResult = ParseTasksModeDurationToDatePattern(dateString, referenceDate);
            }

            if (!innerResult.success) {
              innerResult = ParseWeekdayOfMonth(dateString, referenceDate);
            }

            if (!innerResult.success) {
              innerResult = ParseNumberWithMonth(dateString, referenceDate);
            }

            if (!innerResult.success) {
              innerResult = ParseSingleNumber(dateString, referenceDate);
            }

            if (!innerResult.success) {
              var holidayEr = ExtractResult(
                start: 0,
                length: dateString.length,
                text: dateString,
                type: DateTimeConstants.SYS_DATETIME_DATE,
                data: null,
                metadata: Metadata(isHoliday: true),
              );
              // TODO: bring back
              // innerResult =
              //     config.holidayParser().parseDateTime(holidayEr, referenceDate).value as DateTimeResolutionResult;
              innerResult = DateTimeResolutionResult();
            }

            // Combine parsed results Duration + Date
            if (innerResult.success) {
              var isFuture = connector.getGroup("after").value.isNotEmpty;
              DateTime date = innerResult.futureValue as DateTime;
              var resultDateTime = DurationParsingUtil.shiftDateTime(pr.timexStr!, date, isFuture);
              ret.timex = DateTimeFormatUtil.luisDateFromDateTime(resultDateTime);

              ret.futureValue = ret.pastValue = resultDateTime;
              ret.subDateTimeEntities = [pr];
              ret.success = true;
            }
          }
        }
      }
    }

    return ret;
  }

  // Handle cases like "January first", "twenty-two of August"
  // Handle cases like "20th of next month"
  DateTimeResolutionResult ParseNumberWithMonth(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();

    var trimmedText = text.trim();
    int month = 0;
    int day = 0;
    int? year;
    bool ambiguous = true;

    var er = config.ordinalExtractor().extract(trimmedText);

    // check if the extraction is empty or a relative ordinal (e.g. "next", "previous")
    if (er.isEmpty || er[0].metadata?.isOrdinalRelative == true) {
      er = config.integerExtractor().extract(trimmedText);
    }

    if (er.isEmpty) {
      return ret;
    }

    var num = (config.numberParser().parse(er[0])?.value as double?)?.toInt() ?? 0;

    var match = RegExpComposer.getMatchesSimple(config.monthRegExp(), trimmedText).firstOrNull;
    if (match != null) {
      month = config.monthOfYear()[match.value.trim()]!;
      day = num;

      var suffix = trimmedText.substring(er[0].start + er[0].length);
      (year, ambiguous) = GetYearInAffix(suffix);

      // Check also in prefix
      if (year == null && config.checkBothBeforeAfter()) {
        var prefix = trimmedText.substring(0, er[0].start);
        (year, ambiguous) = GetYearInAffix(prefix);
      }
    }

    year ??= referenceDate.year;

    // Handling relative month
    if (match == null) {
      match = RegExpComposer.getMatchesSimple(config.relativeMonthRegExp(), trimmedText).firstOrNull;
      if (match != null) {
        var monthStr = match.getGroup("order").value;
        var swift = config.getSwiftMonthOrYear(monthStr);
        month = referenceDate.AddMonths(swift).month;
        year = referenceDate.AddMonths(swift).year;
        day = num;
        ambiguous = false;
      }
    }

    // Handling cases like 'second Sunday'
    if (match == null) {
      match = RegExpComposer.getMatchesSimple(config.weekDayRegExp(), trimmedText).firstOrNull;
      if (match != null) {
        month = referenceDate.month;

        // Resolve the date of wanted week day
        var wantedWeekDay = config.dayOfWeek()[match.getGroup("weekday").value]!;
        var firstDate = DateTime(referenceDate.year, referenceDate.month, 1);
        var firstWeekDay = firstDate.weekday;
        var firstWantedWeekDay = firstDate.AddDays(
            wantedWeekDay >= firstWeekDay ? wantedWeekDay - firstWeekDay : wantedWeekDay - firstWeekDay + 7);
        var answerDay = firstWantedWeekDay.day + ((num - 1) * 7);
        if ((answerDay < referenceDate.day) && config.options.match(DateTimeOptions.TasksMode)) {
          DateTime nextReferenceDate = referenceDate.AddMonths(1);
          month = nextReferenceDate.month;
          firstDate = DateTime(nextReferenceDate.year, nextReferenceDate.month, 1);
          firstWeekDay = firstDate.weekday;
          firstWantedWeekDay = firstDate.AddDays(
              wantedWeekDay >= firstWeekDay ? wantedWeekDay - firstWeekDay : wantedWeekDay - firstWeekDay + 7);
          answerDay = firstWantedWeekDay.day + ((num - 1) * 7);
        } else {
          firstWantedWeekDay = firstDate.AddDays(
              wantedWeekDay > firstWeekDay ? wantedWeekDay - firstWeekDay : wantedWeekDay - firstWeekDay + 7);
          answerDay = firstWantedWeekDay.day + ((num - 1) * 7);
        }

        day = answerDay;
        ambiguous = false;
      }
    }

    if (match == null) {
      return ret;
    }

    // For LUIS format value string
    var futureDate = DateUtil.createSafeDate(year!, month, day);
    var pastDate = DateUtil.createSafeDate(year, month, day);

    if (ambiguous) {
      ret.timex = DateTimeFormatUtil.luisDateFromComponents(-1, month, day);
      if (futureDate.isBefore(referenceDate)) {
        futureDate = futureDate.AddYears(1);
      }

      if (!referenceDate.isAfter(pastDate)) {
        pastDate = pastDate.AddYears(-1);
      }
    } else {
      ret.timex = DateTimeFormatUtil.luisDateFromComponents(year, month, day);
    }

    ret.futureValue = futureDate;
    ret.pastValue = pastDate;
    ret.success = true;

    return ret;
  }

  (int? year, bool ambiguous) GetYearInAffix(String affix) {
    int? year;
    bool ambiguous = true;

    var matchYear = RegExpComposer.getMatchesSimple(config.yearSuffix(), affix).firstOrNull;

    if (matchYear != null) {
      year = (config.dateExtractor() as BaseDateExtractor).getYearFromText(matchYear);
      if (year != DateTimeConstants.InvalidYear) {
        ambiguous = false;
      }
    }

    return (year, ambiguous);
  }

  // Handle cases like "the 27th". In the extractor, only the unmatched weekday and date will output this date.
  DateTimeResolutionResult ParseSingleNumber(String text, DateTime referenceDate) {
    var ret = DateTimeResolutionResult();

    var trimmedText = text.trim();
    int month = referenceDate.month, day = 0, year = referenceDate.year;

    var er = config.ordinalExtractor().extract(trimmedText);
    if (er.isEmpty) {
      er = config.integerExtractor().extract(trimmedText);
    }

    if (er.isEmpty) {
      return ret;
    }

    day = (config.numberParser().parse(er[0])?.value as double?)?.toInt() ?? 0;

    // For LUIS format value string
    ret.timex = DateTimeFormatUtil.luisDateFromComponents(-1, -1, day);
    var pastDate = DateUtil.createSafeDate(year, month, day);
    var futureDate = DateUtil.createSafeDate(year, month, day);

    if (futureDate != DateUtil.minValue() && futureDate.isBefore(referenceDate)) {
      futureDate = futureDate.AddMonths(1);
    }

    if (pastDate != DateUtil.minValue() && !referenceDate.isAfter(pastDate)) {
      pastDate = pastDate.AddMonths(-1);
    }

    ret.futureValue = futureDate;
    ret.pastValue = pastDate;
    ret.success = true;

    return ret;
  }

  DateTimeResolutionResult SwiftResolutionByWeekday(DateTimeResolutionResult ret, String text) {
    var match = RegExpComposer.matchBegin(config.weekDayAndDayRegExp(), text, true);
    match ??= RegExpComposer.matchEnd(config.weekDayRegExp(), text, true);

    if (match != null) {
      DateTime futureValue = ret.futureValue as DateTime;
      var weekDayNr = futureValue.weekday;
      var extractedWeekDayStr = match.getGroup("weekday").value;
      var extractedWeekDayNr = config.dayOfWeek()[extractedWeekDayStr]!;
      if (weekDayNr != extractedWeekDayNr) {
        var diffDay = extractedWeekDayNr - weekDayNr;
        if (ret.subDateTimeEntities?.isNotEmpty == true) {
          var retDuration = ret.subDateTimeEntities![0] as DateTimeParseResult;
          if (retDuration.timexStr?.endsWith("M") == true) {
            // In cases like "two months/years from now", the returned date cannot be less than 2 months/years from now.
            if (futureValue.day + diffDay < 1) {
              diffDay += 7;
            }
          } else if (retDuration.timexStr?.endsWith("Y") == true) {
            if (futureValue.dayOfYear + diffDay < 1) {
              diffDay += 7;
            }
          }
        }

        var newFutureValue = futureValue.AddDays(diffDay);
        ret.futureValue = newFutureValue;
        ret.pastValue = newFutureValue;
        ret.timex =
            DateTimeFormatUtil.luisDateFromComponents(newFutureValue.year, newFutureValue.month, newFutureValue.day);
      }
    }

    return ret;
  }
}

extension DateTimeExtensions on DateTime {
  int get dayOfYear {
    return difference(DateTime(year, 1, 1)).inDays + 1;
  }

  DateTime get dateOnly {
    return DateTime(year, month, day);
  }

  DateTime This(int dayOfWeek) {
    var start = weekday;
    var target = dayOfWeek;

    if (start == 0) {
      start = 7;
    }

    if (target == 0) {
      target = 7;
    }

    return AddDays(target - start);
  }

  DateTime Next(int dayOfWeek) {
    var start = weekday;
    var target = dayOfWeek;

    if (start == 0) {
      start = 7;
    }

    if (target == 0) {
      target = 7;
    }

    return AddDays(target - start + 7);
  }

  DateTime Upcoming(int dayOfWeek) {
    var start = weekday;
    var target = dayOfWeek;

    if (start == 0) {
      start = 7;
    }

    if (target == 0) {
      target = 7;
    }

    if (start < target) {
      return This(dayOfWeek);
    } else {
      return Next(dayOfWeek);
    }
  }

  DateTime Last(int dayOfWeek) {
    var start = weekday;
    var target = dayOfWeek;

    if (start == 0) {
      start = 7;
    }

    if (target == 0) {
      target = 7;
    }

    return AddDays(target - start - 7);
  }

  DateTime Past(int dayOfWeek) {
    var start = weekday;
    var target = dayOfWeek;

    if (start == 0) {
      start = 7;
    }

    if (target == 0) {
      target = 7;
    }

    if (start > target) {
      return This(dayOfWeek);
    } else {
      return Last(dayOfWeek);
    }
  }

  DateTime AddDays(int days) {
    final newDate = add(Duration(days: days));
    return _adjustTimeZones(newDate);
  }

  DateTime AddHours(int hours) {
    return add(Duration(hours: hours));
  }

  DateTime AddMinutes(int minutes) {
    return add(Duration(minutes: minutes));
  }

  DateTime AddSeconds(int seconds) {
    return add(Duration(seconds: seconds));
  }

  DateTime AddMonths(int months) {
    final monthsToAdd = months % 12;
    final yearsToAdd = (months - monthsToAdd) ~/ 12;

    var newYear = year + yearsToAdd;
    var newMonth = month + monthsToAdd;

    if (newMonth > 12) {
      newYear += 1;
      newMonth -= 12;
    }

    final newDay = min(day, DateUtil.daysInMonth(newYear, newMonth));

    return DateTime(newYear, newMonth, newDay, hour, minute, second, millisecond, microsecond);
  }

  DateTime AddYears(int years) {
    return AddMonths(years * 12);
  }

  DateTime _adjustTimeZones(DateTime dateTime) {
    final timeZoneOffset = this.timeZoneOffset;
    if (dateTime.timeZoneOffset != timeZoneOffset) {
      return dateTime.subtract(dateTime.timeZoneOffset).add(timeZoneOffset);
    }

    return dateTime;
  }
}
