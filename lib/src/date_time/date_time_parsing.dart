import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/core/parser.dart';

abstract interface class IDateTimeParser implements IParser {
  String getParserName();

  DateTimeParseResult parseDateTime(ExtractResult extractResult, DateTime reference);

  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults);
}

class DateTimeParseResult extends ParseResult {
  factory DateTimeParseResult.fromExtractResult(ExtractResult extractResult) {
    return DateTimeParseResult(
      start: extractResult.start,
      length: extractResult.length,
      text: extractResult.text,
      type: extractResult.type,
      data: extractResult.data,
    );
  }

  factory DateTimeParseResult.fromParseResult(ParseResult parseResult) {
    return DateTimeParseResult(
      start: parseResult.start,
      length: parseResult.length,
      text: parseResult.text,
      type: parseResult.type,
      data: parseResult.data,
      value: parseResult.value,
      resolutionStr: parseResult.resolutionStr,
    );
  }

  DateTimeParseResult({
    required super.start,
    required super.length,
    required super.text,
    super.type,
    super.data,
    super.value,
    super.resolutionStr,
    this.timexStr,
    super.metadata,
  });

  //TimexStr is only used in extractors related with date and time
  //It will output the TIMEX representation of a time string.
  String? timexStr;
}
