import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';
import 'package:nlp/nlp.dart';

import 'test_cases/date_time/date_time_model_cases.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final referenceTimeFormat = DateFormat("yyyy-MM-ddThh:mm:ss");

  group('Recognition > duration >', () {
    for (final testCase in dateTimeModelTestCases) {
      print("Creating test case for: ${testCase["Input"]}");

      final input = testCase["Input"] as String;
      final referenceDateTimeString = (testCase["Context"] as Map<String, dynamic>?)?["ReferenceDateTime"] as String?;
      final referenceDateTime =
          referenceDateTimeString != null ? referenceTimeFormat.parse(referenceDateTimeString) : null;

      testWidgets(input, (widgetTester) async {
        final matches = DateTimeRecognizer.recognizeDateTime(input);

        final expectedResults = testCase["Results"] as List<dynamic>;
        expect(matches, expectedResults);
      });
    }

    // testWidgets('ten months', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "It happened when the baby was only ten months old",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "ten months",
    //       "start": 35,
    //       "end": 44,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "P10M",
    //             "type": "duration",
    //             "value": "25920000",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('two weeks', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for two weeks",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "two weeks",
    //       "start": 15,
    //       "end": 23,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "P2W",
    //             "type": "duration",
    //             "value": "1209600",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3h', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3h",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3h",
    //       "start": 15,
    //       "end": 16,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3H",
    //             "type": "duration",
    //             "value": "10800",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 h', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 h",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 h",
    //       "start": 15,
    //       "end": 17,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3H",
    //             "type": "duration",
    //             "value": "10800",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 hr', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 hr",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 hr",
    //       "start": 15,
    //       "end": 18,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3H",
    //             "type": "duration",
    //             "value": "10800",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 hrs', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 hrs",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 hrs",
    //       "start": 15,
    //       "end": 19,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3H",
    //             "type": "duration",
    //             "value": "10800",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 hours', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 hours",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 hours",
    //       "start": 15,
    //       "end": 21,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3H",
    //             "type": "duration",
    //             "value": "10800",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3day', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3day",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3day",
    //       "start": 15,
    //       "end": 18,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "P3D",
    //             "type": "duration",
    //             "value": "259200",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 day', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 day",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 day",
    //       "start": 15,
    //       "end": 19,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "P3D",
    //             "type": "duration",
    //             "value": "259200",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 days', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 days",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 days",
    //       "start": 15,
    //       "end": 20,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "P3D",
    //             "type": "duration",
    //             "value": "259200",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 months', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 months",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 months",
    //       "start": 15,
    //       "end": 22,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "P3M",
    //             "type": "duration",
    //             "value": "7776000",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 minutes', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 minutes",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 minutes",
    //       "start": 15,
    //       "end": 23,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3M",
    //             "type": "duration",
    //             "value": "180",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3 min', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3 min",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3 min",
    //       "start": 15,
    //       "end": 19,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3M",
    //             "type": "duration",
    //             "value": "180",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('3.5 second', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 3.5 second",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "3.5 second",
    //       "start": 15,
    //       "end": 24,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT3.5S",
    //             "type": "duration",
    //             "value": "3.5",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
    //
    // testWidgets('123.45 sec', (widgetTester) async {
    //   final matches = DateTimeRecognizer.recognizeDateTime(
    //     "I'll leave for 123.45 sec",
    //   );
    //
    //   expect(matches.length, 1);
    //   expect(
    //     matches.first.toJson(),
    //     {
    //       "parentText": null,
    //       "text": "123.45 sec",
    //       "start": 15,
    //       "end": 24,
    //       "typeName": "datetimeV2.duration",
    //       "resolution": {
    //         "values": [
    //           {
    //             "timex": "PT123.45S",
    //             "type": "duration",
    //             "value": "123.45",
    //           },
    //         ],
    //       },
    //     },
    //   );
    // });
  });
}
