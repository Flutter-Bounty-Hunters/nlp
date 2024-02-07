import 'dart:io';

import 'package:test/test.dart';

import '../test_case_serialization.dart';

void main() {
  final cases = parseTestCases(File("test/cases/english/date_time.json").readAsStringSync());
  for (final testCase in cases) {
    test("Date and Time: '${testCase.input}'", () {
      // TODO:
    });
  }
}
