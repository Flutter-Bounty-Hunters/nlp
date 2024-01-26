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

  Map<String, dynamic> toJson() {
    return {
      "parentText": parentText,
      "text": text,
      "start": start,
      "end": end,
      "typeName": typeName,
      "resolution": resolution,
    };
  }
}
