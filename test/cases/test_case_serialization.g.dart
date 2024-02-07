// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_case_serialization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestCase _$TestCaseFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TestCase',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'Input',
            'Context',
            'Results',
            'Comment',
            'NotSupported',
            'NotSupportedByDesign'
          ],
        );
        final val = TestCase(
          input: $checkedConvert('Input', (v) => v as String),
          context: $checkedConvert(
              'Context',
              (v) => v == null
                  ? null
                  : TestCaseContext.fromJson(v as Map<String, dynamic>)),
          results: $checkedConvert(
              'Results',
              (v) => (v as List<dynamic>)
                  .map(
                      (e) => TestCaseResult.fromJson(e as Map<String, dynamic>))
                  .toList()),
          comment: $checkedConvert('Comment', (v) => v as String?),
          notSupported: $checkedConvert('NotSupported', (v) => v as String?),
          notSupportedByDesign:
              $checkedConvert('NotSupportedByDesign', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'input': 'Input',
        'context': 'Context',
        'results': 'Results',
        'comment': 'Comment',
        'notSupported': 'NotSupported',
        'notSupportedByDesign': 'NotSupportedByDesign'
      },
    );

TestCaseContext _$TestCaseContextFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseContext',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['ReferenceDateTime'],
        );
        final val = TestCaseContext(
          referenceDateTime: $checkedConvert(
              'ReferenceDateTime',
              (v) => const _StringToTimestampDateTimeConverter()
                  .fromJson(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'referenceDateTime': 'ReferenceDateTime'},
    );

TestCaseResult _$TestCaseResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResult',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'Text',
            'Start',
            'End',
            'Resolution',
            'TypeName',
            'Typename'
          ],
        );
        final val = TestCaseResult(
          text: $checkedConvert('Text', (v) => v as String),
          start: $checkedConvert('Start', (v) => v as int),
          end: $checkedConvert('End', (v) => v as int),
          resolution: $checkedConvert('Resolution',
              (v) => TestCaseResolution.fromJson(v as Map<String, dynamic>)),
          typeName: $checkedConvert('TypeName', (v) => v as String?),
          typeNameMisspelled: $checkedConvert('Typename', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'text': 'Text',
        'start': 'Start',
        'end': 'End',
        'resolution': 'Resolution',
        'typeName': 'TypeName',
        'typeNameMisspelled': 'Typename'
      },
    );

TestCaseResolution _$TestCaseResolutionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolution',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['values'],
        );
        final val = TestCaseResolution(
          values: $checkedConvert(
              'values',
              (v) => (v as List<dynamic>)
                  .map((e) => const _TestCaseResolutionConverter()
                      .fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

TestCaseResolutionDateRange _$TestCaseResolutionDateRangeFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionDateRange',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'type',
            'timex',
            'start',
            'end',
            'value',
            'list',
            'Mod',
            'sourceEntity'
          ],
        );
        final val = TestCaseResolutionDateRange(
          type: $checkedConvert('type', (v) => v as String),
          timex: $checkedConvert('timex', (v) => v as String),
          start: $checkedConvert('start', (v) => v as String?),
          end: $checkedConvert('end', (v) => v as String?),
          value: $checkedConvert('value', (v) => v as String?),
          list: $checkedConvert('list', (v) => v as String?),
          mod: $checkedConvert('Mod', (v) => v as String?),
          sourceEntity: $checkedConvert('sourceEntity', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'mod': 'Mod'},
    );

TestCaseResolutionDate _$TestCaseResolutionDateFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionDate',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'timex', 'value', 'sourceEntity'],
        );
        final val = TestCaseResolutionDate(
          type: $checkedConvert('type', (v) => v as String),
          timex: $checkedConvert('timex', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
          sourceEntity: $checkedConvert('sourceEntity', (v) => v as String?),
        );
        return val;
      },
    );

