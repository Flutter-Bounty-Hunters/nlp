// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:nlp/nlp.dart';
import 'package:nlp/src/core/model_result.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/core/timex_utility.dart';
import 'package:nlp/src/duration/base_duration_parser.dart';
import 'package:nlp/src/date_time/date_time_format_util.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_util.dart';
import 'package:nlp/src/date_time/english_date_time_parser.dart';

class DateTimeRecognizer {
  static List<ModelResult> recognizeDateTime(String query) {
    return recognizeByModel(
      (recognizer) => null, //recognizer.getDateTimeModel(culture, true),
      query,
      DateTime.now(),
    );
  }

  static List<ModelResult> recognizeByModel(
    // TODO: make DateTimeModel non-nullable when we successfully generalize this method
    DateTimeModel? Function(DateTimeRecognizer recognizer) getModelFunction,
    String query,
    DateTime referenceTime,
  ) {
    // DateTimeRecognizer recognizer = DateTimeRecognizer();
    // DateTimeModel model = getModelFunction.call(recognizer);
    // return model.parse(query, referenceTime);

    return DateTimeModel().parse(query, referenceTime);
  }

  //////////////////////////////// PARSING //////////////////////////////

  // static DateTimeParseResult setInclusivePeriodEnd(DateTimeParseResult slot, String parserName) {
  //   String currentType =  parserName + "." + DateTimeConstants.SYS_DATETIME_DATEPERIOD;
  //   if (slot.type == currentType) {
  //     final timexStream = slot.timexStr!.split(",|\\(|\\)");
  //     final timexComponents = timexStream.where((str) => str.isNotEmpty).toList();
  //
  //     // Only handle DatePeriod like "(StartDate,EndDate,Duration)"
  //     if (timexComponents.length == 3) {
  //       final value = slot.value as SplayTreeMap<String, Object>;
  //       String altTimex = "";
  //
  //       if (value != null && value.containsKey(ResolutionKey.ValueSet)) {
  //         if (value[ResolutionKey.ValueSet] is List) {
  //           List<Map<String, String>> valueSet = value[ResolutionKey.ValueSet] as List<Map<String, String>>;
  //           if (value.isNotEmpty) {
  //             for (final values in valueSet) {
  //               // This is only a sanity check, as here we only handle DatePeriod like "(StartDate,EndDate,Duration)"
  //               if (values.containsKey(DateTimeResolutionKey.START) &&
  //                 values.containsKey(DateTimeResolutionKey.END) &&
  //                 values.containsKey(DateTimeResolutionKey.Timex)) {
  //
  //                 final formatter = DateFormat("yyyy-MM-dd");
  //                 DateTime startDate = LocalDate.parse(values[DateTimeResolutionKey.START], formatter).atStartOfDay();
  //                 DateTime endDate = LocalDate.parse(values[DateTimeResolutionKey.END], formatter).atStartOfDay();
  //                 String durationStr = timexComponents[2];
  //                 final datePeriodTimexType = TimexUtility.getDatePeriodTimexType(durationStr);
  //
  //                 endDate = TimexUtility.offsetDateObject(endDate, 1, datePeriodTimexType);
  //                 values[DateTimeResolutionKey.END] = DateTimeFormatUtil.luisDate(endDate);
  //                 values[DateTimeResolutionKey.Timex] = generateEndInclusiveTimex(slot.timexStr, datePeriodTimexType, startDate, endDate);
  //
  //                 if (altTimex == null || altTimex.isEmpty) {
  //                   altTimex = values[DateTimeResolutionKey.Timex];
  //                 }
  //               }
  //             }
  //           }
  //         }
  //       }
  //
  //       slot.value = value;
  //       slot.timexStr = altTimex;
  //     }
  //   }
  //   return slot;
  // }

  DateTimeRecognizer();
}

class DateTimeModel {
  static final String dateMinString = DateTimeFormatUtil.formatDate(DateUtil.minValue());

  DateTimeModel();

  List<ModelResult> parse(String query, DateTime referenceTime) {
    final durationExtractor = DurationExtractor(
      config: EnglishDurationExtractorConfiguration(),
    );
    final extractions = durationExtractor.extractDateTime(query, DateTime.now());
    print("Extracted ${extractions.length} from the query.");
    print("");

    print("Parsing extracted results...");
    // final parser = BaseMergedDateTimeParser();
    final parsedDateTimes = <DateTimeParseResult>[];
    final referenceTime = DateTime.now();
    for (final extraction in extractions) {
      print("Attempting to parse extracted result: ${extraction.type}, '${extraction.text}'");
      // DateTimeParseResult parseResult = parser.parse(result, referenceTime);
      final parseResult = _parse(extraction, referenceTime);
      if (parseResult == null) {
        print("Didn't parse any date time from extraction: ${extraction.text}");
        continue;
      }

      if (parseResult.value is List) {
        parsedDateTimes.addAll(parseResult.value as List<DateTimeParseResult>);
      } else {
        parsedDateTimes.add(parseResult);
      }
    }

    return parsedDateTimes.map((parsedDateTime) => _getModelResult(parsedDateTime)).toList();
  }

