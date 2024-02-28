import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

import 'time_period_parser_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Time period > parser >', () {
    print('executing ${timePeriodParserTestCases.length} test cases');

    for (final testCase in timePeriodParserTestCases) {
      final input = testCase["Input"] as String;
      testWidgets(input, (tester) async {
        final extractor = BaseTimePeriodExtractor(
          EnglishTimePeriodExtractorConfiguration(
            EnglishCommonDateTimeParserConfiguration(DateTimeOptions.None),
          ),
        );

        final parser = BaseTimePeriodParser(
          EnglishTimePeriodParserConfiguration(
            EnglishCommonDateTimeParserConfiguration(DateTimeOptions.None),
          ),
        );

        DateTime? referenceDate;

        final context = testCase["Context"] as Map<String, dynamic>?;

        if (context != null) {
          referenceDate = DateTime.parse(context["ReferenceDateTime"]);
        }

        referenceDate ??= DateTime.now();

        final extractions = extractor.extractDateTime(input, referenceDate);

        final actualResults =
            extractions.map((extraction) => parser.parseDateTime(extraction, referenceDate!).toTestCaseJson()).toList();
        final expectedResults = testCase["Results"] as List<dynamic>;

        expect(actualResults, expectedResults);
      });
    }
  });
}
