import 'package:nlp/src/date_time/base_date_extractor.dart';
import 'package:nlp/src/duration/duration.dart';

class BaseDateTimeOptionsConfiguration implements IDateTimeOptionsConfiguration {
  BaseDateTimeOptionsConfiguration({
    required DateTimeOptions options,
    bool dmyDateFormat = false,
  })  : _options = options,
        _dmyDateFormat = dmyDateFormat;

  final bool _dmyDateFormat;
  @override
  bool get dmyDateFormat => _dmyDateFormat;

  final DateTimeOptions _options;
  @override
  DateTimeOptions get options => _options;
}
