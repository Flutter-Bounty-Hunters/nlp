// ignore_for_file: constant_identifier_names

extension NlpString on String {
  bool get isLetterOrDigit => isLetter || isDigit;

  bool get isLetter {
    if (length != 1) {
      return false;
    }

    final codePoint = this[0].codeUnitAt(0);
    return (_unicode_A <= codePoint && codePoint <= _unicode_Z) || (_unicode_a <= codePoint && codePoint <= _unicode_z);
  }

  bool get isDigit {
    if (length != 1) {
      return false;
    }

    final codePoint = this[0].codeUnitAt(0);
    return codePoint ^ 0x30 <= 9;
  }

  bool get isWhitespace {
    if (length != 1) {
      return false;
    }

    final codePoint = this[0].codeUnitAt(0);
    return (codePoint >= 0x0009 && codePoint <= 0x000D) ||
        codePoint == 0x0020 ||
        codePoint == 0x0085 ||
        codePoint == 0x00A0 ||
        codePoint == 0x1680 ||
        codePoint == 0x180E ||
        (codePoint >= 0x2000 && codePoint <= 0x200A) ||
        codePoint == 0x2028 ||
        codePoint == 0x2029 ||
        codePoint == 0x202F ||
        codePoint == 0x205F ||
        codePoint == 0x3000 ||
        codePoint == 0xFEFF;
  }
}

const _unicode_A = 65;
const _unicode_Z = 90;

const _unicode_a = 97;
const _unicode_z = 122;
