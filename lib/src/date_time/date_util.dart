import 'package:intl/intl.dart';

class DateUtil {
  static final DateFormat DATE_TIME_FORMATTER = DateFormat("yyyy-MM-dd");

  static DateTime minValue() {
    return DateTime(1, 1, 1, 0, 0, 0, 0);
  }

  static DateTime? tryParse(String? date) {
    if (date == null) {
      return null;
    }

    try {
      return DATE_TIME_FORMATTER.parse(date);
    } catch (exception) {
      return null;
    }
  }

  const DateUtil._();
}
