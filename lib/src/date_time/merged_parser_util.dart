import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/duration/duration.dart';

class MergedParserUtil {
  static const String ParserTypeName = "datetimeV2";

  static String DateMinString = DateTimeFormatUtil.formatDate(DateUtil.minValue());

  static List<DateTimeParseResult> FilterResults(String query, List<DateTimeParseResult> candidateResults) {
    return candidateResults;
  }

  static String CombineMod(String originalMod, String newMod) {
    var combinedMod = newMod;

    if (originalMod.isNotEmpty && originalMod != newMod) {
      combinedMod = "${newMod}-${originalMod}";
    }

    return combinedMod;
  }

  //  static bool IsDurationWithAgoAndLater(ExtractResult er)
  // {
  //     return er.metadata != null && er.metadata?.isDurationWithAgoAndLater == true;
  // }

  static void AddSingleDateTimeToResolution(
      Map<String, String> resolutionDic, String type, String mod, Map<String, String> res) {
    // If an "invalid" Date or DateTime is extracted, it should not have an assigned resolution.
    // Only valid entities should pass this condition.
    if (resolutionDic.containsKey(type) && !resolutionDic[type]!.startsWith(DateMinString)) {
      if (mod.isNotEmpty) {
        if (mod.startsWith(DateTimeConstants.BEFORE_MOD)) {
          res[DateTimeResolutionKey.END] = resolutionDic[type]!;
          return;
        }

        if (mod.startsWith(DateTimeConstants.AFTER_MOD)) {
          res[DateTimeResolutionKey.START] = resolutionDic[type]!;
          return;
        }

        if (mod.startsWith(DateTimeConstants.SINCE_MOD)) {
          res[DateTimeResolutionKey.START] = resolutionDic[type]!;
          return;
        }

        if (mod.startsWith(DateTimeConstants.UNTIL_MOD)) {
          res[DateTimeResolutionKey.END] = resolutionDic[type]!;
          return;
        }
      }

      res[ResolutionKey.Value] = resolutionDic[type]!;
    }
  }

  //  static void AddPeriodToResolution(Map<String, String> resolutionDic, String startType, String endType, String mod,
  //                                          Map<String, String> res)
  // {
  //     var start = '';
  //     var end = '';

  //     if (resolutionDic.containsKey(startType))
  //     {
  //         start = resolutionDic[startType]!;
  //         if (start == DateTimeConstants.InvalidDateString)
  //         {
  //             return;
  //         }
  //     }

  //     if (resolutionDic.containsKey(endType))
  //     {
  //         end = resolutionDic[endType]!;
  //         if (end == DateTimeConstants.InvalidDateString)
  //         {
  //             return;
  //         }
  //     }

  //     if (mod.isNotEmpty)
  //     {
  //         // For the 'before' mod
  //         // 1. Cases like "Before December", the start of the period should be the end of the new period, not the start
  //         // (but not for cases like "Before the end of December")
  //         // 2. Cases like "More than 3 days before today", the date point should be the end of the new period
  //         if (mod.startsWith(DateTimeConstants.BEFORE_MOD))
  //         {
  //             if (start.isNotEmpty && end.isNotEmpty && !mod.endsWith(DateTimeConstants.LATE_MOD))
  //             {
  //                 res[DateTimeResolutionKey.END] = start;
  //             }
  //             else
  //             {
  //                 res[DateTimeResolutionKey.END] = end;
  //             }

  //             return;
  //         }

  //         // For the 'after' mod
  //         // 1. Cases like "After January", the end of the period should be the start of the new period, not the end
  //         // (but not for cases like "After the beginning of January")
  //         // 2. Cases like "More than 3 days after today", the date point should be the start of the new period
  //         if (mod.startsWith(DateTimeConstants.AFTER_MOD))
  //         {
  //             if (start.isNotEmpty && end.isNotEmpty && !mod.endsWith(DateTimeConstants.EARLY_MOD))
  //             {
  //                 res[DateTimeResolutionKey.START] =  end;
  //             }
  //             else
  //             {
  //                 res[DateTimeResolutionKey.START] =  start;
  //             }