  DateTimeParseResult? _parse(ExtractResult er, DateTime reference) {
    print("parse() - '${er.text}', reference time: $reference, metadata: ${er.metadata}");
    DateTimeParseResult? pr;

    String originText = er.text;
    final config = EnglishMergedParserConfiguration(DateTimeOptions.None);
    // TODO: bring back following preview mode code when rest of method is working
    // if (config.options.match(DateTimeOptions.EnablePreview)) {
    //   String newText = MatchingUtil.preProcessTextRemoveSuperfluousWords(er.text, config.getSuperfluousWordMatcher()).text;
    //   int newLength = er.length + newText.length - originText.length;
    //   er = ExtractResult(start: er.start, length: newLength, text: newText, type: er.type, data: er.data, metadata: er.metadata,);
    // }

    // Push, save the MOD string
    bool hasBefore = false;
    bool hasAfter = false;
    bool hasSince = false;
    bool hasAround = false;
    bool hasYearAfter = false;

    // "InclusiveModifier" means MOD should include the start/end time
    // For example, cases like "on or later than", "earlier than or in" have inclusive modifier
    bool hasInclusiveModifier = false;
    String modStr = "";

    if (er.metadata != null && er.metadata!.hasMod) {
      final beforeMatch = config.getBeforeRegex().matchBegin(er.text, true);
      final afterMatch = config.getAfterRegex().matchBegin(er.text, true);
      final sinceMatch = config.getSinceRegex().matchBegin(er.text, true);
      final aroundMatch = config.getAroundRegex().matchBegin(er.text, true);

      if (beforeMatch != null) {
        hasBefore = true;
        er.start = er.start + beforeMatch.length;
        er.length = er.length - beforeMatch.length;
        er.text = er.text.substring(beforeMatch.length);
        modStr = beforeMatch.input.substring(beforeMatch.start, beforeMatch.end);

        final inclusiveModifier = beforeMatch.namedGroup("include");
        if (inclusiveModifier != null && inclusiveModifier.isNotEmpty) {
          hasInclusiveModifier = true;
        }
      } else if (afterMatch != null) {
        hasAfter = true;
        er.start = er.start + afterMatch.length;
        er.length = er.length - afterMatch.length;
        er.text = er.text.substring(afterMatch.length);
        modStr = afterMatch.input.substring(afterMatch.start, afterMatch.end);

        final inclusiveModifier = afterMatch.namedGroup("include");
        if (inclusiveModifier != null && inclusiveModifier.isNotEmpty) {
          hasInclusiveModifier = true;
        }
      } else if (sinceMatch != null) {
        hasSince = true;
        er.start = er.start + sinceMatch.length;
        er.length = er.length - sinceMatch.length;
        er.text = er.text.substring(sinceMatch.length);
        modStr = sinceMatch.input.substring(sinceMatch.start, sinceMatch.end);
      } else if (aroundMatch != null) {
        hasAround = true;
        er.start = er.start + aroundMatch.length;
        er.length = er.length - aroundMatch.length;
        er.text = er.text.substring(aroundMatch.length);
        modStr = aroundMatch.input.substring(aroundMatch.start, aroundMatch.end);
      } else if ((er.type == DateTimeConstants.SYS_DATETIME_DATEPERIOD &&
              config.getYearRegex().allMatches(er.text).firstOrNull != null) ||
          (er.type == DateTimeConstants.SYS_DATETIME_DATE) ||
          (er.type == DateTimeConstants.SYS_DATETIME_TIME)) {
        // This has to be put at the end of the if, or cases like "before 2012" and "after 2012" would fall into this
        // 2012 or after/above, 3 pm or later
        final match = config.getSuffixAfterRegex().matchEnd(er.text, true);
        if (match != null) {
          hasYearAfter = true;
          er.length = er.length - match.length;
          er.text = er.length > 0 ? er.text.substring(0, er.length) : "";
          modStr = match.input.substring(match.start, match.end);
        }
      }
    }

    // if (er.type == DateTimeConstants.SYS_DATETIME_DATE) {
    //   if (er.metadata != null && er.metadata!.isHoliday) {
    //     pr = config.getHolidayParser().parse(er, reference);
    //   } else {
    //     pr = config.getDateParser().parse(er, reference);
    //   }
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_TIME) {
    //   pr = config.getTimeParser().parse(er, reference);
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_DATETIME) {
    //   pr = config.getDateTimeParser().parse(er, reference);
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_DATEPERIOD) {
    //   pr = config.getDatePeriodParser().parse(er, reference);
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_TIMEPERIOD) {
    //   pr = config.getTimePeriodParser().parse(er, reference);
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD) {
    //   pr = config.getDateTimePeriodParser().parse(er, reference);
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_DURATION) {
    if (er.type == DateTimeConstants.SYS_DATETIME_DURATION) {
      pr = config.durationParser.parseDateTime(er, reference);
    }
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_SET) {
    //   pr = config.getGetParser().parse(er, reference);
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_DATETIMEALT) {
    //   pr = config.getDateTimeAltParser().parse(er, reference);
    // } else if (er.type == DateTimeConstants.SYS_DATETIME_TIMEZONE) {
    //   if (config.options.match(DateTimeOptions.EnablePreview)) {
    //     pr = config.getTimeZoneParser().parse(er, reference);
    //   }
    // } else {
    //   return null;
    // }

    if (pr == null) {
      return null;
    }

    // Pop, restore the MOD string
    if (hasBefore && pr.value != null) {
      pr.start = pr.start - modStr.length;
      pr.text = modStr + pr.text;
      pr.length = pr.length + modStr.length;

      final val = pr.value as DateTimeResolutionResult;

      if (!hasInclusiveModifier) {
        val.mod = combineMod(val.mod, DateTimeConstants.BEFORE_MOD);
      } else {
        val.mod = combineMod(val.mod, DateTimeConstants.UNTIL_MOD);
      }

      pr.value = val;
    }

    if (hasAfter && pr.value != null) {
      pr.start = pr.start - modStr.length;
      pr.text = modStr + pr.text;
      pr.length = pr.length + modStr.length;

      final val = pr.value as DateTimeResolutionResult;

      if (!hasInclusiveModifier) {
        val.mod = combineMod(val.mod, DateTimeConstants.AFTER_MOD);
      } else {
        val.mod = combineMod(val.mod, DateTimeConstants.SINCE_MOD);
      }

      pr.value = val;
    }

    if (hasSince && pr.value != null) {
      pr.start = pr.start - modStr.length;
      pr.text = modStr + pr.text;
      pr.length = pr.length + modStr.length;

      final val = pr.value as DateTimeResolutionResult;
      val.mod = combineMod(val.mod, DateTimeConstants.SINCE_MOD);
      pr.value = val;
    }

    if (hasAround && pr.value != null) {
      pr.start = pr.start - modStr.length;
      pr.text = modStr + pr.text;
      pr.length = pr.length + modStr.length;

      final val = pr.value as DateTimeResolutionResult;
      val.mod = combineMod(val.mod, DateTimeConstants.APPROX_MOD);
      pr.value = val;
    }

    if (hasYearAfter && pr.value != null) {
      pr.text = pr.text + modStr;
      pr.length = pr.length + modStr.length;

      final val = pr.value as DateTimeResolutionResult;
      val.mod = combineMod(val.mod, DateTimeConstants.SINCE_MOD);
      pr.value = val;
      hasSince = true;
    }

    // For cases like "3 pm or later on Monday"
    if (pr.value != null && pr.type == DateTimeConstants.SYS_DATETIME_DATETIME) {
      final match = config.getSuffixAfterRegex().allMatches(pr.text).firstOrNull;
      if (match != null && match.start != 0) {
        final val = pr.value as DateTimeResolutionResult;
        val.mod = combineMod(val.mod, DateTimeConstants.SINCE_MOD);
        pr.value = val;
        hasSince = true;
      }
    }

    if (config.options.match(DateTimeOptions.SplitDateAndTime) &&
        pr.value != null &&
        (pr.value as DateTimeResolutionResult).subDateTimeEntities != null) {
      // TODO: when this code is moved into a parser class, replace hard-coded parser name with per-class name
      pr.value = dateTimeResolutionForSplit(pr, "datetimeV2", config);
    } else {
      bool hasModifier = hasBefore || hasAfter || hasSince;
      if (pr.value != null) {
        (pr.value as DateTimeResolutionResult).hasRangeChangingMod = hasModifier;
      }

      // TODO: when this code is moved into a parser class, replace hard-coded parser name with per-class name
      pr = setParseResult(pr, hasModifier, "datetimeV2", config);
    }

    // TODO: bring back
    // // In this version, ExperimentalMode only cope with the "IncludePeriodEnd" case
    // if (config.options.match(DateTimeOptions.ExperimentalMode)) {
    //   if (pr.metadata != null && pr.metadata!.isPossiblyIncludePeriodEnd) {
    //     pr = setInclusivePeriodEnd(pr, "FIXME-DateTimeParser");
    //   }
    // }

    if (config.options.match(DateTimeOptions.EnablePreview)) {
      int prLength = pr.length + originText.length - pr.text.length;
      pr = DateTimeParseResult(
        start: pr.start,
        length: prLength,
        text: originText,
        type: pr.type,
        data: pr.data,
        value: pr.value,
        resolutionStr: pr.resolutionStr,
        timexStr: pr.timexStr,
      );
    }

    return pr;
  }

