import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/set_handler.dart';
import 'package:nlp/src/date_time/task_mode_set_handler.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseSetParser implements IDateTimeParser {
  BaseSetParser(this.config);

  final ISetParserConfiguration config;

  @override
  String getParserName() => DateTimeConstants.SYS_DATETIME_SET;

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime refDate) {
    Object? value;
    if (er.type == getParserName()) {
      var innerResult = ParseEachUnit(er.text);

      if (!innerResult.success) {
        innerResult = ParseEachDuration(er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParserTimeEveryday(er.text, refDate);
      }

      // NOTE: Do not change the order of the following calls, due to type precedence
      // datetimeperiod > dateperiod > timeperiod > datetime > date > time
      if (!innerResult.success) {
        innerResult = ParseEach(config.DateTimePeriodExtractor(), config.DateTimePeriodParser(), er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParseEach(config.DatePeriodExtractor(), config.DatePeriodParser(), er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParseEach(config.TimePeriodExtractor(), config.TimePeriodParser(), er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParseEach(config.DateTimeExtractor(), config.DateTimeParser(), er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParseEach(config.DateExtractor(), config.DateParser(), er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParseEach(config.TimeExtractor(), config.TimeParser(), er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParserDayEveryweek(er.text, refDate);
      }

      if (!innerResult.success) {
        innerResult = ParserSingleNumberMonth(er.text, refDate);
      }

      if (innerResult.success) {
        if (config.options.match(DateTimeOptions.TasksMode)) {
          //innerResult = TasksModeSetHandler.TasksModeAddResolution(innerResult, er, refDate);
        } else {
          innerResult.futureResolution = <String, String>{
            TimeTypeConstants.SET: innerResult.futureValue as String,
          };

          innerResult.pastResolution = <String, String>{
            TimeTypeConstants.SET: innerResult.pastValue as String,
          };
        }

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
      timexStr: value == null ? '' : (value as DateTimeResolutionResult).timex,
      resolutionStr: '',
    );

    return ret;
  }

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) => candidateResults;

  List<DateTimeParseResult> FilterResults(String query, List<DateTimeParseResult> candidateResults) {
    return candidateResults;
  }

  DateTimeResolutionResult ParseEachDuration(String text, DateTime refDate) {
    var ret = DateTimeResolutionResult();

    var ers = config.DurationExtractor().extractDateTime(text, refDate);

    if (ers.length != 1 || text.substring(ers[0].start + ers[0].length ?? 0).trim().isNotEmpty) {
      return ret;
    }

    var beforeStr = text.substring(0, ers[0].start ?? 0);
    if (config.EachPrefixRegex().hasMatch(beforeStr)) {
      var pr = config.DurationParser().parseDateTime(ers[0], DateTime.now());

      ret = SetHandler.ResolveSet(ret, pr.timexStr ?? '');

      if (config.options.match(DateTimeOptions.TasksMode)) {
        // ret = TasksModeSetHandler.TasksModeResolveSet(ret, pr.timexStr ?? '');
      }
    }

    return ret;
  }

  DateTimeResolutionResult ParseEachUnit(String text) {
    var ret = DateTimeResolutionResult();

    // handle "daily", "weekly"
    var match = config.PeriodicRegex().firstMatch(text);
    if (match != null) {
      // @TODO refactor to pass match
      var timex = config.GetMatchedDailyTimex(text);
      if (timex == null) {
        return ret;
      }

      ret = SetHandler.ResolveSet(ret, timex);

      if (config.options.match(DateTimeOptions.TasksMode)) {
        //ret = TasksModeSetHandler.TasksModeResolveSet(ret, timex);
      }

      return ret;
    }

    // handle "each month"
    var exactMatch = RegExpComposer.matchExact(config.EachUnitRegex(), text, true);

    if (exactMatch != null) {
      var sourceUnit = exactMatch.getGroup("unit").value;
      if (sourceUnit.isEmpty) {
        sourceUnit = exactMatch.getGroup("specialUnit").value;
      }

      if (sourceUnit.isNotEmpty && config.UnitMap().containsKey(sourceUnit)) {
        // @TODO refactor to pass match
        String? timex = config.GetMatchedUnitTimex(sourceUnit);
        if (timex == null) {
          return ret;
        }

        // "handle every other month"
        if (exactMatch.getGroup("other").success) {
          timex = timex.replaceAll("1", "2");
        }

        ret = SetHandler.ResolveSet(ret, timex);

        if (config.options.match(DateTimeOptions.TasksMode)) {
          //ret = TasksModeSetHandler.TasksModeResolveSet(ret, timex);
        }
      }
    }

    return ret;
  }

  DateTimeResolutionResult ParserTimeEveryday(String text, DateTime refDate) {
    var ret = DateTimeResolutionResult();

    var ers = config.TimeExtractor().extractDateTime(text, refDate);
    var ersTimePeriod = config.TimePeriodExtractor().extractDateTime(text, refDate);

    if (ers.length == 1) {
      var afterStr = text.replaceAll(ers[0].text, '');
      var match = config.EachDayRegex().firstMatch(afterStr);

      if (match != null) {
        var pr = config.TimeParser().parseDateTime(ers[0], refDate);
        ret = SetHandler.ResolveSet(ret, pr.timexStr ?? '');

        if (config.options.match(DateTimeOptions.TasksMode)) {
          //ret = TasksModeSetHandler.TasksModeResolveSet(ret, (pr.timexStr ?? '') + TasksModeConstants.PeriodDaySuffix);
        }
      }
    } else if (ersTimePeriod.length == 1) {
      var afterStr = text.replaceAll(ersTimePeriod[0].text, '');
      var match = config.EachDayRegex().firstMatch(afterStr);

      if (match != null) {
        // parse input: daily morning under tasksmode
        var pr = config.TimePeriodParser().parseDateTime(ersTimePeriod[0], refDate);
        ret = SetHandler.ResolveSet(ret, pr.timexStr ?? '');

        if (config.options.match(DateTimeOptions.TasksMode)) {
          //  ret = TasksModeSetHandler.TasksModeResolveSet(ret, (pr.timexStr ?? '') + TasksModeConstants.PeriodDaySuffix);
        }
      }
    }

    return ret;
  }

  // parse value for 15 may of every year etc
  DateTimeResolutionResult ParserDayEveryweek(String text, DateTime refDate) {
    var ret = DateTimeResolutionResult();

    var ers = config.DateExtractor().extractDateTime(text, refDate);

    if (ers.length != 1) {
      return ret;
    }

    var afterStr = text.replaceAll(ers[0].text, '');
    var timeErs = config.TimeExtractor().extractDateTime(afterStr, refDate);
    var timePeriodErs = config.TimePeriodExtractor().extractDateTime(afterStr, refDate);

    if (timeErs.isEmpty) {
      timeErs = timePeriodErs;
    }

    var match = config.EachUnitRegex().firstMatch(afterStr);
    match ??= config.PeriodicRegex().firstMatch(text);

    if (match != null) {
      var pr = config.DateParser().parseDateTime(ers[0], DateTime.now());
      var eachResult = ParseEachUnit(match.value);

      if (timeErs.isNotEmpty) {
        var timePr = config.TimeParser().parseDateTime(timeErs[0], DateTime.now());
        ret = SetHandler.ResolveSet(ret, (pr.timexStr ?? '') + (timePr.timexStr ?? ''));
        if (config.options.match(DateTimeOptions.TasksMode)) {
          // ret = TasksModeSetHandler.TasksModeResolveSet(
          //     ret, (pr.timexStr ?? '') + (timePr.timexStr ?? '') + (eachResult.timex ?? ''));
        }
      } else {
        ret = SetHandler.ResolveSet(ret, pr.timexStr ?? '');
        if (config.options.match(DateTimeOptions.TasksMode)) {
          //ret = TasksModeSetHandler.TasksModeResolveSet(ret, (pr.timexStr ?? '') + (eachResult.timex ?? ''));
        }
      }
    }

    return ret;
  }

  // parse value for input date like 19th for every month
  DateTimeResolutionResult ParserSingleNumberMonth(String text, DateTime refDate) {
    var ret = DateTimeResolutionResult();

    List<ExtractResult>? ers;
    var success = false;

    // remove key words of set type from text
    var match = config.SetEachRegex().firstMatch(text);
    if (match != null) {
      // if match value equals 19th of every month then newText = 19th of this month
      var newText = config.ReplaceValueInTextWithFutTerm(text, match.value);

      ers = config.DateExtractor().extractDateTime(newText, refDate);
      if (ers.length == 1 && ers.first.length == newText.length) {
        success = true;
      }
    }

    if (success) {
      var eachMatch = config.EachUnitRegex().firstMatch(text);
      eachMatch ??= config.PeriodicRegex().firstMatch(text);

      if (eachMatch != null) {
        var pr = config.DateParser().parseDateTime(ers![0], DateTime.now());
        var eachResult = ParseEachUnit(eachMatch.value);

        if (config.options.match(DateTimeOptions.TasksMode)) {
          // ret = TasksModeSetHandler.TasksModeResolveSet(
          //     ret, TasksModeConstants.FuzzyYearAndMonth + pr.timexStr!.substring(8) + (eachResult.timex ?? ''), pr);
        } else {
          ret = SetHandler.ResolveSet(ret, TasksModeConstants.FuzzyYearAndMonth + pr.timexStr!.substring(8));
        }
      }
    }

    return ret;
  }

  DateTimeResolutionResult ParseEach(
      IDateTimeExtractor extractor, IDateTimeParser parser, String text, DateTime refDate) {
    var ret = DateTimeResolutionResult();

    List<ExtractResult>? ers;
    var success = false;

    // remove key words of set type from text
    var match = RegExpComposer.firstMatch(config.SetEachRegex(), text);
    if (match != null) {
      var trimmedText = text.replaceRange(match.index, match.index + match.length, '');

      ers = extractor.extractDateTime(trimmedText, refDate);
      if (ers.length == 1 && ers.first.length == trimmedText.length) {
        success = true;
      }
    }

    // remove suffix 's' and "on" if existed and re-try
    var matchWeekDay = RegExpComposer.firstMatch(config.SetWeekDayRegex(), text);
    if (matchWeekDay != null) {
      var trimmedText = text.replaceRange(matchWeekDay.index, matchWeekDay.index + matchWeekDay.length, '');
      trimmedText = trimmedText.substring(0, matchWeekDay.index) +
          config.WeekDayGroupMatchString(matchWeekDay) +
          trimmedText.substring(matchWeekDay.index);

      ers = extractor.extractDateTime(trimmedText, refDate);
      if (ers.length == 1 && ers.first.length == trimmedText.length) {
        success = true;
      }
    }

    if (success) {
      var pr = parser.parseDateTime(ers![0], refDate);

      if (config.options.match(DateTimeOptions.TasksMode)) {
        if (match != null) {
          //pr.timexStr = TasksModeSetHandler.TasksModeTimexIntervalExt(pr.timexStr ?? '');
        }

        if (match!.getGroup("other").success) {
          // function replaces timex P1 with timex P2 when parsing values i.e. every other day at 2pm.
          //  pr.timexStr = TasksModeSetHandler.TasksModeTimexIntervalReplace(pr.timexStr ?? '');
        }

        //ret = TasksModeSetHandler.TasksModeResolveSet(ret, pr.timexStr ?? '', pr);
      } else {
        ret = SetHandler.ResolveSet(ret, pr.timexStr ?? '');
      }
    }

    return ret;
  }
}

abstract interface class ISetParserConfiguration extends IDateTimeOptionsConfiguration {
  IDateTimeExtractor DurationExtractor();

  IDateTimeParser DurationParser();

  IDateTimeExtractor TimeExtractor();

  IDateTimeParser TimeParser();

  IDateExtractor DateExtractor();

  IDateTimeParser DateParser();

  IDateTimeExtractor DateTimeExtractor();

  IDateTimeParser DateTimeParser();

  IDateTimeExtractor DatePeriodExtractor();

  IDateTimeParser DatePeriodParser();

  IDateTimeExtractor TimePeriodExtractor();

  IDateTimeParser TimePeriodParser();

  IDateTimeExtractor DateTimePeriodExtractor();

  IDateTimeParser DateTimePeriodParser();

  Map<String, String> UnitMap();

  RegExp EachPrefixRegex();

  RegExp PeriodicRegex();

  RegExp EachUnitRegex();

  RegExp EachDayRegex();

  RegExp SetWeekDayRegex();

  RegExp SetEachRegex();

  String? GetMatchedDailyTimex(String text);

  String? GetMatchedUnitTimex(String text);

  String WeekDayGroupMatchString(NlpMatch match);

  String ReplaceValueInTextWithFutTerm(String text, String value);
}
