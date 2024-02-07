import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nlp/nlp.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('JS regular expressions >', () {
    testWidgets('reports capture group names', (widgetTester) async {
      final dartResult = JsRegExp(
        '^(?<timestamp>\\d+),(?<author>.+)\$',
        d: true,
      ).exec("1560979912,Caroline");

      expect(dartResult!.matchingGroupNames, ['timestamp', 'author']);
    });

    testWidgets('reports capture group indices', (widgetTester) async {
      final dartResult = JsRegExp(
        '^(?<timestamp>\\d+),(?<author>.+)\$',
        d: true,
      ).exec("1560979912,Caroline");

      expect(dartResult!.groups['timestamp'], '1560979912');
      expect(dartResult.groups['author'], 'Caroline');
      expect(dartResult.indices, [(0, 19), (0, 10), (11, 19)]);
    });

    testWidgets('reports capture group indices by name', (widgetTester) async {
      final dartResult = JsRegExp(
        '^(?<timestamp>\\d+),(?<author>.+)\$',
        d: true,
      ).exec("1560979912,Caroline");

      expect(dartResult!.getGroupBounds('timestamp'), (0, 10));
      expect(dartResult.getGroupBounds('author'), (11, 19));
    });
  });
}
