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
}
