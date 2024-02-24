import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/extract_result_extension.dart';
import 'package:nlp/src/date_time/timezone_utility.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class BaseTimeExtractor implements IDateTimeExtractor {
  BaseTimeExtractor(this.config);

  final ITimeExtractorConfiguration config;

  @override
  String getExtractorName() {
    return DateTimeConstants.SYS_DATETIME_TIME;
  }

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String input, DateTime reference) {
    final normalizedInput = input.toLowerCase();

    var tokens = <Token>[];
    tokens.addAll(BasicRegexMatch(normalizedInput));
    tokens.addAll(AtRegexMatch(normalizedInput));
    tokens.addAll(BeforeAfterRegexMatch(normalizedInput));
    tokens.addAll(SpecialCasesRegexMatch(normalizedInput, reference));

    var timeErs = Token.mergeAllTokens(tokens, normalizedInput, getExtractorName());

    if (config.options.match(DateTimeOptions.EnablePreview)) {
      timeErs = TimeZoneUtility.MergeTimeZones(
          timeErs, config.TimeZoneExtractor().extractDateTime(normalizedInput, reference), normalizedInput);
    }

    // Remove common ambiguous cases
    timeErs = ExtractResultExtension.FilterAmbiguity(timeErs, normalizedInput, config.AmbiguityFiltersDict());

    return timeErs;
  }

  List<Token> BasicRegexMatch(String text) {
    var results = <Token>[];

    for (var regex in config.TimeRegexList()) {
      var matches = RegExpComposer.getMatchesSimple(regex, text);

      for (final match in matches) {
        // @TODO Workaround to avoid incorrect partial-only matches. Remove after time regex reviews across languages.
        var lth = match.getGroup("lth").value;

        if (lth.isEmpty ||
            (lth.length != match.length && !(match.length == lth.length + 1 && match.value.endsWith(" ")))) {
          results.add(Token(match.index, match.index + match.length));
        }
      }
    }

    return results;
  }

  List<Token> AtRegexMatch(String text) {
    var result = <Token>[];

    // handle "at 5", "at seven"
    if (config.AtRegex().hasMatch(text)) {
      var matches = config.AtRegex().allMatches(text);
      for (Match match in matches) {
        if (match.end - match.start + 1 < text.length && text[match.end - 1] == '%') {
          continue;
        }

        result.add(Token(match.start, match.end));
      }
    }

    return result;
  }

  List<Token> BeforeAfterRegexMatch(String text) {
    var result = <Token>[];

    // only enabled in CalendarMode
    if (config.options.match(DateTimeOptions.CalendarMode)) {
      // handle "before 3", "after three"
      var beforeAfterRegex = config.TimeBeforeAfterRegex();
      if (beforeAfterRegex.hasMatch(text)) {
        var matches = beforeAfterRegex.allMatches(text);
        for (Match match in matches) {
          result.add(Token(match.start, match.end));
        }
      }
    }

    return result;
  }

  List<Token> SpecialCasesRegexMatch(String text, DateTime reference) {
    var result = <Token>[];

    // handle "ish"
    if (config.IshRegex().hasMatch(text)) {
      var matches = config.IshRegex().allMatches(text);

      for (Match match in matches) {
        result.add(Token(match.start, match.end));
      }
    }

    return result;
  }

  // public static readonly Regex HourRegex =
  //     new Regex(BaseDateTime.HourRegex, RegexOptions.Singleline | RegexOptions.Compiled, RegexTimeOut);

  // public static readonly Regex MinuteRegex =
  //     new Regex(BaseDateTime.MinuteRegex, RegexOptions.Singleline | RegexOptions.Compiled, RegexTimeOut);

  // public static readonly Regex SecondRegex =
  //     new Regex(BaseDateTime.SecondRegex, RegexOptions.Singleline | RegexOptions.Compiled, RegexTimeOut);
}

abstract interface class ITimeExtractorConfiguration extends IDateTimeOptionsConfiguration {
  IDateTimeExtractor TimeZoneExtractor();

  List<RegExp> TimeRegexList();

  RegExp AtRegex();

  RegExp IshRegex();

  RegExp TimeBeforeAfterRegex();

  RegExp TimeTokenPrefix();

  Map<RegExp, RegExp> AmbiguityFiltersDict();
}
