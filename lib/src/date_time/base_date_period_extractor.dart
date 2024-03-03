import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseDatePeriodExtractor implements IDateTimeExtractor {
  BaseDatePeriodExtractor(this.config);

  final IDatePeriodExtractorConfiguration config;

  @override
  String getExtractorName() => DateTimeConstants.SYS_DATETIME_DATEPERIOD;

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String input, DateTime reference) {
    final text = input.toLowerCase();

    var tokens = <Token>[];
    tokens.addAll(MatchSimpleCases(text));

    var simpleCasesResults = Token.mergeAllTokens(tokens, text, getExtractorName());
    var ordinalExtractions = config.OrdinalExtractor().extract(text);

    tokens.addAll(MergeTwoTimePoints(text, reference));
    tokens.addAll(MatchDuration(text, reference));
    tokens.addAll(SingleTimePointWithPatterns(text, ordinalExtractions, reference));
    tokens.addAll(MatchComplexCases(text, simpleCasesResults, reference));
    tokens.addAll(MatchYearPeriod(text, reference));
    tokens.addAll(MatchOrdinalNumberWithCenturySuffix(text, ordinalExtractions));

    return Token.mergeAllTokens(tokens, text, getExtractorName());
  }

  List<Token> MatchDuration(String text, DateTime reference) {
    var ret = <Token>[];

    var durations = <Token>[];
    var durationExtractions = config.DurationExtractor().extractDateTime(text, reference);

    for (var durationExtraction in durationExtractions) {
      var dateUnitMatch = RegExpComposer.firstMatch(config.DateUnitRegex(), durationExtraction.text);
      if (dateUnitMatch == null) {
        continue;
      }

      var isPlurarUnit = dateUnitMatch.getGroup(DateTimeConstants.PluralUnit).success;
      var duration = Token(durationExtraction.start ?? 0, durationExtraction.start + durationExtraction.length ?? 0);
      var beforeStr = text.substring(0, duration.start);
      var afterStr = text.substring(duration.start + duration.length);

      if (beforeStr.isEmpty && afterStr.isEmpty) {
        continue;
      }

      // Patterns like 'first 3 weeks of 2018', 'last two months of 2020'
      if (dateUnitMatch.getGroup(DateTimeConstants.UnitOfYearGroupName).success) {
        var beforeMatch = config.FirstLastRegex().matchEnd(beforeStr, true);
        if (beforeMatch != null) {
          var afterMatch = config.OfYearRegex().matchBegin(afterStr, true);
          if (afterMatch != null) {
            ret.add(Token(beforeMatch.start, duration.end + afterMatch.start + afterMatch.length));
            continue;
          }
        }
      }

      // within "Days/Weeks/Months/Years" should be handled as dateRange here
      // if duration contains "Seconds/Minutes/Hours", it should be treated as datetimeRange
      Token matchToken = MatchWithinNextAffixRegex(text, duration, true);
      if (matchToken.start >= 0) {
        ret.add(matchToken);
        continue;
      }

      // check also afterStr
      if (config.CheckBothBeforeAfter()) {
        matchToken = MatchWithinNextAffixRegex(text, duration, false);
        if (matchToken.start >= 0) {
          ret.add(matchToken);
          continue;
        }
      }

      // Match prefix
      var match = config.PreviousPrefixRegex().matchEnd(beforeStr, true);

      var index = -1;

      if (match != null) {
        index = match.start;
      }

      if (index < 0) {
        // For cases like "next five days"
        match = config.FutureRegex().matchEnd(beforeStr, true);

        if (match != null) {
          index = match.start;
        }
      }

      if (index >= 0) {
        var prefix = beforeStr.substring(0, index).trim();
        var durationText = text.substring(duration.start, duration.end);

        var numbersInPrefix = config.CardinalExtractor().extract(prefix);
        var numbersInDuration = config.CardinalExtractor().extract(durationText);

        // Cases like "2 upcoming days", should be supported here
        // Cases like "2 upcoming 3 days" is invalid, only extract "upcoming 3 days" by default
        if (numbersInPrefix.isNotEmpty && numbersInDuration.isEmpty && isPlurarUnit) {
          final sortedNumbers = [...numbersInPrefix];
          sortedNumbers.sort((a, b) => (a.start + a.length) - (b.start + b.length));
          var lastNumber = sortedNumbers.last;

          // Prefix should ends with the last number
          if (lastNumber.start + lastNumber.length == prefix.length) {
            ret.add(Token(lastNumber.start, duration.end));
          }
        } else {
          ret.add(Token(index, duration.end));
        }

        continue;
      }

      // Match suffix
      match = config.PreviousPrefixRegex().matchBegin(afterStr, true);

      if (match != null) {
        ret.add(Token(duration.start, duration.end + match.start + match.length));
        continue;
      }

      match = config.FutureSuffixRegex().matchBegin(afterStr, true);

      if (match != null) {
        ret.add(Token(duration.start, duration.end + match.start + match.length));
        continue;
      }
    }

    return ret;
  }

  static List<Token> GetTokenForRegexMatching(String text, RegExp regex, ExtractResult er, bool inPrefix) {
    var ret = <Token>[];

    var match = RegExpComposer.getMatchesSimple(regex, text).firstOrNull;
    bool isMatchAtEdge =
        inPrefix ? text.trim().endsWith(match?.value.trim() ?? '') : text.trim().startsWith(match?.value.trim() ?? '');

    if (match != null && isMatchAtEdge) {
      var startIndex = inPrefix ? text.lastIndexOf(match.value) : er.start;
      var endIndex = er.start + er.length;
      endIndex += inPrefix ? 0 : match.index + match.length;

      ret.add(Token(startIndex, endIndex));
    }

    return ret;
  }

  // Check whether the match is an infix of source
  static bool InfixBoundaryCheck(NlpMatch match, String source) {
    bool isMatchInfixOfSource = false;
    if (match.index > 0 && (match.index + match.length) < source.length) {
      if (source.substring(match.index, match.index + match.length) == match.value) {
        isMatchInfixOfSource = true;
      }
    }

    return isMatchInfixOfSource;
  }

  static bool IsDigitChar(String ch) {
    return const ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].contains(ch);
  }

  int? HasDashPrefix(NlpMatch match, String source) {
    int? dashPrefixIndex;

    for (var i = match.index - 1; i >= 0; i--) {
      if (source[i] != ' ' && source[i] != '-') {
        break;
      } else if (source[i] == '-') {
        dashPrefixIndex = i;
        break;
      }
    }

    return dashPrefixIndex;
  }

  static int? HasDashSuffix(NlpMatch match, String source) {
    int? dashSuffixIndex;

    for (var i = match.index + match.length; i < source.length; i++) {
      if (source[i] != ' ' && source[i] != '-') {
        break;
      } else if (source[i] == '-') {
        dashSuffixIndex = i;
        break;
      }
    }

    return dashSuffixIndex;
  }

  static int? HasDigitNumberBeforeDash(String source, int dashPrefixIndex) {
    bool hasDigitNumberBeforeDash = false;
    int? numberStartIndex;

    for (var i = dashPrefixIndex - 1; i >= 0; i--) {
      if (source[i] == ' ') {
        continue;
      }

      if (IsDigitChar(source[i])) {
        hasDigitNumberBeforeDash = true;
      }

      if (!IsDigitChar(source[i])) {
        if (hasDigitNumberBeforeDash) {
          numberStartIndex = i + 1;
        }

        break;
      }
    }

    if (hasDigitNumberBeforeDash && numberStartIndex == -1) {
      numberStartIndex = 0;
    }

    return numberStartIndex;
  }

  static int? HasDigitNumberAfterDash(String source, int dashSuffixIndex) {
    bool hasDigitNumberAfterDash = false;
    int? numberEndIndex;

    for (var i = dashSuffixIndex + 1; i < source.length; i++) {
      if (source[i] == ' ') {
        continue;
      }

      if (IsDigitChar(source[i])) {
        hasDigitNumberAfterDash = true;
      }

      if (!IsDigitChar(source[i])) {
        if (hasDigitNumberAfterDash) {
          numberEndIndex = i;
        }

        break;
      }
    }

    if (hasDigitNumberAfterDash && numberEndIndex == -1) {
      numberEndIndex = source.length;
    }

    return numberEndIndex;
  }

  // Cases like "21st century"
  List<Token> MatchOrdinalNumberWithCenturySuffix(String text, List<ExtractResult> ordinalExtractions) {
    var ret = <Token>[];

    for (var er in ordinalExtractions) {
      if (er.start + er.length >= text.length) {
        continue;
      }

      var afterString = text.substring(er.start + er.length);
      var trimmedAfterString = afterString.trimLeft();
      var whiteSpacesCount = afterString.length - trimmedAfterString.length;
      var afterStringOffset = (er.start + er.length) + whiteSpacesCount;

      var match = config.CenturySuffixRegex().firstMatch(trimmedAfterString);

      if (match != null) {
        ret.add(Token(er.start, afterStringOffset + match.start + match.length));
      }
    }

    return ret;
  }

  List<Token> MatchYearPeriod(String text, DateTime referenceDate) {
    var ret = <Token>[];
    var metadata = Metadata(
      possiblyIncludePeriodEnd: true,
    );

    var matches = RegExpComposer.getMatchesSimple(config.YearPeriodRegex(), text);
    for (final match in matches) {
      var matchYear = RegExpComposer.getMatchesSimple(config.YearRegex(), match.value).firstOrNull;

      // Single year cases like "1998"
      if (matchYear != null && matchYear.length == match.value.length) {
        var year = config.DatePointExtractor().getYearFromText(matchYear);
        if (!(year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum)) {
          continue;
        }

        // Possibly include period end only apply for cases like "2014-2018", which are not single year cases
        metadata.possiblyIncludePeriodEnd = false;
      } else {
        var yearMatches = RegExpComposer.getMatchesSimple(config.YearRegex(), match.value);
        var allDigitYear = true;
        var isValidYear = true;

        for (final yearMatch in yearMatches) {
          var year = config.DatePointExtractor().getYearFromText(yearMatch);
          if (!(year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum)) {
            isValidYear = false;
            break;
          } else if (yearMatch.length != DateTimeConstants.FourDigitsYearLength) {
            allDigitYear = false;
          }
        }

        if (!isValidYear) {
          continue;
        }

        // Cases like "2010-2015"
        if (allDigitYear) {
          // Filter out cases like "82-2010-2015" or "2010-2015-82" where "2010-2015" should not be extracted as a DateRange
          if (HasInvalidDashContext(match, text)) {
            continue;
          }
        }
      }

      ret.add(Token(match.index, match.index + match.length, '', metadata));
    }

    return ret;
  }

  List<Token> MatchSimpleCases(String text) {
    var ret = <Token>[];
    for (var regex in config.SimpleCasesRegexes()) {
      var matches = RegExpComposer.getMatchesSimple(regex, text);

      for (final match in matches) {
        var matchYear = RegExpComposer.getMatchesSimple(config.YearRegex(), match.value).firstOrNull;

        if (matchYear != null && matchYear.length == match.value.length) {
          var year = config.DatePointExtractor().getYearFromText(matchYear);

          if (!(year >= DateTimeConstants.MinYearNum && year <= DateTimeConstants.MaxYearNum)) {
            continue;
          }
        }

        if (match.length == DateTimeConstants.FourDigitsYearLength && config.YearRegex().hasMatch(match.value)) {
          // handle single year which is surrounded by '-' at both sides, e.g., a single year falls in a GUID
          if (InfixBoundaryCheck(match, text)) {
            var substr = text.substring(match.index - 1, match.index + 6);

            if (config.IllegalYearRegex().hasMatch(substr)) {
              continue;
            }
          }

          // filter out cases like "82-2010", "2010-82" where "2010" should not be extracted as DateRange
          if (HasInvalidDashContext(match, text)) {
            continue;
          }
        }

        ret.add(Token(match.index, match.index + match.length));
      }
    }

    return ret;
  }

  // This method is to detect the invalid dash context
  // Some match with invalid dash context might be false positives
  // For example, it can be part of the phone number like "Tel: 138-2010-2015"
  bool HasInvalidDashContext(NlpMatch match, String text) {
    var hasInvalidDashContext = false;

    // Filter out cases like "82-2100" where "2100" should not be extracted as a DateRange
    // Filter out cases like "82-2010-2015" where "2010-2015" should not be extracted as a DateRange
    int? dashPrefixIndex = HasDashPrefix(match, text);
    if (dashPrefixIndex != null) {
      int? numberStartIndex = HasDigitNumberBeforeDash(text, dashPrefixIndex);
      if (numberStartIndex != null) {
        var digitNumberStr = text.substring(numberStartIndex, match.index - 1);

        if (config.MonthNumRegex().matchExact(digitNumberStr, true) == null) {
          hasInvalidDashContext = true;
        }
      }
    }

    // Filter out cases like "2100-82" where "2100" should not be extracted as a DateRange
    // Filter out cases like "2010-2015-82" where "2010-2015" should not be extracted as a DateRange
    int? dashSuffixIndex = HasDashSuffix(match, text);
    if (dashSuffixIndex != null) {
      int? numberEndIndex = HasDigitNumberAfterDash(text, dashSuffixIndex);
      if (numberEndIndex != null) {
        var numberStartIndex = match.index + match.length + 1;
        var digitNumberStr = text.substring(numberStartIndex, numberEndIndex);

        if (config.MonthNumRegex().matchExact(digitNumberStr, true) != null) {
          hasInvalidDashContext = true;
        }
      }
    }

    return hasInvalidDashContext;
  }

  // Complex cases refer to the combination of daterange and datepoint
  // For Example: from|between {DateRange|DatePoint} to|till|and {DateRange|DatePoint}
  List<Token> MatchComplexCases(String text, List<ExtractResult> simpleDateRangeResults, DateTime reference) {
    var er = config.DatePointExtractor().extractDateTime(text, reference);

    // Filter out DateRange results that are part of DatePoint results
    // For example, "Feb 1st 2018" => "Feb" and "2018" should be filtered out here

    er.addAll(
      simpleDateRangeResults.where(
        (simpleDateRange) => er
            .where((datePoint) => (datePoint.start <= simpleDateRange.start &&
                datePoint.start + datePoint.length >= simpleDateRange.start + simpleDateRange.length))
            .isEmpty,
      ),
    );
    er.sort((a, b) => a.start - b.start);

    // Handle "now"
    er = MatchNow(text, er);

    return MergeMultipleExtractions(text, er);
  }

  List<Token> MergeTwoTimePoints(String text, DateTime reference) {
    var er = config.DatePointExtractor().extractDateTime(text, reference);

    // Handle "now"
    er = MatchNow(text, er);

    return MergeMultipleExtractions(text, er);
  }

  List<Token> MergeMultipleExtractions(String text, List<ExtractResult> extractionResults) {
    var ret = <Token>[];
    var metadata = Metadata(
      possiblyIncludePeriodEnd: true,
    );

    if (extractionResults.length <= 1) {
      return ret;
    }

    var idx = 0;

    while (idx < extractionResults.length - 1) {
      var middleBegin = extractionResults[idx].start + extractionResults[idx].length ?? 0;
      var middleEnd = extractionResults[idx + 1].start ?? 0;
      if (middleBegin >= middleEnd) {
        idx++;
        continue;
      }

      var middleStr = text.substring(middleBegin, middleEnd).trim();
      var endPointStr = extractionResults[idx + 1].text;

      if (config.TillRegex().matchExact(middleStr, true) != null ||
          (middleStr.isEmpty && config.TillRegex().matchBegin(endPointStr, true) != null)) {
        var periodBegin = extractionResults[idx].start ?? 0;
        var periodEnd = (extractionResults[idx + 1].start ?? 0) + (extractionResults[idx + 1].length ?? 0);

        // handle "from/between" together with till words (till/until/through...)
        var beforeStr = text.substring(0, periodBegin).trim();

        int? fromIndex = config.GetFromTokenIndex(beforeStr) ?? config.GetBetweenTokenIndex(beforeStr);
        if (fromIndex != null) {
          periodBegin = fromIndex;
        }

        // handle "between...and..." case when "between" follows the datepoints
        if (config.CheckBothBeforeAfter()) {
          var afterStr = text.substring(periodEnd, text.length);
          int? afterIndex = config.GetBetweenTokenIndex(afterStr);
          if (afterIndex != null) {
            periodEnd += afterIndex;
            ret.add(Token(periodBegin, periodEnd, '', metadata));

            // merge two tokens here, increase the index by two
            idx += 2;
            continue;
          }
        }

        ret.add(Token(periodBegin, periodEnd, '', metadata));

        // merge two tokens here, increase the index by two
        idx += 2;
        continue;
      }

      if (config.HasConnectorToken(middleStr)) {
        var periodBegin = extractionResults[idx].start ?? 0;
        var periodEnd = (extractionResults[idx + 1].start ?? 0) + (extractionResults[idx + 1].length ?? 0);

        // handle "between...and..." case
        var beforeStr = text.substring(0, periodBegin).trim();
        int? beforeIndex = config.GetBetweenTokenIndex(beforeStr);
        if (beforeIndex != null) {
          periodBegin = beforeIndex;
          ret.add(Token(periodBegin, periodEnd, '', metadata));

          // merge two tokens here, increase the index by two
          idx += 2;
          continue;
        }

        // handle "between...and..." case when "between" follows the datepoints
        if (config.CheckBothBeforeAfter()) {
          var afterStr = text.substring(periodEnd, text.length);
          int? afterIndex = config.GetBetweenTokenIndex(afterStr);
          if (afterIndex != null) {
            periodEnd += afterIndex;
            ret.add(Token(periodBegin, periodEnd, '', metadata));

            // merge two tokens here, increase the index by two
            idx += 2;
            continue;
          }
        }
      }

      idx++;
    }

    return ret;
  }

  // 1. Extract the month of date, week of date to a date range
  // 2. Extract cases like within two weeks from/before today/tomorrow/yesterday
  List<Token> SingleTimePointWithPatterns(String text, List<ExtractResult> ordinalExtractions, DateTime reference) {
    var ret = <Token>[];
    var datePoints = config.DatePointExtractor().extractDateTime(text, reference);

    // For cases like "week of the 18th"
    datePoints.addAll(ordinalExtractions
        .where((o) => datePoints.where((er) => er.isOverlap(o) && o.metadata?.isOrdinalRelative != true).isEmpty));

    if (datePoints.length < 1) {
      return ret;
    }

    for (var extractionResult in datePoints) {
      if (extractionResult.start != null && extractionResult.length != null) {
        var beforeString = text.substring(0, extractionResult.start);
        var afterString = text.substring(extractionResult.start + extractionResult.length, text.length);

        ret.addAll(GetTokenForRegexMatching(beforeString, config.WeekOfRegex(), extractionResult, true));
        ret.addAll(GetTokenForRegexMatching(beforeString, config.MonthOfRegex(), extractionResult, true));

        // Check also afterString
        if (config.CheckBothBeforeAfter()) {
          ret.addAll(GetTokenForRegexMatching(afterString, config.WeekOfRegex(), extractionResult, false));
          ret.addAll(GetTokenForRegexMatching(afterString, config.MonthOfRegex(), extractionResult, false));
        }

        // Cases like "3 days from today", "2 weeks before yesterday", "3 months after tomorrow"
        if (IsRelativeDurationDate(extractionResult)) {
          ret.addAll(GetTokenForRegexMatching(beforeString, config.LessThanRegex(), extractionResult, true));
          ret.addAll(GetTokenForRegexMatching(beforeString, config.MoreThanRegex(), extractionResult, true));

          // Check also afterString
          if (config.CheckBothBeforeAfter()) {
            ret.addAll(GetTokenForRegexMatching(afterString, config.LessThanRegex(), extractionResult, false));
            ret.addAll(GetTokenForRegexMatching(afterString, config.MoreThanRegex(), extractionResult, false));
          }

          // For "within" case, only duration with relative to "today" or "now" makes sense
          // Cases like "within 3 days from yesterday/tomorrow" does not make any sense
          if (IsDateRelativeToNowOrToday(extractionResult)) {
            var tokens = ExtractWithinNextPrefix(beforeString, extractionResult, true);
            ret.addAll(tokens);

            // check also afterString
            if (config.CheckBothBeforeAfter() && tokens.isEmpty) {
              tokens = ExtractWithinNextPrefix(afterString, extractionResult, false);
              ret.addAll(tokens);
            }
          }
        }
      }
    }

    return ret;
  }

  // Cases like "3 days from today", "2 weeks before yesterday", "3 months after tomorrow"
  bool IsRelativeDurationDate(ExtractResult er) {
    var isAgo = config.AgoRegex().hasMatch(er.text);
    var isLater = config.LaterRegex().hasMatch(er.text);

    return isAgo || isLater;
  }

  bool IsAgoRelativeDurationDate(ExtractResult er) {
    return config.AgoRegex().hasMatch(er.text);
  }

  bool IsDateRelativeToNowOrToday(ExtractResult er) {
    for (var flagWord in config.DurationDateRestrictions()) {
      if (er.text.contains(flagWord)) {
        return true;
      }
    }

    return false;
  }

  // Matches "within (the next)?" part (in beforeStr or afterStr) in "within Days/Weeks/Months/Years"
  Token MatchWithinNextAffixRegex(String text, Token duration, bool inPrefix) {
    int startToken = -1;
    int endToken = -1;

    var beforeStr = text.substring(0, duration.start);
    var afterStr = text.substring(duration.start + duration.length);

    var match = inPrefix
        ? config.WithinNextPrefixRegex().matchEnd(beforeStr, true)
        : config.WithinNextPrefixRegex().matchBegin(afterStr, true);

    if (match != null) {
      var durationStr = text.substring(duration.start, duration.end);

      var matchDate = config.DateUnitRegex().firstMatch(durationStr);
      var matchTime = config.TimeUnitRegex().firstMatch(durationStr);

      if (matchDate != null && matchTime == null) {
        startToken = inPrefix ? match.start : duration.start;
        endToken = inPrefix ? duration.end : duration.end + match.start + match.length;

        if (!inPrefix) {
          // Check prefix for "next"
          match = config.FutureRegex().matchEnd(beforeStr, true);
          if (match != null) {
            startToken = match.start;
          }
        }
      }
    }

    return Token(startToken, endToken);
  }

  List<Token> ExtractWithinNextPrefix(String subStr, ExtractResult extractionResult, bool inPrefix) {
    var tokens = <Token>[];

    var match = RegExpComposer.firstMatch(config.WithinNextPrefixRegex(), subStr);

    if (match != null) {
      var isNext = match.getGroup(DateTimeConstants.NextGroupName).value.isNotEmpty;

      // For "within" case
      // Cases like "within the next 5 days before today" is not acceptable
      if (!(isNext && IsAgoRelativeDurationDate(extractionResult))) {
        tokens = GetTokenForRegexMatching(subStr, config.WithinNextPrefixRegex(), extractionResult, inPrefix);
      }
    }

    return tokens;
  }

  // Handle cases with "now"
  List<ExtractResult> MatchNow(String text, List<ExtractResult> er) {
    var matches = config.NowRegex().allMatches(text);
    if (matches.isNotEmpty) {
      for (Match match in matches) {
        var nowEr = ExtractResult(
          start: match.start,
          length: match.end - match.start,
          text: text.substring(match.start, match.end),
        );

        er.add(nowEr);
      }

      er.sort((a, b) => a.start - b.start);
    }

    return er;
  }
}

