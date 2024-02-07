import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

import 'duration_extractor_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Duration > extractor >', () {
    for (final testCase in durationExtractorTestCases) {
      final input = testCase["Input"] as String;

      testWidgets(input, (widgetTester) async {
        final extractions = DurationExtractor(config: EnglishDurationExtractorConfiguration()).extract(input);
        final actualResults = extractions.map((extraction) => extraction.toTestCaseJson()).toList();
        final expectedResults = testCase["Results"] as List<dynamic>;

        expect(actualResults, expectedResults);
      });
    }
  });
}