  //             return;
  //         }

  //         // For the 'since' mod, the start of the period should be the start of the new period, not the end
  //         if (mod.startsWith(DateTimeConstants.SINCE_MOD))
  //         {
  //             res[DateTimeResolutionKey.START] = start;
  //             return;
  //         }

  //         // For the 'until' mod, the end of the period should be the end of the new period, not the start
  //         if (mod.startsWith(DateTimeConstants.UNTIL_MOD))
  //         {
  //             res[DateTimeResolutionKey.START] = end;
  //             return;
  //         }
  //     }

  //     if (!AreUnresolvedDates(start, end))
  //     {
  //         res[DateTimeResolutionKey.START] = start;
  //         res[DateTimeResolutionKey.END] = end;

  //         // Preserving any present timex values. Useful for Holiday weekend where the timex is known during parsing.
  //         if (resolutionDic.containsKey(DateTimeResolutionKey.Timex))
  //         {
  //             res[DateTimeResolutionKey.Timex] = resolutionDic[DateTimeResolutionKey.Timex]!;
  //         }
  //     }
  // }

  //  static void AddAltPeriodToResolution(Map<String, String> resolutionDic, String mod, Map<String, String> res)
  // {
  //     if (resolutionDic.containsKey(TimeTypeConstants.START_DATETIME) || resolutionDic.containsKey(TimeTypeConstants.END_DATETIME))
  //     {
  //         AddPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATETIME, TimeTypeConstants.END_DATETIME, mod, res);
  //     }
  //     else if (resolutionDic.containsKey(TimeTypeConstants.START_DATE) || resolutionDic.containsKey(TimeTypeConstants.END_DATE))
  //     {
  //         AddPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATE, TimeTypeConstants.END_DATE, mod, res);
  //     }
  //     else if (resolutionDic.containsKey(TimeTypeConstants.START_TIME) || resolutionDic.containsKey(TimeTypeConstants.END_TIME))
  //     {
  //         AddPeriodToResolution(resolutionDic, TimeTypeConstants.START_TIME, TimeTypeConstants.END_TIME, mod, res);
  //     }
  // }

  //  static void AddAltSingleDateTimeToResolution(Map<String, String> resolutionDic, String type, String mod,
  //                                                     Map<String, String> res)
  // {
  //     if (resolutionDic.containsKey(TimeTypeConstants.DATE))
  //     {
  //         AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATE, mod, res);
  //     }
  //     else if (resolutionDic.containsKey(TimeTypeConstants.DATETIME))
  //     {
  //         AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIME, mod, res);
  //     }
  //     else if (resolutionDic.containsKey(TimeTypeConstants.TIME))
  //     {
  //         AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.TIME, mod, res);
  //     }
  // }

  //  static bool AreUnresolvedDates(String startDate, String endDate)
  // {
  //     return startDate.isEmpty || endDate.isEmpty ||
  //            startDate.startsWith(DateMinString) ||
  //            endDate.startsWith(DateMinString);
  // }

  //  static DateTimeParseResult SetInclusivePeriodEnd(DateTimeParseResult slot)
  // {
  //     if (slot.type == "${ParserTypeName}.${DateTimeConstants.SYS_DATETIME_DATEPERIOD}")
  //     {
  //         var timexComponents = slot.timexStr!.split(DateTimeConstants.DatePeriodTimexSplitter);

  //         // Only handle DatePeriod like "(StartDate,EndDate,Duration)"
  //         if (timexComponents.length == 3)
  //         {
  //             var value = slot.value as Map<String, Object>?;
  //             var altTimex = '';

