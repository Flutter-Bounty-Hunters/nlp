// import 'package:nlp/src/core/extraction.dart';
// import 'package:nlp/src/date_time/base_date_parser.dart';
// import 'package:nlp/src/date_time/constants.dart';
// import 'package:nlp/src/date_time/date_time_format_util.dart';
// import 'package:nlp/src/date_time/date_time_parsing.dart';
// import 'package:nlp/src/date_time/date_time_recognizer.dart';
// import 'package:nlp/src/date_time/date_util.dart';
// import 'package:nlp/src/date_time/merged_parser_util.dart';
// import 'package:nlp/src/date_time/resolution.dart';
// import 'package:nlp/src/date_time/timex_regex.dart';
// import 'package:nlp/src/date_time/timex_resolver.dart';
// import 'package:nlp/src/duration/base_duration_parser.dart';

class TasksModeSetHandler {
//   static DateTimeResolutionResult TasksModeResolveSet(DateTimeResolutionResult result, String innerTimex,
//       [DateTimeParseResult? pr]) {
//     result.timex = innerTimex;

//     result.futureValue = result.pastValue = ExtendSetTimex(TasksModeConstants.KeySet, innerTimex);

//     if (pr != null) {
//       DateTimeResolutionResult value = pr.value as DateTimeResolutionResult;
//       if (value.futureValue != null) {
//         if (pr.timexStr?.endsWith(TasksModeConstants.WeekEndPrefix) == true) {
//           result.futureValue = (value.futureValue as (DateTime, DateTime)).$1;
//           result.pastValue = (value.pastValue as (DateTime, DateTime)).$1;
//         }
//       }
//     }

//     result.success = true;

//     return result;
//   }

//   static Map<String, String> TasksModeGenerateResolutionSetParser(
//       Map<String, String> resolutionDic, String mod, String timex) {
//     var res = <String, String>{};

//     TasksModeAddAltSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIMEALT, mod, res);
//     if (timex.startsWith(DateTimeConstants.GeneralPeriodPrefix) && res.isNotEmpty) {
//       var extracted = <String, String>{};
//       TimexRegex.Extract(TasksModeConstants.PeriodString, timex, extracted);
//       res[TasksModeConstants.KeyIntSize] = extracted[TasksModeConstants.AmountString] ?? '';
//       res[TasksModeConstants.KeyIntType] = extracted[TasksModeConstants.DateUnitString] ?? '';
//     } else if (timex.startsWith(TasksModeConstants.FuzzyYear) && res.isNotEmpty) {
//       var extracted = <String, String>{};
//       TimexRegex.Extract(TasksModeConstants.PeriodString, timex, extracted);
//       res[TasksModeConstants.KeyIntSize] = extracted[TasksModeConstants.AmountString] ?? "1";
//       res[TasksModeConstants.KeyIntType] = extracted[TasksModeConstants.DateUnitString] ?? DateTimeConstants.TimexWeek;
//     } else if (timex.startsWith(DateTimeConstants.TimeTimexPrefix) && res.isNotEmpty) {
//       res[TasksModeConstants.KeyIntSize] = "1";
//       res[TasksModeConstants.KeyIntType] = DateTimeConstants.TimexDay;
//     }

//     return res;
//   }

//   static String TasksModeTimexIntervalExt(String timex) {
//     String periodicity;
//     if (timex.contains(DateTimeConstants.TimexFuzzyWeek)) {
//       periodicity = TasksModeConstants.WeeklyPeriodSuffix;
//     } else if (timex.contains(DateTimeConstants.TimexFuzzyYear)) {
//       periodicity = TasksModeConstants.YearlyPeriodSuffix;
//     } else if (!timex.endsWith(TasksModeConstants.WeekEndPrefix) && !timex.endsWith(TasksModeConstants.WeekDayPrefix)) {
//       periodicity = TasksModeConstants.PeriodDaySuffix;
//     } else {
//       periodicity = '';
//     }

//     timex = ExtendSetTimex(timex, periodicity);
//     return timex;
//   }

//   static DateTimeResolutionResult TasksModeAddResolution(
//       DateTimeResolutionResult result, ExtractResult er, DateTime refDate) {
//     if (result.timex?.endsWith(TasksModeConstants.WeekEndPrefix) == true) {
//       if (refDate.weekday == DateTime.sunday) {
//         result.futureResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate),
//         };

//         result.pastResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate),
//         };
//       } else {
//         var tempdate = refDate.Upcoming(DateTime.sunday);
//         var dateTimeToSet = DateUtil.createSafeDate(tempdate.year, tempdate.month, tempdate.day);
//         result.futureResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(dateTimeToSet),
//         };

//         result.pastResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(dateTimeToSet),
//         };
//       }
//     } else if (result.timex?.endsWith(TasksModeConstants.WeekDayPrefix) == true) {
//       if (refDate.weekday == DateTime.saturday) {
//         result.futureResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate.AddDays(2)),
//         };

//         result.pastResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate.AddDays(2)),
//         };
//       } else if (refDate.weekday == DateTime.sunday) {
//         result.futureResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate.AddDays(1)),
//         };

//         result.pastResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate.AddDays(1)),
//         };
//       } else {
//         result.futureResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate),
//         };

//         result.pastResolution = <String, String>{
//           TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate),
//         };
//       }
//     } else if (result.timex?.startsWith(DateTimeConstants.GeneralPeriodPrefix) == true) {
//       result.futureResolution = <String, String>{
//         TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate),
//       };

//       result.pastResolution = <String, String>{
//         TimeTypeConstants.DATE: DateTimeFormatUtil.formatDate(refDate),
//       };
//     } else if (result.timex?.startsWith(TasksModeConstants.FuzzyYear) == true) {
//       var timexRes = TimexResolver.Resolve([result.timex!], refDate);

//       String value = timexRes.Values[1].Value;

//       var resKey = TimeTypeConstants.DATETIME;

//       if (result.timex?.contains(DateTimeConstants.TimeTimexPrefix) != true) {
//         resKey = TimeTypeConstants.DATE;
//       }

//       var futureValue = refDate.AddDays(7);

//       // value = "09-04-2022 19:30" to extract only date substring from value used value[0:10].
//       if (DateTimeFormatUtil.formatDate(futureValue) ==
//               value.substring(TasksModeConstants.IntDateStartIdx,
//                   TasksModeConstants.IntDateStartIdx + TasksModeConstants.IntDateEndIdx) &&
//           result.timex?.startsWith(TasksModeConstants.FuzzyYearAndWeek) == true) {
//         if (result.timex?.contains(DateTimeConstants.TimeTimexPrefix) == true) {
//           if (DateTimeFormatUtil.formatTime(refDate).compareTo(value.substring(11)) <= 0) {
//             value = JoinDateWithValue(refDate, value.substring(11));
//           }
//         } else {
//           value = DateTimeFormatUtil.formatDate(refDate);
//         }
//       }

//       result.futureResolution = <String, String>{
//         resKey: value,
//       };

//       result.pastResolution = <String, String>{
//         resKey: value,
//       };
//     } else if (result.timex?.startsWith(DateTimeConstants.TimeTimexPrefix) == true) {
//       var timexRes = TimexResolver.Resolve([result.timex!], refDate);

//       String value = GetStartValue(timexRes);
//       if (value == null) {
//         value = timexRes.Values[0].Value;
//       }

//       DateTime resDate = refDate;
//       if (DateTimeFormatUtil.formatTime(resDate).compareTo(value) > 0) {
//         resDate = resDate.AddDays(1);
//       }

//       result.futureResolution = <String, String>{
//         TimeTypeConstants.DATETIME: JoinDateWithValue(resDate, value),
//       };

//       result.pastResolution = <String, String>{
//         TimeTypeConstants.DATETIME: JoinDateWithValue(resDate, value),
//       };
//     } else {
//       result.futureResolution = <String, String>{
//         TimeTypeConstants.SET: result.futureValue as String,
//       };

//       result.pastResolution = <String, String>{
//         TimeTypeConstants.SET: result.pastValue as String,
//       };
//     }

//     return result;
//   }

//   // function used for replacing "every" with "this" in String for parsing text i.e "19th of every month". (only with month duration)
  static String ReplaceValueInTextWithFutTerm(String text, String value, List<String> thisTermList) {
    value = value.trim();

    // the function should replace value with first term of list in text, It must agree with "month".
    String thisTerm = thisTermList[0];
    text = text.replaceAll(value, thisTerm);
    return text;
  }

//   static String JoinDateWithValue(DateTime resDate, String value) {
//     return '${DateTimeFormatUtil.formatDate(resDate)} $value';
//   }

//   static void TasksModeAddAltSingleDateTimeToResolution(
//       Map<String, String> resolutionDic, String type, String mod, Map<String, String> res) {
//     if (resolutionDic.containsKey(TimeTypeConstants.DATE)) {
//       res[TasksModeConstants.KeySetTypeName] = TimeTypeConstants.DATE;
//       MergedParserUtil.AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATE, mod, res);
//     } else if (resolutionDic.containsKey(TimeTypeConstants.DATETIME)) {
//       res[TasksModeConstants.KeySetTypeName] = DateTimeConstants.SYS_DATETIME_DATETIME;
//       MergedParserUtil.AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIME, mod, res);
//     } else if (resolutionDic.containsKey(TimeTypeConstants.TIME)) {
//       MergedParserUtil.AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.TIME, mod, res);
//     }
//   }

//   static String GetStartValue(Resolution timexRes) {
//     switch (timexRes.Values[0].Timex) {
//       case DateTimeConstants.Morning:
//         return TasksModeConstants.StringMorningHHMMSS;
//       case DateTimeConstants.Afternoon:
//         return TasksModeConstants.StringAfternoonHHMMSS;
//       case DateTimeConstants.Evening:
//         return TasksModeConstants.StringEveningHHMMSS;
//       case DateTimeConstants.Night:
//         return TasksModeConstants.StringNightHHMMSS;
//       default:
//         return timexRes.Values[0].Start;
//     }
//   }

//   // function replaces P1 with P2 when parsing values i.e. every other day at 2pm
//   static String TasksModeTimexIntervalReplace(String timex) {
//     timex = timex.replaceAll(TasksModeConstants.DailyPeriodPrefix, TasksModeConstants.AlternatePeriodPrefix);

//     return timex;
//   }

//   static String ExtendSetTimex(String timex, String extTimex) {
//     return timex + extTimex;
//   }
}
