// ignore_for_file: constant_identifier_names

class Culture {
  static List<String> getSupportedCultureCodes() {
    return SupportedCultures.map((c) => c.cultureCode).toList();
  }

  static const SupportedCultures = <Culture>{
    Culture("English", English),
    Culture("Chinese", Chinese),
    Culture("Spanish", Spanish),
    Culture("Portuguese", Portuguese),
    Culture("French", French),
    Culture("German", German),
    Culture("Japanese", Japanese),
    Culture("Dutch", Dutch),
    Culture("Italian", Italian),
  };

  static const English = "en-us";
  static const Chinese = "zh-cn";
  static const Spanish = "es-es";
  static const Portuguese = "pt-br";
  static const French = "fr-fr";
  static const German = "de-de";
  static const Japanese = "ja-jp";
  static const Dutch = "nl-nl";
  static const Italian = "it-it";

  const Culture(this.cultureName, this.cultureCode);

  final String cultureName;
  final String cultureCode;
}

class CultureInfo {
  static CultureInfo getCultureInfo(String cultureCode) {
    return CultureInfo(cultureCode);
  }

  const CultureInfo(this.cultureCode);

  final String cultureCode;
}
