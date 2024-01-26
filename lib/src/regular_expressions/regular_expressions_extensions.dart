import 'package:nlp/src/core/string_utility.dart';
import 'package:nlp/src/regular_expressions/js_regexp.dart';

class RegExpComposer {
  static final _matchGroup = RegExp("\\?<(?<name>\\w+)>", caseSensitive: false);
  static final _matchGroupNames = RegExp("\\(\\?<([a-zA-Z][a-zA-Z0-9]*)>", caseSensitive: false);
  static final _matchPositiveLookbehind = RegExp("\\(\\?<=", caseSensitive: false);
  static final _matchNegativeLookbehind = RegExp("\\(\\?<!", caseSensitive: false);
  static const _groupNameIndexSep = "iii";
  static final _groupNameIndexSepRegex = RegExp.escape(_groupNameIndexSep);
  static final _lookBehindCheckRegex = RegExp("(\\\\?<[!=])");

  static RegExp sanitizeGroupsAndCompile(String source) {
    return RegExp(sanitizeGroups(source));
  }

  static String sanitizeGroups(String source) {
    // print("Sanitizing groups for:");
    // print(source);
    // print("");

    String result = source;

    int index = 0;
    result = _replace(result, _matchGroup, (Match m) {
      final replacedString = m.group(0)!.replaceAll(
            m.group(1)!,
            "${m.group(1)!.replaceAll("_", "ii")}$_groupNameIndexSep$index",
          );
      index += 1;

      return replacedString;
    });
    // print("Pattern after first replace:");
    // print(result);
    // print("");

    index = 0;
    result = _replace(result, _matchPositiveLookbehind, (Match m) {
      final replacedString = "(?<plb$_groupNameIndexSep$index>";
      index += 1;

      return replacedString;
    });
    // print("Pattern after second replace:");
    // print(result);
    // print("");

    index = 0;
    result = _replace(result, _matchNegativeLookbehind, (Match m) {
      final replacedString = "(?<nlb$_groupNameIndexSep$index>";
      index += 1;

      return replacedString;
    });
    // print("Pattern after third replace:");
    // print(result);
    // print("");

    return result;
  }

  static String _replace(String input, RegExp regex, String Function(Match match) callback) {
    final matches = regex.allMatches(input);
    if (matches.isEmpty) {
      return input;
    }

    // print("Writing bits and pieces to the final string:");
    final resultString = StringBuffer();
    int lastCopyIndex = 0;
    for (final match in matches) {
      // Get the text that we want to use to replace the matched text.
      String matchReplacement = callback(match);
      // print("Replacing '${input.substring(match.start, match.end)}' with '$matchReplacement'");

      // Copy all the characters between the previous match and the current match.
      resultString.write(input.substring(lastCopyIndex, match.start));

      // Insert the match replacement in place of the original matched text.
      resultString.write(matchReplacement);

      // Update the copy index to the end of the current match.
      lastCopyIndex = match.end;
      // print("Current string: '${resultString.toString()}'");
    }
    resultString.write(input.substring(lastCopyIndex));

    return resultString.toString();
  }

