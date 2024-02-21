// ignore_for_file: constant_identifier_names

import 'package:nlp/nlp.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';

class BaseDurationParser implements IDateTimeParser {
  BaseDurationParser(this.config);

  final IDurationParserConfiguration config;

  @override
  String getParserName() {
    return DateTimeConstants.SYS_DATETIME_DURATION;
  }

  @override
  ParseResult parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime reference) {
    print("BaseDurationParser - parseDateTime() - ${er.text}");
    print(" - parser name: ${getParserName()}");
    print(" - extraction type: ${er.type}");
    print(" ^ If these aren't the same, we won't add a MOD");
    Object? value;

    if (er.type == getParserName()) {
      print(" - this parser knows the meaning of this extraction - looking at MODs");
      var innerResult = _parseMergedDuration(er.text, reference);
      print(" - did parse merged duration? ${innerResult.success}");

      if (!innerResult.success) {
        innerResult = _parseNumberWithUnit(er.text, reference);
        print(" - did parse number with unit? ${innerResult.success}");
      }

      if (!innerResult.success) {
        innerResult = _parseImplicitDuration(er.text, reference);
        print(" - did did parse implicit duration? ${innerResult.success}");
      }

      if (innerResult.success) {
        print(" - adding a future resolution and past resolution");
        innerResult.futureResolution = {
          TimeTypeConstants.DURATION: StringUtility.format(innerResult.futureValue as double),
        };

        innerResult.pastResolution = {
          TimeTypeConstants.DURATION: StringUtility.format(innerResult.pastValue as double),
        };

        print(" - ExtractResult data: ${er.data}");
        if (er.data != null) {
          if (er.data == DateTimeConstants.MORE_THAN_MOD) {
            innerResult.mod = DateTimeConstants.MORE_THAN_MOD;
          } else if (er.data == DateTimeConstants.LESS_THAN_MOD) {
            innerResult.mod = DateTimeConstants.LESS_THAN_MOD;
          }
        }
        print(" - set MOD to ${innerResult.mod}");

        value = innerResult;
      }
    }

    DateTimeParseResult result = DateTimeParseResult(
      start: er.start,
      length: er.length,
      text: er.text,
      type: er.type,
      data: er.data,
      value: value,
      resolutionStr: "",
      timexStr: value == null ? "" : (value as DateTimeResolutionResult).timex,
    );

    return result;
  }

  DateTimeResolutionResult _parseMergedDuration(String text, DateTime reference) {
    final result = DateTimeResolutionResult();

    IExtractor durationExtractor = config.getDurationExtractor();

    // DurationExtractor without parameter will not extract merged duration
    final ers = durationExtractor.extract(text);

    // only handle merged duration cases like "1 month 21 days"
    if (ers.length <= 1) {
      result.success = false;
      return result;
    }

    int start = ers.first.start;
    if (start != 0) {
      String beforeStr = text.substring(0, start - 1);
      if (!StringUtility.isNullOrWhiteSpace(beforeStr)) {
        return result;
      }
    }

    int end = ers.last.start + ers.last.length;
    if (end != text.length) {
      String afterStr = text.substring(end);
      if (!StringUtility.isNullOrWhiteSpace(afterStr)) {
        return result;
      }
    }

    final prs = <DateTimeParseResult>[];
    final timexMap = <String, String>{};

    // insert timex into a dictionary
    for (final er in ers) {
      // RegExp unitRegex = config.getDurationUnitRegex();
      // final unitMatch = unitRegex.allMatches(er.text).firstOrNull;
      final unitMatch = RegExpComposer.getMatchesSimple(config.getDurationUnitRegex(), er.text).firstOrNull;
      if (unitMatch != null) {
        final pr = parse(er) as DateTimeParseResult;
        if (pr.value != null) {
          timexMap[unitMatch.getGroup("unit").value] = pr.timexStr!;
          prs.add(pr);
        }
      }
    }

    // sort the timex using the granularity of the duration, "P1M23D" for "1 month 23 days" and "23 days 1 month"
    if (prs.length == ers.length) {
      result.timex = TimexUtility.generateCompoundDurationTimex(timexMap, config.getUnitValueMap());

      double value = 0;
      for (final pr in prs) {
        value += double.parse((pr.value as DateTimeResolutionResult).futureValue.toString());
      }

      result.futureValue = value;
      result.pastValue = value;
    }

    result.success = true;
    return result;
  }

  DateTimeResolutionResult _parseNumberWithUnit(String text, DateTime reference) {
    DateTimeResolutionResult result = _parseNumberSpaceUnit(text);
    if (!result.success) {
      result = _parseNumberCombinedUnit(text);
    }

    if (!result.success) {
      result = _parseAnUnit(text);
    }

    if (!result.success) {
      result = _parseInexactNumberUnit(text);
    }

    return result;
  }

  // check {and} suffix after a {number} {unit}
  double _parseNumberWithUnitAndSuffix(String text) {
    double numVal = 0;

    final match = config.getSuffixAndRegex().allMatches(text).firstOrNull;
    if (match != null) {
      String numStr = match.namedGroup("suffix_num")!.toLowerCase();

      if (config.getDoubleNumbers().containsKey(numStr)) {
        numVal = config.getDoubleNumbers()[numStr]!;
      }
    }

    return numVal;
  }

  DateTimeResolutionResult _parseNumberSpaceUnit(String text) {
    DateTimeResolutionResult result = DateTimeResolutionResult();

    // if there are spaces between number and unit
    List<ExtractResult> ers = _extractNumbersBeforeUnit(text);
    if (ers.length == 1) {
      ExtractResult er = ers[0];
      ParseResult pr = config.getNumberParser()!.parse(er)!;

      // followed unit: {num} (<followed unit>and a half hours)
      String srcUnit = "";
      String noNum = text.substring(er.start + er.length).trim().toLowerCase();
      String suffixStr = text;

      print("_parseNumberSpaceUnit()");
      print(" - regex: ${config.getFollowedUnit().pattern}");
      print(" - input: $noNum");

      // final match = config.getFollowedUnit().allMatches(noNum).firstOrNull;
      final match = RegExpComposer.getMatchesSimple(config.getFollowedUnit(), noNum).firstOrNull;
      if (match != null) {
        print("Matches:");
        for (final entry in match.innerGroups.entries) {
          print(" - '${entry.key}' -> '${entry.value.value}'");
        }

        srcUnit = match.getGroup("unit").value.toLowerCase();
        suffixStr = match.getGroup(DateTimeConstants.SuffixGroupName).value.toLowerCase();
      }

      final businessDayGroup = match?.getGroup(DateTimeConstants.BusinessDayGroupName);
      if (match != null && businessDayGroup != null && businessDayGroup.value.isNotEmpty) {
        int numVal = double.parse(pr.value.toString()).round();

        String timex = TimexUtility.generateDurationTimex(numVal.toDouble(), DateTimeConstants.TimexBusinessDay, false);
        double timeValue = numVal * config.getUnitValueMap()[srcUnit.split(" ")[1]]!.toDouble();

        result.timex = timex;
        result.futureValue = timeValue;
        result.pastValue = timeValue;

        result.success = true;
      }

      if (config.getUnitMap().containsKey(srcUnit)) {
        double numVal = double.parse(pr.value.toString()) + _parseNumberWithUnitAndSuffix(suffixStr);

        String unitStr = config.getUnitMap()[srcUnit]!;

        String timex = TimexUtility.generateDurationTimex(numVal, unitStr, _isLessThanDay(unitStr));
        double timeValue = numVal * config.getUnitValueMap()[srcUnit]!;

        result.timex = timex;
        result.futureValue = timeValue;
        result.pastValue = timeValue;

        result.success = true;
      }
    }

    return result;
  }

  List<ExtractResult> _extractNumbersBeforeUnit(String text) {
    List<ExtractResult> ers = config.getCardinalExtractor().extract(text);
    if (config.getSpecialNumberUnitRegex() == null) {
      return ers;
    }

    // In special cases some languages will treat "both" as a number to be combined with duration units.
    final specialNumberTokens = Token.getTokenFromRegex(config.getSpecialNumberUnitRegex()!, text);

    for (final token in specialNumberTokens) {
      ExtractResult er = ExtractResult(
        start: token.start,
        length: token.length,
        text: text.substring(token.start, token.end),
      );

      ers.add(er);
    }

    return ers;
  }

  DateTimeResolutionResult _parseNumberCombinedUnit(String text) {
    var result = DateTimeResolutionResult();

    String suffixStr = text;

    // if there are NO spaces between number and unit
    // TODO: we're using getMatchesSimple() because we haven't implemented more sophisticated named
    //       group matching because it hasn't been needed yet.
    final match = RegExpComposer.getMatchesSimple(config.getNumberCombinedWithUnit(), text).firstOrNull;
    // Original regex line is below:
    // Optional<Match> match = Arrays.stream(RegExpUtility.getMatches(config.getNumberCombinedWithUnit(), text)).findFirst();
    print("");
    print("RegExp for number with unit:");
    print(config.getNumberCombinedWithUnit().pattern);
    print("");
    if (match != null) {
      final numVal = double.parse(match.getGroup("num").value) + _parseNumberWithUnitAndSuffix(suffixStr);
      final numStr = StringUtility.format(numVal);

      String srcUnit = match.getGroup("unit").value.toLowerCase();

      if (config.getUnitMap().containsKey(srcUnit)) {
        String unitStr = config.getUnitMap()[srcUnit]!;

        if ((numVal > 1000) && (unitStr == "Y" || unitStr == "MON" || unitStr == "W")) {
          return result;
        }

        String timex = "P${_isLessThanDay(unitStr) ? "T" : ""}$numStr${unitStr[0]}";
        double timeValue = numVal * config.getUnitValueMap()[srcUnit]!;

        result.timex = timex;
        result.futureValue = timeValue;
        result.pastValue = timeValue;

        result.success = true;
        return result;
      }
    }

    return result;
  }

  DateTimeResolutionResult _parseAnUnit(String text) {
    print("_parseAsUnit(): '$text'");
    print("");
    print("anUnit regex: ${config.getAnUnitRegex()}");
    print("");
    print("halfDateUnit regex: ${config.getHalfDateUnitRegex()}");
    print("");
    var result = DateTimeResolutionResult();

    String suffixStr = text;

    // if there are NO spaces between number and unit
    // var match = config.getAnUnitRegex().allMatches(text).firstOrNull;
    // match ??= config.getHalfDateUnitRegex().allMatches(text).firstOrNull;
    var match = RegExpComposer.getMatchesSimple(config.getAnUnitRegex(), text).firstOrNull;
    match ??= RegExpComposer.getMatchesSimple(config.getHalfDateUnitRegex(), text).firstOrNull;

    if (match != null) {
      double numVal = StringUtility.isNullOrEmpty(match.getGroup("half").value) ? 1 : 0.5;
      numVal = StringUtility.isNullOrEmpty(match.getGroup("quarter").value) ? numVal : 0.25;
      numVal = StringUtility.isNullOrEmpty(match.getGroup("threequarter").value) ? numVal : 0.75;

      numVal += _parseNumberWithUnitAndSuffix(suffixStr);
      String numStr = StringUtility.format(numVal);

      String srcUnit = match.getGroup("unit").value.toLowerCase();

      if (config.getUnitMap().containsKey(srcUnit)) {
        String unitStr = config.getUnitMap()[srcUnit]!;

        double timeValue = numVal * config.getUnitValueMap()[srcUnit]!;

        result.timex = TimexUtility.generateDurationTimex(numVal, unitStr, _isLessThanDay(unitStr));
        result.futureValue = timeValue;
        result.pastValue = timeValue;

        result.success = true;
      } else if (!StringUtility.isNullOrEmpty(match.getGroup(DateTimeConstants.BusinessDayGroupName).value)) {
        String timex = TimexUtility.generateDurationTimex(numVal, DateTimeConstants.TimexBusinessDay, false);
        double timeValue = numVal * config.getUnitValueMap()[srcUnit.split(" ")[1]]!;

        result.timex = timex;
        result.futureValue = timeValue;
        result.pastValue = timeValue;

        result.success = true;
      }
    }

    return result;
  }

  DateTimeResolutionResult _parseInexactNumberUnit(String text) {
    var result = DateTimeResolutionResult();

    // final match = config.getInexactNumberUnitRegex().allMatches(text).firstOrNull;
    final match = RegExpComposer.getMatchesSimple(config.getInexactNumberUnitRegex(), text).firstOrNull;
    if (match != null) {
      double numVal;

      if (!StringUtility.isNullOrEmpty(match.getGroup("NumTwoTerm").value)) {
        numVal = 2;
      } else {
        // set the inexact number "few", "some" to 3 for now
        numVal = 3;
      }

      String numStr = StringUtility.format(numVal);

      String srcUnit = match.getGroup("unit").value.toLowerCase();

      if (config.getUnitMap().containsKey(srcUnit)) {
        String unitStr = config.getUnitMap()[srcUnit]!;

        String timex = "P${_isLessThanDay(unitStr) ? "T" : ""}$numStr${unitStr[0]}";
        double timeValue = numVal * config.getUnitValueMap()[srcUnit]!;

        result.timex = timex;
        result.futureValue = timeValue;
        result.pastValue = timeValue;

        result.success = true;
        return result;
      }
    }

    return result;
  }

  DateTimeResolutionResult _parseImplicitDuration(String text, DateTime reference) {
    // handle "all day" "all year"
    var result = _getResultFromRegex(config.getAllDateUnitRegex(), text, "1");

    // handle "during/for the day/week/month/year"
    if (config.options.match(DateTimeOptions.CalendarMode) && !result.success) {
      result = _getResultFromRegex(config.getDuringRegex(), text, "1");
    }

    // handle "half day", "half year"
    if (!result.success) {
      result = _getResultFromRegex(config.getHalfDateUnitRegex(), text, "0.5");
    }

    // handle single duration unit, it is filtered in the extraction that there is a relative word in advance
    if (!result.success) {
      result = _getResultFromRegex(config.getFollowedUnit(), text, "1");
    }

    return result;
  }

  DateTimeResolutionResult _getResultFromRegex(RegExp regExp, String text, String numStr) {
    var result = DateTimeResolutionResult();

    final match = RegExpComposer.getMatchesSimple(regExp, text).firstOrNull;
    if (match != null) {
      String srcUnit = match.getGroup("unit").value.toLowerCase();
      if (config.getUnitMap().containsKey(srcUnit)) {
        String unitStr = config.getUnitMap()[srcUnit]!;

        String timex = "P${_isLessThanDay(unitStr) ? "T" : ""}$numStr${unitStr[0]}";
        double timeValue = double.parse(numStr) * config.getUnitValueMap()[srcUnit]!;

        result.timex = timex;
        result.futureValue = timeValue;
        result.pastValue = timeValue;

        result.success = true;
      }
    }

    return result;
  }

  bool _isLessThanDay(String unit) {
    return unit == "S" || unit == "M" || unit == "H";
  }

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) {
    return candidateResults;
  }
}