  List<DateTimeParseResult> dateTimeResolutionForSplit(
      DateTimeParseResult slot, String parserName, IOptionsConfiguration config) {
    final results = <DateTimeParseResult>[];
    if ((slot.value as DateTimeResolutionResult).subDateTimeEntities != null) {
      final subEntities = (slot.value as DateTimeResolutionResult).subDateTimeEntities!;
      for (final subEntity in subEntities) {
        final result = subEntity as DateTimeParseResult;
        result.start = result.start + slot.start;
        results.addAll(dateTimeResolutionForSplit(result, parserName, config));
      }
    } else {
      slot.value = dateTimeResolution(slot, config);
      slot.type = "$parserName.${determineDateTimeType(slot.type!, false, config)}";

      results.add(slot);
    }

    return results;
  }

  String combineMod(String? originalMod, String newMod) {
    String combinedMod = newMod;
    if (originalMod != null && originalMod != "") {
      combinedMod = "$newMod-$originalMod";
    }
    return combinedMod;
  }

  // // TODO: return type should be a SortedMap
  Map<String, Object>? dateTimeResolution(DateTimeParseResult? slot, IOptionsConfiguration config) {
    if (slot == null) {
      return null;
    }

    final resolutions = <Map<String, String>>[];
    var res = LinkedHashMap<String, Object>();

    final val = slot.value as DateTimeResolutionResult?;
    if (val == null) {
      return null;
    }

    bool islunar = val.isLunar != null ? val.isLunar! : false;
    String? mod = val.mod;

    String? list;

    // Resolve dates list for date periods
    if (slot.type == DateTimeConstants.SYS_DATETIME_DATEPERIOD && val.list != null) {
      list = val.list!.map((item) => DateTimeFormatUtil.luisDateFromDateTime(item as DateTime)).join(",");
      // ^ adapted from the below line.
      // list = String.join(",", val.getList().stream().map(o -> DateTimeFormatUtil.luisDate((LocalDateTime)o)).collect(Collectors.toList()));
    }

    // With modifier, output Type might not be the same with type in resolution comments
    // For example, if the resolution type is "date", with modifier the output type should be "daterange"
    String typeOutput = determineDateTimeType(slot.type!, !StringUtility.isNullOrEmpty(mod), config);
    String? sourceEntity = determineSourceEntityType(slot.type!, typeOutput, val.hasRangeChangingMod);
    String? comment = val.comment;

    String type = slot.type!;
    String? timex = slot.timexStr;

    // The following should be added to res first, since ResolveAmPm requires these fields.
    addResolutionFieldsObject(res, DateTimeResolutionKey.Timex, timex);
    addResolutionFieldsObject(res, DateTimeConstants.Comment, comment);
    addResolutionFieldsObject(res, DateTimeResolutionKey.Mod, mod);
    addResolutionFieldsObject(res, ResolutionKey.Type, typeOutput);
    addResolutionFieldsObject(res, DateTimeResolutionKey.IsLunar, islunar ? islunar.toString() : "");

    bool hasTimeZone = false;

    // For standalone timezone entity recognition, we generate TimeZoneResolution for each entity we extracted.
    // We also merge time entity with timezone entity and add the information in TimeZoneResolution to every DateTime resolutions.
    if (val.timeZoneResolution != null) {
      if (slot.type == DateTimeConstants.SYS_DATETIME_TIMEZONE) {
        // single timezone
        final resolutionField = <String, String>{};
        resolutionField[ResolutionKey.Value] = val.timeZoneResolution!.value;
        resolutionField[DateTimeConstants.UtcOffsetMinsKey] = val.timeZoneResolution!.utcOffsetMins.toString();

        addResolutionFieldsObject(res, DateTimeConstants.ResolveTimeZone, resolutionField);
      } else {
        // timezone as clarification of datetime
        hasTimeZone = true;
        addResolutionFieldsObject(res, DateTimeConstants.TimeZone, val.timeZoneResolution!.value);
        addResolutionFieldsObject(res, DateTimeConstants.TimeZoneText, val.timeZoneResolution!.timeZoneText);
        addResolutionFieldsObject(
            res, DateTimeConstants.UtcOffsetMinsKey, val.timeZoneResolution!.utcOffsetMins.toString());
      }
    }

    final pastResolutionStr = LinkedHashMap<String, String>();
    if ((slot.value as DateTimeResolutionResult).pastResolution != null) {
      pastResolutionStr.addAll((slot.value as DateTimeResolutionResult).pastResolution!);
    }

    final futureResolutionStr = (slot.value as DateTimeResolutionResult).futureResolution!;

    if (typeOutput == DateTimeConstants.SYS_DATETIME_DATETIMEALT && pastResolutionStr.isNotEmpty) {
      typeOutput = determineResolutionDateTimeType(pastResolutionStr);
    }

    Map<String, String> resolutionPast = generateResolution(type, pastResolutionStr, mod);
    Map<String, String> resolutionFuture = generateResolution(type, futureResolutionStr, mod);

    // If past and future are same, keep only one
    if ((const DeepCollectionEquality()).equals(resolutionFuture, resolutionPast)) {
      if (resolutionPast.isNotEmpty) {
        addResolutionFieldsObject(res, DateTimeConstants.Resolve, resolutionPast);
      }
    } else {
      if (resolutionPast.isNotEmpty) {
        addResolutionFieldsObject(res, DateTimeConstants.ResolveToPast, resolutionPast);
      }

      if (resolutionFuture.isNotEmpty) {
        addResolutionFieldsObject(res, DateTimeConstants.ResolveToFuture, resolutionFuture);
      }
    }

    // If 'ampm', double our resolution accordingly
    if (!StringUtility.isNullOrEmpty(comment) && comment == DateTimeConstants.Comment_AmPm) {
      if (res.containsKey(DateTimeConstants.Resolve)) {
        resolveAmPm(res, DateTimeConstants.Resolve);
      } else {
        resolveAmPm(res, DateTimeConstants.ResolveToPast);
        resolveAmPm(res, DateTimeConstants.ResolveToFuture);
      }
    }

    // If WeekOf and in CalendarMode, modify the past part of our resolution
    if (config.options.match(DateTimeOptions.CalendarMode) &&
        !StringUtility.isNullOrEmpty(comment) &&
        comment == DateTimeConstants.Comment_WeekOf) {
      resolveWeekOf(res, DateTimeConstants.ResolveToPast);
    }

    if (comment != null && comment.isNotEmpty && TimexUtility.hasDoubleTimex(comment) && timex != null) {
      res = TimexUtility.processDoubleTimex(
        res,
        DateTimeConstants.ResolveToFuture,
        DateTimeConstants.ResolveToPast,
        timex,
      );
    }

    for (final p in res.entries) {
      if (p.value is Map) {
        final value = <String, String>{};

        addResolutionFieldsString(value, DateTimeResolutionKey.Timex, timex);
        addResolutionFieldsString(value, DateTimeResolutionKey.Mod, mod);
        addResolutionFieldsString(value, ResolutionKey.Type, typeOutput);
        addResolutionFieldsString(value, DateTimeResolutionKey.IsLunar, islunar ? islunar.toString() : "");
        addResolutionFieldsString(value, DateTimeResolutionKey.List, list);
        addResolutionFieldsString(value, DateTimeResolutionKey.SourceEntity, sourceEntity);

        if (hasTimeZone) {
          addResolutionFieldsString(value, DateTimeConstants.TimeZone, val.timeZoneResolution?.value);
          addResolutionFieldsString(value, DateTimeConstants.TimeZoneText, val.timeZoneResolution?.timeZoneText);
          addResolutionFieldsString(
              value, DateTimeConstants.UtcOffsetMinsKey, val.timeZoneResolution?.utcOffsetMins.toString());
        }

        for (final q in (p.value as Map<String, String>).entries) {
          value[q.key] = q.value;
        }

        resolutions.add(value);
      }
    }

    if (resolutionPast.isEmpty && resolutionFuture.isEmpty && val.timeZoneResolution == null) {
      final notResolved = <String, String>{};
      notResolved[DateTimeResolutionKey.Timex] = timex!;
      notResolved[ResolutionKey.Type] = typeOutput;
      notResolved[ResolutionKey.Value] = "not resolved";

      resolutions.add(notResolved);
    }

    // Using a SplayTreeMap because the original code uses TreeMap and expects a sorted Map.
    final result = SplayTreeMap<String, Object>();
    result[ResolutionKey.ValueSet] = resolutions;

    return result;
  }