  static List<NlpMatch> getMatchesSimple(RegExp regExp, String input) {
    print("");
    print("getMatchesSimple()");
    print(" - regExp: ${regExp.pattern}");
    print(" - input: $input");
    print("");
    final matches = <NlpMatch>[];

    print("-------");
    print("Running '$input' through a JS version of RegEx");
    final jsRegExp = JsRegExp(regExp.pattern, d: true);
    final result = jsRegExp.exec(input);
    print(" - results: $result");
    print("-------");
    print("");

    final regExpMatches = regExp.allMatches(input).toList();
    final jsRegExpMatches = JsRegExp(regExp.pattern, d: true).exec(input);
    for (final match in regExpMatches) {
      print(
          "Processing a RegExpMatch - start: ${match.start}, end: ${match.end}, value: '${input.substring(match.start, match.end)}', group count: ${match.groupCount}");

      final positiveLookbehinds = <(String, String)>[];
      final groups = <String, NlpMatchGroup>{};
      String? lastGroup;

      print("Finding named groups in the regex match and processing each group...");
      print("");
      final namedGroups = getNamedGroups(regExp.pattern, jsRegExpMatches, regExpMatches);

      for (final entry in namedGroups.entries) {
        final key = entry.key;
        final groupValue = entry.value;

        print("Processing named group");
        print(" - key: $key");
        print(" - groupValue: $groupValue");
        if (!key.contains(_groupNameIndexSep)) {
          continue;
        }

        if (key.startsWith("plb") && !StringUtility.isNullOrEmpty(match.namedGroup(key))) {
          if (match.group(0)!.indexOf(match.namedGroup(key)!) != 0 && !StringUtility.isNullOrEmpty(lastGroup)) {
            int index = match.start + match.group(0)!.indexOf(match.namedGroup(key)!);
            int length = match.namedGroup(key)!.length;
            String value = input.substring(index, index + length);

            NlpMatchGroup lastMatchGroup = groups[lastGroup]!;
            groups[lastGroup!] = NlpMatchGroup(
              lastMatchGroup.value + value,
              lastMatchGroup.index,
              lastMatchGroup.length,
              lastMatchGroup.captures,
            );
          }

          positiveLookbehinds.add((key, match.namedGroup(key)!));
          continue;
        }

        if (key.startsWith("nlb")) {
          continue;
        }

        String groupKey = key.substring(0, key.lastIndexOf(_groupNameIndexSep)).replaceAll("ii", "_");
        print(" - groupKey: $groupKey");
        lastGroup = groupKey;

        if (!groups.containsKey(groupKey)) {
          groups[groupKey] = NlpMatchGroup("", 0, 0, <Capture>[]);
        }

        if (!StringUtility.isNullOrEmpty(match.namedGroup(key))) {
          print(" - the input text has a match for '$key' - adding a match group to our records.");
          // String inputMatchValue = input.substring(match.start, match.end);

          final inputMatchValue = jsRegExpMatches.getGroup(key)!;
          final jsBounds = jsRegExpMatches.getGroupBounds(key);
          if (jsBounds == null) {
            print("ERROR: Couldn't find capture match for $key");
          }

          Capture newCapture = Capture(inputMatchValue, jsBounds!.$1, jsBounds.$2);
          // Capture newCapture = Capture(inputMatchValue, match.start, match.end - match.start);
          print("    - capture - index: ${newCapture.index}, length: ${newCapture.length}, value: ${newCapture.value}");

          // Matt: The following behavior essentially appends the capture to the existing
          // list of captures for the given groupKey. I'm not sure why this code creates
          // a list just to append a value, but it does.
          final captures = List<Capture>.from(groups[groupKey]!.captures);
          captures.add(newCapture);

          groups[groupKey] = NlpMatchGroup(inputMatchValue, match.start, match.end - match.start, captures);

          print("Set '$groupKey' -> '$inputMatchValue'");
        }
      }

      print("Done finding named groups and capturing their values.");
      print("");

      String value = match.group(0)!;
      int index = match.start;
      int length = value.length;
      print("Processing root match - value: '$value', index: $index, length: $length");

      if (positiveLookbehinds.isNotEmpty && value.indexOf(positiveLookbehinds.first.$1) == 0) {
        print("There are some positive look-behinds. I'm not sure what that means.");
        int valueLength = positiveLookbehinds[0].$1.length;
        value = input.substring(index, index + length).substring(valueLength);
        index += valueLength;
        length -= valueLength;
      } else {
        print("No positive look-behinds - setting value to a direct substring of the input text.");
        value = input.substring(index, index + length);
      }
      print("Done processing root match.");
      print("");

      print("Found simple match:");
      print(" - input: $input");
      print(" - index: $index");
      print(" - length: $length");
      print(" - value: $value");
      print(" - groups(${groups.length}): ");
      for (final entry in groups.entries) {
        print("   -> ${entry.key}: ");
        print("      - value: ${entry.value.value}");
        print("      - index: ${entry.value.index}");
        print("      - captures: ${entry.value.length}");
        for (final capture in entry.value.captures) {
          print("        Capture: ");
          print("          - value: ${capture.value}");
          print("          - index: ${capture.index}");
          print("          - length: ${capture.length}");
        }
      }
      matches.add(NlpMatch(index, length, value, groups));
    }
    print("");

    print("Done with getMatchesSimple()");
    print("");

    return matches;
  }