  //             if (value != null && value.containsKey(ResolutionKey.ValueSet))
  //             {
  //                 if (value[ResolutionKey.ValueSet] is IList<Map<String, String>> valueSet && valueSet.Any())
  //                 {
  //                     for (var values in valueSet)
  //                     {
  //                         // This is only a sanity check, as here we only handle DatePeriod like "(StartDate,EndDate,Duration)"
  //                         if (values.containsKey(DateTimeResolutionKey.START) && values.containsKey(DateTimeResolutionKey.End) &&
  //                             values.containsKey(DateTimeResolutionKey.Timex))
  //                         {
  //                             var startDate = DateTime.parse(values[DateTimeResolutionKey.START]);
  //                             var endDate = DateTime.parse(values[DateTimeResolutionKey.END]);
  //                             var durationStr = timexComponents[2];
  //                             var datePeriodTimexType = TimexUtility.GetDatePeriodTimexType(durationStr);

  //                             endDate = TimexUtility.OffsetDateObject(endDate, offset: 1, timexType: datePeriodTimexType);
  //                             values[DateTimeResolutionKey.END] = DateTimeFormatUtil.luisDateFromDateTime(endDate);
  //                             values[DateTimeResolutionKey.Timex] =
  //                                 TimexUtility.GenerateEndInclusiveTimex(slot.timexStr, datePeriodTimexType, startDate, endDate);

  //                             if (altTimex.isEmpty)
  //                             {
  //                                 altTimex = values[DateTimeResolutionKey.Timex];
  //                             }
  //                         }
  //                     }
  //                 }
  //             }

  //             slot.value = value;
  //             slot.timexStr = altTimex;
  //         }
  //     }

  //     return slot;
  // }

  static DateTimeParseResult SetParseResult(
      DateTimeParseResult slot, bool hasMod, IDateTimeOptionsConfiguration config) {
    slot.value = DateTimeModel.dateTimeResolution(slot, config);

    // Change the type at last for the after or before modes
    slot.type = "${ParserTypeName}.${DetermineDateTimeType(slot.type ?? '', hasMod, config)}";
    return slot;
  }

  static String DetermineDateTimeType(String type, bool hasMod, IDateTimeOptionsConfiguration config) {
    if (config.options.match(DateTimeOptions.SplitDateAndTime)) {
      if (type == DateTimeConstants.SYS_DATETIME_DATETIME) {
        return DateTimeConstants.SYS_DATETIME_TIME;
      }
    } else {
      if (hasMod) {
        if (type == DateTimeConstants.SYS_DATETIME_DATE) {
          return DateTimeConstants.SYS_DATETIME_DATEPERIOD;
        }

        if (type == DateTimeConstants.SYS_DATETIME_TIME) {
          return DateTimeConstants.SYS_DATETIME_TIMEPERIOD;
        }

        if (type == DateTimeConstants.SYS_DATETIME_DATETIME) {
          return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;
        }
      }
    }

    return type;
  }

  //  static String? DetermineSourceEntityType(String sourceType, String newType, bool hasMod)
  // {
  //     if (!hasMod)
  //     {
  //         return null;
  //     }

  //     if (newType!=sourceType)
  //     {
  //         return DateTimeConstants.SYS_DATETIME_DATETIMEPOINT;
  //     }

  //     if (newType==DateTimeConstants.SYS_DATETIME_DATEPERIOD)
  //     {
  //         return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;
  //     }

  //     return null;
  // }

  //  static Map<String, Object>? DateTimeResolution(DateTimeParseResult slot, IDateTimeOptionsConfiguration config)
  // {
  //     if (slot == null)
  //     {
  //         return null;
  //     }

  //     var resolutions = <Map<String, String>>[];
  //     var res = new Map<String, Object>();

  //     var type = slot.type;
  //     var timex = slot.timexStr;

  //     var val = slot.value as DateTimeResolutionResult?;
  //     if (val == null)
  //     {
  //         return null;
  //     }

  //     var isLunar = val.isLunar ?? false;
  //     var mod = val.mod;
  //     String? list = null;

  //     // Resolve dates list for date periods
  //     if (slot.type ==DateTimeConstants.SYS_DATETIME_DATEPERIOD && val.list != null)
  //     {

