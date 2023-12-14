import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_case_serialization.g.dart';

/// Given a JSON list, parses the list as a series of [TestCase]s and returns those [TestCase]s.
List<TestCase> parseTestCases(String data) {
  final json = jsonDecode(data) as List<dynamic>;
  return json.map((testCaseJson) => TestCase.fromJson(testCaseJson)).toList();
}

@JsonSerializable()
class TestCase {
  static TestCase fromJson(Map<String, dynamic> json) => _$TestCaseFromJson(json);

  const TestCase({
    required this.input,
    this.context,
    required this.results,
    this.comment,
    this.notSupported,
    this.notSupportedByDesign,
  });

  @JsonKey(name: "Input")
  final String input;

  @JsonKey(name: "Context")
  final TestCaseContext? context;

  @JsonKey(name: "Results")
  final List<TestCaseResult> results;

  @JsonKey(name: "Comment")
  final String? comment;

  @JsonKey(name: "NotSupported")
  final String? notSupported;

  @JsonKey(name: "NotSupportedByDesign")
  final String? notSupportedByDesign;
}

@JsonSerializable(converters: [_StringToTimestampDateTimeConverter()])
class TestCaseContext {
  static TestCaseContext fromJson(Map<String, dynamic> json) => _$TestCaseContextFromJson(json);

  const TestCaseContext({required this.referenceDateTime});

  @JsonKey(name: "ReferenceDateTime")
  final DateTime referenceDateTime;
}

@JsonSerializable()
class TestCaseResult {
  static TestCaseResult fromJson(Map<String, dynamic> json) => _$TestCaseResultFromJson(json);

  const TestCaseResult({
    required this.text,
    required this.start,
    required this.end,
    required this.resolution,
    this.typeName,
    this.typeNameMisspelled,
  });

  @JsonKey(name: "Text")
  final String text;

  @JsonKey(name: "Start")
  final int start;

  @JsonKey(name: "End")
  final int end;

  @JsonKey(name: "Resolution")
  final TestCaseResolution resolution;

  @JsonKey(name: "TypeName")
  final String? typeName;

  @JsonKey(name: "Typename")
  final String? typeNameMisspelled;
}

@JsonSerializable(converters: [_TestCaseResolutionConverter()])
class TestCaseResolution {
  static TestCaseResolution fromJson(Map<String, dynamic> json) => _$TestCaseResolutionFromJson(json);

  const TestCaseResolution({required this.values});

  final List<TestCaseResolutionValue> values;
}

abstract interface class TestCaseResolutionValue {
  String get type;
}

@JsonSerializable()
class TestCaseResolutionDateRange implements TestCaseResolutionValue {
  static TestCaseResolutionDateRange fromJson(Map<String, dynamic> json) => _$TestCaseResolutionDateRangeFromJson(json);

  const TestCaseResolutionDateRange({
    required this.type,
    required this.timex,
    this.start,
    this.end,
    this.value,
    this.list,
    this.mod,
    this.sourceEntity,
  });

  @override
  final String type;
  final String timex;
  final String? start;
  final String? end;
  final String? value;
  final String? list;
  @JsonKey(name: "Mod")
  final String? mod;
  final String? sourceEntity;
}

@JsonSerializable()
class TestCaseResolutionDate implements TestCaseResolutionValue {
  static TestCaseResolutionDate fromJson(Map<String, dynamic> json) => _$TestCaseResolutionDateFromJson(json);

  const TestCaseResolutionDate({
    required this.type,
    required this.timex,
    required this.value,
    this.sourceEntity,
  });

  @override
  final String type;
  final String timex;
  final String value;
  final String? sourceEntity;
}

@JsonSerializable()
class TestCaseResolutionDateTimeRange implements TestCaseResolutionValue {
  static TestCaseResolutionDateTimeRange fromJson(Map<String, dynamic> json) =>
      _$TestCaseResolutionDateTimeRangeFromJson(json);

  const TestCaseResolutionDateTimeRange({
    required this.type,
    required this.timex,
    this.start,
    this.end,
    this.value,
    this.mod,
    this.timezone,
    this.timezoneText,
    this.utcOffsetMins,
    this.sourceEntity,
  });

  @override
  final String type;
  final String timex;
  final String? start;
  final String? end;
  final String? value;
  @JsonKey(name: "Mod")
  final String? mod;
  final String? timezone;
  final String? timezoneText;
  final String? utcOffsetMins;
  final String? sourceEntity;
}

@JsonSerializable()
class TestCaseResolutionDateTime implements TestCaseResolutionValue {
  static TestCaseResolutionDateTime fromJson(Map<String, dynamic> json) => _$TestCaseResolutionDateTimeFromJson(json);

