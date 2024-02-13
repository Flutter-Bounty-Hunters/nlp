import 'package:nlp/nlp.dart';
import 'package:nlp/src/date_time/date_time_extraction.dart';
import 'package:nlp/src/date_time/holiday_extractor_configuration.dart';

class BaseHolidayExtractor implements IDateTimeExtractor {
  BaseHolidayExtractor({required this.config});

  final IHolidayExtractorConfiguration config;

  final _rangeExtractorName = DateTimeConstants.SYS_DATETIME_DATEPERIOD;

  @override
  List<ExtractResult> extract(String input) {
    return extractDateTime(input, DateTime.now());
  }

  @override
  List<ExtractResult> extractDateTime(String input, DateTime reference) {
    final tokens = <Token>[];
    tokens.addAll(_holidayMatch(input));
    var ers = Token.mergeAllTokens(tokens, input, getExtractorName());
    for (var er in ers) {
      // If this is a daterange that contains a holiday, we should change its
      // type to indicate that.

      if (er.metadata?.isHolidayRange ?? false) {
        er.type = _rangeExtractorName;
      }
    }

    return ers;
  }

  @override
  String getExtractorName() => DateTimeConstants.SYS_DATETIME_DATE;

  List<Token> _holidayMatch(String text) {
    var ret = <Token>[];
    for (var regex in config.holidayRegexes()) {
      var matches = RegExpComposer.getMatchesSimple(regex, text);

      for (final match in matches) {
        var metaData = Metadata();

        // The objective here is to not lose the information of the holiday name
        // and year (if captured) when choosing. The data is extracted from the match
        // groups.
        final holidayWeekendGroup = match.getGroup(DateTimeConstants.HolidayWeekend);

        if (holidayWeekendGroup.value.isNotEmpty) {
          metaData.isHolidayRange = metaData.isHolidayWeekend = true;

          final holidayGroup = match.getGroup(DateTimeConstants.Holiday);
          metaData.holidayName = holidayGroup.value;

          final yearGroup = match.getGroup(DateTimeConstants.YearGroupName);
          if (yearGroup.value.isNotEmpty) {
            metaData.holidayName = "${metaData.holidayName} ${yearGroup.value}";
          }
        }

        metaData.isHoliday = true;

        ret.add(Token(match.index, match.index + match.length, "", metaData));
      }
    }

    return ret;
  }
}
