import 'package:nlp/nlp.dart';
import 'package:test/test.dart';

void main() {
  group("Regular expression composition >", () {
    group("de-duplicates group names >", () {
      // Regular expressions are often composed from other lower-level regular expressions,
      // which can result in duplicated group names. For example, two smaller regular
      // expressions might both have groups named "<minute>". When composing those two regular
      // expressions to form a larger expression, those names need to be changed so that the
      // regular expression doesn't contain duplicate group names.

      test("number combined with unit", () {
        final deduplicatedPattern = EnglishDurationExtractorConfiguration().getNumberCombinedWithUnit().pattern;

        expect(
          deduplicatedPattern,
          r"\b(?<numiii0>\d+(\.\d*)?)(-)?(?<unitiii1>(?<unitiii2>(decade|year|(?<uoyiii3>month|week)|(?<businessiii4>(business\s+|week\s*))?(?<uoyiii5>day)|fortnight|weekend)(?<pluraliii6>s)?|(?<plbiii0>(^|\s)\d{1,4})[ymwd])\b|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\b",
        );
      });

      test("comparing regex", () {
        expect(
          r"((?<=\b)(?:((((?:seventeen|thirteen|fourteen|eighteen|nineteen|fifteen|sixteen|eleven|twelve|ten)|((?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)(\s+(and\s+)?|\s*-\s*)(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six))|(?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)|(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six)|(an?)(?=\s))(\s+(?:hundred|thousand|million|mln|billion|bln|trillion|tln|lakh|crore)s?)+)\s+(and\s+)?)*(?:(((?:seventeen|thirteen|fourteen|eighteen|nineteen|fifteen|sixteen|eleven|twelve|ten)|((?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)(\s+(and\s+)?|\s*-\s*)(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six))|(?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)|(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six))(\s+(?:hundred|thousand|million|mln|billion|bln|trillion|tln|lakh|crore)s?)*))|(((an?)(?=\s)(\s+(?:hundred|thousand|million|mln|billion|bln|trillion|tln|lakh|crore)s?)+)))(?=\b))",
          r"((?<=\b)(?:((((?:seventeen|thirteen|fourteen|eighteen|nineteen|fifteen|sixteen|eleven|twelve|ten)|((?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)(\s+(and\s+)?|\s*-\s*)(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six))|(?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)|(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six)|(an?)(?=\s))(\s+(?:hundred|thousand|million|mln|billion|bln|trillion|tln|lakh|crore)s?)+)\s+(and\s+)?)*(?:(((?:seventeen|thirteen|fourteen|eighteen|nineteen|fifteen|sixteen|eleven|twelve|ten)|((?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)(\s+(and\s+)?|\s*-\s*)(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six))|(?:seventy|twenty|thirty|eighty|ninety|forty|fifty|sixty)|(?:three|seven|eight|four|five|zero|n[ao]ught|nine|one|two|six))(\s+(?:hundred|thousand|million|mln|billion|bln|trillion|tln|lakh|crore)s?)*))|(((an?)(?=\s)(\s+(?:hundred|thousand|million|mln|billion|bln|trillion|tln|lakh|crore)s?)+)))(?=\b))",
        );
      });
    });
  });
}
