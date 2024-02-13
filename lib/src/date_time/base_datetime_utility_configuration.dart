import 'package:nlp/nlp.dart';
import 'package:nlp/src/date_time/datetime_utility_configuration.dart';

abstract class BaseDatetimeUtilityConfiguration implements IDateTimeUtilityConfiguration {
  BaseDatetimeUtilityConfiguration(
      String agoRegex,
      String laterRegex,
      String inConnectorRegex,
      String sinceYearSuffixRegex,
      String withinNextPrefixRegex,
      String amDescRegex,
      String pmDescRegex,
      String amPmDescRegex,
      String rangeUnitRegex,
      String timeUnitRegex,
      String dateUnitRegex,
      String commonDatePrefixRegex,
      String rangePrefixRegex,
      //RegexOptions options,
      bool checkBothBeforeAfter)
      : _agoRegExp = RegExpComposer.sanitizeGroupsAndCompile(agoRegex),
        _laterRegExp = RegExpComposer.sanitizeGroupsAndCompile(laterRegex),
        _inConnectorRegExp = RegExpComposer.sanitizeGroupsAndCompile(inConnectorRegex),
        _sinceYearSuffixRegExp = RegExpComposer.sanitizeGroupsAndCompile(sinceYearSuffixRegex),
        _withinNextPrefixRegExp = RegExpComposer.sanitizeGroupsAndCompile(withinNextPrefixRegex),
        _amDescRegExp = RegExpComposer.sanitizeGroupsAndCompile(amDescRegex),
        _pmDescRegExp = RegExpComposer.sanitizeGroupsAndCompile(pmDescRegex),
        _amPmDescRegExp = RegExpComposer.sanitizeGroupsAndCompile(amPmDescRegex),
        _rangeUnitRegExp = RegExpComposer.sanitizeGroupsAndCompile(rangeUnitRegex),
        _timeUnitRegExp = RegExpComposer.sanitizeGroupsAndCompile(timeUnitRegex),
        _dateUnitRegExp = RegExpComposer.sanitizeGroupsAndCompile(dateUnitRegex),
        _commonDatePrefixRegExp = RegExpComposer.sanitizeGroupsAndCompile(commonDatePrefixRegex),
        _rangePrefixRegExp = RegExpComposer.sanitizeGroupsAndCompile(rangePrefixRegex),
        _checkBothBeforeAfter = checkBothBeforeAfter;

  //  static TimeSpan RegexTimeOut => DateTimeRecognizer.GetTimeout(MethodBase.GetCurrentMethod().DeclaringType);

  final RegExp _agoRegExp;
  @override
  RegExp agoRegExp() => _agoRegExp;

  final RegExp _laterRegExp;
  @override
  RegExp laterRegExp() => _laterRegExp;

  final RegExp _inConnectorRegExp;
  @override
  RegExp inConnectorRegExp() => _inConnectorRegExp;

  final RegExp _sinceYearSuffixRegExp;
  @override
  RegExp sinceYearSuffixRegExp() => _sinceYearSuffixRegExp;

  final RegExp _withinNextPrefixRegExp;
  @override
  RegExp withinNextPrefixRegExp() => _withinNextPrefixRegExp;

  final RegExp _rangeUnitRegExp;
  @override
  RegExp rangeUnitRegExp() => _rangeUnitRegExp;

  final RegExp _timeUnitRegExp;
  @override
  RegExp timeUnitRegExp() => _timeUnitRegExp;

  final RegExp _dateUnitRegExp;
  @override
  RegExp dateUnitRegExp() => _dateUnitRegExp;

  final RegExp _amDescRegExp;
  @override
  RegExp amDescRegExp() => _amDescRegExp;

  final RegExp _pmDescRegExp;
  @override
  RegExp pmDescRegExp() => _pmDescRegExp;

  final RegExp _amPmDescRegExp;
  @override
  RegExp amPmDescRegExp() => _amPmDescRegExp;

  final RegExp _commonDatePrefixRegExp;
  @override
  RegExp commonDatePrefixRegExp() => _commonDatePrefixRegExp;

  final RegExp _rangePrefixRegExp;
  @override
  RegExp rangePrefixRegExp() => _rangePrefixRegExp;

  final bool _checkBothBeforeAfter;
  @override
  bool checkBothBeforeAfter() => _checkBothBeforeAfter;
}
