// ignore_for_file: constant_identifier_names

import 'package:nlp/src/date_time/base_date_parser.dart';
import 'package:nlp/src/date_time/constants.dart';

import '../core/extraction.dart';
import '../regular_expressions/string_extensions.dart';

class DurationParsingUtil {
  static bool isTimeDurationUnit(String unitStr) {
    bool result = false;
    switch (unitStr) {
      case "H":
        result = true;
        break;
      case "M":
        result = true;
        break;
      case "S":
        result = true;
        break;
      default:
        break;
    }
    return result;
  }

  static bool isMultipleDuration(String timex) {
    Map<String, double> map = _resolveDurationTimex(timex);
    return map.length > 1;
  }

  static bool isDateDuration(String timex) {
    Map<String, double> map = _resolveDurationTimex(timex);

    for (final unit in map.keys) {
      if (isTimeDurationUnit(unit)) {
        return false;
      }
    }

    return true;
  }

  static DateTime shiftDateTime(String timex, DateTime reference, bool future) {
    Map<String, double> timexUnitMap = _resolveDurationTimex(timex);

    return getShiftResult(timexUnitMap, reference, future);
  }

  static DateTime getShiftResult(Map<String, double> timexUnitMap, DateTime reference, bool future) {
    DateTime result = reference;
    int futureOrPast = future ? 1 : -1;
    for (final pair in timexUnitMap.entries) {
      String unit = pair.key;
      ChronoUnit? chronoUnit;
      double number = pair.value;

      switch (unit) {
        case "H":
          chronoUnit = ChronoUnit.HOURS;
          break;
        case "M":
          chronoUnit = ChronoUnit.MINUTES;
          break;
        case "S":
          chronoUnit = ChronoUnit.SECONDS;
          break;
        case DateTimeConstants.TimexDay:
          result = result.AddDays((number * futureOrPast).round());
          break;
        case DateTimeConstants.TimexWeek:
          chronoUnit = ChronoUnit.WEEKS;
          break;
        case DateTimeConstants.TimexMonthFull:
          chronoUnit = null;
          result = result.AddMonths((number * futureOrPast).round());
          break;
        case DateTimeConstants.TimexYear:
          chronoUnit = null;
          result = result.copyWith(year: result.year + (number * futureOrPast).round());
          break;
        case DateTimeConstants.TimexBusinessDay:
          chronoUnit = null;
          result = getNthBusinessDay(result, number.round(), future).result;
          break;

        default:
          return result;
      }
      if (chronoUnit != null) {
        // result = DateUtil.plusPeriodInNanos(result, number * futureOrPast, chronoUnit);
        final nanos = chronoUnit.duration.inMicroseconds;
        final micros = result.microsecondsSinceEpoch + ((number * futureOrPast) * nanos).round();
        result = DateTime.fromMicrosecondsSinceEpoch(micros);
      }
    }
    return result;
  }

  static NthBusinessDayResult getNthBusinessDay(DateTime startDate, int number, bool isFuture) {
    DateTime date = startDate;
    var dateList = <DateTime>[];
    dateList.add(date);

    for (int i = 0; i < number; i++) {
      date = getNextBusinessDay(date, isFuture);
      dateList.add(date);
    }

    return NthBusinessDayResult(
      date,
      isFuture ? dateList : dateList.reversed.toList(),
    );
  }

  // By design it currently does not take holidays into account
  static DateTime getNextBusinessDay(DateTime startDate, [bool isFuture = true]) {
    final dateIncrement = Duration(days: isFuture ? 1 : -1);
    DateTime date = startDate.add(dateIncrement);

    while (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
      date = date.add(dateIncrement);
    }

    return date;
  }

