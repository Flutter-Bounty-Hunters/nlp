abstract interface class IDateTimeUtilityConfiguration {
  RegExp agoRegExp();

  RegExp laterRegExp();

  RegExp inConnectorRegExp();

  RegExp sinceYearSuffixRegExp();

  RegExp withinNextPrefixRegExp();

  RegExp rangeUnitRegExp();

  RegExp timeUnitRegExp();

  RegExp dateUnitRegExp();

  RegExp amDescRegExp();

  RegExp pmDescRegExp();

  RegExp amPmDescRegExp();

  RegExp commonDatePrefixRegExp();

  RegExp rangePrefixRegExp();

  bool checkBothBeforeAfter();
}