  //         list =  val.list!.map((o) => DateTimeFormatUtil.luisDateFromDateTime(o as DateTime)).toList().join(',');
  //     }

  //     // With modifier, output type might not be the same with type in resolution result
  //     // For example, if the resolution type is "date", with modifier the output type should be "daterange"
  //     var typeOutput = DetermineDateTimeType(slot.type ?? '', mod?.isNotEmpty == true, config);

  //     var sourceEntity = DetermineSourceEntityType(slot.type ?? '', typeOutput, val.hasRangeChangingMod);

  //     var comment = val.comment;

  //     // The following should be added to res first, since ResolveAmPm requires these fields.
  //     AddResolutionFields(res, DateTimeResolutionKey.Timex, timex ??'');
  //     AddResolutionFields(res, DateTimeConstants.Comment, comment ?? '');
  //     AddResolutionFields(res, DateTimeResolutionKey.Mod, mod ??'');
  //     AddResolutionFields(res, ResolutionKey.Type, typeOutput ??'');
  //     AddResolutionFields(res, DateTimeResolutionKey.IsLunar, isLunar ? isLunar.toString() : '');

  //     var hasTimeZone = false;

  //     // For standalone timezone entity recognition, we generate timeZoneResolution for each entity we extracted.
  //     // We also merge time entity with timezone entity and add the information in timeZoneResolution to every DateTime resolutions.
  //     if (val.timeZoneResolution != null)
  //     {
  //         if (slot.type == DateTimeConstants.SYS_DATETIME_TIMEZONE)
  //         {
  //             // single timezone
  //             AddResolutionFields(res, DateTimeConstants.ResolveTimeZone, <String, String>
  //             {
  //                  ResolutionKey.Value: val.timeZoneResolution!.value,
  //                  DateTimeConstants.UtcOffsetMinsKey: val.timeZoneResolution!.utcOffsetMins.toString() ,
  //             });
  //         }
  //         else
  //         {
  //             // timezone as clarification of datetime
  //             hasTimeZone = true;
  //             AddResolutionFields(res, DateTimeConstants.TimeZone, val.timeZoneResolution!.value);
  //             AddResolutionFields(res, DateTimeConstants.TimeZoneText, val.timeZoneResolution!.timeZoneText);
  //             AddResolutionFields(res, DateTimeConstants.UtcOffsetMinsKey,
  //                                 val.timeZoneResolution!.utcOffsetMins.toString());
  //         }
  //     }

  //     var pastResolutionStr = ((DateTimeResolutionResult)slot.value).PastResolution;
  //     var futureResolutionStr = ((DateTimeResolutionResult)slot.value).FutureResolution;

  //     if (typeOutput == DateTimeConstants.SYS_DATETIME_DATETIMEALT && pastResolutionStr.length > 0)
  //     {
  //         typeOutput = DetermineResolutionDateTimeType(pastResolutionStr);
  //     }

  //     var resolutionPast = GenerateResolution(type, pastResolutionStr, mod);
  //     var resolutionFuture = GenerateResolution(type, futureResolutionStr, mod);

  //     if ((config.Options & DateTimeOptions.TasksMode) != 0)
  //     {
  //         if (type.Equals(DateTimeConstants.SYS_DATETIME_SET))
  //         {
  //             pastResolutionStr = ((DateTimeResolutionResult)slot.value).PastResolution;
  //             futureResolutionStr = ((DateTimeResolutionResult)slot.value).FutureResolution;

  //             resolutionPast = TasksModeSetHandler.TasksModeGenerateResolutionSetParser(pastResolutionStr, mod, timex);
  //             resolutionFuture = TasksModeSetHandler.TasksModeGenerateResolutionSetParser(futureResolutionStr, mod, timex);
  //         }
  //     }

