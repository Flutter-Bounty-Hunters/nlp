import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

import 'date_time_extractor_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('DateTime > extractor >', () {
    for (final testCase in dateTimeExtractorTestCases) {
      final input = testCase["Input"] as String;
      testWidgets(input, (tester) async {
        final extractor = BaseDateTimeExtractor(
          EnglishDateTimeExtractorConfiguration(
            EnglishCommonDateTimeParserConfiguration(DateTimeOptions.None),
          ),
        );

        DateTime? referenceDate;

        final context = testCase["Context"] as Map<String, dynamic>?;

        if (context != null) {
          referenceDate = DateTime.parse(context["ReferenceDateTime"]);
        }

        final extractions = extractor.extractDateTime(input, referenceDate ?? DateTime.now());

        final actualResults = extractions.map((extraction) => extraction.toTestCaseJson()).toList();
        final expectedResults = testCase["Results"] as List<dynamic>;

        expect(actualResults, expectedResults);
      });
    }
  });
}
