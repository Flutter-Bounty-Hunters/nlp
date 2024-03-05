import 'package:nlp/src/core/english_merged_extractor.dart';
import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/string_matcher.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/extract_result_extension.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseMergedDateTimeExtractor implements IDateTimeExtractor {
  BaseMergedDateTimeExtractor(this.config);

  final IMergedExtractorConfiguration config;

  @override
  String getExtractorName() => '';

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String text, DateTime reference) {
    var ret = <ExtractResult>[];

    if (config.options.match(DateTimeOptions.FailFast) && IsFailFastCase(text)) {
      // @TODO needs better handling of holidays and timezones.
      // AddTo(ret, this.config.HolidayExtractor.extractDateTime(text, reference), text);
      // ret = AddMod(ret, text);

      return ret;
    }

    var originText = text;
    List<MatchResult<String>>? superfluousWordMatches = null;

    // Push
    // if ((config.options & DateTimeOptions.EnablePreview) != 0)
    // {
    //     text = MatchingUtil.PreProcessTextRemoveSuperfluousWords(text, config.SuperfluousWordMatcher, out superfluousWordMatches);
    // }

    // The order is important, since there can be conflicts in merging
    AddTo(ret, config.dateExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.timeExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.datePeriodExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.durationExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.timePeriodExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.dateTimePeriodExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.dateTimeExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.setExtractor.extractDateTime(text, reference), text);
    AddTo(ret, config.holidayExtractor.extractDateTime(text, reference), text);

    // if ((config.options & DateTimeOptions.EnablePreview) != 0)
    // {
    //     AddTo(ret, config.TimeZoneExtractor.extractDateTime(text, reference), text);
    //     ret = config.TimeZoneExtractor.RemoveAmbiguousTimezone(ret);
    // }

    // This should be the last extraction step, as it needs to determine if the previous text contains time or not
    AddTo(ret, NumberEndingRegexMatch(text, ret), text);

    // Modify time entity to an alternative DateTime expression if it follows a DateTime entity
    // if ((config.options & DateTimeOptions.ExtendedTypes) != 0)
    // {
    //     ret = config.DateTimeAltExtractor.extractDateTime(ret, text, reference);
    // }

    ret = FilterUnspecificDatePeriod(ret);

    // Remove common ambiguous cases
    // TODO: Bring back
    //ret = ExtractResultExtension.FilterAmbiguity(ret, text, config.AmbiguityFiltersDict);

    ret = AddMod(ret, text);

    // Filtering
    if (config.options.match(DateTimeOptions.CalendarMode)) {
      ret = CheckCalendarModeFilters(ret, text);
    }

    ret.sort((a, b) => a.start - b.start);

    // Merge overlapping results
    ret = ExtractResultExtension.MergeAllResults(ret);

    // Pop
    // if ((config.options & DateTimeOptions.EnablePreview) != 0)
    // {
    //     ret = MatchingUtil.PostProcessRecoverSuperfluousWords(ret, superfluousWordMatches, originText);
    // }

    return ret;
  }

  static int? HasTokenIndex(String text, RegExp regex, bool inPrefix) {
    // Support cases has two or more specific tokens
    // For example, "show me sales after 2010 and before 2018 or before 2000"
    // When extract "before 2000", we need the second "before" which will be matched in the second RegExp match
    //RegexOptions regexFlags = inPrefix ? RegexOptions.RightToLeft | RegexOptions.Singleline : RegexOptions.Singleline;
    var match = regex.firstMatch(text);

    if (match != null) {
      var subStr = inPrefix ? text.substring(match.end) : text.substring(0, match.start);
      if (subStr.isEmpty) {
        return inPrefix ? match.start : match.end - match.start;
      }
    }

    return null;
  }

  bool TryMergeModifierToken(ExtractResult er, RegExp tokenRegex, String text, [bool potentialAmbiguity = false]) {
    var beforeStr = text.substring(0, er.start ?? 0);
    var afterStr = text.substring(er.start + er.length ?? 0);
    var tokenIndex = HasTokenIndex(beforeStr.trimRight(), tokenRegex, true);
    if (tokenIndex != null) {
      // Avoid adding mod for ambiguity cases, such as "from" in "from ... to ..." should not add mod
      if (potentialAmbiguity &&
          config.getAmbiguousRangeModifierPrefix() != null &&
          config.getAmbiguousRangeModifierPrefix().hasMatch(beforeStr.substring(tokenIndex))) {
        var matches = RegExpComposer.getMatchesSimple(config.getPotentialAmbiguousRangeRegex(), text);

        // Weak ambiguous matches are considered only if the extraction is of type range
        if (matches
            .where((m) =>
                m.index < er.start + er.length &&
                m.index + m.length > er.start &&
                !(m.getGroup(DateTimeConstants.AmbiguousPattern).success && er.type?.endsWith("range") != true))
            .isNotEmpty) {
          return false;
        }
      }

      var modLength = beforeStr.length - tokenIndex;

      er.length += modLength;
      er.start -= modLength;
      er.text = text.substring(er.start ?? 0, er.length ?? 0);

      er.metadata = AssignModMetadata(er.metadata);

      return true;
    } else if (config.checkBothBeforeAfter) {
      // check also afterStr
      afterStr = text.substring(er.start + er.length ?? 0);

      tokenIndex = HasTokenIndex(afterStr.trimLeft(), tokenRegex, false);
      if (tokenIndex != null) {
        var modLength = tokenIndex + afterStr.length - afterStr.trimLeft().length;

        er.length += modLength;
        er.text = text.substring(er.start ?? 0, er.length ?? 0);
        er.data = DateTimeConstants.HAS_MOD;
        er.metadata = AssignModMetadata(er.metadata);

        return true;
      }
    }

    return false;
  }

  Metadata AssignModMetadata(Metadata? metadata) {
    if (metadata == null) {
      metadata = new Metadata(hasMod: true);
    } else {
      metadata.hasMod = true;
    }

    return metadata;
  }

  bool IsFailFastCase(String input) {
    return (config.getFailFastRegex() != null) && (!config.getFailFastRegex()!.hasMatch(input));
  }

  List<ExtractResult> CheckCalendarModeFilters(List<ExtractResult> res, String text) {
    final ers = res.reversed.toList();

    for (var er in ers) {
      for (var regex in config.getTermFilterRegexes()) {
        var match = regex.firstMatch(er.text);
        if (match != null) {
          ers.remove(er);
        }
      }
    }

    return ers;
  }

  void AddTo(List<ExtractResult> dst, List<ExtractResult> src, String text) {
    for (var result in src) {
      if (config.options.match(DateTimeOptions.SkipFromToMerge)) {
        if (ShouldSkipFromToMerge(result)) {
          continue;
        }
      }

      if (config.options.match(DateTimeOptions.TasksMode)) {
        if (ShouldSkipOnlyYear(result) || TasksModeFilters(result)) {
          continue;
        }
      }

      var isFound = false;
      var overlapIndexes = <int>[];
      var firstIndex = -1;
      for (var i = 0; i < dst.length; i++) {
        if (dst[i].isOverlap(result)) {
          isFound = true;
          if (dst[i].isCover(result)) {
            if (firstIndex == -1) {
              firstIndex = i;
            }

            overlapIndexes.add(i);
          } else {
            break;
          }
        }
      }

      if (!isFound) {
        dst.add(result);
      } else if (overlapIndexes.isNotEmpty) {
        var tempDst = dst.where((i) => !overlapIndexes.contains(i)).toList();

        // Insert at the first overlap occurence to keep the order
        tempDst.insert(firstIndex, result);
        dst.clear();
        dst.addAll(tempDst);
      }

      dst.sort((a, b) => a.start - b.start);
    }
  }

  bool ShouldSkipFromToMerge(ExtractResult er) {
    return config.getFromToRegex().hasMatch(er.text);
  }

  bool TasksModeFilters(ExtractResult er) {
    return false;
    // var match = config.TasksModeMentionFilters.Match(er.text);

    // if (match.success)
    // {
    //     return true;
    // }

    // return false;
  }

  /*Under TasksMode: Should not treat a four-digit number as a daterange if the input text does not include a month or year reference.
          It should not treat 2005 as a daterange in statements like "Milk 2005."
         (The year 2005 should be treated as a number only.)
        */
  bool ShouldSkipOnlyYear(ExtractResult er) {
    return config.getYearRegex().firstMatch(er.text)?.value == er.text;
  }

  List<ExtractResult> FilterUnspecificDatePeriod(List<ExtractResult> ers) {
    ers.removeWhere((o) => config.getUnspecificDatePeriodRegex().hasMatch(o.text));
    return ers;
  }

  // Handle cases like "move 3pm appointment to 4"
  List<ExtractResult> NumberEndingRegexMatch(String text, List<ExtractResult> extractResults) {
    var tokens = <Token>[];

    for (var extractResult in extractResults) {
      if (extractResult.type == DateTimeConstants.SYS_DATETIME_TIME ||
          extractResult.type == DateTimeConstants.SYS_DATETIME_DATETIME) {
        var stringAfter = text.substring(extractResult.start + extractResult.length);
        var match = RegExpComposer.firstMatch(config.getNumberEndingRegExp(), stringAfter);
        if (match != null) {
          var newTime = match.getGroup("newTime");
          var numRes = config.integerExtractor.extract(newTime.value);
          if (numRes.length == 0) {
            continue;
          }

          var startPosition = extractResult.start + extractResult.length + newTime.index;
          tokens.add(new Token(startPosition, startPosition + newTime.length));
        }
      }
    }

    return Token.mergeAllTokens(tokens, text, DateTimeConstants.SYS_DATETIME_TIME);
  }

  List<ExtractResult> AddMod(List<ExtractResult> ers, String text) {
    for (var er in ers) {
      // AroundRegex is matched non-exclusively before the other relative regexes in order to catch also combined modifiers e.g. "before around 1pm"
      TryMergeModifierToken(er, config.getAroundRegex(), text);

      // BeforeRegex in Dutch contains the term "voor" which is ambiguous (meaning both "for" and "before")
      var success = TryMergeModifierToken(er, config.getBeforeRegex(), text, true);

      if (!success) {
        success = TryMergeModifierToken(er, config.getAfterRegex(), text);
      }

      if (!success) {
        // SinceRegex in English contains the term "from" which is potentially ambiguous with ranges in the form "from X to Y"
        success = TryMergeModifierToken(er, config.getSinceRegex(), text, true);
      }

      if (!success) {
        success = TryMergeModifierToken(er, config.getEqualRegex(), text);
      }

      if (er.type == DateTimeConstants.SYS_DATETIME_DATEPERIOD ||
          er.type == DateTimeConstants.SYS_DATETIME_DATE ||
          er.type == DateTimeConstants.SYS_DATETIME_TIME) {
        // 2012 or after/above, 3 pm or later
        var afterStr = text.substring((er.start ?? 0) + (er.length ?? 0));

        if (afterStr.length > 1) {
          var match = config.getSuffixAfterRegex().matchBegin(afterStr.trimLeft(), true);

          if (match != null && match.value != ".") {
            var isFollowedByOtherEntity = true;

            if (match.length == afterStr.trim().length) {
              isFollowedByOtherEntity = false;
            } else {
              var nextStr = afterStr.trim().substring(match.length).trim();
              var nextEr = ers.where((t) => t.start > er.start).firstOrNull;

              if (nextEr == null || !nextStr.startsWith(nextEr.text)) {
                isFollowedByOtherEntity = false;
              }
            }

            if (!isFollowedByOtherEntity) {
              var modLength = match.length + afterStr.indexOf(match.value);
              er.length += modLength;
              er.text = text.substring(er.start ?? 0, er.length ?? 0);

              er.metadata = AssignModMetadata(er.metadata);
            }
          }
        }
      }
    }

    return ers;
  }
}