  //     // If past and future are same, keep only one
  //     if (resolutionFuture.OrderBy(t => t.Key).Select(t => t.value)
  //         .SequenceEqual(resolutionPast.OrderBy(t => t.Key).Select(t => t.value)))
  //     {
  //         if (resolutionPast.length > 0)
  //         {
  //             AddResolutionFields(res, DateTimeConstants.Resolve, resolutionPast);
  //         }
  //     }
  //     else
  //     {
  //         if (resolutionPast.length > 0)
  //         {
  //             AddResolutionFields(res, DateTimeConstants.ResolveToPast, resolutionPast);
  //         }

  //         if (resolutionFuture.length > 0)
  //         {
  //             AddResolutionFields(res, DateTimeConstants.ResolveToFuture, resolutionFuture);
  //         }
  //     }

  //     // If 'ampm', double our resolution accordingly
  //     if (!String.IsNullOrEmpty(comment) && comment.Equals(DateTimeConstants.Comment_AmPm))
  //     {
  //         if (res.containsKey(DateTimeConstants.Resolve))
  //         {
  //             ResolveAmpm(res, DateTimeConstants.Resolve);
  //         }
  //         else
  //         {
  //             ResolveAmpm(res, DateTimeConstants.ResolveToPast);
  //             ResolveAmpm(res, DateTimeConstants.ResolveToFuture);
  //         }
  //     }

  //     // If WeekOf and in CalendarMode, modify the past part of our resolution
  //     if ((config.Options & DateTimeOptions.CalendarMode) != 0 &&
  //         !String.IsNullOrEmpty(comment) && comment.Equals(DateTimeConstants.Comment_WeekOf))
  //     {
  //         ResolveWeekOf(res, DateTimeConstants.ResolveToPast);
  //     }

  //     if (!String.IsNullOrEmpty(comment) && TimexUtility.HasDoubleTimex(comment))
  //     {
  //         TimexUtility.ProcessDoubleTimex(res, DateTimeConstants.ResolveToFuture, DateTimeConstants.ResolveToPast, timex);
  //     }

  //     for (var p in res)
  //     {
  //         if (p.value is Map<String, String> dictionary)
  //         {
  //             var value = new Map<String, String>();

  //             AddResolutionFields(value, DateTimeResolutionKey.Timex, timex);
  //             AddResolutionFields(value, DateTimeResolutionKey.Mod, mod);
  //             AddResolutionFields(value, ResolutionKey.type, typeOutput);
  //             AddResolutionFields(value, DateTimeResolutionKey.IsLunar,
  //                                 isLunar ? isLunar.ToString(CultureInfo.InvariantCulture) : '');
  //             AddResolutionFields(value, DateTimeResolutionKey.List, list);
  //             AddResolutionFields(value, DateTimeResolutionKey.SourceEntity, sourceEntity);

  //             if (hasTimeZone)
  //             {
  //                 AddResolutionFields(value, DateTimeConstants.TimeZone, val.timeZoneResolution.value);
  //                 AddResolutionFields(value, DateTimeConstants.TimeZoneText, val.timeZoneResolution.TimeZoneText);
  //                 AddResolutionFields(value, DateTimeConstants.UtcOffsetMinsKey,
  //                                     val.timeZoneResolution.UtcOffsetMins.ToString(CultureInfo.InvariantCulture));
  //             }

  //             for (var q in dictionary)
  //             {
  //                 value[q.Key] = q.value;
  //             }

  //             resolutions.add(value);
  //         }
  //     }

  //     if (resolutionPast.length == 0 && resolutionFuture.length == 0 && val.timeZoneResolution == null)
  //     {
  //         var notResolved = <String, String>
  //         {

  //                 DateTimeResolutionKey.Timex: timex!
  //             ,

  //                 ResolutionKey.Type: typeOutput
  //             ,

  //                 ResolutionKey.Value: "not resolved"
  //             ,
  //         };

  //         resolutions.add(notResolved);
  //     }

  //     return new SortedDictionary<String, Object> { { ResolutionKey.ValueSet, resolutions } };
  // }

