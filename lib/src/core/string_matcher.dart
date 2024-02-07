import 'dart:collection';

import 'package:nlp/src/regular_expressions/string_extensions.dart';

import 'extraction.dart';

class StringMatcher {
  StringMatcher({
    MatchStrategy strategy = MatchStrategy.TrieTree,
    ITokenizer? tokenizer,
  }) {
    this.tokenizer = tokenizer ?? SimpleTokenizer();

    switch (strategy) {
      case MatchStrategy.AcAutomaton:
        matcher = AcAutomation<String>();
        break;
      case MatchStrategy.TrieTree:
        matcher = TrieTree<String>();
        break;
    }
  }

  late final ITokenizer tokenizer;
  late final IMatcher<String> matcher;

  void initFromValues(Iterable<String> values) {
    initFromValuesAndIds(values, values.toList());
  }

  void initFromValuesAndIds(Iterable<String> values, List<String> ids) {
    List<List<String>> tokenizedValues = _getTokenizedText(values);
    initFromTokensAndIds(tokenizedValues, ids);
  }

  void initFromMap(Map<String, List<String>> valuesMap) {
    final values = <String>[];
    final ids = <String>[];

    for (final item in valuesMap.entries) {
      String id = item.key;
      for (final value in item.value) {
        values.add(value);
        ids.add(id);
      }
    }

    List<List<String>> tokenizedValues = _getTokenizedText(values);
    initFromTokensAndIds(tokenizedValues, ids);
  }

  void initFromTokensAndIds(List<List<String>> tokenizedValues, List<String> ids) {
    matcher.init(tokenizedValues, ids);
  }

  List<List<String>> _getTokenizedText(Iterable<String> values) {
    final result = <List<String>>[];
    for (final value in values) {
      result.add(tokenizer.tokenize(value).map((i) => i.text!).toList());
    }

    return result;
  }

  Iterable<MatchResult<String>> findByTokenizedQuery(Iterable<String> tokenizedQuery) {
    return matcher.find(tokenizedQuery)!;
  }

  Iterable<MatchResult<String>> findByQueryText(String queryText) {
    final queryTokens = tokenizer.tokenize(queryText);
    final tokenizedQueryText = queryTokens.map((t) => t.text!);

    final result = <MatchResult<String>>[];
    for (MatchResult<String> r in findByTokenizedQuery(tokenizedQueryText)) {
      Token startToken = queryTokens[r.start];
      Token endToken = queryTokens[r.start + r.length - 1];
      int start = startToken.start;
      int length = endToken.end - startToken.start;
      String rtext = queryText.substring(start, start + length);

      result.add(
        MatchResult<String>(start: start, length: length, canonicalValues: r.canonicalValues, text: rtext),
      );
    }

    return result;
  }
}

class SimpleTokenizer implements ITokenizer {
  @override
  List<Token> tokenize(String? input) {
    final tokens = <Token>[];

    if (input == null || input.isEmpty) {
      return tokens;
    }

    bool inToken = false;
    int tokenStart = 0;
    for (int i = 0; i < input.length; i++) {
      final c = input[i];

      if (c.isWhitespace) {
        if (inToken) {
          tokens.add(Token(tokenStart, i - tokenStart, input.substring(tokenStart, i)));
          inToken = false;
        }
      } else if (!(c.isLetter || c.isDigit) || isCjk(c)) {
        if (inToken) {
          tokens.add(Token(tokenStart, i - tokenStart, input.substring(tokenStart, i)));
          inToken = false;
        }

        tokens.add(Token(i, 1, input.substring(i, i + 1)));
      } else {
        if (!inToken) {
          tokenStart = i;
          inToken = true;
        }
      }
    }

    if (inToken) {
      tokens.add(Token(tokenStart, input.length - tokenStart, input.substring(tokenStart)));
    }

    return tokens;
  }

  bool isChinese(String c) {
    int uc = c.codeUnitAt(0);

    return (uc >= 0x4E00 && uc <= 0x9FBF) || (uc >= 0x3400 && uc <= 0x4DBF);
  }

  bool isJapanese(String c) {
    int uc = c.codeUnitAt(0);

    return (uc >= 0x3040 && uc <= 0x309F) || (uc >= 0x30A0 && uc <= 0x30FF) || (uc >= 0xFF66 && uc <= 0xFF9D);
  }

  bool isKorean(String c) {
    int uc = c.codeUnitAt(0);

    return (uc >= 0xAC00 && uc <= 0xD7AF) ||
        (uc >= 0x1100 && uc <= 0x11FF) ||
        (uc >= 0x3130 && uc <= 0x318F) ||
        (uc >= 0xFFB0 && uc <= 0xFFDC);
  }

  // Check the character is Chinese/Japanese/Korean.
  // For those languages which are not using whitespace delimited symbol, we only simply tokenize the sentence by each single character.
  bool isCjk(String c) {
    return isChinese(c) || isJapanese(c) || isKorean(c);
  }
}

abstract interface class ITokenizer {
  List<Token> tokenize(String input);
}

class MatchResult<T> {
  MatchResult({
    this.start = 0,
    this.length = 0,
    this.text,
    Set<String>? canonicalValues,
  }) : canonicalValues = canonicalValues ?? <String>{};

