import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Recognition >', () {
    testWidgets('recognizes >ten months< duration', (widgetTester) async {
      final matches = DateTimeRecognizer.recognizeDateTime(
        "It happened when the baby was only ten months old",
      );

      expect(
        matches.first.toJson(),
        {
          "parentText": null,
          "text": "ten months",
          "start": 35,
          "end": 44,
          "typeName": "datetimeV2.duration",
          "resolution": {
            "values": [
              {"timex": "P10M", "type": "duration", "value": "25920000"}
            ]
          }
        },
      );
    });
  });

  group('JS regular expressions >', () {
    testWidgets('reports capture group names', (widgetTester) async {
      final dartResult = JsRegExp(
        '^(?<timestamp>\\d+),(?<author>.+)\$',
        d: true,
      ).exec("1560979912,Caroline");

      expect(dartResult.matchingGroupNames, ['timestamp', 'author']);
    });

    testWidgets('reports capture group indices', (widgetTester) async {
      final dartResult = JsRegExp(
        '^(?<timestamp>\\d+),(?<author>.+)\$',
        d: true,
      ).exec("1560979912,Caroline");

      expect(dartResult.groups['timestamp'], '1560979912');
      expect(dartResult.groups['author'], 'Caroline');
      expect(dartResult.indices, [(0, 19), (0, 10), (11, 19)]);
    });

    testWidgets('reports capture group indices by name', (widgetTester) async {
      final dartResult = JsRegExp(
        '^(?<timestamp>\\d+),(?<author>.+)\$',
        d: true,
      ).exec("1560979912,Caroline");

      expect(dartResult.getGroupBounds('timestamp'), (0, 10));
      expect(dartResult.getGroupBounds('author'), (11, 19));
    });
  });
}
