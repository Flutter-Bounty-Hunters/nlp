import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';
import 'package:nlp/nlp.dart';

import 'duration_parser_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final dateTimeFormat = DateFormat("yyyy-MM-ddThh:mm:ss");

  group('Duration > parser >', () {
    for (final testCase in durationParserTestCases) {
      final input = testCase["Input"] as String;

      final referenceDateTimeString = (testCase["Context"] as Map<String, dynamic>?)?["ReferenceDateTime"];
      final referenceDateTime =
          referenceDateTimeString != null ? dateTimeFormat.parse(referenceDateTimeString) : DateTime.now();

      testWidgets(input, (widgetTester) async {
        final extractions = DurationExtractor(config: EnglishDurationExtractorConfiguration()).extract(input);

        final parser = BaseDurationParser(
          EnglishDurationParserConfiguration(
            EnglishCommonDateTimeParserConfiguration(DateTimeOptions.None),
          ),
        );
        final parseResults = <ParseResult>[];
        for (final extraction in extractions) {
          parseResults.add(parser.parseDateTime(extraction, referenceDateTime));
        }

        final actualResults = parseResults.map((parseResult) => parseResult.toTestCaseJson()).toList();
        final expectedResults = testCase["Results"] as List<dynamic>;

        expect(actualResults, expectedResults);
      });
    }
  });
}
