import 'package:nlp/src/old/unicode.dart';
import 'package:unorm_dart/unorm_dart.dart' as unorm;

import 'base_date_time.dart';
import '../date_time_interfaces.dart';

class DateTimeRecognizer extends Recognizer<DateTimeOptions> {
  static List<ModelResult> recognizeDateTime({
    required String query,
    required String culture,
    DateTimeOptions options = DateTimeOptions.none,
    required bool fallbackToDefaultCulture,
    DateTime? reference,
  }) {
    DateTimeRecognizer recognizer = DateTimeRecognizer(targetCulture: culture, options: options);
    DateTimeModel model = recognizer.getDateTimeModel(culture: culture, fallbackToDefaultCulture: fallbackToDefaultCulture,);
    return model.parse(query, reference);
  }

  DateTimeRecognizer({
    required super.targetCulture,
    super.options = DateTimeOptions.none,
    super.lazyInitialization = true,
  });

  DateTimeModel getDateTimeModel({String? culture, bool fallbackToDefaultCulture = true,}) {
    return getModel(DateTimeModel, culture, fallbackToDefaultCulture);
  }

  @override
  void initializeConfiguration() {
    // English
    registerModel(
        DateTimeModel,
        Culture.English,
        (DateTimeOptions options) => DateTimeModel(
          BaseMergedDateTimeParser(EnglishMergedParserConfiguration(options)),
          BaseMergedDateTimeExtractor(EnglishMergedExtractorConfiguration(options)),
        ),
    );

    // // Spanish
    // registerModel(DateTimeModel, Culture.Spanish,
    // (DateTimeOptions options) => DateTimeModel(
    // BaseMergedDateTimeParser(SpanishMergedParserConfiguration(options)),
    // BaseMergedDateTimeExtractor(SpanishMergedExtractorConfiguration(options))));
    //
    // // French
    // registerModel(DateTimeModel.class, Culture.French, dateTimeOptions -> new DateTimeModel(
    // new BaseMergedDateTimeParser(new FrenchMergedParserConfiguration(options)),
    // new BaseMergedDateTimeExtractor(new FrenchMergedExtractorConfiguration(options))));
    //
    // // German
    // registerModel(DateTimeModel.class, Culture.German, dateTimeOptions -> new DateTimeModel(
    // new BaseMergedDateTimeParser(new GermanMergedParserConfiguration(options)),
    // new BaseMergedDateTimeExtractor(new GermanMergedExtractorConfiguration(options))
    // ));
    }
}

 class Recognizer<TRecognizerOptions> {
   Recognizer({required this.targetCulture, required this.options, bool lazyInitialization = true,}) {
    _factory = ModelFactory<TRecognizerOptions>();
    this.initializeConfiguration();

    if (!lazyInitialization) {
      _initializeModels(targetCulture, options);
    }
  }

   void _initializeModels(String targetCulture, TRecognizerOptions options) {
     _factory.initializeModels(targetCulture, options);
   }

   final String targetCulture;
   final TRecognizerOptions options;

   late final ModelFactory<TRecognizerOptions> _factory;

   T getModel<T extends IModel>(Type modelType, String? culture, bool fallbackToDefaultCulture) {
    return _factory.getModel(
        modelType,
        culture ?? targetCulture,
        fallbackToDefaultCulture,
        options,
    );
  }

   void registerModel<T extends IModel>(Type modelType, String culture, IModel Function(TRecognizerOptions) modelCreator) {
    _factory.put((culture, modelType), modelCreator);
  }



  // Note: This method wsa originally abstract, and the class was abstract. However, to
  // retain the class' constructor, we had to make the class non-abstract.
  void initializeConfiguration() => throw UnimplementedError();
}

class ModelFactory<TModelOptions> { //extends Map<(String, Type), IModel Function(TModelOptions)> {
  static (String, Type) _generateKey(String culture, Type modelType) {
    return (culture.toLowerCase(), modelType);
  }

  // cacheKey: (string culture, Type modelType, string modelOptions)
  static final cache = <(String, Type, String), IModel>{};

  static final String fallbackCulture = Culture.English;

  T getModel<T extends IModel>(Type modelType, String culture, bool fallbackToDefaultCulture, TModelOptions options) {
    IModel? model = _getModel(modelType, culture, options);
    if (model != null) {
     return model as T;
    }

    if (fallbackToDefaultCulture) {
      model = _getModel(modelType, fallbackCulture, options);
      if (model != null) {
        return model as T;
      }
    }

    throw Exception("Could not find Model with the specified configuration: %culture, %modelType");
  }

