import 'package:diacritic/diacritic.dart';
import 'package:nlp/src/core/string_matcher.dart';
import 'package:nlp/src/duration/duration.dart';
import 'package:nlp/src/duration/duration_extractor.dart';
import 'package:nlp/src/numbers/number_with_unit_tokenizer.dart';
import 'package:nlp/src/time/english_time_zone.dart';
import 'package:nlp/src/time/time_zone_extractor.dart';

class EnglishTimeZoneExtractorConfiguration extends BaseOptionsConfiguration
    implements ITimeZoneExtractorConfiguration {
  // These regexes do need to be case insensitive for them to work correctly
  static final RegExp DirectUtcRegex = RegExp(EnglishTimeZone.DirectUtcRegex, caseSensitive: false);
  static final List<String> AbbreviationsList = EnglishTimeZone.AbbreviationsList;
  static final List<String> FullNameList = EnglishTimeZone.FullNameList;
  static final RegExp LocationTimeSuffixRegex = RegExp(EnglishTimeZone.LocationTimeSuffixRegex, caseSensitive: false);
  static final StringMatcher LocationMatcher = StringMatcher();
  static final StringMatcher TimeZoneMatcher = buildMatcherFromLists([AbbreviationsList, FullNameList]);

  static final List<String> AmbiguousTimezoneList = EnglishTimeZone.AmbiguousTimezoneList;

  EnglishTimeZoneExtractorConfiguration([super.options = DateTimeOptions.None]) {
    if (options.match(DateTimeOptions.EnablePreview)) {
      LocationMatcher.initFromValues(
        EnglishTimeZone.MajorLocations.map(
          (o) => removeDiacritics(o.toLowerCase()),
        ),
      );
    }
  }

  static StringMatcher buildMatcherFromLists(List<List<String>> collections) {
    StringMatcher matcher = StringMatcher(
      strategy: MatchStrategy.TrieTree,
      tokenizer: NumberWithUnitTokenizer(),
    );
    final matcherList = <String>[];

    // Collect all lower case versions of given list items.
    final nonLowerCaseList = <String>[];
    for (List<String> collection in collections) {
      for (String item in collection) {
        matcherList.add(item.toLowerCase());

        if (item != item.toLowerCase()) {
          nonLowerCaseList.add(item);
        }
      }
    }

    // For items that weren't originally lower case, add their original version.
    matcherList.addAll(nonLowerCaseList);

    matcher.initFromValues(matcherList);

    return matcher;
  }

  @override
  RegExp getDirectUtcRegex() {
    return DirectUtcRegex;
  }

  @override
  RegExp getLocationTimeSuffixRegex() {
    return LocationTimeSuffixRegex;
  }

  @override
  StringMatcher getLocationMatcher() {
    return LocationMatcher;
  }

  @override
  StringMatcher getTimeZoneMatcher() {
    return TimeZoneMatcher;
  }

  @override
  List<String> getAmbiguousTimezoneList() {
    return AmbiguousTimezoneList;
  }
}
