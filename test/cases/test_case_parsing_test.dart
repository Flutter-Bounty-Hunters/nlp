import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import 'test_case_serialization.dart';

void main() {
  test("Test cases can be deserialized", () {
    final file = File("test/cases/english/date_time.json");
    expect(file.existsSync(), isTrue);

    final testCases = parseTestCases(file.readAsStringSync());
    expect(testCases, isNotEmpty);
  });
}
