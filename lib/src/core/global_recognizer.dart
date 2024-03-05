import 'package:nlp/src/core/model_result.dart';
import 'package:nlp/src/date_time/date_time_recognizer.dart';

class GlobalRecognizer {
  static List<ModelResult> recognize(String text) {
    final results = [
      ...DateTimeRecognizer.recognizeDateTime(text),
    ];

    return results;
  }
}
