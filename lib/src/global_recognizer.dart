import 'package:nlp/nlp.dart';
import 'package:nlp/src/core/model_result.dart';

class GlobalRecognizer {
  List<ModelResult> recognize(String text) {
    // TODO: pass the text through all domain recognizers and return all results.

    // final extractor = BaseDateExtractor(
    //   EnglishDateExtractorConfiguration(
    //     EnglishCommonDateTimeParserConfiguration(DateTimeOptions.None),
    //   ),
    // );
    //
    // final parser = BaseDateParser(
    //   EnglishDateParserConfiguration(
    //     EnglishCommonDateTimeParserConfiguration(DateTimeOptions.None),
    //   ),
    // );
    //
    // final extractions = extractor.extract(text);
    //
    // return extractions //
    //     .map((extraction) => parser.parseDateTime(extraction, DateTime.now()))
    //     .toList();

    final results = [
      ...DateTimeRecognizer.recognizeDateTime(text),
    ];

    return results;
  }
}
