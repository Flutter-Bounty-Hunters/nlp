// ignore_for_file: constant_identifier_names

extension NlpString on String {
  bool get isLetter {
    if (length != 1) {
      return false;
    }

    final codePoint = this[0].codeUnitAt(0);
    return (_unicode_A <= codePoint && codePoint <= _unicode_Z) || (_unicode_a <= codePoint && codePoint <= _unicode_z);
  }
}

const _unicode_A = 65;
const _unicode_Z = 90;

const _unicode_a = 97;
const _unicode_z = 122;
