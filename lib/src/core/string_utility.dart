class StringUtility {
  static bool isNullOrEmpty(String? source) {
    return source == null || source.isEmpty;
  }

  static bool isNullOrWhiteSpace(String? source) {
    return source == null || source.trim().isEmpty;
  }

  static bool isNotNullOrWhiteSpace(String? source) {
    return !isNullOrWhiteSpace(source);
  }

  static String format(double d) {
    if (d == d.toInt()) {
      return "${d.toInt()}";
    }

    return d.toString();
  }

  static bool isDigit(
    String? character, {
    bool positiveOnly = false,
  }) {
    if (character == null || character.isEmpty || character.length > 1) {
      return false;
    }
    final unicodeValue = character.codeUnitAt(0);
    return unicodeValue >= 48 && unicodeValue <= 57;
  }
}