  int start;
  int length;
  T? text;
  Set<String> canonicalValues;

  int getEnd() {
    return start + length;
  }
}

enum MatchStrategy {
  AcAutomaton,
  TrieTree,
}

class AcAutomation<T> extends AbstractMatcher<T> {
  AcAutomation() : root = AaNode<T>();

  final AaNode<T> root;

  @override
  void insert(Iterable<T> value, String id) {
    AaNode<T> node = root;
    int i = 0;
    for (T item in value) {
      AaNode<T>? child = node.get(item);
      if (child == null) {
        node.put(item, AaNode<T>(item, i, node));
        child = node.get(item);
      }

      node = child!;
      i++;
    }

    node.addValue(id);
  }

  @override
  void init(List<List<T>> values, List<String> ids) {
    batchInsert(values, ids);
    final queue = Queue<AaNode<T>>();
    queue.add(root);

    while (queue.isNotEmpty) {
      AaNode<T> node = queue.first;

      if (node.children != null) {
        for (Object item in node.getIterable()!) {
          queue.add(item as AaNode<T>);
        }
      }

      if (node == root) {
        root.fail = root;
        continue;
      }

      AaNode<T> fail = node.parent!.fail!;

      while (fail.get(node.word as T) == null && fail != root) {
        fail = fail.fail!;
      }

      node.fail = fail.get(node.word as T) ?? root;
      node.fail = node.fail == node ? root : node.fail;
    }
  }

  @override
  Iterable<MatchResult<T>> find(Iterable<T> queryText) {
    AaNode<T> node = root;
    int i = 0;
    final result = <MatchResult<T>>[];

    for (T c in queryText) {
      while (node.get(c) == null && node != root) {
        node = node.fail!;
      }

      node = node.get(c) == null ? node.get(c)! : root;

      for (AaNode<T> t = node; t != root; t = t.fail!) {
        if (t.getEnd()) {
          result.add(MatchResult<T>(start: i - t.depth, length: t.depth + 1, canonicalValues: t.values));
        }
      }

      i++;
    }

    return result;
  }
}

class TrieTree<T> extends AbstractMatcher<T> {
  TrieTree() : root = Node<T>();

  final Node<T> root;

  @override
  void insert(Iterable<T> value, String id) {
    Node<T> node = root;

    for (T item in value) {
      Node<T>? child = node.get(item);

      if (child == null) {
        node.put(item, Node<T>());
        child = node.get(item);
      }

      node = child!;
    }

    node.addValue(id);
  }

  @override
  void init(List<List<T>> values, List<String> ids) {
    batchInsert(values, ids);
  }

  @override
  Iterable<MatchResult<T>> find(Iterable<T> queryText) {
    final result = <MatchResult<T>>[];

    final queryArray = <T>[
      ...queryText,
    ];

    for (int i = 0; i < queryArray.length; i++) {
      Node<T> node = root;
      for (int j = i; j <= queryArray.length; j++) {
        if (node.getEnd()) {
          result.add(MatchResult<T>(start: i, length: j - i, canonicalValues: node.values));
        }

        if (j == queryArray.length) {
          break;
        }

        T text = queryArray[j];
        if (node.get(text) == null) {
          break;
        }

        node = node.get(text)!;
      }
    }

    return result;
  }
}

abstract class AbstractMatcher<T> implements IMatcher<T> {
  void insert(Iterable<T> value, String id);

  void batchInsert(List<List<T>> values, List<String> ids) {
    if (values.length != ids.length) {
      throw Exception("Expected values to have same length as IDs - ${values.length} vs ${ids.length}");
    }

    for (int i = 0; i < values.length; i++) {
      insert(values[i], ids[i]);
    }
  }

  bool isMatch(Iterable<T> queryText) {
    return find(queryText) != null;
  }
}

abstract interface class IMatcher<T> {
  void init(List<List<T>> values, List<String> ids);

  Iterable<MatchResult<T>>? find(Iterable<T> queryText);
}

class AaNode<T> extends Node<T> {
  AaNode([this.word, this.depth = 0, this.parent]);

  T? word;
  int depth;
  AaNode<T>? parent;
  AaNode<T>? fail;

  @override
  AaNode<T>? get(T c) {
    return children != null && children!.containsKey(c) ? children![c] as AaNode<T> : null;
  }

  @override
  void put(T c, Node<T> value) {
    children ??= HashMap<T, AaNode<T>>();
    children![c] = value as AaNode<T>;
  }

  @override
  String toString() {
    return word.toString();
  }
}

class Node<T> {
  Iterable<Node<T>>? getEnumerator() {
    return children?.values;
  }

  Iterable<Node<T>>? getIterable() {
    return children?.values;
  }

  HashSet<String>? values;
  Map<T, Node<T>>? children;

  bool getEnd() {
    return this.values != null && values!.isNotEmpty;
  }

  Node<T>? get(T c) {
    return children != null && children!.containsKey(c) ? children![c] : null;
  }

  void put(T c, Node<T> value) {
    children ??= HashMap<T, Node<T>>();
    children![c] = value;
  }

  void addValue(String value) {
    values ??= HashSet<String>();
    values!.add(value);
  }
}
