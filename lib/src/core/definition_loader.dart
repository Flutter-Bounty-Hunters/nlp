class DefinitionLoader {
  static Map<RegExp, RegExp> LoadAmbiguityFilters(Map<String, String> filters) {
    var ambiguityFiltersDict = <RegExp, RegExp>{};

    for (var item in filters.entries) {
      if ("null" != item.key) {
        ambiguityFiltersDict.putIfAbsent(RegExp(item.key), () => RegExp(item.value));
      }
    }

    return ambiguityFiltersDict;
  }
}
