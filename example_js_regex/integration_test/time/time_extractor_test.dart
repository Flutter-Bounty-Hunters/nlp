import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'time_extractor_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Time > extractor >', () {
    for (final testCase in timeExtractorTestCases) {
      final input = testCase["Input"] as String;

      // TODO:
      // testWidgets(input, (widgetTester) async {
      //   final extractions = TimeExtractor(config: EnglishDurationExtractorConfiguration()).extract(input);
      //   final actualResults = extractions.map((extraction) => extraction.toTestCaseJson()).toList();
      //   final expectedResults = testCase["Results"] as List<dynamic>;
      //
      //   expect(actualResults, expectedResults);
      // });
    }
  });
}
