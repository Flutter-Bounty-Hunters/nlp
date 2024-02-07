import 'package:nlp/src/core/extraction.dart';

abstract interface class IDateExtractor extends IDateTimeExtractor {
  int getYearFromText(Match match);
}

abstract interface class IDateTimeExtractor implements IExtractor {
  String getExtractorName();

  List<ExtractResult> extractDateTime(String input, DateTime reference);
}
