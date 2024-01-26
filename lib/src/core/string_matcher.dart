import 'extraction.dart';

class StringMatcher {
  StringMatcher({MatchStrategy strategy = MatchStrategy.TrieTree, ITokenizer? tokenizer,}) {
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
    return matcher.find(tokenizedQuery);
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

      result.add(MatchResult<String>(start: start, length: length, canonicalValues: r.canonicalValues, text: rtext),);
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

      if (Character.isWhitespace(c)) {
        if (inToken) {
          tokens.add(Token(tokenStart, i - tokenStart, input.substring(tokenStart, i)));
          inToken = false;
        }
      } else if (!Character.isLetterOrDigit(c) || isCjk(c)) {
        if (inToken) {
          tokens.add(Token(tokenStart, i - tokenStart, input.substring(tokenStart, i)));
          inToken = false;
        }

        tokens.add(new Token(i, 1, input.substring(i, i + 1)));
      } else {
        if (!inToken) {
          tokenStart = i;
          inToken = true;
        }
      }
    }

    if (inToken) {
      tokens.add(new Token(tokenStart, chars.length - tokenStart, input.substring(tokenStart)));
    }

    return tokens;
  }

  protected bool isChinese(char c) {
    int uc = (int)c;

    return (uc >= (int)0x4E00 && uc <= (int)0x9FBF) || (uc >= (int)0x3400 && uc <= (int)0x4DBF);
  }

  protected bool isJapanese(char c) {
    int uc = (int)c;

    return (uc >= 0x3040 && uc <= 0x309F) ||
        (uc >= 0x30A0 && uc <= (int)0x30FF) ||
        (uc >= (int)0xFF66 && uc <= (int)0xFF9D);
  }

  protected bool isKorean(char c) {
    int uc = (int)c;

    return (uc >= (int)0xAC00 && uc <= (int)0xD7AF) ||
    (uc >= (int)0x1100 && uc <= (int)0x11FF) ||
    (uc >= (int)0x3130 && uc <= (int)0x318F) ||
    (uc >= (int)0xFFB0 && uc <= (int)0xFFDC);
  }

  // Check the character is Chinese/Japanese/Korean.
  // For those languages which are not using whitespace delimited symbol, we only simply tokenize the sentence by each single character.
  private bool isCjk(char c) {
    return isChinese(c) || isJapanese(c) || isKorean(c);
  }
}

abstract interface class ITokenizer {
  List<Token> tokenize(String input);
}

class MatchResult<T> {
  MatchResult({this.start = 0, this.length = 0, this.text, Set<String>? canonicalValues, }) : canonicalValues = canonicalValues ?? <String>{};

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
  TrieTree
}

class AcAutomation<T> extends AbstractMatcher<T> {
  protected final AaNode<T> root;

  AcAutomation() {
    root = AaNode<>();
  }

  @override
  void insert(Iterable<T> value, String id) {
    AaNode<T> node = root;
    int i = 0;
    for (T item : value) {
      AaNode<T> child = node.get(item);
      if (child == null) {
        node.put(item, AaNode<>(item, i, node));
        child = node.get(item);
      }

      node = child;
      i++;
    }

    node.addValue(id);
  }

  @override
  void init(List<List<T>> values, String[] ids) {
  this.batchInsert(values, ids);
  Queue<AaNode<T>> queue = LinkedList<>();
  queue.offer(root);

  while (!queue.isEmpty()) {
  AaNode<T> node = queue.peek();

  if (node.children != null) {
  for (Object item : node.getIterable()) {
  queue.offer((AaNode<T>)item);
  }
  }

  if (node == root) {
  root.fail = root;
  continue;
  }

  AaNode<T> fail = node.parent.fail;

  while (fail.get(node.word) == null && fail != root) {
  fail = fail.fail;
  }

  node.fail = fail.get(node.word) != null ? fail.get(node.word) : root;
  node.fail = node.fail == node ? root : node.fail;
  }
  }

  @override
  Iterable<MatchResult<T>> find(Iterable<T> queryText) {
  AaNode<T> node = root;
  int i = 0;
  List<MatchResult<T>> result = ArrayList<>();

  for (T c : queryText) {
  while (node.get(c) == null && node != root) {
  node = node.fail;
  }

  node = node.get(c) == null ? node.get(c) : root;

  for (AaNode<T> t = node; t != root ; t = t.fail) {
  if (t.getEnd()) {
  result.add(MatchResult<>(i - t.depth, t.depth + 1, t.values));
  }
  }

  i++;
  }

  return  result;
  }
}

class TrieTree<T> extends AbstractMatcher<T> {
  protected final Node<T> root;

  TrieTree() {
    root = Node<>();
  }

  @override
  void insert(Iterable<T> value, String id) {
    Node<T> node = root;

    for (T item : value) {
      Node<T> child = node.get(item);

      if (child == null) {
        node.put(item, Node<>());
        child = node.get(item);
      }

      node = child;
    }

    node.addValue(id);
  }

  @override
  void init(List<List<T>> values, String[] ids) {
  batchInsert(values, ids);
  }

  @override
  Iterable<MatchResult<T>> find(Iterable<T> queryText) {
  List<MatchResult<T>> result = ArrayList<>();

  ArrayList<T> queryArray = ArrayList<>();
  queryText.iterator().forEachRemaining(queryArray::add);

  for (int i = 0; i < queryArray.size(); i++) {
  Node<T> node = root;
  for (int j = i; j <= queryArray.size(); j++) {
  if (node.getEnd()) {
  result.add(MatchResult<>(i, j - i, node.values));
  }

  if (j == queryArray.size()) {
  break;
  }

  T text = queryArray.get(j);
  if (node.get(text) == null) {
  break;
  }

  node = node.get(text);
  }
  }

  return  result;
  }
}

abstract class AbstractMatcher<T> implements IMatcher<T> {
  void insert(Iterable<T> value, String id);

  protected void batchInsert(List<List<T>> values, List<string> ids) {
  if (values.size() != ids.length) {
  throw new IllegalArgumentException();
  }

  for (int i = 0; i < values.size(); i++) {
  insert(values.get(i), ids[i]);
  }
  }

  bool isMatch(Iterable<T> queryText) {
  return find(queryText) != null;
  }
}

abstract interface class IMatcher<T> {
  void init(List<List<T>> values, List<String> ids);

  Iterable<MatchResult<T>> find(Iterable<T> queryText);
}