  IModel? _getModel(Type modelType, String? culture, TModelOptions options) {
    if (culture == null || culture.isEmpty) {
      return null;
    }

    // Look in cache
    (String, Type, String) cacheKey = (culture.toLowerCase(), modelType, options.toString());
    if (cache.containsKey(cacheKey)) {
      return cache[cacheKey];
    }

    // Use Factory to create instance
    (String, Type) key = _generateKey(culture, modelType);
    if (this.containsKey(key)) {
      IModel Function(TModelOptions) factoryMethod = this.get(key);
      IModel model = factoryMethod(options);

      // Store in cache
      cache[cacheKey] = model;
      return model;
    }

    return null;
  }

  void initializeModels(String targetCulture, TModelOptions options) {
    this.keySet().stream()
        .filter(key -> StringUtility.isNullOrEmpty(targetCulture) || key.getValue0().equalsIgnoreCase(targetCulture))
        .forEach(key -> this.initializeModel(key.getValue1(), key.getValue0(), options));
  }

  void _initializeModel(Type modelType, String culture, TModelOptions options) {
    this.getModel(modelType, culture, options);
  }

  IModel Function(TModelOptions) put((String, Type) config, IModel Function(TModelOptions) modelCreator) {
    return super.put(
        generateKey(config.getValue0(), config.getValue1()),
        modelCreator);
  }
}



enum DateTimeOptions {
  none(0),
  skipFromToMerge(1),
  splitDateAndTime(2),
  calendarMode(4),
  extendedTypes(8),
  enablePreview(8388608),
  experimentalMode(4194304),
  complexCalendar(8 + 4 + 8388608);

  const DateTimeOptions(this._value);
  
  final int _value;

  int getValue() {
    return _value;
  }

  bool match(DateTimeOptions option) {
    return (_value & option._value) == option._value;
  }
}

class DateTimeModel implements IModel {

  DateTimeModel(IDateTimeParser parser, IDateTimeExtractor extractor) : _extractor = extractor, _parser = parser;

  final IDateTimeExtractor _extractor;
  final IDateTimeParser _parser;

  @override
  String getModelTypeName() {
    return Constants.MODEL_DATETIME;
  }

  @override
  List<ModelResult> parse(String query, DateTime? reference) {
    query = FormatUtility.preprocess(query);
    reference ??= DateTime.now();

    late final List<DateTimeParseResult> parsedDateTimes;
    try {
      List<ExtractResult> extractResults = _extractor.extract(query, reference);

      final nonFilteredDateTimes = <DateTimeParseResult>[];
      for (ExtractResult result in extractResults) {
        DateTimeParseResult parseResult = _parser.parse(result, reference);

        if (parseResult.value is List<DateTimeParseResult>) {
          nonFilteredDateTimes.addAll(parseResult.value as List<DateTimeParseResult>);
        } else {
          nonFilteredDateTimes.add(parseResult);
        }
      }

      // Filter out ambiguous cases. Naïve approach.
      parsedDateTimes = _parser.filterResults(query, nonFilteredDateTimes);
    } catch (exception) {
      // Nothing to do. Exceptions in parse should not break users of recognizers.
      // No result.
      rethrow;
    }

    return parsedDateTimes.map(_getModelResult).toList();
  }

  ModelResult _getModelResult(DateTimeParseResult parsedDateTime) {

    int start = parsedDateTime.start!;
    int end = parsedDateTime.start! + parsedDateTime.length! - 1;
    String typeName = parsedDateTime.type!;
    Map<String, Object> resolution = parsedDateTime.value as Map<String, Object>;
    String text = parsedDateTime.text!;

    ModelResult result = ModelResult(text: text, start: start, end: end, typeName: typeName, resolution: resolution);

    List<String> types = parsedDateTime.type!.split("\\.");
    String type = types[types.length - 1];
    if (type == Constants.SYS_DATETIME_DATETIMEALT) {
      result = result.copyWith(parentText: _getParentText(parsedDateTime));
    }

    return result;
  }

  String _getParentText(DateTimeParseResult parsedDateTime) {
    Map<String, Object> map = parsedDateTime.data as Map<String, Object>;
    return map[ModelResult.parentTextKey] as String;
  }
}





class Constants {
  static final SYS_DATETIME_DATE = "date";
  static final SYS_DATETIME_TIME = "time";
  static final SYS_DATETIME_DATEPERIOD = "daterange";
  static final SYS_DATETIME_DATETIME = "datetime";
  static final SYS_DATETIME_TIMEPERIOD = "timerange";
  static final SYS_DATETIME_DATETIMEPERIOD = "datetimerange";
  static final SYS_DATETIME_DURATION = "duration";
  static final SYS_DATETIME_SET = "set";
  static final SYS_DATETIME_DATETIMEALT = "datetimealt";
  static final SYS_DATETIME_TIMEZONE = "timezone";

