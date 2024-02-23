import 'package:intl/intl.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class DateUtil {
  static final DateFormat DATE_TIME_FORMATTER = DateFormat("yyyy-MM-dd");

  static final List<int> _monthValidDays = <int>[31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  static const _leapMonth = 2;

  static DateTime minValue() {
    return DateTime(1, 1, 1, 0, 0, 0, 0);
  }

  static int daysInMonth(int year, int month) {
    final daysInMonth = month == _leapMonth //
        ? LeapMonthDays(year)
        : _monthValidDays[month - 1];
    return daysInMonth;
  }

  static bool isValidDate(int year, int month, int day) {
    final yearStr = year.toString();
    final monthStr = month.toString().padLeft(2, '0');
    final dayStr = day.toString().padLeft(2, '0');
    return DateTime.tryParse('$yearStr-$monthStr-$dayStr') != null;
  }

  static DateTime createSafeDate(int year, int month, int day,
      [int hour = 0, int minute = 0, int second = 0, int millisecond = 0]) {
    if (year < 1 || year > 9999) {
      return minValue();
    }

    final daysInMonth = month == _leapMonth //
        ? LeapMonthDays(year)
        : _monthValidDays[month - 1];

    if (month >= 1 && month <= 12 && day >= 1 && day <= daysInMonth) {
      return DateTime(year, month, day, hour, minute, second, millisecond);
    }

    return minValue();
  }

  static DateTime? tryParse(String? date) {
    if (date == null) {
      return null;
    }

    try {
      return DATE_TIME_FORMATTER.parse(date);
    } catch (exception) {
      return null;
    }
  }

  static bool validateMatch(
      NlpMatch match, String text, List<RegExp> dateRegExpList, RegExp rangeConnectorSymbolRegExp) {
    // If the match doesn't contains "year" part, it will not be ambiguous and it's a valid match
    final yearGroup = match.getGroup(DateTimeConstants.YearGroupName);
    var isValidMatch = yearGroup.value.isNotEmpty;

    if (!isValidMatch) {
      // If the "year" part is not at the end of the match, it's a valid match
      if (yearGroup.index + yearGroup.length != match.index + match.length) {
        isValidMatch = true;
      } else {
        var subText = text.substring(yearGroup.index);

        // If the following text (include the "year" part) doesn't start with a Date entity, it's a valid match
        if (!StartsWithBasicDate(subText, dateRegExpList)) {
          isValidMatch = true;
        } else {
          // If the following text (include the "year" part) starts with a Date entity, but the following text (doesn't include the "year" part) also starts with a valid Date entity, the current match is still valid
          // For example, "10-1-2018-10-2-2018". Match "10-1-2018" is valid because though "2018-10-2" a valid match (indicates the first year "2018" might belongs to the second Date entity), but "10-2-2018" is also a valid match.
          subText = text.substring(yearGroup.index + yearGroup.length).trim();
          subText = TrimStartRangeConnectorSymbols(subText, rangeConnectorSymbolRegExp);
          isValidMatch = StartsWithBasicDate(subText, dateRegExpList);
        }
      }

      // Expressions with mixed separators are not considered valid dates e.g. "30/4.85" (unless one is a comma "30/4, 2016")
      final dayGroup = match.getGroup(DateTimeConstants.DayGroupName);
      final monthGroup = match.getGroup(DateTimeConstants.MonthGroupName);

      if (dayGroup.value.isNotEmpty && monthGroup.value.isNotEmpty) {
        var noDateText =
            match.value.replaceAll(yearGroup.value, "").replaceAll(monthGroup.value, "").replaceAll(dayGroup.value, "");

        final weekDayGroup = match.getGroup(DateTimeConstants.WeekdayGroupName);

        noDateText = weekDayGroup.value.isNotEmpty ? noDateText.replaceAll(weekDayGroup.value, "") : noDateText;
        final separators = <String>['/', '\\', '-', '.'];
        final separatorCount = separators.fold(
          0,
          (count, separator) => count + (noDateText.contains(separator) ? 1 : 0),
        );

        if (separatorCount > 1) {
          isValidMatch = false;
        }
      }
    }

    return isValidMatch;
  }

  static bool StartsWithBasicDate(String text, List<RegExp> dateRegexList) {
    for (final regex in dateRegexList) {
      var match = regex.matchBegin(text, true);

      if (match != null) {
        return true;
      }
    }

    return false;
  }

  static String TrimStartRangeConnectorSymbols(String text, RegExp rangeConnectorSymbolRegex) {
    final rangeConnectorSymbolMatches = RegExpComposer.getMatchesSimple(rangeConnectorSymbolRegex, text);

    for (final symbolMatch in rangeConnectorSymbolMatches) {
      var startSymbolLength = -1;

      if (symbolMatch.index == 0 && symbolMatch.length > startSymbolLength) {
        startSymbolLength = symbolMatch.length;
      }

      if (startSymbolLength > 0) {
        text = text.substring(startSymbolLength);
      }
    }

    return text.trim();
  }

  static bool TrimStartRangeConnectorSymbolsStartsWithBasicDate(String text, List<RegExp> dateRegexList) {
    for (final regex in dateRegexList) {
      var match = regex.matchBegin(text, true);

      if (match != null) {
        return true;
      }
    }

    return false;
  }

  static int LeapMonthDays(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 ? 29 : 28;
  }

  const DateUtil._();
}
