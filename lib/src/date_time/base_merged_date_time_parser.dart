import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/core/task_mode_processing.dart';
import 'package:nlp/src/date_time/constants.dart';

import 'package:nlp/src/date_time/date_time_parsing.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/date_time/merged_parser_util.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseMergedDateTimeParser implements IDateTimeParser {
  BaseMergedDateTimeParser(this.config);

  final IMergedParserConfiguration config;

  @override
  String getParserName() => '';

  @override
  ParseResult? parse(ExtractResult extractResult) {
    return parseDateTime(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parseDateTime(ExtractResult er, DateTime refTime) {
    var referenceTime = refTime;
    DateTimeParseResult? pr = null;

    var origintext = er.text;
    // TODO: bring back
    // if (this.config.options.match(DateTimeOptions.EnablePreview))
    // {
    //     er.text = MatchingUtil.PreProcesstextRemoveSuperfluousWords(er.text, config.SuperfluousWordMatcher, out var _);
    //     er.length += er.text.length - origintext.length;
    // }

    bool hasBefore = false,
        hasAfter = false,
        hasSince = false,
        hasAround = false,
        hasEqual = false,
        hasDateAfter = false;

    // "InclusiveModifier" means MOD should include the start/end time
    // For example, cases like "on or later than", "earlier than or in" have inclusive modifier
    var hasInclusiveModifier = false;
    var matchIsAfter = false;
    var modStr = '';

    // Analyze and process modifiers
    // Push, save the MOD string
    if (er.metadata?.hasMod == true) {
      var beforeMatch = RegExpComposer.matchBegin(config.getBeforeRegex(), er.text, true);
      var afterMatch = RegExpComposer.matchBegin(config.getAfterRegex(), er.text, true);
      var sinceMatch = RegExpComposer.matchBegin(config.getSinceRegex(), er.text, true);
      var preLength = 0;
      if (beforeMatch != null) {
        preLength = beforeMatch.index + beforeMatch.length;
      } else if (afterMatch != null) {
        preLength = afterMatch.index + afterMatch.length;
      } else if (sinceMatch != null) {
        preLength = sinceMatch.index + sinceMatch.length;
      }

      var aroundtext = er.text.substring(preLength);
      var aroundMatch = RegExpComposer.matchBegin(config.getAroundRegex(), aroundtext, true);
      var equalMatch = RegExpComposer.matchBegin(config.getEqualRegex(), er.text, true);

      // check also after match
      if (config.checkBothBeforeAfter() && er.data != null && er.data == DateTimeConstants.HAS_MOD) {
        if (beforeMatch == null) {
          beforeMatch = RegExpComposer.matchEnd(config.getBeforeRegex(), er.text, true);
          matchIsAfter = matchIsAfter || beforeMatch != null;
        }

        if (afterMatch == null) {
          afterMatch = RegExpComposer.matchEnd(config.getAfterRegex(), er.text, true);
          matchIsAfter = matchIsAfter || afterMatch != null;
        }

        if (sinceMatch == null) {
          sinceMatch = RegExpComposer.matchEnd(config.getSinceRegex(), er.text, true);
          matchIsAfter = matchIsAfter || sinceMatch != null;
        }

        if (aroundMatch == null) {
          aroundMatch = RegExpComposer.matchEnd(config.getAroundRegex(), er.text, true);
          matchIsAfter = matchIsAfter || aroundMatch != null;
        }

        if (equalMatch == null) {
          equalMatch = RegExpComposer.matchEnd(config.getEqualRegex(), er.text, true);
          matchIsAfter = matchIsAfter || equalMatch != null;
        }
      }

      if (aroundMatch != null) {
        hasAround = true;
        er.start += matchIsAfter ? 0 : preLength + aroundMatch.index + aroundMatch.length;
        er.length -= matchIsAfter ? aroundMatch.length : preLength + aroundMatch.index + aroundMatch.length;
        er.text = matchIsAfter
            ? er.text.substring(0, er.length)
            : er.text.substring(preLength + aroundMatch.index + aroundMatch.length);
        modStr = matchIsAfter ? aroundMatch.value : aroundtext.substring(0, aroundMatch.index + aroundMatch.length);
      }

      if (beforeMatch != null) {
        hasBefore = true;
        if (!hasAround) {
          er.start += matchIsAfter ? 0 : beforeMatch.length;
          er.length -= beforeMatch.length;
          er.text = matchIsAfter ? er.text.substring(0, er.length) : er.text.substring(beforeMatch.length);
        }

        modStr = beforeMatch.value + modStr;

        if (beforeMatch.getGroup(DateTimeConstants.IncludeGroupName).value.isNotEmpty) {
          hasInclusiveModifier = true;
        }
      } else if (afterMatch != null) {
        hasAfter = true;
        if (!hasAround) {
          er.start += matchIsAfter ? 0 : afterMatch.length;
          er.length -= afterMatch.length;
          er.text = matchIsAfter ? er.text.substring(0, er.length) : er.text.substring(afterMatch.length);
        }

        modStr = afterMatch.value + modStr;

        if (afterMatch.getGroup(DateTimeConstants.IncludeGroupName).value.isNotEmpty) {
          hasInclusiveModifier = true;
        }
      } else if (sinceMatch != null) {
        hasSince = true;
        if (!hasAround) {
          er.start += matchIsAfter ? 0 : sinceMatch.length;
          er.length -= sinceMatch.length;
          er.text = matchIsAfter ? er.text.substring(0, er.length) : er.text.substring(sinceMatch.length);
        }

        modStr = sinceMatch.value + modStr;
      } else if (equalMatch != null) {
        hasEqual = true;
        er.start += matchIsAfter ? 0 : equalMatch.length;
        er.length -= equalMatch.length;
        er.text = matchIsAfter ? er.text.substring(0, er.length) : er.text.substring(equalMatch.length);
        modStr = equalMatch.value;
      } else if ((er.type == DateTimeConstants.SYS_DATETIME_DATEPERIOD && config.getYearRegex().hasMatch(er.text)) ||
          er.type == DateTimeConstants.SYS_DATETIME_DATE ||
          er.type == DateTimeConstants.SYS_DATETIME_TIME) {
        // This has to be put at the end of the if, or cases like "before 2012" and "after 2012" would fall into this
        // 2012 or after/above
        // 3 pm or later
        var match = config.getSinceRegex().matchEnd(er.text, true);
        if (match != null) {
          hasDateAfter = true;
          er.length -= match.length;
          er.text = er.text.substring(0, er.length ?? 0);
          modStr = match.value;
        }
      }
    }

    // Parse extracted datetime mention
    pr = parseExtractedResult(er, referenceTime);
    if (pr == null) {
      return DateTimeParseResult(start: 0, length: 0, text: '');
    }

    // Apply processed modifiers
    // Pop, restore the MOD string
    if (hasBefore && pr.value != null) {
      pr.length += modStr.length;
      pr.start -= matchIsAfter ? 0 : modStr.length;
      pr.text = matchIsAfter ? pr.text + modStr : modStr + pr.text;
      var val = pr.value as DateTimeResolutionResult;

      val.mod = MergedParserUtil.CombineMod(
          val.mod ?? '', !hasInclusiveModifier ? DateTimeConstants.BEFORE_MOD : DateTimeConstants.UNTIL_MOD);

      if (hasAround) {
        val.mod = MergedParserUtil.CombineMod(DateTimeConstants.APPROX_MOD, val.mod ?? '');
        hasAround = false;
      }

      pr.value = val;
    }

    if (hasAfter && pr.value != null) {
      pr.length += modStr.length;
      pr.start -= matchIsAfter ? 0 : modStr.length;
      pr.text = matchIsAfter ? pr.text + modStr : modStr + pr.text;
      var val = pr.value as DateTimeResolutionResult;

      val.mod = MergedParserUtil.CombineMod(
          val.mod ?? '', !hasInclusiveModifier ? DateTimeConstants.AFTER_MOD : DateTimeConstants.SINCE_MOD);

      if (hasAround) {
        val.mod = MergedParserUtil.CombineMod(DateTimeConstants.APPROX_MOD, val.mod ?? '');
        hasAround = false;
      }

      pr.value = val;
    }

    if (hasSince && pr.value != null) {
      pr.length += modStr.length;
      pr.start -= matchIsAfter ? 0 : modStr.length;
      pr.text = matchIsAfter ? pr.text + modStr : modStr + pr.text;
      var val = pr.value as DateTimeResolutionResult;
      val.mod = MergedParserUtil.CombineMod(val.mod ?? '', DateTimeConstants.SINCE_MOD);

      if (hasAround) {
        val.mod = MergedParserUtil.CombineMod(DateTimeConstants.APPROX_MOD, val.mod ?? '');
        hasAround = false;
      }

      pr.value = val;
    }

    if (hasAround && pr.value != null) {
      pr.length += modStr.length;
      pr.start -= matchIsAfter ? 0 : modStr.length;
      pr.text = matchIsAfter ? pr.text + modStr : modStr + pr.text;
      var val = pr.value as DateTimeResolutionResult;
      val.mod = MergedParserUtil.CombineMod(val.mod ?? '', DateTimeConstants.APPROX_MOD);
      pr.value = val;
    }

    if (hasEqual && pr.value != null) {
      pr.length += modStr.length;
      pr.start -= matchIsAfter ? 0 : modStr.length;
      pr.text = matchIsAfter ? pr.text + modStr : modStr + pr.text;
    }

    if (hasDateAfter && pr.value != null) {
      pr.length += modStr.length;
      pr.text += modStr;
      var val = pr.value as DateTimeResolutionResult;
      val.mod = MergedParserUtil.CombineMod(val.mod ?? '', DateTimeConstants.SINCE_MOD);
      pr.value = val;
      hasSince = true;
    }

    // For cases like "3 pm or later on monday"
    if (pr.value != null &&
        config.getSuffixAfterRegex().firstMatch(pr.text)?.start != 0 &&
        pr.type == DateTimeConstants.SYS_DATETIME_DATETIME &&
        !config.checkBothBeforeAfter()) {
      var val = pr.value as DateTimeResolutionResult;
      val.mod = MergedParserUtil.CombineMod(val.mod ?? '', DateTimeConstants.SINCE_MOD);
      pr.value = val;
      hasSince = true;
    }

    if (config.options.match(DateTimeOptions.SplitDateAndTime) &&
        (pr.value as DateTimeResolutionResult?)?.subDateTimeEntities != null) {
      pr.value = MergedParserUtil.DateTimeResolutionForSplit(pr, config);
    } else {
      var hasRangeChangingMod = hasBefore || hasAfter || hasSince;
      if (pr.value != null) {
        (pr.value as DateTimeResolutionResult).hasRangeChangingMod = hasRangeChangingMod;
      }

      pr = MergedParserUtil.SetParseResult(pr, hasRangeChangingMod, config);
    }

    // In this version, ExperimentalMode only cope with the "IncludePeriodEnd" case
    // if ((this.config.options & DateTimeOptions.ExperimentalMode) != 0)
    // {
    //     if (pr?.metadata != null && pr.metadata.PossiblyIncludePeriodEnd)
    //     {
    //         pr = MergedParserUtil.SetInclusivePeriodEnd(pr);
    //     }
    // }

    if (config.options.match(DateTimeOptions.EnablePreview)) {
      if (pr != null) {
        pr.length += origintext.length - pr.text.length;
        pr.text = origintext;
      }
    }

    /* Modification of datetime value under tasksmode,
             for example when input text is 9 april at 2 pm and current datetime value is 9 april 2022 1pm,
            then output for current query should be "9 april 2022, 9pm" under tasksmode which is different
            from default mode, under which it is "9 april 2023, 9pm".
             */
    // if ((this.config.options & DateTimeOptions.TasksMode) != 0) {
    //   if (pr != null) {
    //     pr = TasksModeProcessing.TasksModeModification(pr, referenceTime);
    //     pr.text = origintext;
    //   }
    // }

    return pr;
  }

  // @TODO move to MergedParserUtil (if possible)
  DateTimeParseResult parseExtractedResult(ExtractResult extractResult, DateTime referenceTime) {
    DateTimeParseResult? parseResult = null;
    switch (extractResult.type) {
      case DateTimeConstants.SYS_DATETIME_DATE:
        // if (extractResult.metadata != null &&
        //     extractResult.metadata!.isHoliday &&
        //     !extractResult.metadata!.isHolidayRange) {
        //   parseResult = config.HolidayParser.Parse(extractResult, referenceTime);
        // } else {
        parseResult = config.dateParser.parseDateTime(extractResult, referenceTime);
        //}

        break;
      case DateTimeConstants.SYS_DATETIME_TIME:
        parseResult = config.timeParser.parseDateTime(extractResult, referenceTime);

        break;
      case DateTimeConstants.SYS_DATETIME_DATETIME:
      case DateTimeConstants.SYS_DATETIME_DATETIMEALT:
        parseResult = config.dateTimeParser.parseDateTime(extractResult, referenceTime);

        break;
      case DateTimeConstants.SYS_DATETIME_DATEPERIOD:
        // if (extractResult.metadata != null && extractResult.metadata.sHolidayRange) {
        //   parseResult = this.config.HolidayParser.Parse(extractResult, referenceTime);
        // } else {
        parseResult = config.datePeriodParser.parseDateTime(extractResult, referenceTime);
        //}

        break;
      case DateTimeConstants.SYS_DATETIME_TIMEPERIOD:
        parseResult = config.timePeriodParser.parseDateTime(extractResult, referenceTime);

        break;
      case DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD:
        parseResult = config.dateTimePeriodParser.parseDateTime(extractResult, referenceTime);

        break;
      case DateTimeConstants.SYS_DATETIME_DURATION:
        parseResult = config.durationParser.parseDateTime(extractResult, referenceTime);

        break;
      case DateTimeConstants.SYS_DATETIME_SET:
        parseResult = config.setParser.parseDateTime(extractResult, referenceTime);

        break;
      // case DateTimeConstants.SYS_DATETIME_DATETIMEALT:
      //   parseResult = this.config.DateTimeAltParser.Parse(extractResult, referenceTime);

      //   break;
      // case DateTimeConstants.SYS_DATETIME_TIMEZONE:
      //   if (config.options.match(DateTimeOptions.EnablePreview)) {
      //     parseResult = config.timeZoneParser.parseDateTime(extractResult, referenceTime);
      //   }

      //   break;
      default:
        return parseExtractedResult(extractResult, referenceTime);
    }

    return parseResult!;
  }

  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) => candidateResults;
}
