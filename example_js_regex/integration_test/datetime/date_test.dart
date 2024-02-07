import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Recognition > date >', () {
    testWidgets('04th Jan 2019', (widgetTester) async {
      final matches = DateTimeRecognizer.recognizeDateTime(
        "I'll go back 04th Jan 2019",
      );

      expect(matches.length, 1);
      expect(
        matches.first.toJson(),
        {
          "parentText": null,
          "text": "04th jan 2019",
          "start": 13,
          "end": 25,
          "typeName": "datetimeV2.date",
          "resolution": {
            "values": [
              {
                "timex": "2019-01-04",
                "type": "date",
                "value": "2019-01-04",
              },
            ],
          },
        },
      );
    });
  });
}