  const TestCaseResolutionDateTime({
    required this.type,
    required this.timex,
    required this.value,
  });

  @override
  final String type;
  final String timex;
  final String value;
}

@JsonSerializable()
class TestCaseResolutionTimeRange implements TestCaseResolutionValue {
  static TestCaseResolutionTimeRange fromJson(Map<String, dynamic> json) => _$TestCaseResolutionTimeRangeFromJson(json);

  const TestCaseResolutionTimeRange({
    required this.type,
    required this.timex,
    this.start,
    this.end,
    this.value,
    this.sourceEntity,
    this.mod,
    this.timezone,
    this.timezoneText,
    this.utcOffsetMins,
  });

  @override
  final String type;
  final String timex;
  final String? start;
  final String? end;
  final String? value;
  final String? sourceEntity;
  @JsonKey(name: "Mod")
  final String? mod;
  final String? timezone;
  final String? timezoneText;
  final String? utcOffsetMins;
}

@JsonSerializable()
class TestCaseResolutionTime implements TestCaseResolutionValue {
  static TestCaseResolutionTime fromJson(Map<String, dynamic> json) => _$TestCaseResolutionTimeFromJson(json);

  const TestCaseResolutionTime({
    required this.timex,
    required this.type,
    required this.value,
    this.timezone,
    this.timezoneText,
    this.utcOffsetMins,
  });

  @override
  final String type;
  final String timex;
  final String value;
  final String? timezone;
  final String? timezoneText;
  final String? utcOffsetMins;
}

@JsonSerializable()
class TestCaseResolutionDuration implements TestCaseResolutionValue {
  static TestCaseResolutionDuration fromJson(Map<String, dynamic> json) => _$TestCaseResolutionDurationFromJson(json);

  const TestCaseResolutionDuration({
    required this.type,
    required this.timex,
    required this.value,
    this.mod,
  });

  @override
  final String type;
  final String timex;
  final String value;
  @JsonKey(name: "Mod")
  final String? mod;
}

@JsonSerializable()
class TestCaseResolutionTimezone implements TestCaseResolutionValue {
  static TestCaseResolutionTimezone fromJson(Map<String, dynamic> json) => _$TestCaseResolutionTimezoneFromJson(json);

  const TestCaseResolutionTimezone({
    required this.type,
    required this.value,
    this.utcOffsetMins,
  });

  @override
  final String type;
  final String value;
  final String? utcOffsetMins;
}

@JsonSerializable()
class TestCaseResolutionSet implements TestCaseResolutionValue {
  static TestCaseResolutionSet fromJson(Map<String, dynamic> json) => _$TestCaseResolutionSetFromJson(json);

  const TestCaseResolutionSet({
    required this.type,
    required this.timex,
    required this.value,
  });

  @override
  final String type;
  final String timex;
  final String value;
}

class _TestCaseResolutionConverter implements JsonConverter<TestCaseResolutionValue, Map<String, dynamic>> {
  const _TestCaseResolutionConverter();

  @override
  TestCaseResolutionValue fromJson(Map<String, dynamic> json) {
    if (json['type'] == null) {
      throw Exception("Tried to parse a TestCaseResolutionValue but it has no 'type'!");
    }

    switch (json['type']) {
      case "daterange":
        return TestCaseResolutionDateRange.fromJson(json);
      case "date":
        return TestCaseResolutionDate.fromJson(json);
      case "datetimerange":
        return TestCaseResolutionDateTimeRange.fromJson(json);
      case "datetime":
        return TestCaseResolutionDateTime.fromJson(json);
      case "timerange":
        return TestCaseResolutionTimeRange.fromJson(json);
      case "time":
        return TestCaseResolutionTime.fromJson(json);
      case "duration":
        return TestCaseResolutionDuration.fromJson(json);
      case "timezone":
        return TestCaseResolutionTimezone.fromJson(json);
      case "set":
        return TestCaseResolutionSet.fromJson(json);
      default:
        throw Exception("Tried to parse a TestCaseResolutionValue but didn't recognize the type: '${json['type']}'");
    }
  }

  @override
  Map<String, dynamic> toJson(TestCaseResolutionValue object) {
    throw UnimplementedError();
  }
}

class _StringToTimestampDateTimeConverter implements JsonConverter<DateTime, String> {
  static final DateFormat _jsonDateFormat = DateFormat("yyyy-MM-ddThh:mm:ss");

  const _StringToTimestampDateTimeConverter();

  @override
  DateTime fromJson(String json) => _jsonDateFormat.parse(json);

  @override
  String toJson(DateTime dateTime) => _jsonDateFormat.format(dateTime);
}