TestCaseResolutionDateTimeRange _$TestCaseResolutionDateTimeRangeFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionDateTimeRange',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'type',
            'timex',
            'start',
            'end',
            'value',
            'Mod',
            'timezone',
            'timezoneText',
            'utcOffsetMins',
            'sourceEntity'
          ],
        );
        final val = TestCaseResolutionDateTimeRange(
          type: $checkedConvert('type', (v) => v as String),
          timex: $checkedConvert('timex', (v) => v as String),
          start: $checkedConvert('start', (v) => v as String?),
          end: $checkedConvert('end', (v) => v as String?),
          value: $checkedConvert('value', (v) => v as String?),
          mod: $checkedConvert('Mod', (v) => v as String?),
          timezone: $checkedConvert('timezone', (v) => v as String?),
          timezoneText: $checkedConvert('timezoneText', (v) => v as String?),
          utcOffsetMins: $checkedConvert('utcOffsetMins', (v) => v as String?),
          sourceEntity: $checkedConvert('sourceEntity', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'mod': 'Mod'},
    );

TestCaseResolutionDateTime _$TestCaseResolutionDateTimeFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionDateTime',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'timex', 'value'],
        );
        final val = TestCaseResolutionDateTime(
          type: $checkedConvert('type', (v) => v as String),
          timex: $checkedConvert('timex', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
        );
        return val;
      },
    );

TestCaseResolutionTimeRange _$TestCaseResolutionTimeRangeFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionTimeRange',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'type',
            'timex',
            'start',
            'end',
            'value',
            'sourceEntity',
            'Mod',
            'timezone',
            'timezoneText',
            'utcOffsetMins'
          ],
        );
        final val = TestCaseResolutionTimeRange(
          type: $checkedConvert('type', (v) => v as String),
          timex: $checkedConvert('timex', (v) => v as String),
          start: $checkedConvert('start', (v) => v as String?),
          end: $checkedConvert('end', (v) => v as String?),
          value: $checkedConvert('value', (v) => v as String?),
          sourceEntity: $checkedConvert('sourceEntity', (v) => v as String?),
          mod: $checkedConvert('Mod', (v) => v as String?),
          timezone: $checkedConvert('timezone', (v) => v as String?),
          timezoneText: $checkedConvert('timezoneText', (v) => v as String?),
          utcOffsetMins: $checkedConvert('utcOffsetMins', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'mod': 'Mod'},
    );

TestCaseResolutionTime _$TestCaseResolutionTimeFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionTime',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'type',
            'timex',
            'value',
            'timezone',
            'timezoneText',
            'utcOffsetMins'
          ],
        );
        final val = TestCaseResolutionTime(
          timex: $checkedConvert('timex', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
          timezone: $checkedConvert('timezone', (v) => v as String?),
          timezoneText: $checkedConvert('timezoneText', (v) => v as String?),
          utcOffsetMins: $checkedConvert('utcOffsetMins', (v) => v as String?),
        );
        return val;
      },
    );

TestCaseResolutionDuration _$TestCaseResolutionDurationFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionDuration',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'timex', 'value', 'Mod'],
        );
        final val = TestCaseResolutionDuration(
          type: $checkedConvert('type', (v) => v as String),
          timex: $checkedConvert('timex', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
          mod: $checkedConvert('Mod', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'mod': 'Mod'},
    );

TestCaseResolutionTimezone _$TestCaseResolutionTimezoneFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionTimezone',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'value', 'utcOffsetMins'],
        );
        final val = TestCaseResolutionTimezone(
          type: $checkedConvert('type', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
          utcOffsetMins: $checkedConvert('utcOffsetMins', (v) => v as String?),
        );
        return val;
      },
    );

TestCaseResolutionSet _$TestCaseResolutionSetFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TestCaseResolutionSet',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'timex', 'value'],
        );
        final val = TestCaseResolutionSet(
          type: $checkedConvert('type', (v) => v as String),
          timex: $checkedConvert('timex', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
        );
        return val;
      },
    );