  static List<DateTimeParseResult> DateTimeResolutionForSplit(
      DateTimeParseResult slot, IDateTimeOptionsConfiguration config) {
    var results = <DateTimeParseResult>[];
    if ((slot.value as DateTimeResolutionResult).subDateTimeEntities != null) {
      var subEntities = (slot.value as DateTimeResolutionResult).subDateTimeEntities!;
      for (var subEntity in subEntities) {
        var result = subEntity as DateTimeParseResult;
        result.start += slot.start;
        results.addAll(DateTimeResolutionForSplit(result, config));
      }
    } else {
      slot.value = DateTimeModel.dateTimeResolution(slot, config);
      slot.type = "${ParserTypeName}.${DetermineDateTimeType(slot.type ?? '', false, config)}";
      results.add(slot);
    }

    return results;
  }

  //  static void AddResolutionFieldsStr(Map<String, Object> dic, String key, String value)
  // {
  //     if (value.isNotEmpty)
  //     {
  //         dic[key] = value;
  //     }
  // }

  //  static void AddResolutionFields(Map<String, Object> dic, String key, Object value)
  // {
  //     if (value != null)
  //     {
  //         dic[key] = value;
  //     }
  // }

  //  static void ResolveAmpm(Map<String, Object> resolutionDic, String keyName)
  // {
  //     if (resolutionDic.containsKey(keyName))
  //     {
  //         var resolution = resolutionDic[keyName] as Map<String, String>;
  //         var resolutionPm = new Map<String, String>();

  //         if (!resolutionDic.containsKey(DateTimeResolutionKey.Timex))
  //         {
  //             return;
  //         }

  //         var timex = resolutionDic[DateTimeResolutionKey.Timex] as String;

  //         resolutionDic.remove(keyName);
  //         resolutionDic[keyName + "Am"] =  resolution;

  //         switch (resolutionDic[ResolutionKey.Type] as String)
  //         {
  //             case DateTimeConstants.SYS_DATETIME_TIME:
  //                 resolutionPm[ResolutionKey.Value] = DateTimeFormatUtil.toPm(resolution[ResolutionKey.Value]!);
  //                 resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.toPm(timex);
  //                 break;

  //             case DateTimeConstants.SYS_DATETIME_DATETIME:
  //                 var split = resolution[ResolutionKey.Value]!.split(' ');
  //                 resolutionPm[ResolutionKey.Value] = split[0] + " " + DateTimeFormatUtil.toPm(split[1]);
  //                 resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.allStringToPm(timex);
  //                 break;

  //             case DateTimeConstants.SYS_DATETIME_TIMEPERIOD:
  //                 if (resolution.containsKey(DateTimeResolutionKey.START))
  //                 {
  //                     resolutionPm[DateTimeResolutionKey.START] = DateTimeFormatUtil.toPm(resolution[DateTimeResolutionKey.START]!);
  //                 }

  //                 if (resolution.containsKey(DateTimeResolutionKey.END))
  //                 {
  //                     resolutionPm[DateTimeResolutionKey.END] = DateTimeFormatUtil.toPm(resolution[DateTimeResolutionKey.END]!);
  //                 }

  //                 if (resolution.containsKey(DateTimeResolutionKey.Value))
  //                 {
  //                     resolutionPm[ResolutionKey.Value] = DateTimeFormatUtil.toPm(resolution[ResolutionKey.Value]!);
  //                 }

  //                 resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.allStringToPm(timex);
  //                 break;

  //             case DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD:
  //                 if (resolution.containsKey(DateTimeResolutionKey.START))
  //                 {
  //                     var start = Convert.ToDateTime(resolution[DateTimeResolutionKey.START]);
  //                     start = start.Hour == DateTimeConstants.HalfDayHourCount ?
  //                         start.AddHours(-DateTimeConstants.HalfDayHourCount) : start.AddHours(DateTimeConstants.HalfDayHourCount);

  //                     resolutionPm[DateTimeResolutionKey.START] = DateTimeFormatUtil.FormatDateTime(start);
  //                 }

