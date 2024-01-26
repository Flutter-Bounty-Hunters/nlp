# How recognizers work

## Operations
### Regex Composition
Most regular expressions are built from other regular expressions in a composition process. 

When one regular expression is embedded in another, it creates the possibility that the composed 
regex contains multiple group names that are the same. But regex doesn't support repeated group 
names. Therefore, each regex pattern has its group names de-duplicated by adding suffixes to those
names.

Example:
```java
// Regex for a duration followed by a duration unit
public static final String DurationFollowedUnit = "(^\\s*{DurationUnitRegex}\\s+{SuffixAndRegex})|(^\\s*{SuffixAndRegex}?(\\s+|-)?{DurationUnitRegex})"
        .replace("{SuffixAndRegex}", SuffixAndRegex)
        .replace("{DurationUnitRegex}", DurationUnitRegex);

// Regex for suffixes
public static final String SuffixAndRegex = "(?<suffix>\\s*(and)\\s+(an?\\s+)?(?<suffix_num>half|quarter))";

// Regex for duration units
public static final String DurationUnitRegex = "(?<unit>{DateUnitRegex}|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\\b"
        .replace("{DateUnitRegex}", DateUnitRegex);

// Date unit regex
public static final String DateUnitRegex = "(?<unit>(decade|year|(?<uoy>month|week)|(?<business>(business\\s+|week\\s*))?(?<uoy>day)|fortnight|weekend)(?<plural>s)?|(?<=(^|\\s)\\d{1,4})[ymwd])\\b";
```

Duration followed by a unit composed regex:
```
(^\s*(?<unitiii0>(?<unitiii1>(decade|year|(?<uoyiii2>month|week)|(?<businessiii3>(business\s+|week\s*))?(?<uoyiii4>day)|fortnight|weekend)(?<pluraliii5>s)?|(?<plbiii0>(^|\s)\d{1,4})[ymwd])\b|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\b\s+(?<suffixiii6>\s*(and)\s+(an?\s+)?(?<suffixiinumiii7>half|quarter)))|(^\s*(?<suffixiii8>\s*(and)\s+(an?\s+)?(?<suffixiinumiii9>half|quarter))?(\s+|-)?(?<unitiii10>(?<unitiii11>(decade|year|(?<uoyiii12>month|week)|(?<businessiii13>(business\s+|week\s*))?(?<uoyiii14>day)|fortnight|weekend)(?<pluraliii15>s)?|(?<plbiii1>(^|\s)\d{1,4})[ymwd])\b|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\b)
```

Notice that the fully composed regex contains multiple group names for "unit", "uoy", "suffix", etc.

These duplicated group names are altered during regex composition so that every group name is
unique. The group names have a separator appended ("iii") and then they have an incrementing number
appended ("unitiii0", "unitiii1").

### Extraction
The extraction process identifies pieces of text that represent something of meaning, such as  a
number, duration, date, time, etc. These pieces of text are extracted from the input text, along
with their position data within the input text.

Given the source: `it happened when the baby was only ten months old`

Using regex:
```
(^\s*(?<unitiii0>(?<unitiii1>(decade|year|(?<uoyiii2>month|week)|(?<businessiii3>(business\s+|week\s*))?(?<uoyiii4>day)|fortnight|weekend)(?<pluraliii5>s)?|(?<plbiii0>(^|\s)\d{1,4})[ymwd])\b|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\b\s+(?<suffixiii6>\s*(and)\s+(an?\s+)?(?<suffixiinumiii7>half|quarter)))|(^\s*(?<suffixiii8>\s*(and)\s+(an?\s+)?(?<suffixiinumiii9>half|quarter))?(\s+|-)?(?<unitiii10>(?<unitiii11>(decade|year|(?<uoyiii12>month|week)|(?<businessiii13>(business\s+|week\s*))?(?<uoyiii14>day)|fortnight|weekend)(?<pluraliii15>s)?|(?<plbiii1>(^|\s)\d{1,4})[ymwd])\b|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\b)
```

Duration Extraction:
```
Text:   "ten months"
Start:  35
Length: 45
```

### Re-ifying group names
During regex composition, group names are altered for the purpose of de-duplication. However, the
original group names are important - the group names represent the domain meaning of what they
capture. For example "unitiii1" needs to recover "unit" so that the tokenization and parsing
processes understand the meaning of the associated text.

The Recognizers package implements `getMatches()` in `RegExpUtility` to recover the original group
names and return matches with those names.

### Tokenization
The extraction process produces `ExtractResult`s. These `ExtractResult`s are then converted into
`Token`s. These tokens are then merged and otherwise processed. Then, the `Token`s are converted
back into `ExtractResult`s and returned from the extraction process.

### Parsing
Given a set of extractions, the parsing process attaches meaning to the extracted text.

Given the source: `it happened when the baby was only ten months old`

With Extraction:
```
Text:   "ten months"
Start:  35
Length: 45
```

Parses the following:
```
text: ten months
type: duration
start: 35
length: 10
data: null
timex: P10M
resolution string: 
date time resolution result:
 - timex: P10M
 - mod: null
 - comment: null
 - past value: 2.592E7
```