  String? determineSourceEntityType(String sourceType, String newType, bool hasMod) {
    if (!hasMod) {
      return null;
    }

    if (newType != sourceType) {
      return DateTimeConstants.SYS_DATETIME_DATETIMEPOINT;
    }

    if (newType != DateTimeConstants.SYS_DATETIME_DATEPERIOD) {
      return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;
    }

    return null;
  }

  String determineResolutionDateTimeType(LinkedHashMap<String, String> pastResolutionStr) {
    switch (pastResolutionStr.keys.first) {
      case TimeTypeConstants.START_DATE:
        return DateTimeConstants.SYS_DATETIME_DATEPERIOD;
      case TimeTypeConstants.START_DATETIME:
        return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;
      case TimeTypeConstants.START_TIME:
        return DateTimeConstants.SYS_DATETIME_TIMEPERIOD;
      default:
        return pastResolutionStr.keys.first.toLowerCase();
    }
  }

  Map<String, String> generateResolution(String type, Map<String, String> resolutionDic, String? mod) {
    final res = LinkedHashMap<String, String>();

    if (type == DateTimeConstants.SYS_DATETIME_DATETIME) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIME, mod, res);
    } else if (type == DateTimeConstants.SYS_DATETIME_TIME) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.TIME, mod, res);
    } else if (type == DateTimeConstants.SYS_DATETIME_DATE) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATE, mod, res);
    } else if (type == DateTimeConstants.SYS_DATETIME_DURATION) {
      if (resolutionDic.containsKey(TimeTypeConstants.DURATION)) {
        res[ResolutionKey.Value] = resolutionDic[TimeTypeConstants.DURATION]!;
      }
    } else if (type == DateTimeConstants.SYS_DATETIME_TIMEPERIOD) {
      addPeriodToResolution(resolutionDic, TimeTypeConstants.START_TIME, TimeTypeConstants.END_TIME, mod, res);
    } else if (type == DateTimeConstants.SYS_DATETIME_DATEPERIOD) {
      addPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATE, TimeTypeConstants.END_DATE, mod, res);
    } else if (type == DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD) {
      addPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATETIME, TimeTypeConstants.END_DATETIME, mod, res);
    } else if (type == DateTimeConstants.SYS_DATETIME_DATETIMEALT) {
      // for a period
      if (resolutionDic.length > 2) {
        addAltPeriodToResolution(resolutionDic, mod, res);
      } else {
        // for a datetime point
        addAltSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIMEALT, mod, res);
      }
    }

    return res;
  }

  void resolveAmPm(Map<String, Object> resolutionDic, String keyName) {
    if (resolutionDic.containsKey(keyName)) {
      final resolution = resolutionDic[keyName] as Map<String, String>;

      final resolutionPm = LinkedHashMap<String, String>();

      if (!resolutionDic.containsKey(DateTimeResolutionKey.Timex)) {
        return;
      }

      final timex = resolutionDic[DateTimeResolutionKey.Timex] as String? ?? "";

      // As resolutionDic is a LinkedHashMap and once a new value is set
      // it goes as the last value, we need to keep the position after the replacement.
      // Here it copies the resolutionDic map but appending the correct with Am
      // to populate again the received LinkedHashMap.
      // This is implemented because LinkedHashMap differs to Dictionary just in Java.
      final resolutionDicDuplicated = Map.fromEntries(
        resolutionDic.entries.map((entry) => entry.key == keyName ? MapEntry("$keyName Am", entry.value) : entry),
      );

      resolutionDic.clear();
      for (final entry in resolutionDicDuplicated.entries) {
        resolutionDic[entry.key] = entry.value;
      }

      switch (resolutionDic[ResolutionKey.Type] as String) {
        case DateTimeConstants.SYS_DATETIME_TIME:
          resolutionPm[ResolutionKey.Value] = DateTimeFormatUtil.toPm(resolution[ResolutionKey.Value]!);
          resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.toPm(timex);
          break;
        case DateTimeConstants.SYS_DATETIME_DATETIME:
          final splited = resolution[ResolutionKey.Value]!.split(" ");
          resolutionPm[ResolutionKey.Value] = "${splited[0]} ${DateTimeFormatUtil.toPm(splited[1])}";
          resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.allStringToPm(timex);
          break;
        case DateTimeConstants.SYS_DATETIME_TIMEPERIOD:
          if (resolution.containsKey(DateTimeResolutionKey.START)) {
            resolutionPm[DateTimeResolutionKey.START] =
                DateTimeFormatUtil.toPm(resolution[DateTimeResolutionKey.START]!);
          }

          if (resolution.containsKey(DateTimeResolutionKey.END)) {
            resolutionPm[DateTimeResolutionKey.END] = DateTimeFormatUtil.toPm(resolution[DateTimeResolutionKey.END]!);
          }

          resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.allStringToPm(timex);
          break;
        case DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD:
          if (resolution.containsKey(DateTimeResolutionKey.START)) {
            DateTime start = DateFormat("yyyy-MM-dd HH:mm:ss").parse(resolution[DateTimeResolutionKey.START]!);
            start = start.hour == DateTimeConstants.HalfDayHourCount
                ? start.subtract(Duration(hours: DateTimeConstants.HalfDayHourCount))
                : start.add(Duration(hours: DateTimeConstants.HalfDayHourCount));

            resolutionPm[DateTimeResolutionKey.START] = DateTimeFormatUtil.formatDateTime(start);
          }

          if (resolution.containsKey(DateTimeResolutionKey.END)) {
            DateTime end = DateFormat("yyyy-MM-dd HH:mm:ss").parse(resolution[DateTimeResolutionKey.END]!);
            end = end.hour == DateTimeConstants.HalfDayHourCount
                ? end.subtract(Duration(hours: DateTimeConstants.HalfDayHourCount))
                : end.add(Duration(hours: DateTimeConstants.HalfDayHourCount));

            resolutionPm[DateTimeResolutionKey.END] = DateTimeFormatUtil.formatDateTime(end);
          }

          resolutionPm[DateTimeResolutionKey.Timex] = DateTimeFormatUtil.allStringToPm(timex);
          break;
        default:
          break;
      }
      resolutionDic["${keyName}Pm"] = resolutionPm;
    }
  }

  void resolveWeekOf(Map<String, Object> resolutionDic, String keyName) {
    if (resolutionDic.containsKey(keyName)) {
      Map<String, String> resolution = resolutionDic[keyName] as Map<String, String>;

      final monday = DateUtil.tryParse(resolution[DateTimeResolutionKey.START]);
      resolution[DateTimeResolutionKey.Timex] = TimexUtility.generateWeekTimex(monday);

      resolutionDic[keyName] = resolution;
    }
  }

  static void addAltPeriodToResolution(Map<String, String> resolutionDic, String? mod, Map<String, String> res) {
    if (resolutionDic.containsKey(TimeTypeConstants.START_DATETIME) &&
        resolutionDic.containsKey(TimeTypeConstants.END_DATETIME)) {
      addPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATETIME, TimeTypeConstants.END_DATETIME, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeConstants.START_DATE) &&
        resolutionDic.containsKey(TimeTypeConstants.END_DATE)) {
      addPeriodToResolution(resolutionDic, TimeTypeConstants.START_DATE, TimeTypeConstants.END_DATE, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeConstants.START_TIME) &&
        resolutionDic.containsKey(TimeTypeConstants.END_TIME)) {
      addPeriodToResolution(resolutionDic, TimeTypeConstants.START_TIME, TimeTypeConstants.END_TIME, mod, res);
    }
  }

  static void addAltSingleDateTimeToResolution(
      Map<String, String> resolutionDic, String type, String? mod, Map<String, String> res) {
    if (resolutionDic.containsKey(TimeTypeConstants.DATE)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATE, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeConstants.DATETIME)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.DATETIME, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeConstants.TIME)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeConstants.TIME, mod, res);
    }
  }

  static void addSingleDateTimeToResolution(
      Map<String, String> resolutionDic, String type, String? mod, Map<String, String> res) {
    // If an "invalid" Date or DateTime is extracted, it should not have an assigned resolution.
    // Only valid entities should pass this condition.
    if (resolutionDic.containsKey(type) && !resolutionDic[type]!.startsWith(dateMinString)) {
      if (!StringUtility.isNullOrEmpty(mod)) {
        if (mod == DateTimeConstants.BEFORE_MOD) {
          res[DateTimeResolutionKey.END] = resolutionDic[type]!;
          return;
        }

        if (mod == DateTimeConstants.AFTER_MOD) {
          res[DateTimeResolutionKey.START] = resolutionDic[type]!;
          return;
        }

        if (mod == DateTimeConstants.SINCE_MOD) {
          res[DateTimeResolutionKey.START] = resolutionDic[type]!;
          return;
        }

        if (mod == DateTimeConstants.UNTIL_MOD) {
          res[DateTimeResolutionKey.END] = resolutionDic[type]!;
          return;
        }
      }

      res[ResolutionKey.Value] = resolutionDic[type]!;
    }
  }

  static void addPeriodToResolution(
      Map<String, String> resolutionDic, String startType, String endType, String? mod, Map<String, String> res) {
    String start = "";
    String end = "";

    if (resolutionDic.containsKey(startType)) {
      if (resolutionDic[startType]!.startsWith(dateMinString)) {
        return;
      }
      start = resolutionDic[startType]!;
    }

    if (resolutionDic.containsKey(endType)) {
      if (resolutionDic[endType]!.startsWith(dateMinString)) {
        return;
      }
      end = resolutionDic[endType]!;
    }

    if (!StringUtility.isNullOrEmpty(mod)) {
      // For the 'before' mod
      // 1. Cases like "Before December", the start of the period should be the end of the new period, not the start
      // 2. Cases like "More than 3 days before today", the date point should be the end of the new period
      if (mod!.startsWith(DateTimeConstants.BEFORE_MOD)) {
        if (!StringUtility.isNullOrEmpty(start) &&
            !StringUtility.isNullOrEmpty(end) &&
            !mod.endsWith(DateTimeConstants.LATE_MOD)) {
          res[DateTimeResolutionKey.END] = start;
        } else {
          res[DateTimeResolutionKey.END] = end;
        }

        return;
      }

      // For the 'after' mod
      // 1. Cases like "After January", the end of the period should be the start of the new period, not the end
      // 2. Cases like "More than 3 days after today", the date point should be the start of the new period
      if (mod.startsWith(DateTimeConstants.AFTER_MOD)) {
        if (!StringUtility.isNullOrEmpty(start) &&
            !StringUtility.isNullOrEmpty(end) &&
            !mod.endsWith(DateTimeConstants.EARLY_MOD)) {
          res[DateTimeResolutionKey.START] = end;
        } else {
          res[DateTimeResolutionKey.START] = start;
        }

        return;
      }

      // For the 'since' mod, the start of the period should be the start of the new period, not the end
      if (mod == DateTimeConstants.SINCE_MOD) {
        res[DateTimeResolutionKey.START] = start;
        return;
      }

      // For the 'until' mod, the end of the period should be the end of the new period, not the start
      if (mod == DateTimeConstants.UNTIL_MOD) {
        res[DateTimeResolutionKey.END] = end;
        return;
      }
    }

    if (!StringUtility.isNullOrEmpty(start) && !StringUtility.isNullOrEmpty(end)) {
      res[DateTimeResolutionKey.START] = start;
      res[DateTimeResolutionKey.END] = end;
    }
  }

  void addResolutionFieldsObject(Map<String, Object> dic, String key, Object? value) {
    if (value != null) {
      dic[key] = value;
    }
  }

  void addResolutionFieldsString(Map<String, String> dic, String key, String? value) {
    if (!StringUtility.isNullOrEmpty(value)) {
      dic[key] = value!;
    }
  }

  DateTimeParseResult setParseResult(
      DateTimeParseResult slot, bool hasMod, String parserName, IOptionsConfiguration config) {
    final slotValue = dateTimeResolution(slot, config);
    // Change the type at last for the after or before modes
    String type = "$parserName.${determineDateTimeType(slot.type!, hasMod, config)}";

    slot.value = slotValue;
    slot.type = type;

    return slot;
  }

  String determineDateTimeType(String type, bool hasMod, IOptionsConfiguration config) {
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

  ModelResult _getModelResult(DateTimeParseResult parsedDateTime) {
    int start = parsedDateTime.start;
    int end = parsedDateTime.start + parsedDateTime.length - 1;
    String typeName = parsedDateTime.type!;
    final resolution = parsedDateTime.value as Map<String, Object>;
    String text = parsedDateTime.text;

    var result = ModelResult(
      text: text,
      start: start,
      end: end,
      typeName: typeName,
      resolution: resolution,
    );

    final types = parsedDateTime.type!.split("\\.");
    String type = types[types.length - 1];
    if (type == DateTimeConstants.SYS_DATETIME_DATETIMEALT) {
      result = result.copyWith(
        parentText: _getParentText(parsedDateTime),
      );
    }

    return result;
  }

  static String _getParentText(DateTimeParseResult parsedDateTime) {
    final map = parsedDateTime.data as Map<String, Object>;
    final result = map[ModelResult.parentTextKey]!;
    return result.toString();
  }
}