  //                 if (resolution.containsKey(DateTimeResolutionKey.End))
  //                 {
  //                     var end = Convert.ToDateTime(resolution[DateTimeResolutionKey.End]);
  //                     end = end.Hour == DateTimeConstants.HalfDayHourCount ?
  //                         end.AddHours(-DateTimeConstants.HalfDayHourCount) : end.AddHours(DateTimeConstants.HalfDayHourCount);

  //                     resolutionPm[DateTimeResolutionKey.End] = DateTimeFormatUtil.FormatDateTime(end);
  //                 }

  //                 resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.AllStringToPm(timex);
  //                 break;
  //         }

  //         resolutionDic[keyName + "Pm"] = resolutionPm;
  //     }
  // }

  //  static void ResolveWeekOf(Map<String, Object> resolutionDic, String keyName)
  // {
  //     if (resolutionDic.containsKey(keyName))
  //     {
  //         var resolution = resolutionDic[keyName] as Map<String, String>;

  //         var monday = DateTime.parse(resolution[DateTimeResolutionKey.START]!);
  //         resolution[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.toIsoWeekTimex(monday);

  //         resolutionDic.remove(keyName);
  //         resolutionDic[keyName] = resolution;
  //     }
  // }

  //  static Map<String, String> GenerateResolution(String type, Map<String, String> resolutionDic, String mod)
  // {
  //     var res = new Map<String, String>();

  //     if (type==DateTimeConstants.SYS_DATETIME_DATETIME)
  //     {
  //         AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIME, mod, res);
  //     }
  //     else if (type==DateTimeConstants.SYS_DATETIME_TIME)
  //     {
  //         AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.TIME, mod, res);
  //     }
  //     else if (type==DateTimeConstants.SYS_DATETIME_DATE)
  //     {
  //         AddSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATE, mod, res);
  //     }
  //     else if (type==DateTimeConstants.SYS_DATETIME_DURATION)
  //     {
  //         if (resolutionDic.containsKey(TimeTypeConstants.DURATION))
  //         {
  //             res[ResolutionKey.Value] = resolutionDic[TimeTypeConstants.DURATION]!;
  //         }
  //     }
  //     else if (type==DateTimeConstants.SYS_DATETIME_TIMEPERIOD)
  //     {
  //         AddPeriodToResolution(resolutionDic, TimeTypeConstants.START_TIME, TimeTypeConstants.END_TIME, mod, res);
  //     }
  //     else if (type==DateTimeConstants.SYS_DATETIME_DATEPERIOD)
  //     {
  //         AddPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATE, TimeTypeConstants.END_DATE, mod, res);
  //     }
  //     else if (type ==DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD)
  //     {
  //         AddPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATETIME, TimeTypeConstants.END_DATETIME, mod, res);
  //     }
  //     else if (type==DateTimeConstants.SYS_DATETIME_DATETIMEALT)
  //     {
  //         // For a period
  //         if (resolutionDic.length > 2 || mod.isNotEmpty)
  //         {
  //             AddAltPeriodToResolution(resolutionDic, mod, res);
  //         }
  //         else
  //         {
  //             // For a datetime point
  //             AddAltSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIMEALT, mod, res);
  //         }
  //     }

  //     return res;
  // }

  //  static String DetermineResolutionDateTimeType(Map<String, String> pastResolutionStr)
  // {
  //     switch (pastResolutionStr.keys.first)
  //     {
  //         case TimeTypeConstants.START_DATE:
  //             return DateTimeConstants.SYS_DATETIME_DATEPERIOD;

  //         case TimeTypeConstants.START_DATETIME:
  //             return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;

  //         case TimeTypeConstants.START_TIME:
  //             return DateTimeConstants.SYS_DATETIME_TIMEPERIOD;

  //         default:
  //             // ToLowerInvariant needed for legacy reasons with subtype code.
  //             // @TODO remove in future refactoring of test code and double-check there's no impact in output schema.
  //             return pastResolutionStr.keys.first.toLowerCase();
  //     }
  // }
}