  // SourceEntity Types
  static final SYS_DATETIME_DATETIMEPOINT = "datetimepoint";

  // Model Name
  static final MODEL_DATETIME = "datetime";

  // Multiple Duration Types
  static final MultipleDuration_Prefix = "multipleDuration";
  static final MultipleDuration_Type = MultipleDuration_Prefix + "Type";
  static final MultipleDuration_DateTime = MultipleDuration_Prefix + "DateTime";
  static final MultipleDuration_Date = MultipleDuration_Prefix + "Date";
  static final MultipleDuration_Time = MultipleDuration_Prefix + "Time";

  // DateTime Parse
  static final Resolve = "resolve";
  static final ResolveToPast = "resolveToPast";
  static final ResolveToFuture = "resolveToFuture";
  static final FutureDate = "futureDate";
  static final PastDate = "pastDate";
  static final ParseResult1 = "parseResult1";
  static final ParseResult2 = "parseResult2";

  // In the ExtractResult data
  static final Context = "context";
  static final ContextType_RelativePrefix = "relativePrefix";
  static final ContextType_RelativeSuffix = "relativeSuffix";
  static final ContextType_AmPm = "AmPm";
  static final SubType = "subType";

  // Comment - internal tag used during entity processing, never exposed to users. 
  // Tags are filtered out in BaseMergedDateTimeParser DateTimeResolution()
  static final Comment = "Comment";
  // AmPm time representation for time parser
  static final Comment_AmPm = "ampm";
  // Prefix early/late for time parser
  static final Comment_Early = "early";
  static final Comment_Late = "late";
  // Parse week of date format
  static final Comment_WeekOf = "WeekOf";
  static final Comment_MonthOf = "MonthOf";

  static final Comment_DoubleTimex = "doubleTimex";

  static final InvalidDateString = "0001-01-01";
  static final CompositeTimexDelimiter = "|";
  static final CompositeTimexSplit = "\\|";

  // Mod Value
  // "before" -> To mean "preceding in time". I.e. Does not include the extracted datetime entity in the resolution's ending point. Equivalent to "<"
  static final BEFORE_MOD = "before";

  // "after" -> To mean "following in time". I.e. Does not include the extracted datetime entity in the resolution's starting point. Equivalent to ">"
  static final AFTER_MOD = "after";

  // "since" -> Same as "after", but including the extracted datetime entity. Equivalent to ">="
  static final SINCE_MOD = "since";

  // "until" -> Same as "before", but including the extracted datetime entity. Equivalent to "<="
  static final UNTIL_MOD = "until";

  static final EARLY_MOD = "start";
  static final MID_MOD = "mid";
  static final LATE_MOD = "end";

  static final MORE_THAN_MOD = "more";
  static final LESS_THAN_MOD = "less";

  static final REF_UNDEF_MOD = "ref_undef";

  static final APPROX_MOD = "approx";

  // Invalid year
  static final InvalidYear = -1;
  static final InvalidMonth = -1;
  static final InvalidDay = -1;
  static final InvalidHour = -1;
  static final InvalidMinute = -1;
  static final InvalidSecond = -1;

  static final MinYearNum = BaseDateTime.minYearNum;
  static final MaxYearNum = BaseDateTime.maxYearNum;

  static final MaxTwoDigitYearFutureNum = BaseDateTime.maxTwoDigitYearFutureNum;
  static final MinTwoDigitYearPastNum = BaseDateTime.minTwoDigitYearPastNum;

  // These are some particular values for timezone recognition
  static final InvalidOffsetValue = -10000;
  static final UtcOffsetMinsKey = "utcOffsetMins";
  static final TimeZoneText = "timezoneText";
  static final TimeZone = "timezone";
  static final ResolveTimeZone = "resolveTimeZone";
  static final PositiveSign = 1;
  static final NegativeSign = -1;

  static final TrimesterMonthCount = 3;
  static final QuarterCount = 4;
  static final SemesterMonthCount = 6;
  static final WeekDayCount = 7;
  static final CenturyYearsCount = 100;
  static final MaxWeekOfMonth = 5;

  // hours of one half day
  static final HalfDayHourCount = 12;
  // hours of a half mid-day-duration
  static final HalfMidDayDurationHourCount = 2;

  // the length of four digits year, e.g., 2018
  static final FourDigitsYearLength = 4;

  // specifies the priority interpreting month and day order
  static final DefaultLanguageFallback_MDY = "MDY";
  static final DefaultLanguageFallback_DMY = "DMY";
  static final DefaultLanguageFallback_YMD = "YMD"; // ZH