class DateTimeResolutionResult {
  DateTimeResolutionResult();

  bool success = false;
  String? timex;
  bool? isLunar;
  String? mod;
  bool hasRangeChangingMod = false;
  String? comment;

  Map<String, String>? futureResolution;
  Map<String, String>? pastResolution;

  Object? futureValue;
  Object? pastValue;

  List<Object>? subDateTimeEntities;

  TimeZoneResolutionResult? timeZoneResolution;

  List<Object>? list;

  Map<String, dynamic> toTestCaseJson() {
    return {
      if (timex != null) //
        "Timex": timex,
      if (futureResolution != null) //
        "FutureResolution": futureResolution,
      if (pastResolution != null) //
        "PastResolution": pastResolution,
      if (mod != null) //
        "Mod": mod,
    };
  }
}

class TimeZoneResolutionResult {
  TimeZoneResolutionResult(this.value, this.utcOffsetMins, this.timeZoneText);

  final String value;
  final int utcOffsetMins;
  final String timeZoneText;
}

class ResolutionKey {
  static final String ValueSet = "values";
  static final String Value = "value";
  static final String Type = "type";
  static final String Unit = "unit";
  static final String Score = "score";
  static final String IsoCurrency = "isoCurrency";
  static final String Offset = "offset";
  static final String RelativeTo = "relativeTo";
}