abstract interface class IDurationParserConfiguration implements IOptionsConfiguration {
  IExtractor getCardinalExtractor();

  IExtractor getDurationExtractor();

  IParser? getNumberParser();

  RegExp getNumberCombinedWithUnit();

  RegExp getAnUnitRegex();

  RegExp getDuringRegex();

  RegExp getAllDateUnitRegex();

  RegExp getHalfDateUnitRegex();

  RegExp getSuffixAndRegex();

  RegExp getFollowedUnit();

  RegExp getConjunctionRegex();

  RegExp getInexactNumberRegex();

  RegExp getInexactNumberUnitRegex();

  RegExp getDurationUnitRegex();

  RegExp? getSpecialNumberUnitRegex();

  Map<String, String> getUnitMap();

  Map<String, int> getUnitValueMap();

  Map<String, double> getDoubleNumbers();
}

class TimeTypeConstants {
  static const DATE = "date";
  static const DATETIME = "dateTime";
  static const DATETIMEALT = "dateTimeAlt";
  static const DURATION = "duration";
  static const SET = "set";
  static const TIME = "time";

  // Internal SubType for Future/Past in DateTimeResolutionResult
  static const START_DATE = "startDate";
  static const END_DATE = "endDate";
  static const START_DATETIME = "startDateTime";
  static const END_DATETIME = "endDateTime";
  static const START_TIME = "startTime";
  static const END_TIME = "endTime";
}