  // Groups' names for named groups in regexes
  static final NextGroupName = "next";
  static final AmGroupName = "am";
  static final PmGroupName = "pm";
  static final ImplicitAmGroupName = "iam";
  static final ImplicitPmGroupName = "ipm";
  static final PrefixGroupName = "prefix";
  static final SuffixGroupName = "suffix";
  static final DescGroupName = "desc";
  static final SecondGroupName = "sec";
  static final MinuteGroupName = "min";
  static final HourGroupName = "hour";
  static final TimeOfDayGroupName = "timeOfDay";
  static final BusinessDayGroupName = "business";
  static final LeftAmPmGroupName = "leftDesc";
  static final RightAmPmGroupName = "rightDesc";

  static final DECADE_UNIT = "10Y";
  static final FORTNIGHT_UNIT = "2W";

  // Timex
  static final List<String> DatePeriodTimexSplitter = [ ",", "(", ")" ];
  static final TimexYear = "Y";
  static final TimexMonth = "M";
  static final TimexMonthFull = "MON";
  static final TimexWeek = "W";
  static final TimexDay = "D";
  static final TimexBusinessDay = "BD";
  static final TimexWeekend = "WE";
  static final TimexHour = "H";
  static final TimexMinute = "M";
  static final TimexSecond = "S";
  static final TimexFuzzy = 'X';
  static final TimexFuzzyYear = "XXXX";
  static final TimexFuzzyMonth = "XX";
  static final TimexFuzzyWeek = "WXX";
  static final TimexFuzzyDay = "XX";
  static final DateTimexConnector = "-";
  static final TimeTimexConnector = ":";
  static final GeneralPeriodPrefix = "P";
  static final TimeTimexPrefix = "T";

  // Timex of TimeOfDay
  static final EarlyMorning = "TDA";
  static final Morning = "TMO";
  static final Afternoon = "TAF";
  static final Evening = "TEV";
  static final Daytime = "TDT";
  static final Night = "TNI";
  static final BusinessHour = "TBH";
}

class Culture {
   static final English = "en-us";
   static final Chinese = "zh-cn";
   static final Spanish = "es-es";
   static final Portuguese = "pt-br";
   static final French = "fr-fr";
   static final German = "de-de";
   static final Japanese = "ja-jp";
   static final Dutch = "nl-nl";
   static final Italian = "it-it";

   static final SupportedCultures =  [
   Culture("English", English),
   Culture("Chinese", Chinese),
   Culture("Spanish", Spanish),
   Culture("Portuguese", Portuguese),
   Culture("French", French),
   Culture("German", German),
   Culture("Japanese", Japanese),
   Culture("Dutch", Dutch),
   Culture("Italian", Italian),
  ];

   static List<String> getSupportedCultureCodes() {
     return SupportedCultures
         .map((c) => c.cultureCode)
         .toList();
   }

   Culture(this.cultureName, this.cultureCode);

   final String cultureName;
   final String cultureCode;
}

 class FormatUtility {
   static String preprocess(String query, [bool toLower = true]) {
    if (toLower) {
      query = query.toLowerCase();
    }

    return query
        .replaceAll('０', '0')
        .replaceAll('１', '1')
        .replaceAll('２', '2')
        .replaceAll('３', '3')
        .replaceAll('４', '4')
        .replaceAll('５', '5')
        .replaceAll('６', '6')
        .replaceAll('７', '7')
        .replaceAll('８', '8')
        .replaceAll('９', '9')
        .replaceAll('：', ':')
        .replaceAll('－', '-')
        .replaceAll('，', ',')
        .replaceAll('／', '/')
        .replaceAll('Ｇ', 'G')
        .replaceAll('Ｍ', 'M')
        .replaceAll('Ｔ', 'T')
        .replaceAll('Ｋ', 'K')
        .replaceAll('ｋ', 'k')
        .replaceAll('．', '.')
        .replaceAll('（', '(')
        .replaceAll('）', ')');
  }

   static String trimEnd(String input, [String chars = ""]) {
    return input.replaceAll("[$chars]+\$", "");
  }

   static List<String> split(String input, List<String> delimiters) {
    String delimitersRegex = delimiters.map((s) => RegExp.escape(s)).toList().join("|");

    return input.split(delimitersRegex).where((s) => s.isNotEmpty).toList();
  }

   static String? removeDiacritics(String? query) {
    if (query == null) {
      return null;
    }

    String norm = unorm.nfd(query);
    final out = StringBuffer();
    for (int i = 0, n = norm.length; i < n; ++i) {
      final c = norm[i];
      if (!UnicodeSpec.spacingMarks.contains(c)) {
        out.write(c);
      }
    }

    return out.toString();
  }
}