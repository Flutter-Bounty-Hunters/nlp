import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

import 'time_zone_extractor_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Time zone > extractor >', () {
    for (final testCase in timeZoneExtractorTestCases.sublist(0, 1)) {
      final input = testCase["Input"] as String;

      testWidgets(input, (widgetTester) async {
        final extractions = BaseTimeZoneExtractor(EnglishTimeZoneExtractorConfiguration()).extract(input);
        final actualResults = extractions.map((extraction) => extraction.toTestCaseJson()).toList();
        final expectedResults = testCase["Results"] as List<dynamic>;

        expect(actualResults, expectedResults);
      });
    }
  });
}
