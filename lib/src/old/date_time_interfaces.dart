abstract interface class IDateTimeExtractor {
  String getExtractorName();

  List<ExtractResult> extract(String input, DateTime reference);
}

abstract interface class IDateTimeParser {
  String getParserName();

  DateTimeParseResult parse(ExtractResult er, DateTime reference);

  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults);
}

class DateTimeParseResult extends ParseResult {
  DateTimeParseResult(
      {super.start,
      super.length,
      super.text,
      super.type,
      super.data,
      required super.value,
      required super.resolutionStr,
      required this.timexStr});

  //TimexStr is only used in extractors related with date and time
  //It will output the TIMEX representation of a time string.
  final String timexStr;
}

class ParseResult extends ExtractResult {
  ParseResult({
    super.start,
    super.length,
    super.text,
    super.type,
    super.data,
    super.metadata,
    required this.value,
    required this.resolutionStr,
  });

  // Value is for resolution.
  // e.g. 1000 for "one thousand".
  // The resolutions are different for different parsers.
  // Therefore, we use object here.
  Object value;

  // Output the value in string format.
  // It is used in some parsers.
  String resolutionStr;
}

class ExtractResult {
  ExtractResult({
    this.start,
    this.length,
    this.text,
    this.type,
    this.data,
    this.metadata,
  });

  int? start;
  int? length;
  Object? data;
  String? type;
  String? text;
  Metadata? metadata;

  bool isOverlap(ExtractResult er) {
    return _isOverlap(this, er);
  }

  bool _isOverlap(ExtractResult er1, ExtractResult er2) {
    return !(er1.start! >= er2.start! + er2.length!) && !(er2.start! >= er1.start! + er1.length!);
  }

  bool isCover(ExtractResult er) {
    return _isCover(this, er);
  }

  bool _isCover(ExtractResult er1, ExtractResult er2) {
    return ((er2.start! < er1.start!) && ((er2.start! + er2.length!) >= (er1.start! + er1.length!))) ||
        ((er2.start! <= er1.start!) && ((er2.start! + er2.length!) > (er1.start! + er1.length!)));
  }
}

class Metadata {
  // For cases like "from 2014 to 2018", the period end "2018" could be inclusive or exclusive
  // For extraction, we only mark this flag to avoid future duplicate judgment, whether to include the period end or not is not determined in the extraction step
  bool _possiblyIncludePeriodEnd = false;

  // For cases like "2015年以前" (usually regards as "before 2015" in English), "5天以前"
  // (usually regards as "5 days ago" in English) in Chinese, we need to decide whether this is a "Date with Mode" or "Duration with Before and After".
  // We use this flag to avoid duplicate judgment both in the Extraction step and Parse step.
  // Currently, this flag is only used in Chinese DateTime as other languages don't have this ambiguity cases.
  bool _isDurationWithBeforeAndAfter = false;

  bool _isHoliday = false;

  bool getIsHoliday() {
    return _isHoliday;
  }

  void setIsHoliday(bool isHoliday) {
    _isHoliday = isHoliday;
  }

  bool _hasMod = false;

  bool getHasMod() {
    return _hasMod;
  }

  void setHasMod(bool hasMod) {
    _hasMod = hasMod;
  }

  String offset = "";

  String getOffset() {
    return offset;
  }

  void setOffset(String offset) {
    this.offset = offset;
  }

  String relativeTo = "";

  String getRelativeTo() {
    return relativeTo;
  }

  void setRelativeTo(String relativeTo) {
    this.relativeTo = relativeTo;
  }

  bool getIsPossiblyIncludePeriodEnd() {
    return _possiblyIncludePeriodEnd;
  }

  void setPossiblyIncludePeriodEnd(bool possiblyIncludePeriodEnd) {
    _possiblyIncludePeriodEnd = possiblyIncludePeriodEnd;
  }

  bool getIsDurationWithBeforeAndAfter() {
    return _isDurationWithBeforeAndAfter;
  }

  void setDurationWithBeforeAndAfter(bool durationWithBeforeAndAfter) {
    _isDurationWithBeforeAndAfter = durationWithBeforeAndAfter;
  }
}

abstract interface class IModel {
  String getModelTypeName();

  // Note: I added the `reference` parameter because java allows subclass method overloading but Dart doesn't.
  List<ModelResult> parse(String query, DateTime? reference);
}

class ModelResult {
  static final String parentTextKey = "parentText";

  const ModelResult({
    required this.text,
    required this.start,
    required this.end,
    required this.typeName,
    required this.resolution,
    this.parentText,
  });

  final String? parentText;
  final String text;
  final int start;
  final int end;
  final String typeName;
  final Map<String, Object> resolution; // Note: This is expected to be sorted

  ModelResult copyWith({
    String? parentText,
    String? text,
    int? start,
    int? end,
    String? typeName,
    Map<String, Object>? resolution,
  }) {
    return ModelResult(
      parentText: parentText ?? this.parentText,
      text: text ?? this.text,
      start: start ?? this.start,
      end: end ?? this.end,
      typeName: typeName ?? this.typeName,
      resolution: resolution ?? this.resolution,
    );
  }
}
