import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

import 'date_time_period_parser_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Datetime period > parser >', () {
    print('executing ${dateTimePeriodParserTestCases.length} test cases');

    for (final testCase in dateTimePeriodParserTestCases) {
      final input = testCase["Input"] as String;
      testWidgets(input, (tester) async {
        final extractor = BaseDateTimePeriodExtractor(
          EnglishDateTimePeriodExtractorConfiguration(
            EnglishCommonDateTimeParserConfiguration(DateTimeOptions.None),
          ),
        );

        final parser = BaseDateTimePeriodParser(
          EnglishDateTimePeriodParserConfiguration(
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
