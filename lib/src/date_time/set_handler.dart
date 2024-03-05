import 'package:nlp/src/date_time/date_time_recognizer.dart';
import 'package:nlp/src/regular_expressions/regular_expressions_extensions.dart';

class SetHandler {
  static (String, int) WeekDayGroupMatchTuple(NlpMatch match) {
    String weekday = match.getGroup("weekday").value;
    int del = 1;

    return (weekday, del);
  }

  static String WeekDayGroupMatchString(NlpMatch match) {
    String weekday = match.getGroup("weekday").value;

    return weekday;
  }

  static DateTimeResolutionResult ResolveSet(DateTimeResolutionResult result, String innerTimex) {
    result.timex = innerTimex;
    result.futureValue = result.pastValue = "Set: $innerTimex";
    result.success = true;

    return result;
  }
}