  static Map<String, String> getNamedGroups(
      String regExpPattern, JsRegExpResult jsAllContentMatches, List<RegExpMatch> allContentMatches,
      [bool sanitize = false]) {
    print(
        "getNamedGroups() for pattern: '$regExpPattern', all content matches: ${allContentMatches.map((match) => match.input.substring(match.start, match.end)).toList()}");
    for (final groupName in jsAllContentMatches.matchingGroupNames) {
      print("Matched group name: '$groupName' - bounds: ${jsAllContentMatches.getGroupBounds(groupName)}");
      // print("Content match: '${contentMatch.input.substring(contentMatch.start, contentMatch.end)}'");
      // print(" - this match has ${contentMatch.groupCount} groups");
    }

    final matchedGroups = <String, String>{};

    // Note: This regex match is a meta-matcher. This regex is inspecting another regex pattern
    // to find all the groups in that regex pattern.
    final groupNameMatchesInRegExpPattern = _matchGroupNames.allMatches(regExpPattern);
    for (final groupNameMatch in groupNameMatchesInRegExpPattern) {
      print(
          "Group name match - start: ${groupNameMatch.start}, end: ${groupNameMatch.end}, matching substring: '${groupNameMatch.input.substring(groupNameMatch.start, groupNameMatch.end)}'");
      String groupName = groupNameMatch.group(1)!;
      print("Group name: $groupName");
      final contentMatchForGroup =
          allContentMatches.where((contentMatch) => contentMatch.namedGroup(groupName) != null).firstOrNull;
      if (contentMatchForGroup == null) {
        continue;
      }

      if (sanitize && groupName.contains(_groupNameIndexSep)) {
        groupName = groupName.substring(0, groupName.lastIndexOf(_groupNameIndexSep));
      }

      if (!groupName.contains(_groupNameIndexSep)) {
        groupName = groupName.replaceAll("ii", "_");
      }

      final groupValue = contentMatchForGroup.namedGroup(groupName);
      print(
          "Content match that corresponds to this group: '$groupValue' - start: ${contentMatchForGroup.start}, end: ${contentMatchForGroup.end}");

      final jsMatchBounds = jsAllContentMatches.getGroupBounds(groupName);
      if (jsMatchBounds != null) {
        print("JS Match - bounds: $jsMatchBounds - value: ${jsAllContentMatches.getGroup(groupName)}");
      }

      // If matchedGroups previously contained a mapping for groupName, the old value is replaced.
      if (groupValue != null) {
        matchedGroups[groupName] = groupValue;
      }

      print("");
    }

    return matchedGroups;
  }

  const RegExpComposer._();
}

class NlpMatch {
  NlpMatch(this.index, this.length, this.value, this.innerGroups);

  final int index;
  final int length;
  final String value;
  final Map<String, NlpMatchGroup> innerGroups;

  NlpMatchGroup getGroup(String key) => innerGroups[key] ?? NlpMatchGroup("", 0, 0, <Capture>[]);
}

class NlpMatchGroup {
  const NlpMatchGroup(this.value, this.index, this.length, this.captures);

  final String value;
  final int index;
  final int length;
  final List<Capture> captures;
}

class Capture {
  const Capture(this.value, this.index, this.length);

  final String value;
  final int index;
  final int length;
}

extension NlpRegExp on RegExp {
  /// Returns a [Match] for this regular expression within the the given [text], only
  /// if this regular expression matches the beginning of the text.
  ///
  /// To ignore spaces at the beginning of [text], pass `true` for [trim].
  RegExpMatch? matchBegin(String text, [bool trim = false]) {
    final match = allMatches(text).firstOrNull;
    if (match == null) {
      return null;
    }

    String strBefore = text.substring(0, match.start);
    if (trim) {
      strBefore = strBefore.trim();
    }

    if (strBefore.isNotEmpty) {
      return null;
    }

    return match;
  }

  /// Returns a [Match] for this regular expression within the the given [text], only
  /// if this regular expression matches the end of the text.
  ///
  /// To ignore spaces at the end of [text], pass `true` for [trim].
  RegExpMatch? matchEnd(String text, [bool trim = false]) {
    final match = allMatches(text).lastOrNull;
    if (match == null) {
      return null;
    }

    String strAfter = text.substring(match.start + match.length);
    if (trim) {
      strAfter = strAfter.trim();
    }
    if (strAfter.isEmpty) {
      return null;
    }

    return match;
  }
}

extension NlpRegExpMatch on RegExpMatch {
  /// Returns the length of the text in this match.
  int get length => end - start;
}