abstract interface class IDatePeriodExtractorConfiguration extends IDateTimeOptionsConfiguration {
  List<RegExp> SimpleCasesRegexes();

  RegExp IllegalYearRegex();

  RegExp YearRegex();

  RegExp TillRegex();

  RegExp DateUnitRegex();

  RegExp TimeUnitRegex();

  RegExp FollowedDateUnit();

  RegExp NumberCombinedWithDateUnit();

  RegExp PreviousPrefixRegex();

  RegExp FutureRegex();

  RegExp FutureSuffixRegex();

  RegExp WeekOfRegex();

  RegExp MonthOfRegex();

  RegExp RangeUnitRegex();

  RegExp InConnectorRegex();

  RegExp WithinNextPrefixRegex();

  RegExp YearPeriodRegex();

  RegExp RelativeDecadeRegex();

  RegExp ComplexDatePeriodRegex();

  RegExp ReferenceDatePeriodRegex();

  RegExp AgoRegex();

  RegExp LaterRegex();

  RegExp LessThanRegex();

  RegExp MoreThanRegex();

  RegExp CenturySuffixRegex();

  RegExp MonthNumRegex();

  RegExp NowRegex();

  RegExp FirstLastRegex();

  RegExp OfYearRegex();

  bool CheckBothBeforeAfter();

  IDateExtractor DatePointExtractor();

  IExtractor CardinalExtractor();

  IExtractor OrdinalExtractor();

  IDateTimeExtractor DurationExtractor();

  IParser NumberParser();

  List<String> DurationDateRestrictions();

  int? GetFromTokenIndex(String text);

  bool HasConnectorToken(String text);

  int? GetBetweenTokenIndex(String text);
}
