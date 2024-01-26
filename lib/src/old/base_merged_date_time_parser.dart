import 'package:nlp/nlp.dart';
import 'package:nlp/src/core/parser.dart';
import 'package:nlp/src/date_time/date_time_parsing.dart';

class BaseMergedDateTimeParser implements IDateTimeParser {
  static final String _dateMinString = DateTimeFormatUtil.formatDate(DateUtil.minValue());
  static final String _dateTimeMinString = DateTimeFormatUtil.formatDateTime(DateUtil.minValue());

  final String _parserName = "datetimeV2";
  final IMergedParserConfiguration _config;

  BaseMergedDateTimeParser(IMergedParserConfiguration config) : _config = config;

  String getDateMinString() {
    return _dateMinString;
  }

  String getDateTimeMinString() {
    return _dateTimeMinString;
  }

  @override
  String getParserName() {
    return _parserName;
  }

  @override
  ParseResult parse(ExtractResult extractResult) {
    return this.parse(extractResult, DateTime.now());
  }

  @override
  DateTimeParseResult parse(ExtractResult er, DateTime reference) {

    DateTimeParseResult pr = null;

    String originText = er.text;
    if (this._config.getOptions().match(DateTimeOptions.EnablePreview)) {
      String newText = MatchingUtil.preProcessTextRemoveSuperfluousWords(er.text, _config.getSuperfluousWordMatcher()).text;
      int newLength = er.length + newText.length() - originText.length();
      er = ExtractResult(er.start, newLength, newText, er.type, er.getData(), er.getMetadata());
    }

    // Push, save the MOD string
    bool hasBefore = false;
    bool hasAfter = false;
    bool hasSince = false;
    bool hasAround = false;
    bool hasYearAfter = false;

    // "InclusiveModifier" means MOD should include the start/end time
    // For example, cases like "on or later than", "earlier than or in" have inclusive modifier
    bool hasInclusiveModifier = false;
    String modStr = "";

    if (er.getMetadata() != null && er.getMetadata().getHasMod()) {
      ConditionalMatch beforeMatch = RegexExtension.matchBegin(_config.getBeforeRegex(), er.text, true);
      ConditionalMatch afterMatch = RegexExtension.matchBegin(_config.getAfterRegex(), er.text, true);
      ConditionalMatch sinceMatch = RegexExtension.matchBegin(_config.getSinceRegex(), er.text, true);
      ConditionalMatch aroundMatch = RegexExtension.matchBegin(_config.getAroundRegex(), er.text, true);

      if (beforeMatch.getSuccess()) {
        hasBefore = true;
        er.setStart(er.start + beforeMatch.getMatch().get().length);
        er.setLength(er.length - beforeMatch.getMatch().get().length);
        er.setText(er.text.substring(beforeMatch.getMatch().get().length));
        modStr = beforeMatch.getMatch().get().value;

        if (!StringUtility.isNullOrEmpty(beforeMatch.getMatch().get().getGroup("include").value)) {
          hasInclusiveModifier = true;
        }
      } else if (afterMatch.getSuccess()) {
        hasAfter = true;
        er.setStart(er.start + afterMatch.getMatch().get().length);
        er.setLength(er.length - afterMatch.getMatch().get().length);
        er.setText(er.text.substring(afterMatch.getMatch().get().length));
        modStr = afterMatch.getMatch().get().value;

        if (!StringUtility.isNullOrEmpty(afterMatch.getMatch().get().getGroup("include").value)) {
          hasInclusiveModifier = true;
        }
      } else if (sinceMatch.getSuccess()) {
        hasSince = true;
        er.setStart(er.start + sinceMatch.getMatch().get().length);
        er.setLength(er.length - sinceMatch.getMatch().get().length);
        er.setText(er.text.substring(sinceMatch.getMatch().get().length));
        modStr = sinceMatch.getMatch().get().value;
      } else if (aroundMatch.getSuccess()) {
        hasAround = true;
        er.setStart(er.start + aroundMatch.getMatch().get().length);
        er.setLength(er.length - aroundMatch.getMatch().get().length);
        er.setText(er.text.substring(aroundMatch.getMatch().get().length));
        modStr = aroundMatch.getMatch().get().value;
      } else if ((er.type.equals(DateTimeConstants.SYS_DATETIME_DATEPERIOD) &&
          Arrays.stream(RegExpUtility.getMatches(_config.getYearRegex(), er.text)).findFirst().isPresent()) ||
          (er.type == DateTimeConstants.SYS_DATETIME_DATE) || (er.type == DateTimeConstants.SYS_DATETIME_TIME)) {
        // This has to be put at the end of the if, or cases like "before 2012" and "after 2012" would fall into this
        // 2012 or after/above, 3 pm or later
        ConditionalMatch match = RegexExtension.matchEnd(_config.getSuffixAfterRegex(), er.text, true);
        if (match.getSuccess()) {
          hasYearAfter = true;
          er.setLength(er.length - match.getMatch().get().length);
          er.setText(er.length > 0 ? er.text.substring(0, er.length) : "");
          modStr = match.getMatch().get().value;
        }
      }
    }

    if (er.type.equals(DateTimeConstants.SYS_DATETIME_DATE)) {
      if (er.getMetadata() != null && er.getMetadata().getIsHoliday()) {
        pr = _config.getHolidayParser().parse(er, reference);
      } else {
        pr = this._config.getDateParser().parse(er, reference);
      }
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_TIME)) {
      pr = this._config.getTimeParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_DATETIME)) {
      pr = this._config.getDateTimeParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_DATEPERIOD)) {
      pr = this._config.getDatePeriodParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_TIMEPERIOD)) {
      pr = this._config.getTimePeriodParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD)) {
      pr = this._config.getDateTimePeriodParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_DURATION)) {
      pr = this._config.getDurationParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_SET)) {
      pr = this._config.getGetParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_DATETIMEALT)) {
      pr = this._config.getDateTimeAltParser().parse(er, reference);
    } else if (er.type.equals(DateTimeConstants.SYS_DATETIME_TIMEZONE)) {
      if (_config.getOptions().match(DateTimeOptions.EnablePreview)) {
        pr = this._config.getTimeZoneParser().parse(er, reference);
      }
    } else {
      return null;
    }

    if (pr == null) {
      return null;
    }

    // Pop, restore the MOD string
    if (hasBefore && pr != null && pr.getValue() != null) {

      pr.setStart(pr.start - modStr.length());
      pr.setText(modStr + pr.text);
      pr.setLength(pr.length + modStr.length());

      DateTimeResolutionResult val = (DateTimeResolutionResult)pr.getValue();

      if (!hasInclusiveModifier) {
        val.setMod(combineMod(val.getMod(), DateTimeConstants.BEFORE_MOD));
      } else {
        val.setMod(combineMod(val.getMod(), DateTimeConstants.UNTIL_MOD));
      }

      pr.setValue(val);
    }

    if (hasAfter && pr != null && pr.getValue() != null) {

      pr.setStart(pr.start - modStr.length());
      pr.setText(modStr + pr.text);
      pr.setLength(pr.length + modStr.length());

      DateTimeResolutionResult val = (DateTimeResolutionResult)pr.getValue();

      if (!hasInclusiveModifier) {
        val.setMod(combineMod(val.getMod(), DateTimeConstants.AFTER_MOD));
      } else {
        val.setMod(combineMod(val.getMod(), DateTimeConstants.SINCE_MOD));
      }

      pr.setValue(val);
    }

    if (hasSince && pr != null && pr.getValue() != null) {

      pr.setStart(pr.start - modStr.length());
      pr.setText(modStr + pr.text);
      pr.setLength(pr.length + modStr.length());

      DateTimeResolutionResult val = (DateTimeResolutionResult)pr.getValue();
      val.setMod(combineMod(val.getMod(), DateTimeConstants.SINCE_MOD));
      pr.setValue(val);
    }

    if (hasAround && pr != null && pr.getValue() != null) {

      pr.setStart(pr.start - modStr.length());
      pr.setText(modStr + pr.text);
      pr.setLength(pr.length + modStr.length());

      DateTimeResolutionResult val = (DateTimeResolutionResult)pr.getValue();
      val.setMod(combineMod(val.getMod(), DateTimeConstants.APPROX_MOD));
      pr.setValue(val);
    }

    if (hasYearAfter && pr != null && pr.getValue() != null) {

      pr.setText(pr.text + modStr);
      pr.setLength(pr.length + modStr.length());

      DateTimeResolutionResult val = (DateTimeResolutionResult)pr.getValue();
      val.setMod(combineMod(val.getMod(), DateTimeConstants.SINCE_MOD));
      pr.setValue(val);
      hasSince = true;
    }

    // For cases like "3 pm or later on Monday"
    if (pr != null && pr.getValue() != null && pr.type.equals(DateTimeConstants.SYS_DATETIME_DATETIME)) {
      Optional<Match> match = Arrays.stream(RegExpUtility.getMatches(_config.getSuffixAfterRegex(), pr.text)).findFirst();
      if (match.isPresent() && match.get().index != 0) {
        DateTimeResolutionResult val = (DateTimeResolutionResult)pr.getValue();
        val.setMod(combineMod(val.getMod(), DateTimeConstants.SINCE_MOD));
        pr.setValue(val);
        hasSince = true;
      }
    }

    if (_config.getOptions().match(DateTimeOptions.SplitDateAndTime) && pr != null && pr.getValue() != null &&
        ((DateTimeResolutionResult)pr.getValue()).getSubDateTimeEntities() != null) {
    pr.setValue(dateTimeResolutionForSplit(pr));
    } else {
    bool hasModifier = hasBefore || hasAfter || hasSince;
    if (pr.getValue() != null) {
    ((DateTimeResolutionResult)pr.getValue()).setHasRangeChangingMod(hasModifier);
    }

    pr = setParseResult(pr, hasModifier);
    }

    // In this version, ExperimentalMode only cope with the "IncludePeriodEnd" case
    if (this._config.getOptions().match(DateTimeOptions.ExperimentalMode)) {
    if (pr.getMetadata() != null && pr.getMetadata().getIsPossiblyIncludePeriodEnd()) {
    pr = setInclusivePeriodEnd(pr);
    }
    }

    if (this._config.getOptions().match(DateTimeOptions.EnablePreview)) {
    int prLength = pr.length + originText.length() - pr.text.length();
    pr = DateTimeParseResult(pr.start, prLength, originText, pr.type, pr.getData(), pr.getValue(), pr.getResolutionStr(), pr.getTimexStr());
    }

    return pr;
  }


  @override
  List<DateTimeParseResult> filterResults(String query, List<DateTimeParseResult> candidateResults) {
    return candidateResults;
  }

  private bool filterResultsPredicate(DateTimeParseResult pr, Match match) {
    return !(match.index < pr.start + pr.length && pr.start < match.index + match.length);
  }

  DateTimeParseResult setParseResult(DateTimeParseResult slot, bool hasMod) {
    SortedMap<String, Object> slotValue = dateTimeResolution(slot);
    // Change the type at last for the after or before modes
    String type = String.format("%s.%s", _parserName, determineDateTimeType(slot.type, hasMod));

    slot.setValue(slotValue);
    slot.setType(type);

    return slot;
  }

  DateTimeParseResult setInclusivePeriodEnd(DateTimeParseResult slot) {
    String currentType =  _parserName + "." + DateTimeConstants.SYS_DATETIME_DATEPERIOD;
    if (slot.type.equals(currentType)) {
      Stream<String> timexStream = Arrays.asList(slot.getTimexStr().split(",|\\(|\\)")).stream();
      String[] timexComponents = timexStream.filter(str -> !str.isEmpty()).collect(Collectors.toList()).toArray(String[0]);

    // Only handle DatePeriod like "(StartDate,EndDate,Duration)"
    if (timexComponents.length == 3) {
    TreeMap<String, Object> value = (TreeMap<String, Object>)slot.getValue();
    String altTimex = "";

    if (value != null && value.containsKey(ResolutionKey.ValueSet)) {
    if (value.get(ResolutionKey.ValueSet) instanceof List) {
    List<HashMap<String, String>> valueSet = (List<HashMap<String, String>>)value.get(ResolutionKey.ValueSet);
    if (!value.isEmpty()) {

    for (HashMap<String, String> values : valueSet) {
    // This is only a sanity check, as here we only handle DatePeriod like "(StartDate,EndDate,Duration)"
    if (values.containsKey(DateTimeResolutionKey.START) &&
    values.containsKey(DateTimeResolutionKey.END) &&
    values.containsKey(DateTimeResolutionKey.Timex)) {

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTime startDate = LocalDate.parse(values.get(DateTimeResolutionKey.START), formatter).atStartOfDay();
    DateTime endDate = LocalDate.parse(values.get(DateTimeResolutionKey.END), formatter).atStartOfDay();
    String durationStr = timexComponents[2];
    DatePeriodTimexType datePeriodTimexType = TimexUtility.getDatePeriodTimexType(durationStr);

    endDate = TimexUtility.offsetDateObject(endDate, 1, datePeriodTimexType);
    values.put(DateTimeResolutionKey.END, DateTimeFormatUtil.luisDate(endDate));
    values.put(DateTimeResolutionKey.Timex, generateEndInclusiveTimex(slot.getTimexStr(), datePeriodTimexType, startDate, endDate));

    if (StringUtility.isNullOrEmpty(altTimex)) {
    altTimex = values.get(DateTimeResolutionKey.Timex);
    }
    }
    }
    }
    }
    }

    slot.setValue(value);
    slot.setTimexStr(altTimex);
    }
  }
    return slot;
  }

  String generateEndInclusiveTimex(String originalTimex, DatePeriodTimexType datePeriodTimexType, DateTime startDate, DateTime endDate) {
    String timexEndInclusive = TimexUtility.generateDatePeriodTimex(startDate, endDate, datePeriodTimexType);

    // Sometimes the original timex contains fuzzy part like "XXXX-05-31"
    // The fuzzy part needs to stay the same in the end-inclusive timex
    if (originalTimex.contains(Character.toString(DateTimeConstants.TimexFuzzy)) && originalTimex.length() == timexEndInclusive.length()) {
      char[] timexCharSet = char[timexEndInclusive.length()];

      for (int i = 0; i < originalTimex.length(); i++) {
        if (originalTimex.charAt(i) != DateTimeConstants.TimexFuzzy) {
          timexCharSet[i] = timexEndInclusive.charAt(i);
        } else {
          timexCharSet[i] = DateTimeConstants.TimexFuzzy;
        }
      }

      timexEndInclusive = String(timexCharSet);
    }

    return timexEndInclusive;
  }

  String determineDateTimeType(String type, bool hasMod) {
    if (_config.getOptions().match(DateTimeOptions.SplitDateAndTime)) {
      if (type.equals(DateTimeConstants.SYS_DATETIME_DATETIME)) {
        return DateTimeConstants.SYS_DATETIME_TIME;
      }
    } else {
      if (hasMod) {
        if (type.equals(DateTimeConstants.SYS_DATETIME_DATE)) {
          return DateTimeConstants.SYS_DATETIME_DATEPERIOD;
        }

        if (type.equals(DateTimeConstants.SYS_DATETIME_TIME)) {
          return DateTimeConstants.SYS_DATETIME_TIMEPERIOD;
        }

        if (type.equals(DateTimeConstants.SYS_DATETIME_DATETIME)) {
          return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;
        }
      }
    }

    return type;
  }

  String determineSourceEntityType(String sourceType, String newType, bool hasMod) {
    if (!hasMod) {
      return null;
    }

    if (!newType.equals(sourceType)) {
      return DateTimeConstants.SYS_DATETIME_DATETIMEPOINT;
    }

    if (newType.equals(DateTimeConstants.SYS_DATETIME_DATEPERIOD)) {
      return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;
    }

    return null;
  }

  List<DateTimeParseResult> dateTimeResolutionForSplit(DateTimeParseResult slot) {
    List<DateTimeParseResult> results = ArrayList<>();
    if (((DateTimeResolutionResult)slot.getValue()).getSubDateTimeEntities() != null) {
    List<Object> subEntities = ((DateTimeResolutionResult)slot.getValue()).getSubDateTimeEntities();
    for (Object subEntity : subEntities) {
    DateTimeParseResult result = (DateTimeParseResult)subEntity;
    result.setStart(result.start + slot.start);
    results.addAll(dateTimeResolutionForSplit(result));
    }
    } else {
    slot.setValue(dateTimeResolution(slot));
    slot.setType(String.format("%s.%s",_parserName, determineDateTimeType(slot.type, false)));

    results.add(slot);
    }

    return results;
  }

  SortedMap<String, Object> dateTimeResolution(DateTimeParseResult slot) {
    if (slot == null) {
      return null;
    }

    List<Map<String, String>> resolutions = ArrayList<>();
    LinkedHashMap<String, Object> res = LinkedHashMap<>();

    DateTimeResolutionResult val = (DateTimeResolutionResult)slot.getValue();
    if (val == null) {
      return null;
    }

    bool islunar = val.getIsLunar() != null ? val.getIsLunar() : false;
    String mod = val.getMod();

    String list = null;

    // Resolve dates list for date periods
    if (slot.type.equals(DateTimeConstants.SYS_DATETIME_DATEPERIOD) && val.getList() != null) {
      list = String.join(",", val.getList().stream().map(o -> DateTimeFormatUtil.luisDate((DateTime)o)).collect(Collectors.toList()));
    }

    // With modifier, output Type might not be the same with type in resolution comments
    // For example, if the resolution type is "date", with modifier the output type should be "daterange"
    String typeOutput = determineDateTimeType(slot.type, !StringUtility.isNullOrEmpty(mod));
    String sourceEntity = determineSourceEntityType(slot.type, typeOutput, val.getHasRangeChangingMod());
    String comment = val.getComment();

    String type = slot.type;
    String timex = slot.getTimexStr();

    // The following should be added to res first, since ResolveAmPm requires these fields.
    addResolutionFields(res, DateTimeResolutionKey.Timex, timex);
    addResolutionFields(res, DateTimeConstants.Comment, comment);
    addResolutionFields(res, DateTimeResolutionKey.Mod, mod);
    addResolutionFields(res, ResolutionKey.Type, typeOutput);
    addResolutionFields(res, DateTimeResolutionKey.IsLunar, islunar ? Boolean.toString(islunar) : "");

    bool hasTimeZone = false;

    // For standalone timezone entity recognition, we generate TimeZoneResolution for each entity we extracted.
    // We also merge time entity with timezone entity and add the information in TimeZoneResolution to every DateTime resolutions.
    if (val.getTimeZoneResolution() != null) {
    if (slot.type.equals(DateTimeConstants.SYS_DATETIME_TIMEZONE)) {
    // single timezone
    Map<String, String> resolutionField = LinkedHashMap<>();
    resolutionField.put(ResolutionKey.Value, val.getTimeZoneResolution().getValue());
    resolutionField.put(DateTimeConstants.UtcOffsetMinsKey, val.getTimeZoneResolution().getUtcOffsetMins().toString());

    addResolutionFields(res, DateTimeConstants.ResolveTimeZone, resolutionField);
    } else {
    // timezone as clarification of datetime
    hasTimeZone = true;
    addResolutionFields(res, DateTimeConstants.TimeZone, val.getTimeZoneResolution().getValue());
    addResolutionFields(res, DateTimeConstants.TimeZoneText, val.getTimeZoneResolution().getTimeZoneText());
    addResolutionFields(res, DateTimeConstants.UtcOffsetMinsKey, val.getTimeZoneResolution().getUtcOffsetMins().toString());
    }
    }

    LinkedHashMap<String, String> pastResolutionStr = LinkedHashMap<>();
    if (((DateTimeResolutionResult)slot.getValue()).getPastResolution() != null) {
    pastResolutionStr.putAll(((DateTimeResolutionResult)slot.getValue()).getPastResolution());
    }

    Map<String, String> futureResolutionStr = ((DateTimeResolutionResult)slot.getValue()).getFutureResolution();

    if (typeOutput.equals(DateTimeConstants.SYS_DATETIME_DATETIMEALT) && pastResolutionStr.size() > 0) {
    typeOutput = determineResolutionDateTimeType(pastResolutionStr);
    }

    Map<String, String> resolutionPast = generateResolution(type, pastResolutionStr, mod);
    Map<String, String> resolutionFuture = generateResolution(type, futureResolutionStr, mod);

    // If past and future are same, keep only one
    if (resolutionFuture.equals(resolutionPast)) {
    if (resolutionPast.size() > 0) {
    addResolutionFields(res, DateTimeConstants.Resolve, resolutionPast);
    }
    } else {
    if (resolutionPast.size() > 0) {
    addResolutionFields(res, DateTimeConstants.ResolveToPast, resolutionPast);
    }

    if (resolutionFuture.size() > 0) {
    addResolutionFields(res, DateTimeConstants.ResolveToFuture, resolutionFuture);
    }
    }

    // If 'ampm', double our resolution accordingly
    if (!StringUtility.isNullOrEmpty(comment) && comment.equals(DateTimeConstants.Comment_AmPm)) {
    if (res.containsKey(DateTimeConstants.Resolve)) {
    resolveAmPm(res, DateTimeConstants.Resolve);
    } else {
    resolveAmPm(res, DateTimeConstants.ResolveToPast);
    resolveAmPm(res, DateTimeConstants.ResolveToFuture);
    }
    }

    // If WeekOf and in CalendarMode, modify the past part of our resolution
    if (_config.getOptions().match(DateTimeOptions.CalendarMode) &&
    !StringUtility.isNullOrEmpty(comment) && comment.equals(DateTimeConstants.Comment_WeekOf)) {
    resolveWeekOf(res, DateTimeConstants.ResolveToPast);
    }

    if (comment != null && !comment.isEmpty() && TimexUtility.hasDoubleTimex(comment)) {
    res = TimexUtility.processDoubleTimex(res, DateTimeConstants.ResolveToFuture, DateTimeConstants.ResolveToPast, timex);
    }

    for (Map.Entry<String,Object> p : res.entrySet()) {
    if (p.getValue() instanceof Map) {
    Map<String, String> value = LinkedHashMap<>();

    addResolutionFields(value, DateTimeResolutionKey.Timex, timex);
    addResolutionFields(value, DateTimeResolutionKey.Mod, mod);
    addResolutionFields(value, ResolutionKey.Type, typeOutput);
    addResolutionFields(value, DateTimeResolutionKey.IsLunar, islunar ? Boolean.toString(islunar) : "");
    addResolutionFields(value, DateTimeResolutionKey.List, list);
    addResolutionFields(value, DateTimeResolutionKey.SourceEntity, sourceEntity);

    if (hasTimeZone) {
    addResolutionFields(value, DateTimeConstants.TimeZone, val.getTimeZoneResolution().getValue());
    addResolutionFields(value, DateTimeConstants.TimeZoneText, val.getTimeZoneResolution().getTimeZoneText());
    addResolutionFields(value, DateTimeConstants.UtcOffsetMinsKey, val.getTimeZoneResolution().getUtcOffsetMins().toString());
    }

    for (Map.Entry<String, String> q : ((Map<String, String>)p.getValue()).entrySet()) {
    value.put(q.getKey(), q.getValue());
    }

    resolutions.add(value);
    }
    }

    if (resolutionPast.size() == 0 && resolutionFuture.size() == 0 && val.getTimeZoneResolution() == null) {
    Map<String, String> notResolved = LinkedHashMap<>();
    notResolved.put(DateTimeResolutionKey.Timex, timex);
    notResolved.put(ResolutionKey.Type, typeOutput);
    notResolved.put(ResolutionKey.Value, "not resolved");

    resolutions.add(notResolved);
    }

    SortedMap<String, Object> result = TreeMap<>();
    result.put(ResolutionKey.ValueSet, resolutions);

    return result;
    }

  private String combineMod(String originalMod, String newMod) {
    String combinedMod = newMod;
    if (originalMod != null && originalMod != "") {
      combinedMod = newMod + "-" + originalMod;
    }
    return combinedMod;
  }

  private String determineResolutionDateTimeType(LinkedHashMap<String, String> pastResolutionStr) {
    switch (pastResolutionStr.keySet().stream().findFirst().get()) {
      case TimeTypeDateTimeConstants.START_DATE:
        return DateTimeConstants.SYS_DATETIME_DATEPERIOD;
      case TimeTypeDateTimeConstants.START_DATETIME:
        return DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD;
      case TimeTypeDateTimeConstants.START_TIME:
        return DateTimeConstants.SYS_DATETIME_TIMEPERIOD;
      default:
        return pastResolutionStr.keySet().stream().findFirst().get().toLowerCase();
    }
  }

  private void addResolutionFields(Map<String, Object> dic, String key, Object value) {
    if (value != null) {
      dic.put(key, value);
    }
  }

  private void addResolutionFields(Map<String, String> dic, String key, String value) {
    if (!StringUtility.isNullOrEmpty(value)) {
      dic.put(key, value);
    }
  }

  private void resolveAmPm(Map<String, Object> resolutionDic, String keyName) {
    if (resolutionDic.containsKey(keyName)) {
      Map<String, String> resolution = (Map<String, String>)resolutionDic.get(keyName);

      Map<String, String> resolutionPm = LinkedHashMap<>();

      if (!resolutionDic.containsKey(DateTimeResolutionKey.Timex)) {
        return;
      }

      String timex = (String)resolutionDic.get(DateTimeResolutionKey.Timex);
      timex = timex != null ? timex : "";

      // As resolutionDic is a LinkedHashMap and once a value is set
      // it goes as the last value, we need to keep the position after the replacement.
      // Here it copies the resolutionDic map but appending the correct with Am
      // to populate again the received LinkedHashMap.
      // This is implemented because LinkedHashMap differs to Dictionary just in Java.
      LinkedHashMap<String, Object> resolutionDicDuplicated = resolutionDic
          .entrySet()
          .stream()
          .collect(Collectors.toMap(e ->
          e.getKey() == keyName ? keyName + "Am" : e.getKey(),
          Map.Entry<String, Object>::getValue,
          (existing, replacement) -> existing,
          LinkedHashMap::new
      ));

    resolutionDic.clear();
    resolutionDicDuplicated.entrySet().stream().forEach(e -> {
    resolutionDic.put(e.getKey(), e.getValue());
    });

    switch ((String)resolutionDic.get(ResolutionKey.Type)) {
    case DateTimeConstants.SYS_DATETIME_TIME:
    resolutionPm.put(ResolutionKey.Value, DateTimeFormatUtil.toPm(resolution.get(ResolutionKey.Value)));
    resolutionPm.put(DateTimeResolutionKey.Timex, DateTimeFormatUtil.toPm(timex));
    break;
    case DateTimeConstants.SYS_DATETIME_DATETIME:
    String[] splited = resolution.get(ResolutionKey.Value).split(" ");
    resolutionPm.put(ResolutionKey.Value, splited[0] + " " + DateTimeFormatUtil.toPm(splited[1]));
    resolutionPm.put(DateTimeResolutionKey.Timex, DateTimeFormatUtil.allStringToPm(timex));
    break;
    case DateTimeConstants.SYS_DATETIME_TIMEPERIOD:
    if (resolution.containsKey(DateTimeResolutionKey.START)) {
    resolutionPm.put(DateTimeResolutionKey.START, DateTimeFormatUtil.toPm(resolution.get(DateTimeResolutionKey.START)));
    }

    if (resolution.containsKey(DateTimeResolutionKey.END)) {
    resolutionPm.put(DateTimeResolutionKey.END, DateTimeFormatUtil.toPm(resolution.get(DateTimeResolutionKey.END)));
    }

    resolutionPm.put(DateTimeResolutionKey.Timex, DateTimeFormatUtil.allStringToPm(timex));
    break;
    case DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD:
    if (resolution.containsKey(DateTimeResolutionKey.START)) {
    DateTime start = DateTime.parse(resolution.get(DateTimeResolutionKey.START), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    start = start.getHour() == DateTimeConstants.HalfDayHourCount ? start.minusHours(DateTimeConstants.HalfDayHourCount) : start.plusHours(DateTimeConstants.HalfDayHourCount);

    resolutionPm.put(DateTimeResolutionKey.START, DateTimeFormatUtil.formatDateTime(start));
    }

    if (resolution.containsKey(DateTimeResolutionKey.END)) {
    DateTime end = DateTime.parse(resolution.get(DateTimeResolutionKey.END), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    end = end.getHour() == DateTimeConstants.HalfDayHourCount ? end.minusHours(DateTimeConstants.HalfDayHourCount) : end.plusHours(DateTimeConstants.HalfDayHourCount);

    resolutionPm.put(DateTimeResolutionKey.END, DateTimeFormatUtil.formatDateTime(end));
    }

    resolutionPm.put(DateTimeResolutionKey.Timex, DateTimeFormatUtil.allStringToPm(timex));
    break;
    default:
    break;
    }
    resolutionDic.put(keyName + "Pm", resolutionPm);
  }
  }

  private void resolveWeekOf(Map<String, Object> resolutionDic, String keyName) {
    if (resolutionDic.containsKey(keyName)) {
      Map<String, String> resolution = (Map<String, String>)resolutionDic.get(keyName);

      DateTime monday = DateUtil.tryParse(resolution.get(DateTimeResolutionKey.START));
      resolution.put(DateTimeResolutionKey.Timex, TimexUtility.generateWeekTimex(monday));

      resolutionDic.put(keyName, resolution);
    }
  }

  private Map<String, String> generateResolution(String type, Map<String, String> resolutionDic, String mod) {
    Map<String, String> res = LinkedHashMap<>();

    if (type.equals(DateTimeConstants.SYS_DATETIME_DATETIME)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeDateTimeConstants.DATETIME, mod, res);
    } else if (type.equals(DateTimeConstants.SYS_DATETIME_TIME)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeDateTimeConstants.TIME, mod, res);
    } else if (type.equals(DateTimeConstants.SYS_DATETIME_DATE)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeDateTimeConstants.DATE, mod, res);
    } else if (type.equals(DateTimeConstants.SYS_DATETIME_DURATION)) {
      if (resolutionDic.containsKey(TimeTypeDateTimeConstants.DURATION)) {
        res.put(ResolutionKey.Value, resolutionDic.get(TimeTypeDateTimeConstants.DURATION));
      }
    } else if (type.equals(DateTimeConstants.SYS_DATETIME_TIMEPERIOD)) {
      addPeriodToResolution(resolutionDic, TimeTypeDateTimeConstants.START_TIME, TimeTypeDateTimeConstants.END_TIME, mod, res);
    } else if (type.equals(DateTimeConstants.SYS_DATETIME_DATEPERIOD)) {
      addPeriodToResolution(resolutionDic, TimeTypeDateTimeConstants.START_DATE, TimeTypeDateTimeConstants.END_DATE, mod, res);
    } else if (type.equals(DateTimeConstants.SYS_DATETIME_DATETIMEPERIOD)) {
      addPeriodToResolution(resolutionDic, TimeTypeDateTimeConstants.START_DATETIME, TimeTypeDateTimeConstants.END_DATETIME, mod, res);
    } else if (type.equals(DateTimeConstants.SYS_DATETIME_DATETIMEALT)) {
      // for a period
      if (resolutionDic.size() > 2) {
        addAltPeriodToResolution(resolutionDic, mod, res);
      } else {
        // for a datetime point
        addAltSingleDateTimeToResolution(resolutionDic, TimeTypeDateTimeConstants.DATETIMEALT, mod, res);
      }
    }

    return res;
  }

  void addAltPeriodToResolution(Map<String, String> resolutionDic, String mod, Map<String, String> res) {
    if (resolutionDic.containsKey(TimeTypeDateTimeConstants.START_DATETIME) && resolutionDic.containsKey(TimeTypeDateTimeConstants.END_DATETIME)) {
      addPeriodToResolution(resolutionDic, TimeTypeDateTimeConstants.START_DATETIME, TimeTypeDateTimeConstants.END_DATETIME, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeDateTimeConstants.START_DATE) && resolutionDic.containsKey(TimeTypeDateTimeConstants.END_DATE)) {
      addPeriodToResolution(resolutionDic, TimeTypeDateTimeConstants.START_DATE, TimeTypeDateTimeConstants.END_DATE, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeDateTimeConstants.START_TIME) && resolutionDic.containsKey(TimeTypeDateTimeConstants.END_TIME)) {
      addPeriodToResolution(resolutionDic, TimeTypeDateTimeConstants.START_TIME, TimeTypeDateTimeConstants.END_TIME, mod, res);
    }
  }

  void addAltSingleDateTimeToResolution(Map<String, String> resolutionDic, String type, String mod, Map<String, String> res) {
    if (resolutionDic.containsKey(TimeTypeDateTimeConstants.DATE)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeDateTimeConstants.DATE, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeDateTimeConstants.DATETIME)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeDateTimeConstants.DATETIME, mod, res);
    } else if (resolutionDic.containsKey(TimeTypeDateTimeConstants.TIME)) {
      addSingleDateTimeToResolution(resolutionDic, TimeTypeDateTimeConstants.TIME, mod, res);
    }
  }

  void addSingleDateTimeToResolution(Map<String, String> resolutionDic, String type, String mod, Map<String, String> res) {
    // If an "invalid" Date or DateTime is extracted, it should not have an assigned resolution.
    // Only valid entities should pass this condition.
    if (resolutionDic.containsKey(type) && !resolutionDic.get(type).startsWith(_dateMinString)) {
      if (!StringUtility.isNullOrEmpty(mod)) {
        if (mod.equals(DateTimeConstants.BEFORE_MOD)) {
          res.put(DateTimeResolutionKey.END, resolutionDic.get(type));
          return;
        }

        if (mod.equals(DateTimeConstants.AFTER_MOD)) {
          res.put(DateTimeResolutionKey.START, resolutionDic.get(type));
          return;
        }

        if (mod.equals(DateTimeConstants.SINCE_MOD)) {
          res.put(DateTimeResolutionKey.START, resolutionDic.get(type));
          return;
        }

        if (mod.equals(DateTimeConstants.UNTIL_MOD)) {
          res.put(DateTimeResolutionKey.END, resolutionDic.get(type));
          return;
        }
      }

      res.put(ResolutionKey.Value, resolutionDic.get(type));
    }
  }

  void addPeriodToResolution(Map<String, String> resolutionDic, String startType, String endType, String mod, Map<String, String> res) {
    String start = "";
    String end = "";

    if (resolutionDic.containsKey(startType)) {
      if (resolutionDic.get(startType).startsWith(_dateMinString)) {
        return;
      }
      start = resolutionDic.get(startType);
    }

    if (resolutionDic.containsKey(endType)) {
      if (resolutionDic.get(endType).startsWith(_dateMinString)) {
        return;
      }
      end = resolutionDic.get(endType);
    }

    if (!StringUtility.isNullOrEmpty(mod)) {
      // For the 'before' mod
      // 1. Cases like "Before December", the start of the period should be the end of the period, not the start
      // 2. Cases like "More than 3 days before today", the date point should be the end of the period
      if (mod.startsWith(DateTimeConstants.BEFORE_MOD)) {
        if (!StringUtility.isNullOrEmpty(start) && !StringUtility.isNullOrEmpty(end) && !mod.endsWith(DateTimeConstants.LATE_MOD)) {
          res.put(DateTimeResolutionKey.END, start);
        } else {
          res.put(DateTimeResolutionKey.END, end);
        }

        return;
      }

      // For the 'after' mod
      // 1. Cases like "After January", the end of the period should be the start of the period, not the end 
      // 2. Cases like "More than 3 days after today", the date point should be the start of the period
      if (mod.startsWith(DateTimeConstants.AFTER_MOD)) {
        if (!StringUtility.isNullOrEmpty(start) && !StringUtility.isNullOrEmpty(end) && !mod.endsWith(DateTimeConstants.EARLY_MOD)) {
          res.put(DateTimeResolutionKey.START, end);
        } else {
          res.put(DateTimeResolutionKey.START, start);
        }

        return;
      }

      // For the 'since' mod, the start of the period should be the start of the period, not the end 
      if (mod.equals(DateTimeConstants.SINCE_MOD)) {
        res.put(DateTimeResolutionKey.START, start);
        return;
      }

      // For the 'until' mod, the end of the period should be the end of the period, not the start 
      if (mod.equals(DateTimeConstants.UNTIL_MOD)) {
        res.put(DateTimeResolutionKey.END, end);
        return;
      }
    }

    if (!StringUtility.isNullOrEmpty(start) && !StringUtility.isNullOrEmpty(end)) {
      res.put(DateTimeResolutionKey.START, start);
      res.put(DateTimeResolutionKey.END, end);
    }
  }
}