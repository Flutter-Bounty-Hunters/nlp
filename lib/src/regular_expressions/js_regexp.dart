import 'dart:js' as js;

class JsRegExp {
  /// Creates a JavaScript Regular Expression based in the given [pattern],
  /// with the given flags.
  ///
  /// [d] - `true` to enable indices for capture groups.
  JsRegExp(
    String pattern, {
    bool d = false,
  }) {
    _jsRegExp = js.context['RegExp'].apply([
      pattern,
      if (d) 'd',
    ]);
  }

  late final js.JsObject _jsRegExp;

  JsRegExpResult? exec(String content) {
    final jsResult = _jsRegExp.callMethod('exec', [content]);
    return jsResult != null ? JsRegExpResult(jsResult) : null;
  }
}

// class JsRegExpMatch implements RegExpMatch {
//   JsRegExpMatch({
//     required String target,
//     required this.pattern,
//     required Map<String, (int, int)> captureGroups,
//   })  : _target = target,
//         _captureGroups = captureGroups {
//     groupNames = captureGroups.keys;
//   }
//
//   final String _target;
//
//   final Map<String, (int, int)> _captureGroups;
//
//   @override
//   final RegExp pattern;
//
//   @override
//   late final Iterable<String> groupNames;
//
//   @override
//   String? namedGroup(String groupName) => _target.substring(
//         _captureGroups[groupName]!.$1,
//         _captureGroups[groupName]!.$2,
//       );
//
//   @override
//   String? operator [](int group) {
//     // TODO: implement []
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement end
//   int get end => throw UnimplementedError();
//
//   @override
//   String? group(int group) {
//     // TODO: implement group
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement groupCount
//   int get groupCount => throw UnimplementedError();
//
//   @override
//   List<String?> groups(List<int> groupIndices) {
//     // TODO: implement groups
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement input
//   String get input => throw UnimplementedError();
//
//   @override
//   // TODO: implement start
//   int get start => throw UnimplementedError();
// }

class JsRegExpResult {
  const JsRegExpResult(this._jsResult);

  final js.JsObject _jsResult;

  String get input => _jsResult['input'];

  int get index => _jsResult['index'];

  JsRegExpGroups get groups => JsRegExpGroups(_jsResult['groups']);

  /// Returns the name of each group in the RegExp that found a match within the [input].
  Iterable<String> get matchingGroupNames => groups.names.where((name) => getGroupBounds(name) != null);

  String? getGroup(String groupName) {
    final bounds = getGroupBounds(groupName);
    if (bounds == null) {
      return null;
    }

    return input.substring(bounds.$1, bounds.$2);
  }

  (int, int)? getGroupBounds(String groupName) {
    final js.JsObject namedGroupBounds = _jsResult['indices']['groups'];
    final boundsForGroup = namedGroupBounds[groupName];

    if (boundsForGroup is js.JsArray && boundsForGroup.length == 2) {
      return (boundsForGroup[0], boundsForGroup[1]);
    }

    if (boundsForGroup is (int, int)) {
      return boundsForGroup;
    }

    return null;
  }

  List<(int, int)> get indices {
    final indices = <(int, int)>[];

    final jsIndices = _jsResult['indices'] as js.JsArray;
    for (int i = 0; i < jsIndices.length; i += 1) {
      final range = jsIndices[i];

      if (range is (int, int)) {
        indices.add((range.$1, range.$2));
        continue;
      }

      if (range is js.JsArray) {
        if (range.length != 2) {
          print("WARNING: Found a match range that doesn't have 2 bounds: $range");
          continue;
        }
        jsIndices.add((range[0], range[1]));
        continue;
      }

      print("WARNING: Expected a match range of type JsArray or (int, int) but it was: ${range.runtimeType}");
    }

    return indices;
  }

  @override
  String toString() => '''JsRegExpResult[
 - groups: $groups
 - indices: $indices
]''';
}

class JsRegExpGroups {
  const JsRegExpGroups(this._jsGroups);

  final js.JsObject? _jsGroups;

  Iterable<String> get names => _jsGroups?.keys.whereType<String>() ?? <String>[];

  String operator [](dynamic key) => _jsGroups?[key] ?? '';

  @override
  String toString() => _jsGroups?.keys.join(", ") ?? '';
}

extension on js.JsObject {
  List<String> get keys => (js.context['Object'].callMethod('getOwnPropertyNames', [this]) as js.JsArray)
      .map((key) => key as String)
      .toList();
}

void _jsExample() {
  final jsRegExp = js.context['RegExp'].apply(['^(?<timestamp>\\d+),(?<author>.+)\$', 'd']);
  final result = jsRegExp.callMethod('exec', ["1560979912,Caroline"]);

  print("Result:");
  print("$result");
  print("");

  print("Groups type: ${result['groups'].runtimeType}");

  print("Timestamp group:");
  print("${result['groups']['timestamp']}");
  print("");

  print("Author group:");
  print("${result['groups']['author']}");
  print("");

  print("Indices:");
  print("${result['indices']}");
  print("");
}
