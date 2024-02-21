import 'package:nlp/src/core/extraction.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

abstract interface class IDateExtractor extends IDateTimeExtractor {
  int getYearFromText(NlpMatch match);
}

abstract interface class IDateTimeExtractor implements IExtractor {
  String getExtractorName();

  List<ExtractResult> extractDateTime(String input, DateTime reference);
}