  static Map<String, double> _resolveDurationTimex(String timex) {
    final resultBuilder = <String, double>{};

    // resolve duration timex, such as P21DT2H(21 days 2 hours)
    String durationStr = timex.replaceAll('P', '');
    int numberStart = 0;
    bool isTime = false;

    // Resolve business days
    if (durationStr.endsWith(DateTimeConstants.TimexBusinessDay)) {
      final businessDayNumber = double.tryParse(durationStr.substring(0, durationStr.length - 2));
      if (businessDayNumber != null) {
        resultBuilder[DateTimeConstants.TimexBusinessDay] = businessDayNumber;
      }

      return resultBuilder;
    }

    for (int i = 0; i < durationStr.length; i++) {
      if (durationStr[i].isLetter) {
        if (durationStr[i] == 'T') {
          isTime = true;
        } else {
          String numStr = durationStr.substring(numberStart, i);

          try {
            double number = double.parse(numStr);
            String srcTimexUnit = durationStr.substring(i, i + 1);

            if (!isTime && srcTimexUnit == "M") {
              srcTimexUnit = "MON";
            }

            resultBuilder[srcTimexUnit] = number;
          } catch (exception) {
            return resultBuilder;
          }
        }
        numberStart = i + 1;
      }
    }

    return resultBuilder;
  }
}

class NthBusinessDayResult {
  NthBusinessDayResult(this.result, this.dateList);

  final DateTime result;
  final List<DateTime> dateList;
}

abstract interface class IDurationExtractorConfiguration extends IOptionsConfiguration {
  RegExp getFollowedUnit();

  RegExp getNumberCombinedWithUnit();

  RegExp getAnUnitRegex();

  RegExp getDuringRegex();

  RegExp getAllRegex();

  RegExp getHalfRegex();

  RegExp getSuffixAndRegex();

  RegExp getConjunctionRegex();

  RegExp getInexactNumberRegex();

  RegExp getInexactNumberUnitRegex();

  RegExp getRelativeDurationUnitRegex();

  RegExp getDurationUnitRegex();

  RegExp getDurationConnectorRegex();

  RegExp getLessThanRegex();

  RegExp getMoreThanRegex();

  RegExp? getSpecialNumberUnitRegex();

  IExtractor get cardinalExtractor;

  Map<String, String> get unitMap;

  Map<String, int> get unitValueMap;
}

abstract interface class IOptionsConfiguration {
  DateTimeOptions get options;
  bool get dmyDateFormat;
}

enum DateTimeOptions {
  None(0),
  SkipFromToMerge(1),
  SplitDateAndTime(2),
  CalendarMode(4),
  ExtendedTypes(8),
  NoProtoCache(16),
  TasksMode(1048576),
  EnablePreview(8388608),
  ExperimentalMode(4194304),
  FailFast(2097152),
  ComplexCalendar(8 + 4 + 8388608);

  const DateTimeOptions(this.value);

  final int value;

  bool match(DateTimeOptions option) {
    return (value & option.value) == option.value;
  }
}

enum ChronoUnit {
  MICROS("Micros", Duration(microseconds: 1)),
  MILLIS("Millis", Duration(milliseconds: 1)),
  SECONDS("Seconds", Duration(seconds: 1)),
  MINUTES("Minutes", Duration(minutes: 1)),
  HOURS("Hours", Duration(hours: 1)),
  HALF_DAYS("HalfDays", Duration(seconds: 43200)),
  DAYS("Days", Duration(seconds: 86400)),
  WEEKS("Weeks", Duration(seconds: 604800)),
  MONTHS("Months", Duration(seconds: 2629746)),
  YEARS("Years", Duration(seconds: 31556952)),
  DECADES("Decades", Duration(seconds: 315569520)),
  CENTURIES("Centuries", Duration(seconds: 3155695200)),
  MILLENNIA("Millennia", Duration(seconds: 31556952000)),
  ERAS("Eras", Duration(seconds: 31556952000000000)),
  FOREVER("Forever", Duration(seconds: intMax));

  const ChronoUnit(this.name, this.duration);

  final String name;
  final Duration duration;

  bool isDurationEstimated() {
    return duration >= DAYS.duration;
  }

  bool isDateBased() {
    return duration >= DAYS.duration && this != FOREVER;
  }

  bool isTimeBased() {
    return duration < DAYS.duration;
  }

  @override
  String toString() => name;
}
