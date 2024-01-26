import 'base_date_time.dart';

class EnglishDateTime {
  static final String langMarker = "Eng";

  static final bool checkBothBeforeAfter = false;

  static final String tillRegex =
      "(?<till>\\b(to|(un)?till?|thru|through)\\b(\\s+the\\b)?|{BaseDateTime.rangeConnectorSymbolRegex})"
          .replaceFirst("{BaseDateTime.rangeConnectorSymbolRegex}", BaseDateTime.rangeConnectorSymbolRegex);

  static final String rangeConnectorRegex =
      "(?<and>\\b(and|through|to)\\b(\\s+the\\b)?|{BaseDateTime.rangeConnectorSymbolRegex})"
          .replaceFirst("{BaseDateTime.rangeConnectorSymbolRegex}", BaseDateTime.rangeConnectorSymbolRegex);

  static final String lastNegPrefix =
      "(?<!(w(ill|ould|on\\s*'\\s*t)|m(ay|ight|ust)|sh(all|ould(n\\s*'\\s*t)?)|c(an(\\s*'\\s*t|not)?|ould(n\\s*'\\s*t)?))(\\s+not)?\\s+)";

  static final String relativeRegex =
      "\\b(?<order>following|next|(up)?coming|this|{LastNegPrefix}last|past|previous|current|the)\\b"
          .replaceFirst("{LastNegPrefix}", lastNegPrefix);

  static final String strictRelativeRegex =
      "\\b(?<order>following|next|(up)?coming|this|{LastNegPrefix}last|past|previous|current)\\b"
          .replaceFirst("{LastNegPrefix}", lastNegPrefix);

  static final String upcomingPrefixRegex = "((this\\s+)?((up)?coming))";

  static final String nextPrefixRegex =
      "\\b(following|next|{UpcomingPrefixRegex})\\b".replaceFirst("{UpcomingPrefixRegex}", upcomingPrefixRegex);

  static final String afterNextSuffixRegex = "\\b(after\\s+(the\\s+)?next)\\b";

  static final String pastPrefixRegex = "((this\\s+)?past)\\b";

  static final String previousPrefixRegex = "({LastNegPrefix}last|previous|{PastPrefixRegex})\\b"
      .replaceFirst("{LastNegPrefix}", lastNegPrefix)
      .replaceFirst("{PastPrefixRegex}", pastPrefixRegex);

  static final String thisPrefixRegex = "(this|current)\\b";

  static final String rangePrefixRegex = "(from|between)";

  static final String centurySuffixRegex = "(^century)\\b";

  static final String referencePrefixRegex = "(that|same)\\b";

  static final String futureSuffixRegex = "\\b((in\\s+the\\s+)?future|hence)\\b";

  static final String pastSuffixRegex = "\\b((in\\s+the\\s+)past)\\b";

  static final String dayRegex =
      "(the\\s*)?(?<!(\\d:|\\\$)\\s*|\\d)(?<day>(?:3[0-1]|[1-2]\\d|0?[1-9])(?:th|nd|rd|st)?)(?=\\b|t)";

  static final String implicitDayRegex = "(the\\s*)?(?<day>(?:3[0-1]|[0-2]?\\d)(?:th|nd|rd|st))\\b";

  static final String monthNumRegex = "(?<month>1[0-2]|(0)?[1-9])\\b";

  static final String writtenOneToNineRegex = "(?:one|two|three|four|five|six|seven|eight|nine)";

  static final String writtenElevenToNineteenRegex = "(?:eleven|twelve|(?:thir|four|fif|six|seven|eigh|nine)teen)";

  static final String writtenTensRegex = "(?:ten|twenty|thirty|fou?rty|fifty|sixty|seventy|eighty|ninety)";

  static final String writtenNumRegex =
      "(?:{WrittenOneToNineRegex}|{WrittenElevenToNineteenRegex}|{WrittenTensRegex}(\\s+{WrittenOneToNineRegex})?)"
          .replaceFirst("{WrittenOneToNineRegex}", writtenOneToNineRegex)
          .replaceFirst("{WrittenElevenToNineteenRegex}", writtenElevenToNineteenRegex)
          .replaceFirst("{WrittenTensRegex}", writtenTensRegex);

  static final String writtenOneToNineOrdinalRegex = "(?:first|second|third|fourth|fifth|sixth|seventh|eighth|nine?th)";

  static final String writtenTensOrdinalRegex =
      "(?:tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth|eighteenth|nineteenth|twentieth|thirtieth|fortieth|fiftieth|sixtieth|seventieth|eightieth|ninetieth)";

  static final String writtenOrdinalRegex =
      "(?:{WrittenOneToNineOrdinalRegex}|{WrittenTensOrdinalRegex}|{WrittenTensRegex}\\s+{WrittenOneToNineOrdinalRegex})"
          .replaceFirst("{WrittenOneToNineOrdinalRegex}", writtenOneToNineOrdinalRegex)
          .replaceFirst("{WrittenTensOrdinalRegex}", writtenTensOrdinalRegex)
          .replaceFirst("{WrittenTensRegex}", writtenTensRegex);

  static final String writtenOrdinalDayRegex =
      "\\b(the\\s+)?(?<day>(?<ordinal>{WrittenOneToNineOrdinalRegex}|(?:tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth|eighteenth|nineteenth|twentieth|thirtieth)|(?:ten|twenty)\\s+{WrittenOneToNineOrdinalRegex}|thirty\\s+first))\\b"
          .replaceFirst("{WrittenOneToNineOrdinalRegex}", writtenOneToNineOrdinalRegex);

  static final String writtenCenturyFullYearRegex =
      "(?:(one|two)\\s+thousand((\\s+and)?\\s+{WrittenOneToNineRegex}\\s+hundred)?)"
          .replaceFirst("{WrittenOneToNineRegex}", writtenOneToNineRegex);

  static final String writtenCenturyOrdinalYearRegex =
      "(?:twenty(\\s+(one|two))?|ten|eleven|twelve|thirteen|fifteen|eighteen|(?:four|six|seven|nine)(teen)?|one|two|three|five|eight)";

  static final String centuryRegex =
      "\\b(?<century>{WrittenCenturyFullYearRegex}|{WrittenCenturyOrdinalYearRegex}(\\s+hundred)?)\\b"
          .replaceFirst("{WrittenCenturyFullYearRegex}", writtenCenturyFullYearRegex)
          .replaceFirst("{WrittenCenturyOrdinalYearRegex}", writtenCenturyOrdinalYearRegex);

  static final String lastTwoYearNumRegex =
      "(?:(zero\\s+)?{WrittenOneToNineRegex}|{WrittenElevenToNineteenRegex}|{WrittenTensRegex}(\\s+{WrittenOneToNineRegex})?)"
          .replaceFirst("{WrittenOneToNineRegex}", writtenOneToNineRegex)
          .replaceFirst("{WrittenElevenToNineteenRegex}", writtenElevenToNineteenRegex)
          .replaceFirst("{WrittenTensRegex}", writtenTensRegex);

  static final String fullTextYearRegex =
      "\\b((?<firsttwoyearnum>{CenturyRegex})(\\s+and)?\\s+(?<lasttwoyearnum>{LastTwoYearNumRegex})\\b|\\b(?<firsttwoyearnum>{WrittenCenturyFullYearRegex}|{WrittenCenturyOrdinalYearRegex}\\s+hundred))\\b"
          .replaceFirst("{CenturyRegex}", centuryRegex)
          .replaceFirst("{WrittenCenturyFullYearRegex}", writtenCenturyFullYearRegex)
          .replaceFirst("{WrittenCenturyOrdinalYearRegex}", writtenCenturyOrdinalYearRegex)
          .replaceFirst("{LastTwoYearNumRegex}", lastTwoYearNumRegex);

  static final String oclockRegex = "(?<oclock>o\\s*((’|‘|')\\s*)?clock|sharp)";

  static final String specialDescRegex = "((?<ipm>)p\\b)";

  static final String tasksModeSpecialDescRegex = "([0-9]+((?<ipm>)p\\b))";

  static final String amDescRegex =
      "(?:{BaseDateTime.baseAmDescRegex})".replaceFirst("{BaseDateTime.baseAmDescRegex}", BaseDateTime.baseAmDescRegex);

  static final String pmDescRegex =
      "(:?{BaseDateTime.basePmDescRegex})".replaceFirst("{BaseDateTime.basePmDescRegex}", BaseDateTime.basePmDescRegex);

  static final String amPmDescRegex = "(:?{BaseDateTime.baseAmPmDescRegex})"
      .replaceFirst("{BaseDateTime.baseAmPmDescRegex}", BaseDateTime.baseAmPmDescRegex);

  static final String descRegex =
      "(:?(:?({OclockRegex}\\s+)?(?<desc>({AmPmDescRegex}|{AmDescRegex}|{PmDescRegex}|{SpecialDescRegex})))|{OclockRegex})"
          .replaceFirst("{OclockRegex}", oclockRegex)
          .replaceFirst("{AmDescRegex}", amDescRegex)
          .replaceFirst("{PmDescRegex}", pmDescRegex)
          .replaceFirst("{AmPmDescRegex}", amPmDescRegex)
          .replaceFirst("{SpecialDescRegex}", specialDescRegex);

  static final String ofPrepositionRegex = "(\\bof\\b)";

  static final String twoDigitYearRegex =
      "\\b(?<![\$])(?<year>([0-9]\\d))(?!(\\s*((\\:\\d)|{AmDescRegex}|{PmDescRegex}|\\.\\d)))\\b"
          .replaceFirst("{AmDescRegex}", amDescRegex)
          .replaceFirst("{PmDescRegex}", pmDescRegex);

  static final String yearRegex = "(?:{BaseDateTime.fourDigitYearRegex}|{FullTextYearRegex})"
      .replaceFirst("{BaseDateTime.fourDigitYearRegex}", BaseDateTime.fourDigitYearRegex)
      .replaceFirst("{FullTextYearRegex}", fullTextYearRegex);

  static final String weekDayRegex =
      "\\b(?<weekday>(?:sun|mon|tues?|thurs?|fri)(day)?|thu|wedn(esday)?|weds?|sat(urday)?)s?\\b";

  static final String singleWeekDayRegex =
      "\\b(?<weekday>(?<!(easter|palm)\\s+)sunday|(?<!easter\\s+)saturday|(?<!(easter|cyber)\\s+)monday|mon|(?<!black\\s+)friday|fri|(?:tues?|thurs?)(day)?|thu|wedn(esday)?|weds?|((?<=on\\s+)(sat|sun)))\\b";

  static final String relativeMonthRegex =
      "(?<relmonth>((day\\s+)?of\\s+)?{RelativeRegex}\\s+month)\\b".replaceFirst("{RelativeRegex}", relativeRegex);

  static final String monthRegexNoWordBoundary =
      "(?<month>apr(il)?|aug(ust)?|dec(ember)?|feb(ruary)?|jan(uary)?|july?|june?|mar(ch)?|may|nov(ember)?|oct(ober)?|sept(ember)?|sep)(?!\\p{L})";

  static final String monthRegex =
      "\\b{MonthRegexNoWordBoundary}".replaceFirst("{MonthRegexNoWordBoundary}", monthRegexNoWordBoundary);

  static final String writtenMonthRegex =
      "(((the\\s+)?month of\\s+)?{MonthRegex})".replaceFirst("{MonthRegex}", monthRegex);

  static final String monthSuffixRegex = "(?<msuf>(?:(in|of|on)\\s+)?({RelativeMonthRegex}|{WrittenMonthRegex}))"
      .replaceFirst("{RelativeMonthRegex}", relativeMonthRegex)
      .replaceFirst("{WrittenMonthRegex}", writtenMonthRegex);

  static final String dateUnitRegex =
      "(?<unit>(decade|year|(?<uoy>month|week)|(?<business>(business\\s+|week\\s*))?(?<uoy>day)|fortnight|weekend)(?<plural>s)?|(?<=(^|\\s)\\d{1,4})[ymwd])\\b";

  static final String dateTokenPrefix = "on ";

  static final String timeTokenPrefix = "at ";

  static final String tokenBeforeDate = "on ";

  static final String tokenBeforeTime = "at ";

  static final String halfTokenRegex = "^(half)";

  static final String quarterTokenRegex = "^((a\\s+)?quarter)";

  static final String threeQuarterTokenRegex = "^(three\\s+quarters?)";

  static final String toTokenRegex = "\\b(to)\$";

  static final String fromRegex = "\\b(from(\\s+the)?)\$";

  static final String betweenTokenRegex = "\\b(between(\\s+the)?)\$";

  static final String simpleCasesRegex =
      "\\b({RangePrefixRegex}\\s+)?({DayRegex}|{WrittenOrdinalDayRegex})\\s*{TillRegex}\\s*(({DayRegex}|{WrittenOrdinalDayRegex})\\s+{MonthSuffixRegex}|{MonthSuffixRegex}\\s+({DayRegex}|{WrittenOrdinalDayRegex}))((\\s+|\\s*,\\s*){YearRegex})?\\b"
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{TillRegex}", tillRegex)
          .replaceFirst("{MonthSuffixRegex}", monthSuffixRegex)
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RangePrefixRegex}", rangePrefixRegex)
          .replaceFirst("{WrittenOrdinalDayRegex}", writtenOrdinalDayRegex);

  static final String monthFrontSimpleCasesRegex =
      "\\b({RangePrefixRegex}\\s+)?{MonthSuffixRegex}\\s+((from)\\s+)?({DayRegex}|{WrittenOrdinalDayRegex})\\s*{TillRegex}\\s*({DayRegex}|{WrittenOrdinalDayRegex})((\\s+|\\s*,\\s*){YearRegex})?\\b"
          .replaceFirst("{MonthSuffixRegex}", monthSuffixRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{TillRegex}", tillRegex)
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RangePrefixRegex}", rangePrefixRegex)
          .replaceFirst("{WrittenOrdinalDayRegex}", writtenOrdinalDayRegex);

  static final String monthFrontBetweenRegex =
      "\\b{MonthSuffixRegex}\\s+(between\\s+)({DayRegex}|{WrittenOrdinalDayRegex})\\s*{RangeConnectorRegex}\\s*({DayRegex}|{WrittenOrdinalDayRegex})((\\s+|\\s*,\\s*){YearRegex})?\\b"
          .replaceFirst("{MonthSuffixRegex}", monthSuffixRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{RangeConnectorRegex}", rangeConnectorRegex)
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{WrittenOrdinalDayRegex}", writtenOrdinalDayRegex);

  static final String betweenRegex =
      "\\b(between\\s+)({DayRegex}|{WrittenOrdinalDayRegex})\\s*{RangeConnectorRegex}\\s*({DayRegex}|{WrittenOrdinalDayRegex})\\s+{MonthSuffixRegex}((\\s+|\\s*,\\s*){YearRegex})?\\b"
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{RangeConnectorRegex}", rangeConnectorRegex)
          .replaceFirst("{MonthSuffixRegex}", monthSuffixRegex)
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{WrittenOrdinalDayRegex}", writtenOrdinalDayRegex);

  static final String monthWithYear =
      "\\b((({WrittenMonthRegex}[\\.]?|((the\\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|sixth|6th|seventh|7th|eighth|8th|ninth|9th|tenth|10th|eleventh|11th|twelfth|12th|last)\\s+month(?=\\s+(of|in))))((\\s*)[/\\\\\\-\\.,]?(\\s+(of|in))?(\\s*)({YearRegex}|(?<order>following|next|last|this)\\s+year)|\\s+(of|in)\\s+{TwoDigitYearRegex}))|(({YearRegex}|(?<order>following|next|last|this)\\s+year)(\\s*),?(\\s*){WrittenMonthRegex}))\\b"
          .replaceFirst("{WrittenMonthRegex}", writtenMonthRegex)
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{TwoDigitYearRegex}", twoDigitYearRegex);

  static final String specialYearPrefixes = "(calendar|(?<special>fiscal|school))";

  static final String oneWordPeriodRegex =
      "\\b((((the\\s+)?month of\\s+)?({StrictRelativeRegex}\\s+)?{MonthRegex})|(month|year) to date|(?<toDate>((un)?till?|to)\\s+date)|({RelativeRegex}\\s+)?(my\\s+)?((?<business>working\\s+week|workweek)|week(end)?|month|fortnight|(({SpecialYearPrefixes}\\s+)?year))(?!((\\s+of)?\\s+\\d+(?!({BaseDateTime.baseAmDescRegex}|{BaseDateTime.basePmDescRegex}))|\\s+to\\s+date))(\\s+{AfterNextSuffixRegex})?)\\b"
          .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex)
          .replaceFirst("{AfterNextSuffixRegex}", afterNextSuffixRegex)
          .replaceFirst("{SpecialYearPrefixes}", specialYearPrefixes)
          .replaceFirst("{BaseDateTime.baseAmDescRegex}", BaseDateTime.baseAmDescRegex)
          .replaceFirst("{BaseDateTime.basePmDescRegex}", BaseDateTime.basePmDescRegex)
          .replaceFirst("{MonthRegex}", monthRegex);

  static final String monthNumWithYear =
      "\\b(({BaseDateTime.fourDigitYearRegex}(\\s*)[/\\-\\.](\\s*){MonthNumRegex})|({MonthNumRegex}(\\s*)[/\\-](\\s*){BaseDateTime.fourDigitYearRegex}))\\b"
          .replaceFirst("{BaseDateTime.fourDigitYearRegex}", BaseDateTime.fourDigitYearRegex)
          .replaceFirst("{MonthNumRegex}", monthNumRegex);

  static final String weekOfMonthRegex =
      "\\b(?<wom>(the\\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|last)\\s+week\\s+{MonthSuffixRegex}(\\s+{BaseDateTime.fourDigitYearRegex}|{RelativeRegex}\\s+year)?)\\b"
          .replaceFirst("{MonthSuffixRegex}", monthSuffixRegex)
          .replaceFirst("{BaseDateTime.fourDigitYearRegex}", BaseDateTime.fourDigitYearRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex);

  static final String weekOfYearRegex =
      "\\b(?<woy>(the\\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|last)\\s+week(\\s+of)?\\s+({YearRegex}|{RelativeRegex}\\s+year))\\b"
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex);

  static final String ofYearRegex = "\\b((of|in)\\s+({YearRegex}|{StrictRelativeRegex}\\s+year))\\b"
      .replaceFirst("{YearRegex}", yearRegex)
      .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex);

  static final String firstLastRegex = "\\b(the\\s+)?((?<first>first)|(?<last>last))\\b";

  static final String followedDateUnit = "^\\s*{DateUnitRegex}".replaceFirst("{DateUnitRegex}", dateUnitRegex);

  static final String numberCombinedWithDateUnit =
      "\\b(?<num>\\d+(\\.\\d*)?){DateUnitRegex}".replaceFirst("{DateUnitRegex}", dateUnitRegex);

  static final String quarterTermRegex =
      "\\b(((?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th)[ -]+quarter)|(q(?<number>[1-4])))\\b";

  static final String relativeQuarterTermRegex =
      "\\b(?<orderQuarter>{StrictRelativeRegex})\\s+((?<num>[\\w,]+)\\s+)?quarters?\\b"
          .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex);

  static final String quarterRegex =
      "((the\\s+)?{QuarterTermRegex}(?:((\\s+of)?\\s+|\\s*[,-]\\s*)({YearRegex}|{RelativeRegex}\\s+year))?)|{RelativeQuarterTermRegex}"
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex)
          .replaceFirst("{QuarterTermRegex}", quarterTermRegex)
          .replaceFirst("{RelativeQuarterTermRegex}", relativeQuarterTermRegex);

  static final String quarterRegexYearFront =
      "(?:{YearRegex}|{RelativeRegex}\\s+year)('s)?(?:\\s*-\\s*|\\s+(the\\s+)?)?{QuarterTermRegex}"
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex)
          .replaceFirst("{QuarterTermRegex}", quarterTermRegex);

  static final String halfYearTermRegex = "(?<cardinal>first|1st|second|2nd)\\s+half";

  static final String halfYearFrontRegex =
      "(?<year>((1[5-9]|20)\\d{2})|2100)(\\s*-\\s*|\\s+(the\\s+)?)?h(?<number>[1-2])"
          .replaceFirst("{YearRegex}", yearRegex);

  static final String halfYearBackRegex =
      "(the\\s+)?(h(?<number>[1-2])|({HalfYearTermRegex}))(\\s+of|\\s*,\\s*)?\\s+({YearRegex})"
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{HalfYearTermRegex}", halfYearTermRegex);

  static final String halfYearRelativeRegex =
      "(the\\s+)?{HalfYearTermRegex}(\\s+of|\\s*,\\s*)?\\s+({RelativeRegex}\\s+year)"
          .replaceFirst("{RelativeRegex}", relativeRegex)
          .replaceFirst("{HalfYearTermRegex}", halfYearTermRegex);

  static final String allHalfYearRegex = "({HalfYearFrontRegex})|({HalfYearBackRegex})|({HalfYearRelativeRegex})"
      .replaceFirst("{HalfYearFrontRegex}", halfYearFrontRegex)
      .replaceFirst("{HalfYearBackRegex}", halfYearBackRegex)
      .replaceFirst("{HalfYearRelativeRegex}", halfYearRelativeRegex);

  static final String earlyPrefixRegex =
      "\\b(?<EarlyPrefix>early|beginning of|start of|(?<RelEarly>earlier(\\s+in)?))\\b";

  static final String midPrefixRegex = "\\b(?<MidPrefix>mid-?|middle of)\\b";

  static final String laterPrefixRegex = "\\b(?<LatePrefix>late|end of|(?<RelLate>later(\\s+in)?))\\b";

  static final String prefixPeriodRegex = "({EarlyPrefixRegex}|{MidPrefixRegex}|{LaterPrefixRegex})"
      .replaceFirst("{EarlyPrefixRegex}", earlyPrefixRegex)
      .replaceFirst("{MidPrefixRegex}", midPrefixRegex)
      .replaceFirst("{LaterPrefixRegex}", laterPrefixRegex);

  static final String prefixDayRegex =
      "\\b((?<EarlyPrefix>earl(y|ier))|(?<MidPrefix>mid(dle)?)|(?<LatePrefix>later?))(\\s+in)?(\\s+the\\s+day)?\$";

  static final String seasonDescRegex = "(?<seas>spring|summer|fall|autumn|winter)";

  static final String seasonRegex =
      "\\b(?<season>({PrefixPeriodRegex}\\s+)?({RelativeRegex}\\s+)?{SeasonDescRegex}((\\s+of|\\s*,\\s*)?\\s+({YearRegex}|{RelativeRegex}\\s+year))?)\\b"
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex)
          .replaceFirst("{SeasonDescRegex}", seasonDescRegex)
          .replaceFirst("{PrefixPeriodRegex}", prefixPeriodRegex);

  static final String whichWeekRegex =
      "\\b(week)(\\s*)(?<number>5[0-3]|[1-4]\\d|0?[1-9])(\\s+of\\s+({YearRegex}|{RelativeRegex}\\s+year))?\\b"
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex);

  static final String weekOfRegex =
      "(the\\s+)?((week)(\\s+(of|(commencing|starting|beginning)(\\s+on)?))|w/c)(\\s+the)?";

  static final String monthOfRegex = "(month)(\\s*)(of)";

  static final String dateYearRegex =
      "(?<year>{BaseDateTime.fourDigitYearRegex}|(?<!,\\s?){TwoDigitYearRegex}|{TwoDigitYearRegex}(?=(\\.(?!\\d)|[?!;]|\$)))"
          .replaceFirst("{BaseDateTime.fourDigitYearRegex}", BaseDateTime.fourDigitYearRegex)
          .replaceFirst("{TwoDigitYearRegex}", twoDigitYearRegex);

  static final String yearSuffix = "((,|\\sof)?\\s*({DateYearRegex}|{FullTextYearRegex}))"
      .replaceFirst("{DateYearRegex}", dateYearRegex)
      .replaceFirst("{FullTextYearRegex}", fullTextYearRegex);

  static final String onRegex = "(?<=\\bon\\s+)({DayRegex}s?)\\b".replaceFirst("{DayRegex}", dayRegex);

  static final String relaxedOnRegex = "(?<=\\b(on|at|in)\\s+)((?<day>(3[0-1]|[0-2]?\\d)(?:th|nd|rd|st))s?)\\b";

  static final String prefixWeekDayRegex = "(\\s*((,?\\s*on)|[-—–]))";

  static final String thisRegex =
      "\\b(this(\\s*week{PrefixWeekDayRegex}?)?\\s*{WeekDayRegex})|({WeekDayRegex}((\\s+of)?\\s+this\\s*week))\\b"
          .replaceFirst("{WeekDayRegex}", weekDayRegex)
          .replaceFirst("{PrefixWeekDayRegex}", prefixWeekDayRegex);

  static final String lastDateRegex =
      "\\b({PreviousPrefixRegex}(\\s*week{PrefixWeekDayRegex}?)?\\s*{WeekDayRegex})|({WeekDayRegex}(\\s+(of\\s+)?last\\s*week))\\b"
          .replaceFirst("{PreviousPrefixRegex}", previousPrefixRegex)
          .replaceFirst("{WeekDayRegex}", weekDayRegex)
          .replaceFirst("{PrefixWeekDayRegex}", prefixWeekDayRegex);

  static final String nextDateRegex =
      "\\b({NextPrefixRegex}(\\s*week{PrefixWeekDayRegex}?)?\\s*{WeekDayRegex})|((on\\s+)?{WeekDayRegex}((\\s+of)?\\s+(the\\s+following|(the\\s+)?next)\\s*week))\\b"
          .replaceFirst("{NextPrefixRegex}", nextPrefixRegex)
          .replaceFirst("{WeekDayRegex}", weekDayRegex)
          .replaceFirst("{PrefixWeekDayRegex}", prefixWeekDayRegex);

  static final String specialDayRegex =
      "\\b((the\\s+)?day before yesterday|(the\\s+)?day after (tomorrow|tmrw?)|the\\s+day\\s+(before|after)(?!=\\s+day)|((the\\s+)?({RelativeRegex}|my)\\s+day)|yesterday|tomorrow|tmrw?|today|otd|current date)\\b"
          .replaceFirst("{RelativeRegex}", relativeRegex);

  static final String specialDayWithNumRegex =
      "\\b((?<number>{WrittenNumRegex})\\s+days?\\s+from\\s+(?<day>yesterday|tomorrow|tmrw?|today|current date))\\b"
          .replaceFirst("{WrittenNumRegex}", writtenNumRegex);

  static final String relativeDayRegex =
      "\\b(((the\\s+)?{RelativeRegex}\\s+day))\\b".replaceFirst("{RelativeRegex}", relativeRegex);

  static final String setWeekDayRegex =
      "\\b(?<prefix>on\\s+)?(?<weekday>morning|afternoon|evening|night|(sun|mon|tues|wednes|thurs|fri|satur)day)s\\b";

  static final String weekDayOfMonthRegex =
      "(?<wom>(the\\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|last)\\s+(week\\s+{MonthSuffixRegex}[\\.]?\\s+(on\\s+)?{WeekDayRegex}|{WeekDayRegex}\\s+{MonthSuffixRegex}))"
          .replaceFirst("{WeekDayRegex}", weekDayRegex)
          .replaceFirst("{MonthSuffixRegex}", monthSuffixRegex);

  static final String relativeWeekDayRegex = "\\b({WrittenNumRegex}\\s+{WeekDayRegex}\\s+(from\\s+now|later))\\b"
      .replaceFirst("{WrittenNumRegex}", writtenNumRegex)
      .replaceFirst("{WeekDayRegex}", weekDayRegex);

  static final String specialDate = "(?=\\b(on|at)\\s+the\\s+){DayRegex}\\b".replaceFirst("{DayRegex}", dayRegex);

  static final String datePreposition = "\\b(on|in)";

  static final String dateExtractorYearTermRegex =
      "(\\s+|\\s*[/\\\\.,-]\\s*|\\s+of\\s+){DateYearRegex}".replaceFirst("{DateYearRegex}", dateYearRegex);

  static final String dayPrefix = "\\b({WeekDayRegex}|{SpecialDayRegex})\\b"
      .replaceFirst("{WeekDayRegex}", weekDayRegex)
      .replaceFirst("{SpecialDayRegex}", specialDayRegex);

  static final String dateExtractor1 =
      "\\b({DayPrefix}\\s*[,-]?\\s*)?(({MonthRegex}[\\.]?\\s*[/\\\\.,-]?\\s*{DayRegex})|(\\({MonthRegex}\\s*[-./]\\s*{DayRegex}\\)))(?!\\s*\\-\\s*\\d{2}\\b)(\\s*\\(\\s*{DayPrefix}\\s*\\))?({DateExtractorYearTermRegex}\\b)?"
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{MonthRegex}", monthRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{DateExtractorYearTermRegex}", dateExtractorYearTermRegex);

  static final String dateExtractor3 =
      "\\b({DayPrefix}(\\s+|\\s*,\\s*))?({DayRegex}?[\\.]?(\\s+|\\s*[-,/]\\s*|\\s+of\\s+|\\s*)(\\b)?{MonthRegexNoWordBoundary}[\\.]?((\\s+in)?{DateExtractorYearTermRegex})?|{BaseDateTime.fourDigitYearRegex}\\s*[-./]?\\s*(the\\s+)?(?<day>(?:3[0-1]|[1-2]\\d|0?[1-9])(?:th|nd|rd|st)?)[\\.]?(\\s+|\\s*[-,/]\\s*|\\s+of\\s+){MonthRegex}[\\.]?)\\b"
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{MonthRegex}", monthRegex)
          .replaceFirst("{DateExtractorYearTermRegex}", dateExtractorYearTermRegex)
          .replaceFirst("{BaseDateTime.fourDigitYearRegex}", BaseDateTime.fourDigitYearRegex)
          .replaceFirst("{MonthRegexNoWordBoundary}", monthRegexNoWordBoundary);

  static final String dateExtractor4 =
      "\\b{MonthNumRegex}\\s*[/\\\\\\-]\\s*{DayRegex}[\\.]?\\s*[/\\\\\\-]\\s*{DateYearRegex}"
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{DateYearRegex}", dateYearRegex);

  static final String dateExtractor5 =
      "\\b({DayPrefix}(\\s*,)?\\s+)?{DayRegex}\\s*[/\\\\\\-\\.]\\s*({MonthNumRegex}|{MonthRegex})\\s*[/\\\\\\-\\.]\\s*{DateYearRegex}(?!\\s*[/\\\\\\-\\.]\\s*\\d+)"
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{MonthRegex}", monthRegex)
          .replaceFirst("{DateYearRegex}", dateYearRegex);

  static final String dateExtractor6 =
      "(?<={DatePreposition}\\s+)({StrictRelativeRegex}\\s+)?({DayPrefix}\\s+)?{MonthNumRegex}[\\-\\.]{DayRegex}(?![%]){BaseDateTime.checkDecimalRegex}\\b"
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{DatePreposition}", datePreposition)
          .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex)
          .replaceFirst("{BaseDateTime.checkDecimalRegex}", BaseDateTime.checkDecimalRegex);

  static final String dateExtractor7L =
      "\\b({DayPrefix}(\\s*,)?\\s+)?{MonthNumRegex}\\s*/\\s*{DayRegex}{DateExtractorYearTermRegex}(?![%])\\b"
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{DateExtractorYearTermRegex}", dateExtractorYearTermRegex);

  static final String dateExtractor7S =
      "\\b({DayPrefix}(\\s*,)?\\s+)?{MonthNumRegex}\\s*/\\s*{DayRegex}(?![%]){BaseDateTime.checkDecimalRegex}\\b"
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{BaseDateTime.checkDecimalRegex}", BaseDateTime.checkDecimalRegex);

  static final String dateExtractor8 =
      "(?<={DatePreposition}\\s+)({StrictRelativeRegex}\\s+)?({DayPrefix}\\s+)?{DayRegex}[\\\\\\-]{MonthNumRegex}(?![%]){BaseDateTime.checkDecimalRegex}\\b"
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{DatePreposition}", datePreposition)
          .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex)
          .replaceFirst("{BaseDateTime.checkDecimalRegex}", BaseDateTime.checkDecimalRegex);

  static final String dateExtractor9L =
      "\\b({DayPrefix}(\\s*,)?\\s+)?{DayRegex}\\s*/\\s*{MonthNumRegex}{DateExtractorYearTermRegex}(?![%])\\b"
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{DateExtractorYearTermRegex}", dateExtractorYearTermRegex);

  static final String dateExtractor9S =
      "\\b({DayPrefix}(\\s*,)?\\s+)?{DayRegex}\\s*/\\s*{MonthNumRegex}{BaseDateTime.checkDecimalRegex}(?![%])\\b"
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{BaseDateTime.checkDecimalRegex}", BaseDateTime.checkDecimalRegex);

  static final String dateExtractorNoSep =
      "\\b((?<![\$])(?<year>((1\\d|20)\\d{2})|2100)(\\s+(?<month>1[0-2]|(0)?[1-9])\\s+(?<day>(?:3[0-1]|[1-2]\\d|0?[1-9]))|(?<month>1[0-2]|(0)?[1-9])(?<day>(?:3[0-1]|[1-2]\\d|0?[1-9])))\\b)";

  static final String dateExtractorA =
      "\\b({DayPrefix}(\\s*,)?\\s+)?(({BaseDateTime.fourDigitYearRegex}\\s*[/\\\\\\-\\.]\\s*({MonthNumRegex}|{MonthRegex})\\s*[/\\\\\\-\\.]\\s*{DayRegex})|({MonthRegex}\\s*[/\\\\\\-\\.]\\s*{BaseDateTime.fourDigitYearRegex}\\s*[/\\\\\\-\\.]\\s*(the\\s+)?(?<day>(?:3[0-1]|[1-2]\\d|0?[1-9])(?:th|nd|rd|st)?))|({DayRegex}\\s*[/\\\\\\-\\.]\\s*{BaseDateTime.fourDigitYearRegex}\\s*[/\\\\\\-\\.]\\s*{MonthRegex})|{DateExtractorNoSep})"
          .replaceFirst("{BaseDateTime.fourDigitYearRegex}", BaseDateTime.fourDigitYearRegex)
          .replaceFirst("{MonthNumRegex}", monthNumRegex)
          .replaceFirst("{MonthRegex}", monthRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{DayPrefix}", dayPrefix)
          .replaceFirst("{DateExtractorNoSep}", dateExtractorNoSep);

  static final String ofMonth = "^(\\s*(day\\s+)?of)?\\s*{MonthRegex}".replaceFirst("{MonthRegex}", monthRegex);

  static final String monthEnd = "{MonthRegex}\\s*(the)?\\s*\$".replaceFirst("{MonthRegex}", monthRegex);

  static final String weekDayEnd = "(this\\s+)?{WeekDayRegex}\\s*,?\\s*\$".replaceFirst("{WeekDayRegex}", weekDayRegex);

  static final String weekDayStart = "^\\s+(on\\s+)?{WeekDayRegex}\\b".replaceFirst("{WeekDayRegex}", weekDayRegex);

  static final String rangeUnitRegex = "\\b(?<unit>years?|months?|weeks?|fortnights?)\\b";

  static final String hourNumRegex =
      "\\b(?<hournum>zero|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)\\b";

  static final String minuteNumRegex =
      "(((?<tens>twenty|thirty|fou?rty|fifty)(\\s*-?\\s*))?(?<minnum>one|two|three|four|five|six|seven|eight|nine)|(?<minnum>ten|eleven|twelve|thirteen|fifteen|eighteen|(four|six|seven|nine)(teen)|twenty|thirty|forty|fifty))";

  static final String deltaMinuteNumRegex =
      "(((?<tens>twenty|thirty|fou?rty|fifty)(\\s*-?\\s*))?(?<deltaminnum>one|two|three|four|five|six|seven|eight|nine)|(?<deltaminnum>ten|eleven|twelve|thirteen|fifteen|eighteen|(four|six|seven|nine)(teen)|twenty|thirty|forty|fifty))";

  static final String pmRegex =
      "(?<pm>(((?:at|in|around|circa|on|for)\\s+(the\\s+)?)?(((early|late)\\s+)?(afternoon|evening)|midnight|lunchtime))|((at|in|around|on|for)\\s+(the\\s+)?night))";

  static final String pmRegexFull =
      "(?<pm>((?:at|in|around|circa|on|for)\\s+(the\\s+)?)?(((early|late)\\s+)?(afternoon|evening)|(mid)?night|lunchtime))";

  static final String amRegex = "(?<am>((?:at|in|around|circa|on|for)\\s+(the\\s+)?)?((early|late)\\s+)?(morning))";

  static final String lunchRegex = "\\blunchtime\\b";

  static final String nightRegex = "\\b(mid)?night\\b";

  static final String commonDatePrefixRegex = "^[\\.]";

  static final String lessThanOneHour =
      "(?<lth>(a\\s+)?quarter|three quarter(s)?|half( an hour)?|{BaseDateTime.deltaMinuteRegex}(\\s+(minutes?|mins?)|(?=\\s+past))|{DeltaMinuteNumRegex}(\\s+(minutes?|mins?)|(?=\\s+past)))"
          .replaceFirst("{BaseDateTime.deltaMinuteRegex}", BaseDateTime.deltaMinuteRegex)
          .replaceFirst("{DeltaMinuteNumRegex}", deltaMinuteNumRegex);

  static final String writtenTimeRegex = "(?<writtentime>{HourNumRegex}\\s+{MinuteNumRegex}(\\s+(minutes?|mins?))?)"
      .replaceFirst("{HourNumRegex}", hourNumRegex)
      .replaceFirst("{MinuteNumRegex}", minuteNumRegex);

  static final String timePrefix =
      "(?<prefix>{LessThanOneHour}\\s+(past|to))".replaceFirst("{LessThanOneHour}", lessThanOneHour);

  static final String timeSuffix = "(?<suffix>{AmRegex}|{PmRegex}|{OclockRegex})"
      .replaceFirst("{AmRegex}", amRegex)
      .replaceFirst("{PmRegex}", pmRegex)
      .replaceFirst("{OclockRegex}", oclockRegex);

  static final String timeSuffixFull = "(?<suffix>{AmRegex}|{PmRegexFull}|{OclockRegex})"
      .replaceFirst("{AmRegex}", amRegex)
      .replaceFirst("{PmRegexFull}", pmRegexFull)
      .replaceFirst("{OclockRegex}", oclockRegex);

  static final String basicTime =
      "\\b(?<basictime>{WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex}:{BaseDateTime.MinuteRegex}(:{BaseDateTime.SecondRegex})?|{BaseDateTime.HourRegex}(?![%\\d]))"
          .replaceFirst("{WrittenTimeRegex}", writtenTimeRegex)
          .replaceFirst("{HourNumRegex}", hourNumRegex)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{BaseDateTime.MinuteRegex}", BaseDateTime.minuteRegex)
          .replaceFirst("{BaseDateTime.SecondRegex}", BaseDateTime.secondRegex);

  static final String midnightRegex = "(?<midnight>mid\\s*(-\\s*)?night)";

  static final String midmorningRegex = "(?<midmorning>mid\\s*(-\\s*)?morning)";

  static final String midafternoonRegex = "(?<midafternoon>mid\\s*(-\\s*)?afternoon)";

  static final String middayRegex = "(?<midday>mid\\s*(-\\s*)?day|((12\\s)?noon))";

  static final String midTimeRegex = "(?<mid>({MidnightRegex}|{MidmorningRegex}|{MidafternoonRegex}|{MiddayRegex}))"
      .replaceFirst("{MidnightRegex}", midnightRegex)
      .replaceFirst("{MidmorningRegex}", midmorningRegex)
      .replaceFirst("{MidafternoonRegex}", midafternoonRegex)
      .replaceFirst("{MiddayRegex}", middayRegex);

  static final String atRegex =
      "\\b(?:(?:(?<=\\b(at|(at)?\\s*around|circa)\\s+)(?:{WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex}(?!\\.\\d)(\\s*((?<iam>a)|(?<ipm>p)))?|{MidTimeRegex}))|{MidTimeRegex})\\b"
          .replaceFirst("{WrittenTimeRegex}", writtenTimeRegex)
          .replaceFirst("{HourNumRegex}", hourNumRegex)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{MidTimeRegex}", midTimeRegex);

  static final String ishRegex = "\\b({BaseDateTime.HourRegex}(-|——)?ish|noon(ish)?)\\b"
      .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex);

  static final String timeUnitRegex = "([^a-z]{1,}|\\b)(?<unit>(h(ou)?r|min(ute)?|sec(ond)?)(?<plural>s)?|h)\\b";

  static final String restrictedTimeUnitRegex = "(?<unit>hour|minute)\\b";

  static final String fivesRegex = "(?<tens>(?:fifteen|(?:twen|thir|fou?r|fif)ty(\\s*five)?|ten|five))\\b";

  static final String HourRegex =
      "\\b{BaseDateTime.HourRegex}".replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex);

  static final String periodHourNumRegex =
      "\\b(?<hour>twenty(\\s+(one|two|three|four))?|eleven|twelve|thirteen|fifteen|eighteen|(four|six|seven|nine)(teen)?|zero|one|two|three|five|eight|ten)\\b";

  static final String connectNumRegex = "\\b{BaseDateTime.HourRegex}(?<min>[0-5][0-9])\\s*{DescRegex}"
      .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
      .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegexWithDotConnector = "({BaseDateTime.HourRegex}(\\s*\\.\\s*){BaseDateTime.MinuteRegex})"
      .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
      .replaceFirst("{BaseDateTime.MinuteRegex}", BaseDateTime.minuteRegex);

  static final String timeRegex1 =
      "\\b({TimePrefix}\\s+)?({WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex})(\\s*|[.]){DescRegex}"
          .replaceFirst("{TimePrefix}", timePrefix)
          .replaceFirst("{WrittenTimeRegex}", writtenTimeRegex)
          .replaceFirst("{HourNumRegex}", hourNumRegex)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex2 =
      "(\\b{TimePrefix}\\s+)?(t)?{BaseDateTime.HourRegex}(\\s*)?:(\\s*)?{BaseDateTime.MinuteRegex}((\\s*)?:(\\s*)?{BaseDateTime.SecondRegex})?(?<iam>a)?((\\s*{DescRegex})|\\b)"
          .replaceFirst("{TimePrefix}", timePrefix)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{BaseDateTime.MinuteRegex}", BaseDateTime.minuteRegex)
          .replaceFirst("{BaseDateTime.SecondRegex}", BaseDateTime.secondRegex)
          .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex3 =
      "(\\b{TimePrefix}\\s+)?{BaseDateTime.HourRegex}\\.{BaseDateTime.MinuteRegex}(\\s*{DescRegex})"
          .replaceFirst("{TimePrefix}", timePrefix)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{BaseDateTime.MinuteRegex}", BaseDateTime.minuteRegex)
          .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex4 = "\\b{TimePrefix}\\s+{BasicTime}(\\s*{DescRegex})?\\s+{TimeSuffix}\\b"
      .replaceFirst("{TimePrefix}", timePrefix)
      .replaceFirst("{BasicTime}", basicTime)
      .replaceFirst("{DescRegex}", descRegex)
      .replaceFirst("{TimeSuffix}", timeSuffix);

  static final String timeRegex5 = "\\b{TimePrefix}\\s+{BasicTime}((\\s*{DescRegex})|\\b)"
      .replaceFirst("{TimePrefix}", timePrefix)
      .replaceFirst("{BasicTime}", basicTime)
      .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex6 = "({BasicTime})(\\s*{DescRegex})?\\s+{TimeSuffix}\\b"
      .replaceFirst("{BasicTime}", basicTime)
      .replaceFirst("{DescRegex}", descRegex)
      .replaceFirst("{TimeSuffix}", timeSuffix);

  static final String timeRegex7 = "\\b{TimeSuffixFull}\\s+(at\\s+)?{BasicTime}((\\s*{DescRegex})|\\b)"
      .replaceFirst("{TimeSuffixFull}", timeSuffixFull)
      .replaceFirst("{BasicTime}", basicTime)
      .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex8 = ".^"
      .replaceFirst("{TimeSuffixFull}", timeSuffixFull)
      .replaceFirst("{BasicTime}", basicTime)
      .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex9 = "\\b{PeriodHourNumRegex}(\\s+|-){FivesRegex}((\\s*{DescRegex})|\\b)"
      .replaceFirst("{PeriodHourNumRegex}", periodHourNumRegex)
      .replaceFirst("{FivesRegex}", fivesRegex)
      .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex10 =
      "\\b({TimePrefix}\\s+)?{BaseDateTime.HourRegex}(\\s*h\\s*){BaseDateTime.MinuteRegex}(\\s*{DescRegex})?"
          .replaceFirst("{TimePrefix}", timePrefix)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{BaseDateTime.MinuteRegex}", BaseDateTime.minuteRegex)
          .replaceFirst("{DescRegex}", descRegex);

  static final String timeRegex11 =
      "\\b((?:({TimeTokenPrefix})?{TimeRegexWithDotConnector}(\\s*{DescRegex}))|(?:(?:{TimeTokenPrefix}{TimeRegexWithDotConnector})(?!\\s*per\\s*cent|%)))"
          .replaceFirst("{TimeTokenPrefix}", timeTokenPrefix)
          .replaceFirst("{TimeRegexWithDotConnector}", timeRegexWithDotConnector)
          .replaceFirst("{DescRegex}", descRegex);

  static final String firstTimeRegexInTimeRange = "\\b{TimeRegexWithDotConnector}(\\s*{DescRegex})?"
      .replaceFirst("{TimeRegexWithDotConnector}", timeRegexWithDotConnector)
      .replaceFirst("{DescRegex}", descRegex);

  static final String pureNumFromTo =
      "({RangePrefixRegex}\\s+)?({HourRegex}|{PeriodHourNumRegex})(\\s*(?<leftDesc>{DescRegex}))?\\s*{TillRegex}\\s*({HourRegex}|{PeriodHourNumRegex})(?<rightDesc>\\s*({PmRegex}|{AmRegex}|{DescRegex}))?"
          .replaceFirst("{HourRegex}", HourRegex)
          .replaceFirst("{PeriodHourNumRegex}", periodHourNumRegex)
          .replaceFirst("{DescRegex}", descRegex)
          .replaceFirst("{TillRegex}", tillRegex)
          .replaceFirst("{PmRegex}", pmRegex)
          .replaceFirst("{AmRegex}", amRegex)
          .replaceFirst("{RangePrefixRegex}", rangePrefixRegex);

  static final String pureNumBetweenAnd =
      "(between\\s+)(({BaseDateTime.TwoDigitHourRegex}{BaseDateTime.TwoDigitMinuteRegex})|{HourRegex}|{PeriodHourNumRegex})(\\s*(?<leftDesc>{DescRegex}))?\\s*{RangeConnectorRegex}\\s*(({BaseDateTime.TwoDigitHourRegex}{BaseDateTime.TwoDigitMinuteRegex})|{HourRegex}|{PeriodHourNumRegex})(?<rightDesc>\\s*({PmRegex}|{AmRegex}|{DescRegex}))?"
          .replaceFirst("{HourRegex}", HourRegex)
          .replaceFirst("{PeriodHourNumRegex}", periodHourNumRegex)
          .replaceFirst("{BaseDateTime.TwoDigitHourRegex}", BaseDateTime.twoDigitHourRegex)
          .replaceFirst("{BaseDateTime.TwoDigitMinuteRegex}", BaseDateTime.twoDigitMinuteRegex)
          .replaceFirst("{DescRegex}", descRegex)
          .replaceFirst("{PmRegex}", pmRegex)
          .replaceFirst("{AmRegex}", amRegex)
          .replaceFirst("{RangeConnectorRegex}", rangeConnectorRegex);

  static final String specificTimeFromTo =
      "({RangePrefixRegex}\\s+)?(?<time1>(({TimeRegex2}|{FirstTimeRegexInTimeRange})|({HourRegex}|{PeriodHourNumRegex})(\\s*(?<leftDesc>{DescRegex}))?))\\s*{TillRegex}\\s*(?<time2>(({TimeRegex2}|{TimeRegexWithDotConnector}(?<rightDesc>\\s*{DescRegex}))|({HourRegex}|{PeriodHourNumRegex})(\\s*(?<rightDesc>{DescRegex}))?))"
          .replaceFirst("{TimeRegex2}", timeRegex2)
          .replaceFirst("{FirstTimeRegexInTimeRange}", firstTimeRegexInTimeRange)
          .replaceFirst("{TimeRegexWithDotConnector}", timeRegexWithDotConnector)
          .replaceFirst("{TillRegex}", tillRegex)
          .replaceFirst("{HourRegex}", HourRegex)
          .replaceFirst("{PeriodHourNumRegex}", periodHourNumRegex)
          .replaceFirst("{DescRegex}", descRegex)
          .replaceFirst("{PmRegex}", pmRegex)
          .replaceFirst("{AmRegex}", amRegex)
          .replaceFirst("{RangePrefixRegex}", rangePrefixRegex);

  static final String specificTimeBetweenAnd =
      "(between\\s+)(?<time1>(({TimeRegex2}|{FirstTimeRegexInTimeRange})|({HourRegex}|{PeriodHourNumRegex})(\\s*(?<leftDesc>{DescRegex}))?))\\s*{RangeConnectorRegex}\\s*(?<time2>(({TimeRegex2}|{TimeRegexWithDotConnector}(?<rightDesc>\\s*{DescRegex}))|({HourRegex}|{PeriodHourNumRegex})(\\s*(?<rightDesc>{DescRegex}))?))"
          .replaceFirst("{TimeRegex2}", timeRegex2)
          .replaceFirst("{FirstTimeRegexInTimeRange}", firstTimeRegexInTimeRange)
          .replaceFirst("{TimeRegexWithDotConnector}", timeRegexWithDotConnector)
          .replaceFirst("{RangeConnectorRegex}", rangeConnectorRegex)
          .replaceFirst("{HourRegex}", HourRegex)
          .replaceFirst("{PeriodHourNumRegex}", periodHourNumRegex)
          .replaceFirst("{DescRegex}", descRegex)
          .replaceFirst("{PmRegex}", pmRegex)
          .replaceFirst("{AmRegex}", amRegex);

  static final String suffixAfterRegex = "\\b(((at)\\s)?(or|and)\\s+(above|after|later|greater)(?!\\s+than))\\b";

  static final String prepositionRegex = "(?<prep>^(,\\s*)?(at|on|of)(\\s+the)?\$)";

  static final String laterEarlyRegex = "((?<early>earl(y|ier)(\\s+|-))|(?<late>late(r?\\s+|-)))";

  static final String mealTimeRegex =
      "\\b(at\\s+)?(?<mealTime>breakfast|brunch|lunch(\\s*time)?|dinner(\\s*time)?|supper)\\b";

  static final String unspecificTimePeriodRegex = "({MealTimeRegex})".replaceFirst("{MealTimeRegex}", mealTimeRegex);

  static final String timeOfDayRegex =
      "\\b(?<timeOfDay>((((in\\s+the\\s+){LaterEarlyRegex}?(morning|afternoon|night(-?time)?|evening)s)|((in\\s+the\\s+)?{LaterEarlyRegex}?(in(\\s+the)?\\s+)?(morning|afternoon|night(-?time)?|evening)))|{MealTimeRegex}|(((in\\s+(the)?\\s+)?)(daytime|business\\s+hours?))))\\b"
          .replaceFirst("{LaterEarlyRegex}", laterEarlyRegex)
          .replaceFirst("{MealTimeRegex}", mealTimeRegex);

  static final String specificTimeOfDayRegex =
      "\\b(({StrictRelativeRegex}\\s+{TimeOfDayRegex})\\b|\\b(?<pm>toni(ght|te)))s?\\b"
          .replaceFirst("{TimeOfDayRegex}", timeOfDayRegex)
          .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex);

  static final String timeFollowedUnit = "^\\s*{TimeUnitRegex}".replaceFirst("{TimeUnitRegex}", timeUnitRegex);

  static final String timeNumberCombinedWithUnit =
      "\\b(?<num>\\d+(\\.\\d*)?){TimeUnitRegex}".replaceFirst("{TimeUnitRegex}", timeUnitRegex);

  static final businessHourSplitStrings = ["business", "hour"];

  static final String nowRegex =
      "\\b(?<now>(right\\s+)?now|as\\s+soon\\s+as\\s+possible|asap|recently|previously|at\\s+(present|this\\s+time|th(e|is)\\s+minute|the\\s+(moment|present\\s+time)))\\b";

  static final String nowParseRegex = "\\b({NowRegex}|^(date)\$)\\b".replaceFirst("{NowRegex}", nowRegex);

  static final String suffixRegex = "^\\s*(in the\\s+)?(morning|afternoon|evening|night)\\b";

  static final String nonTimeContextTokens = "(building)";

  static final String dateTimeTimeOfDayRegex = "\\b(?<timeOfDay>morning|(?<pm>afternoon|night|evening))\\b";

  static final String dateTimeSpecificTimeOfDayRegex =
      "\\b(({RelativeRegex}\\s+{DateTimeTimeOfDayRegex})\\b|\\btoni(ght|te))\\b"
          .replaceFirst("{DateTimeTimeOfDayRegex}", dateTimeTimeOfDayRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex);

  static final String timeOfTodayAfterRegex = "^\\s*(,\\s*)?(in\\s+)?{DateTimeSpecificTimeOfDayRegex}"
      .replaceFirst("{DateTimeSpecificTimeOfDayRegex}", dateTimeSpecificTimeOfDayRegex);

  static final String timeOfTodayBeforeRegex =
      "{DateTimeSpecificTimeOfDayRegex}(\\s*,)?(\\s+(at|around|circa|in|on))?\\s*\$"
          .replaceFirst("{DateTimeSpecificTimeOfDayRegex}", dateTimeSpecificTimeOfDayRegex);

  static final String simpleTimeOfTodayAfterRegex =
      "(?<!{NonTimeContextTokens}\\s*)\\b({HourNumRegex}|{BaseDateTime.HourRegex})\\s*(,\\s*)?(in\\s+)?{DateTimeSpecificTimeOfDayRegex}\\b"
          .replaceFirst("{NonTimeContextTokens}", nonTimeContextTokens)
          .replaceFirst("{HourNumRegex}", hourNumRegex)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{DateTimeSpecificTimeOfDayRegex}", dateTimeSpecificTimeOfDayRegex);

  static final String simpleTimeOfTodayBeforeRegex =
      "\\b{DateTimeSpecificTimeOfDayRegex}(\\s*,)?(\\s+(at|around|circa))?\\s*({HourNumRegex}|{BaseDateTime.HourRegex})\\b"
          .replaceFirst("{DateTimeSpecificTimeOfDayRegex}", dateTimeSpecificTimeOfDayRegex)
          .replaceFirst("{HourNumRegex}", hourNumRegex)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex);

  static final String specificEndOfRegex = "(the\\s+)?end of(\\s+the)?\\s*\$";

  static final String unspecificEndOfRegex = "\\b(the\\s+)?(eod|(end\\s+of\\s+day))\\b";

  static final String unspecificEndOfRangeRegex = "\\b(eoy)\\b";

  static final String periodTimeOfDayRegex =
      "\\b((in\\s+(the\\s+)?)?{LaterEarlyRegex}?((this\\s+)?{DateTimeTimeOfDayRegex}|(?<timeOfDay>(?<pm>tonight))))\\b"
          .replaceFirst("{DateTimeTimeOfDayRegex}", dateTimeTimeOfDayRegex)
          .replaceFirst("{LaterEarlyRegex}", laterEarlyRegex);

  static final String periodSpecificTimeOfDayRegex =
      "\\b({LaterEarlyRegex}?this\\s+{DateTimeTimeOfDayRegex}|({StrictRelativeRegex}\\s+{PeriodTimeOfDayRegex})\\b|\\b(?<pm>toni(ght|te)))\\b"
          .replaceFirst("{PeriodTimeOfDayRegex}", periodTimeOfDayRegex)
          .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex)
          .replaceFirst("{DateTimeTimeOfDayRegex}", dateTimeTimeOfDayRegex)
          .replaceFirst("{LaterEarlyRegex}", laterEarlyRegex);

  static final String periodTimeOfDayWithDateRegex =
      "\\b(({PeriodTimeOfDayRegex}(\\s+(on|of))?))\\b".replaceFirst("{PeriodTimeOfDayRegex}", periodTimeOfDayRegex);

  static final String tasksmodeMealTimeofDayRegex =
      "\\b((in\\s+(the)?\\s+)?((?<early>earl(y|ier)(\\s+|-))|(?<late>late(r?\\s+|-)))?((this\\s+)?\\b(?<timeOfDay>lunch(\\s*time)?|dinner(\\s*time)?|brunch|breakfast)\\b))\\b"
          .replaceFirst("{DateTimeTimeOfDayRegex}", dateTimeTimeOfDayRegex)
          .replaceFirst("{LaterEarlyRegex}", laterEarlyRegex);

  static final String lessThanRegex = "\\b(less\\s+than)\\b";

  static final String moreThanRegex = "\\b(more\\s+than)\\b";

  static final String durationUnitRegex = "(?<unit>{DateUnitRegex}|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\\b"
      .replaceFirst("{DateUnitRegex}", dateUnitRegex);

  static final String suffixAndRegex = "(?<suffix>\\s*(and)\\s+(an?\\s+)?(?<suffix_num>half|quarter))";

  static final String periodicRegex =
      "\\b(?<periodic>((?<multiplier>semi|bi|tri)(\\s*|-))?(daily|monthly|weekly|quarterly|yearly|annual(ly)?))\\b";

  static final String eachUnitRegex =
      "\\b(?<each>(every|(each|any|once an|one a|once a)\\s?)(?<other>\\s+(other|alternate|second))?\\s*({DurationUnitRegex}|(?<specialUnit>quarters?|weekends?)|{WeekDayRegex})|(?<specialUnit>weekends))"
          .replaceFirst("{DurationUnitRegex}", durationUnitRegex)
          .replaceFirst("{WeekDayRegex}", weekDayRegex);

  static final String eachPrefixRegex = "\\b(?<each>(each|every|once an?)\\s*\$)";

  static final String setEachRegex = "\\b(?<each>(each|every)(?<other>\\s+(other|alternate))?\\s*)(?!the|that)\\b";

  static final String setLastRegex = "(?<last>following|next|upcoming|this|{LastNegPrefix}last|past|previous|current)"
      .replaceFirst("{LastNegPrefix}", lastNegPrefix);

  static final String eachDayRegex = "^\\s*(each|every)\\s*day\\b";

  static final String durationFollowedUnit =
      "(^\\s*{DurationUnitRegex}\\s+{SuffixAndRegex})|(^\\s*{SuffixAndRegex}?(\\s+|-)?{DurationUnitRegex})"
          .replaceFirst("{SuffixAndRegex}", suffixAndRegex)
          .replaceFirst("{DurationUnitRegex}", durationUnitRegex);

  static final String numberCombinedWithDurationUnit =
      "\\b(?<num>\\d+(\\.\\d*)?)(-)?{DurationUnitRegex}".replaceFirst("{DurationUnitRegex}", durationUnitRegex);

  static final String anUnitRegex =
      "(\\b((?<half>(half)\\s+)?an?|another)|(?<half>(1/2|½|half)))\\s+{DurationUnitRegex}"
          .replaceFirst("{DurationUnitRegex}", durationUnitRegex);

  static final String duringRegex = "\\b(for|during)\\s+the\\s+(?<unit>year|month|week|day|fortnight)\\b";

  static final String allRegex = "\\b(?<all>(all|full|whole)(\\s+|-)(?<unit>year|month|week|day|fortnight))\\b";

  static final String halfRegex = "((an?\\s*)|\\b)(?<half>half\\s+(?<unit>year|month|week|fortnight|day|hour))\\b";

  static final String conjunctionRegex = "\\b((and(\\s+for)?)|with)\\b";

  static final String holidayList1 =
      "(?<holiday>mardi gras|(washington|mao)'s birthday|juneteenth|(jubilee|freedom)(\\s+day)|chinese new year|(new\\s+(years'|year\\s*'s|years?)\\s+eve)|(new\\s+(years'|year\\s*'s|years?)(\\s+day)?)|may\\s*day|yuan dan|christmas eve|(christmas|xmas)(\\s+day)?|black friday|yuandan|easter(\\s+(sunday|saturday|monday))?|clean monday|ash wednesday|palm sunday|maundy thursday|good friday|white\\s+(sunday|monday)|trinity sunday|pentecost|corpus christi|cyber monday)";

  static final String holidayList2 =
      "(?<holiday>(thanks\\s*giving|all saint's|white lover|s(?:ain)?t?(\\.)?\\s+(?:patrick|george)(?:')?(?:s)?|us independence|all hallow|all souls|guy fawkes|cinco de mayo|halloween|qingming|dragon boat|april fools|tomb\\s*sweeping)(\\s+day)?)";

  static final String holidayList3 =
      "(?<holiday>(?:independence|presidents(?:')?|mlk|martin luther king( jr)?|canberra|ascension|columbus|tree( planting)?|arbor|labou?r|((international|int'?l)\\s+)?workers'?|mother'?s?|father'?s?|female|women('s)?|single|teacher'?s|youth|children|girls|lovers?|earth|inauguration|groundhog|valentine'?s|baptiste|bastille|veterans(?:')?|memorial|mid[ \\-]autumn|moon|spring|lantern)\\s+day)";

  static final String holidayList4 =
      "(?<holiday>ramad(h)?an|ram(a)?zan|ramathan|eid al(-|\\s+)adha|eid al(-|\\s+)azha|eidul(-|\\s+)azha|feast of the sacrifice|(islamic|arabic|hijri) new year|eid al(-|\\s+)fitr|festival of breaking the fast)";

  static final String holidayRegex =
      "\\b(({StrictRelativeRegex}\\s+({HolidayList1}|{HolidayList2}|{HolidayList3}|{HolidayList4}))|(?<holidayWeekend>((the\\s+)?weekend\\s+of\\s+)({HolidayList1}|{HolidayList2}|{HolidayList3}|{HolidayList4})(\\s+((of\\s+)?({YearRegex}|{RelativeRegex}\\s+year)))?)|(({HolidayList1}|{HolidayList2}|{HolidayList3}|{HolidayList4})((?<holidayWeekend>(\\s+weekend)(\\s+((of\\s+)?({YearRegex}|{RelativeRegex}\\s+year)))?)|(\\s+(of\\s+)?({YearRegex}|{RelativeRegex}\\s+year)(?<holidayWeekend>\\s+weekend)?))?))\\b"
          .replaceFirst("{HolidayList1}", holidayList1)
          .replaceFirst("{HolidayList2}", holidayList2)
          .replaceFirst("{HolidayList3}", holidayList3)
          .replaceFirst("{HolidayList4}", holidayList4)
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{RelativeRegex}", relativeRegex)
          .replaceFirst("{StrictRelativeRegex}", strictRelativeRegex);

  static final String tasksModeHolidayListSupression =
      "(?<holiday>(?:independence|teacher'?s|youth|children|girls)\\s+day)|(?<holiday>ramad(h)?an|ram(a)?zan|ramathan|eid al(-|\\s+)adha|eid al(-|\\s+)azha|eidul(-|\\s+)azha|feast of the sacrifice|(islamic|arabic|hijri) new year|eid al(-|\\s+)fitr|festival of breaking the fast)\\b"
          .replaceFirst("{HolidayList4}", holidayList4);

  static final String amTimeRegex = "(?<am>morning)";

  static final String pmTimeRegex = "\\b(?<pm>afternoon|evening|night)\\b";

  static final String nightTimeRegex = "(night)";

  static final String nowTimeRegex =
      "(now|at\\s+(present|this\\s+time|th(e|is)\\s+minute|the\\s+(moment|(current|present)\\s+time)))";

  static final String recentlyTimeRegex = "(recently|previously)";

  static final String asapTimeRegex = "(as soon as possible|asap)";

  static final String inclusiveModPrepositions = "(?<include>((on|in|at)\\s+or\\s+)|(\\s+or\\s+(on|in|at)))";

  static final String aroundRegex = "(?:\\b(?:around|circa)\\s*?\\b)(\\s+the)?";

  static final String beforeRegex =
      "((\\b{InclusiveModPrepositions}?(?:before|in\\s+advance\\s+of|prior\\s+to|(no\\s+later|earlier|sooner)\\s+than|ending\\s+(with|on)|by|(un)?till?|(?<include>as\\s+late\\s+as)){InclusiveModPrepositions}?\\b\\s*?)|(?<!\\w|>)((?<include><\\s*=)|<))(\\s+the)?"
          .replaceFirst("{InclusiveModPrepositions}", inclusiveModPrepositions);

  static final String afterRegex =
      "((\\b{InclusiveModPrepositions}?((after(\\s+on)?(?!\\sfrom)|(?<!no\\s+)later\\s+than)|((year\\s+)?greater\\s+than))(?!\\s+or\\s+equal\\s+to){InclusiveModPrepositions}?\\b\\s*?)|(?<!\\w|<)((?<include>>\\s*=)|>))(\\s+the)?"
          .replaceFirst("{InclusiveModPrepositions}", inclusiveModPrepositions);

  static final String sinceRegex =
      "(?:(?:\\b(?:since|after\\s+or\\s+equal\\s+to|(starting|beginning)(\\s)?(?:from|on|with)?|as\\s+early\\s+as|(any\\s+time\\s+)from)\\b\\s*?)|(?<!\\w|<)(>=))(\\s+the)?";

  static final String sinceRegexExp = "({SinceRegex}|\\bfrom(\\s+the)?\\b)".replaceFirst("{SinceRegex}", sinceRegex);

  static final String agoRegex = "\\b(ago|earlier|before\\s+(?<day>yesterday|today))\\b";

  static final String laterRegex =
      "\\b(?:later(?!((\\s+in)?\\s*{OneWordPeriodRegex})|(\\s+{TimeOfDayRegex})|\\s+than\\b)|from now|(from|after)\\s+(?<day>tomorrow|tmrw?|today))\\b"
          .replaceFirst("{OneWordPeriodRegex}", oneWordPeriodRegex)
          .replaceFirst("{TimeOfDayRegex}", timeOfDayRegex);

  static final String beforeAfterRegex = "\\b((?<before>before)|(?<after>from|after))\\b";

  static final String modPrefixRegex = "\\b({RelativeRegex}|{AroundRegex}|{BeforeRegex}|{AfterRegex}|{SinceRegex})\\b"
      .replaceFirst("{RelativeRegex}", relativeRegex)
      .replaceFirst("{AroundRegex}", aroundRegex)
      .replaceFirst("{BeforeRegex}", beforeRegex)
      .replaceFirst("{AfterRegex}", afterRegex)
      .replaceFirst("{SinceRegex}", sinceRegex);

  static final String modSuffixRegex =
      "\\b({AgoRegex}|{LaterRegex}|{BeforeAfterRegex}|{FutureSuffixRegex}|{PastSuffixRegex})\\b"
          .replaceFirst("{AgoRegex}", agoRegex)
          .replaceFirst("{LaterRegex}", laterRegex)
          .replaceFirst("{BeforeAfterRegex}", beforeAfterRegex)
          .replaceFirst("{FutureSuffixRegex}", futureSuffixRegex)
          .replaceFirst("{PastSuffixRegex}", pastSuffixRegex);

  static final String inConnectorRegex = "\\b(in)\\b";

  static final String sinceYearSuffixRegex = "(^\\s*{SinceRegex}(\\s*(the\\s+)?year\\s*)?{YearSuffix})"
      .replaceFirst("{SinceRegex}", sinceRegex)
      .replaceFirst("{YearSuffix}", yearSuffix);

  static final String withinNextPrefixRegex =
      "\\b(within(\\s+the)?(\\s+(?<next>{NextPrefixRegex}))?)\\b".replaceFirst("{NextPrefixRegex}", nextPrefixRegex);

  static final String todayNowRegex = "\\b(today|now|current (date|time))\\b";

  static final String morningStartEndRegex =
      "(^(morning|{AmDescRegex}))|((morning|{AmDescRegex})\$)".replaceFirst("{AmDescRegex}", amDescRegex);

  static final String afternoonStartEndRegex =
      "(^(afternoon|{PmDescRegex}))|((afternoon|{PmDescRegex})\$)".replaceFirst("{PmDescRegex}", pmDescRegex);

  static final String eveningStartEndRegex = "(^(evening))|((evening)\$)";

  static final String nightStartEndRegex = "(^(over|to)?ni(ght|te))|((over|to)?ni(ght|te)\$)";

  static final String inexactNumberRegex = "\\b((a\\s+)?few|some|several|(?<NumTwoTerm>(a\\s+)?couple(\\s+of)?))\\b";

  static final String inexactNumberUnitRegex = "({InexactNumberRegex})\\s+({DurationUnitRegex})"
      .replaceFirst("{InexactNumberRegex}", inexactNumberRegex)
      .replaceFirst("{DurationUnitRegex}", durationUnitRegex);

  static final String relativeTimeUnitRegex =
      "(?:(?:(?:{NextPrefixRegex}|{PreviousPrefixRegex}|{ThisPrefixRegex})\\s+({TimeUnitRegex}))|((the|my))\\s+({RestrictedTimeUnitRegex}))"
          .replaceFirst("{NextPrefixRegex}", nextPrefixRegex)
          .replaceFirst("{PreviousPrefixRegex}", previousPrefixRegex)
          .replaceFirst("{ThisPrefixRegex}", thisPrefixRegex)
          .replaceFirst("{TimeUnitRegex}", timeUnitRegex)
          .replaceFirst("{RestrictedTimeUnitRegex}", restrictedTimeUnitRegex);

  static final String relativeDurationUnitRegex =
      "(?:(?:(?<=({NextPrefixRegex}|{PreviousPrefixRegex}|{ThisPrefixRegex})\\s+)({DurationUnitRegex}))|((the|my))\\s+({RestrictedTimeUnitRegex}))"
          .replaceFirst("{NextPrefixRegex}", nextPrefixRegex)
          .replaceFirst("{PreviousPrefixRegex}", previousPrefixRegex)
          .replaceFirst("{ThisPrefixRegex}", thisPrefixRegex)
          .replaceFirst("{DurationUnitRegex}", durationUnitRegex)
          .replaceFirst("{RestrictedTimeUnitRegex}", restrictedTimeUnitRegex);

  static final String referenceDatePeriodRegex =
      "\\b{ReferencePrefixRegex}\\s+(?<duration>week(end)?|fortnight|month|year|decade)\\b"
          .replaceFirst("{ReferencePrefixRegex}", referencePrefixRegex);

  static final String connectorRegex = "^(-|,|for|t|around|circa|@)\$";

  static final String fromToRegex = "(\\b(from).+(to|and|or)\\b.+)";

  static final String singleAmbiguousMonthRegex = "^(the\\s+)?(may|march)\$";

  static final String singleAmbiguousTermsRegex = "^(the\\s+)?(day|week|month|year)\$";

  static final String unspecificDatePeriodRegex = "^(week|fortnight|month|year)\$";

  static final String prepositionSuffixRegex = "\\b(on|in|at|around|circa|from|to)\$";

  static final String flexibleDayRegex = "(?<DayOfMonth>([A-Za-z]+\\s)?[A-Za-z\\d]+)";

  static final String forTheRegex =
      "\\b((((?<=\\bfor\\s+)the\\s+{FlexibleDayRegex})|((?<=\\bon\\s+)(the\\s+)?{FlexibleDayRegex}(?<=(st|nd|rd|th))))(?<end>\\s*(,|\\.(?!\\d)|!|\\?|\$)))"
          .replaceFirst("{FlexibleDayRegex}", flexibleDayRegex);

  static final String weekDayAndDayOfMonthRegex = "\\b{WeekDayRegex}\\s+(the\\s+{FlexibleDayRegex})\\b"
      .replaceFirst("{WeekDayRegex}", weekDayRegex)
      .replaceFirst("{FlexibleDayRegex}", flexibleDayRegex);

  static final String weekDayAndDayRegex =
      "\\b{WeekDayRegex}\\s+(?!(the)){DayRegex}(?!([-:]|(\\s+({AmDescRegex}|{PmDescRegex}|{OclockRegex}))))\\b"
          .replaceFirst("{WeekDayRegex}", weekDayRegex)
          .replaceFirst("{DayRegex}", dayRegex)
          .replaceFirst("{AmDescRegex}", amDescRegex)
          .replaceFirst("{PmDescRegex}", pmDescRegex)
          .replaceFirst("{OclockRegex}", oclockRegex);

  static final String restOfDateRegex =
      "\\b(rest|remaining)\\s+(of\\s+)?((the|my|this|current)\\s+)?(?<duration>week|fortnight|month|year|decade)\\b";

  static final String restOfDateTimeRegex =
      "\\b(rest|remaining)\\s+(of\\s+)?((the|my|this|current)\\s+)?(?<unit>day)\\b";

  static final String ambiguousRangeModifierPrefix = "(from)";

  static final String numberEndingPattern =
      "^(?:\\s+(?<meeting>meeting|appointment|conference|((skype|teams|zoom|facetime)\\s+)?call)\\s+to\\s+(?<newTime>{PeriodHourNumRegex}|{HourRegex})([\\.]?\$|(\\.,|,|!|\\?)))"
          .replaceFirst("{PeriodHourNumRegex}", periodHourNumRegex)
          .replaceFirst("{HourRegex}", HourRegex);

  static final String oneOnOneRegex = "\\b(1\\s*:\\s*1(?!\\d))|(one (on )?one|one\\s*-\\s*one|one\\s*:\\s*one)\\b";

  static final String laterEarlyPeriodRegex =
      "\\b(({PrefixPeriodRegex})\\s*\\b\\s*(?<suffix>{OneWordPeriodRegex}|(?<FourDigitYear>{BaseDateTime.fourDigitYearRegex}))|({UnspecificEndOfRangeRegex}))\\b"
          .replaceFirst("{PrefixPeriodRegex}", prefixPeriodRegex)
          .replaceFirst("{OneWordPeriodRegex}", oneWordPeriodRegex)
          .replaceFirst("{BaseDateTime.fourDigitYearRegex}", BaseDateTime.fourDigitYearRegex)
          .replaceFirst("{UnspecificEndOfRangeRegex}", unspecificEndOfRangeRegex);

  static final String weekWithWeekDayRangeRegex =
      "\\b((?<week>({NextPrefixRegex}|{PreviousPrefixRegex}|this)\\s+week)((\\s+between\\s+{WeekDayRegex}\\s+and\\s+{WeekDayRegex})|(\\s+from\\s+{WeekDayRegex}\\s+to\\s+{WeekDayRegex})))\\b"
          .replaceFirst("{NextPrefixRegex}", nextPrefixRegex)
          .replaceFirst("{PreviousPrefixRegex}", previousPrefixRegex)
          .replaceFirst("{WeekDayRegex}", weekDayRegex);

  static final String generalEndingRegex = "^\\s*((\\.,)|\\.|,|!|\\?)?\\s*\$";

  static final String middlePauseRegex = "\\s*(,)\\s*";

  static final String durationConnectorRegex = "^\\s*(?<connector>\\s+|and|,)\\s*\$";

  static final String prefixArticleRegex = "\\bthe\\s+";

  static final String orRegex = "\\s*((\\b|,\\s*)(or|and)\\b|,)\\s*";

  static final String specialYearTermsRegex = "\\b((({SpecialYearPrefixes}\\s+)?year)|(cy|(?<special>fy|sy)))"
      .replaceFirst("{SpecialYearPrefixes}", specialYearPrefixes);

  static final String yearPlusNumberRegex =
      "\\b({SpecialYearTermsRegex}\\s*((?<year>(\\d{2,4}))|{FullTextYearRegex}))\\b"
          .replaceFirst("{FullTextYearRegex}", fullTextYearRegex)
          .replaceFirst("{SpecialYearTermsRegex}", specialYearTermsRegex);

  static final String numberAsTimeRegex = "\\b({WrittenTimeRegex}|{PeriodHourNumRegex}|{BaseDateTime.HourRegex})\\b"
      .replaceFirst("{WrittenTimeRegex}", writtenTimeRegex)
      .replaceFirst("{PeriodHourNumRegex}", periodHourNumRegex)
      .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex);

  static final String timeBeforeAfterRegex =
      "\\b(((?<=\\b(before|no later than|by|after)\\s+)({WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex}|{MidTimeRegex}))|{MidTimeRegex})\\b"
          .replaceFirst("{WrittenTimeRegex}", writtenTimeRegex)
          .replaceFirst("{HourNumRegex}", hourNumRegex)
          .replaceFirst("{BaseDateTime.HourRegex}", BaseDateTime.hourRegex)
          .replaceFirst("{MidTimeRegex}", midTimeRegex);

  static final String dateNumberConnectorRegex = "^\\s*(?<connector>\\s+at)\\s*\$";

  static final String decadeRegex = "(?<decade>(?:nough|twen|thir|fou?r|fif|six|seven|eigh|nine)ties|two\\s+thousands)";

  static final String decadeWithCenturyRegex =
      "(the\\s+)?(((?<century>\\d|1\\d|2\\d)?(')?(?<decade>\\d0)(')?(\\s)?s\\b)|(({CenturyRegex}(\\s+|-)(and\\s+)?)?{DecadeRegex})|({CenturyRegex}(\\s+|-)(and\\s+)?(?<decade>tens|hundreds)))"
          .replaceFirst("{CenturyRegex}", centuryRegex)
          .replaceFirst("{DecadeRegex}", decadeRegex);

  static final String relativeDecadeRegex = "\\b((the\\s+)?{RelativeRegex}\\s+((?<number>[\\w,]+)\\s+)?decades?)\\b"
      .replaceFirst("{RelativeRegex}", relativeRegex);

  static final String yearPeriodRegex =
      "((((from|during|in)\\s+)?{YearRegex}\\s*({TillRegex})\\s*{YearRegex})|(((between)\\s+){YearRegex}\\s*({RangeConnectorRegex})\\s*{YearRegex}))"
          .replaceFirst("{YearRegex}", yearRegex)
          .replaceFirst("{TillRegex}", tillRegex)
          .replaceFirst("{RangeConnectorRegex}", rangeConnectorRegex);

  static final String strictTillRegex =
      "(?<till>\\b(to|(un)?till?|thru|through)\\b|{BaseDateTime.rangeConnectorSymbolRegex}(?!\\s*(h[1-2]|q[1-4])(?!(\\s+of|\\s*,\\s*))))"
          .replaceFirst("{BaseDateTime.rangeConnectorSymbolRegex}", BaseDateTime.rangeConnectorSymbolRegex);

  static final String strictRangeConnectorRegex =
      "(?<and>\\b(and|through|to)\\b|{BaseDateTime.rangeConnectorSymbolRegex}(?!\\s*(h[1-2]|q[1-4])(?!(\\s+of|\\s*,\\s*))))"
          .replaceFirst("{BaseDateTime.rangeConnectorSymbolRegex}", BaseDateTime.rangeConnectorSymbolRegex);

  static final String startMiddleEndRegex =
      "\\b((?<StartOf>((the\\s+)?(start|beginning)\\s+of\\s+)?)(?<MiddleOf>((the\\s+)?middle\\s+of\\s+)?)(?<EndOf>((the\\s+)?end\\s+of\\s+)?))";

  static final String complexDatePeriodRegex =
      "(?:((from|during|in)\\s+)?{StartMiddleEndRegex}(?<start>.+)\\s*({StrictTillRegex})\\s*{StartMiddleEndRegex}(?<end>.+)|((between)\\s+){StartMiddleEndRegex}(?<start>.+)\\s*({StrictRangeConnectorRegex})\\s*{StartMiddleEndRegex}(?<end>.+))"
          .replaceFirst("{StrictTillRegex}", strictTillRegex)
          .replaceFirst("{StrictRangeConnectorRegex}", strictRangeConnectorRegex)
          .replaceFirst("{StartMiddleEndRegex}", startMiddleEndRegex);

  static final String failFastRegex =
      "{BaseDateTime.deltaMinuteRegex}|\\b(?:{BaseDateTime.baseAmDescRegex}|{BaseDateTime.basePmDescRegex})|{BaseDateTime.baseAmPmDescRegex}|\\b(?:zero|{WrittenOneToNineRegex}|{WrittenElevenToNineteenRegex}|{WrittenTensRegex}|{WrittenMonthRegex}|{SeasonDescRegex}|{DecadeRegex}|centur(y|ies)|weekends?|quarters?|hal(f|ves)|yesterday|to(morrow|day|night)|tmr|noonish|\\d(-|——)?ish|((the\\s+\\w*)|\\d)(th|rd|nd|st)|(mid\\s*(-\\s*)?)?(night|morning|afternoon|day)s?|evenings?|noon|lunch(time)?|dinner(time)?|(day|night)time|overnight|dawn|dusk|sunset|hours?|hrs?|h|minutes?|mins?|seconds?|secs?|eo[dmy]|mardi[ -]?gras|birthday|eve|christmas|xmas|thanksgiving|halloween|yuandan|easter|yuan dan|april fools|cinco de mayo|all (hallow|souls)|guy fawkes|(st )?patrick|hundreds?|noughties|aughts|thousands?)\\b|{WeekDayRegex}|{SetWeekDayRegex}|{NowRegex}|{PeriodicRegex}|\\b({DateUnitRegex}|{ImplicitDayRegex})"
          .replaceFirst("{BaseDateTime.deltaMinuteRegex}", BaseDateTime.deltaMinuteRegex)
          .replaceFirst("{BaseDateTime.baseAmDescRegex}", BaseDateTime.baseAmDescRegex)
          .replaceFirst("{BaseDateTime.basePmDescRegex}", BaseDateTime.basePmDescRegex)
          .replaceFirst("{BaseDateTime.baseAmPmDescRegex}", BaseDateTime.baseAmPmDescRegex)
          .replaceFirst("{ImplicitDayRegex}", implicitDayRegex)
          .replaceFirst("{DateUnitRegex}", dateUnitRegex)
          .replaceFirst("{WeekDayRegex}", weekDayRegex)
          .replaceFirst("{SetWeekDayRegex}", setWeekDayRegex)
          .replaceFirst("{NowRegex}", nowRegex)
          .replaceFirst("{PeriodicRegex}", periodicRegex)
          .replaceFirst("{DecadeRegex}", decadeRegex)
          .replaceFirst("{SeasonDescRegex}", seasonDescRegex)
          .replaceFirst("{WrittenMonthRegex}", writtenMonthRegex)
          .replaceFirst("{WrittenTensRegex}", writtenTensRegex)
          .replaceFirst("{WrittenElevenToNineteenRegex}", writtenElevenToNineteenRegex)
          .replaceFirst("{WrittenOneToNineRegex}", writtenOneToNineRegex);

  static final String tasksModeSupressionRegexes =
      "({AmPmDescRegex}|{TasksModeSpecialDescRegex}|{TasksModeHolidayListSupression}|{DecadeRegex}|{DecadeWithCenturyRegex}|{QuarterRegex}|{QuarterRegexYearFront}|{AllHalfYearRegex}|{SeasonRegex})"
          .replaceFirst("{AmPmDescRegex}", amPmDescRegex)
          .replaceFirst("{TasksModeSpecialDescRegex}", tasksModeSpecialDescRegex)
          .replaceFirst("{TasksModeHolidayListSupression}", tasksModeHolidayListSupression)
          .replaceFirst("{DecadeRegex}", decadeRegex)
          .replaceFirst("{DecadeWithCenturyRegex}", decadeWithCenturyRegex)
          .replaceFirst("{QuarterRegex}", quarterRegex)
          .replaceFirst("{QuarterRegexYearFront}", quarterRegexYearFront)
          .replaceFirst("{AllHalfYearRegex}", allHalfYearRegex)
          .replaceFirst("{SeasonRegex}", seasonRegex);

  static final String tasksModeNextPrefix = "(?<next>next\\s+)";

  static final String tasksModeDurationToDatePatterns =
      "\\b({TasksModeNextPrefix}((?<week>week)|(?<month>month)|(?<year>year)))\\b"
          .replaceFirst("{TasksModeNextPrefix}", tasksModeNextPrefix);

  static final unitMap = <String, String>{
    "decades": "10Y",
    "decade": "10Y",
    "years": "Y",
    "year": "Y",
    "y": "Y",
    "months": "MON",
    "month": "MON",
    "m": "M",
    "quarters": "3MON",
    "quarter": "3MON",
    "semesters": "6MON",
    "semestres": "6MON",
    "semester": "6MON",
    "semestre": "6MON",
    "weeks": "W",
    "week": "W",
    "w": "W",
    "weekends": "WE",
    "weekend": "WE",
    "fortnights": "2W",
    "fortnight": "2W",
    "weekdays": "D",
    "weekday": "D",
    "days": "D",
    "day": "D",
    "d": "D",
    "nights": "D",
    "night": "D",
    "hours": "H",
    "hour": "H",
    "hrs": "H",
    "hr": "H",
    "h": "H",
    "minutes": "M",
    "minute": "M",
    "mins": "M",
    "min": "M",
    "seconds": "S",
    "second": "S",
    "secs": "S",
    "sec": "S",
  };

  static final unitValueMap = <String, int>{
    "decades": 315360000,
    "decade": 315360000,
    "years": 31536000,
    "year": 31536000,
    "y": 31536000,
    "months": 2592000,
    "month": 2592000,
    "m": 2592000,
    "fortnights": 1209600,
    "fortnight": 1209600,
    "weekends": 172800,
    "weekend": 172800,
    "weeks": 604800,
    "week": 604800,
    "w": 604800,
    "days": 86400,
    "day": 86400,
    "d": 86400,
    "nights": 86400,
    "night": 86400,
    "hours": 3600,
    "hour": 3600,
    "hrs": 3600,
    "hr": 3600,
    "h": 3600,
    "minutes": 60,
    "minute": 60,
    "mins": 60,
    "min": 60,
    "seconds": 1,
    "second": 1,
    "secs": 1,
    "sec": 1,
  };

  static final specialYearPrefixesMap = <String, String>{
    "fiscal": "FY",
    "school": "SY",
    "fy": "FY",
    "sy": "SY",
  };

  static final seasonMap = <String, String>{
    "spring": "SP",
    "summer": "SU",
    "fall": "FA",
    "autumn": "FA",
    "winter": "WI",
  };

  static final seasonValueMap = <String, int>{
    "SP": 3,
    "SU": 6,
    "FA": 9,
    "WI": 12,
  };

  static final cardinalMap = <String, int>{
    "first": 1,
    "1st": 1,
    "second": 2,
    "2nd": 2,
    "third": 3,
    "3rd": 3,
    "fourth": 4,
    "4th": 4,
    "fifth": 5,
    "5th": 5,
    "sixth": 6,
    "6th": 6,
    "seventh": 7,
    "7th": 7,
    "eighth": 8,
    "8th": 8,
    "ninth": 9,
    "9th": 9,
    "tenth": 10,
    "10th": 10,
    "eleventh": 11,
    "11th": 11,
    "twelfth": 12,
    "12th": 12,
  };

  static final dayOfWeek = <String, int>{
    "monday": 1,
    "tuesday": 2,
    "wednesday": 3,
    "thursday": 4,
    "friday": 5,
    "saturday": 6,
    "sunday": 0,
    "mon": 1,
    "tue": 2,
    "tues": 2,
    "wed": 3,
    "wedn": 3,
    "weds": 3,
    "thu": 4,
    "thur": 4,
    "thurs": 4,
    "fri": 5,
    "sat": 6,
    "sun": 0,
  };

  static final monthOfYear = <String, int>{
    "january": 1,
    "february": 2,
    "march": 3,
    "april": 4,
    "may": 5,
    "june": 6,
    "july": 7,
    "august": 8,
    "september": 9,
    "october": 10,
    "november": 11,
    "december": 12,
    "jan": 1,
    "feb": 2,
    "mar": 3,
    "apr": 4,
    "jun": 6,
    "jul": 7,
    "aug": 8,
    "sep": 9,
    "sept": 9,
    "oct": 10,
    "nov": 11,
    "dec": 12,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "10": 10,
    "11": 11,
    "12": 12,
    "01": 1,
    "02": 2,
    "03": 3,
    "04": 4,
    "05": 5,
    "06": 6,
    "07": 7,
    "08": 8,
    "09": 9,
  };

  static final numbers = <String, int>{
    "zero": 0,
    "one": 1,
    "a": 1,
    "an": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9,
    "ten": 10,
    "eleven": 11,
    "twelve": 12,
    "thirteen": 13,
    "fourteen": 14,
    "fifteen": 15,
    "sixteen": 16,
    "seventeen": 17,
    "eighteen": 18,
    "nineteen": 19,
    "twenty": 20,
    "twenty one": 21,
    "twenty two": 22,
    "twenty three": 23,
    "twenty four": 24,
    "twenty five": 25,
    "twenty six": 26,
    "twenty seven": 27,
    "twenty eight": 28,
    "twenty nine": 29,
    "thirty": 30,
    "thirty one": 31,
    "thirty two": 32,
    "thirty three": 33,
    "thirty four": 34,
    "thirty five": 35,
    "thirty six": 36,
    "thirty seven": 37,
    "thirty eight": 38,
    "thirty nine": 39,
    "forty": 40,
    "forty one": 41,
    "forty two": 42,
    "forty three": 43,
    "forty four": 44,
    "forty five": 45,
    "forty six": 46,
    "forty seven": 47,
    "forty eight": 48,
    "forty nine": 49,
    "fifty": 50,
    "fifty one": 51,
    "fifty two": 52,
    "fifty three": 53,
    "fifty four": 54,
    "fifty five": 55,
    "fifty six": 56,
    "fifty seven": 57,
    "fifty eight": 58,
    "fifty nine": 59,
    "sixty": 60,
    "sixty one": 61,
    "sixty two": 62,
    "sixty three": 63,
    "sixty four": 64,
    "sixty five": 65,
    "sixty six": 66,
    "sixty seven": 67,
    "sixty eight": 68,
    "sixty nine": 69,
    "seventy": 70,
    "seventy one": 71,
    "seventy two": 72,
    "seventy three": 73,
    "seventy four": 74,
    "seventy five": 75,
    "seventy six": 76,
    "seventy seven": 77,
    "seventy eight": 78,
    "seventy nine": 79,
    "eighty": 80,
    "eighty one": 81,
    "eighty two": 82,
    "eighty three": 83,
    "eighty four": 84,
    "eighty five": 85,
    "eighty six": 86,
    "eighty seven": 87,
    "eighty eight": 88,
    "eighty nine": 89,
    "ninety": 90,
    "ninety one": 91,
    "ninety two": 92,
    "ninety three": 93,
    "ninety four": 94,
    "ninety five": 95,
    "ninety six": 96,
    "ninety seven": 97,
    "ninety eight": 98,
    "ninety nine": 99,
    "one hundred": 100,
  };

  static final dayOfMonth = <String, int>{
    "1st": 1,
    "1th": 1,
    "2nd": 2,
    "2th": 2,
    "3rd": 3,
    "3th": 3,
    "4th": 4,
    "5th": 5,
    "6th": 6,
    "7th": 7,
    "8th": 8,
    "9th": 9,
    "10th": 10,
    "11th": 11,
    "11st": 11,
    "12th": 12,
    "12nd": 12,
    "13th": 13,
    "13rd": 13,
    "14th": 14,
    "15th": 15,
    "16th": 16,
    "17th": 17,
    "18th": 18,
    "19th": 19,
    "20th": 20,
    "21st": 21,
    "21th": 21,
    "22nd": 22,
    "22th": 22,
    "23rd": 23,
    "23th": 23,
    "24th": 24,
    "25th": 25,
    "26th": 26,
    "27th": 27,
    "28th": 28,
    "29th": 29,
    "30th": 30,
    "31st": 31,
    "01st": 1,
    "01th": 1,
    "02nd": 2,
    "02th": 2,
    "03rd": 3,
    "03th": 3,
    "04th": 4,
    "05th": 5,
    "06th": 6,
    "07th": 7,
    "08th": 8,
    "09th": 9,
  };

  static final doubleNumbers = <String, double>{
    "half": 0.5,
    "quarter": 0.25,
  };

  static final holidayNames = <String, List<String>>{
    "easterday": ["easterday", "easter", "eastersunday"],
    "ashwednesday": ["ashwednesday"],
    "palmsunday": ["palmsunday"],
    "maundythursday": ["maundythursday"],
    "goodfriday": ["goodfriday"],
    "eastersaturday": ["eastersaturday"],
    "eastermonday": ["eastermonday"],
    "ascensionday": ["ascensionday"],
    "whitesunday": ["whitesunday", "pentecost", "pentecostday"],
    "whitemonday": ["whitemonday"],
    "trinitysunday": ["trinitysunday"],
    "corpuschristi": ["corpuschristi"],
    "earthday": ["earthday"],
    "fathers": ["fatherday", "fathersday"],
    "mothers": ["motherday", "mothersday"],
    "thanksgiving": ["thanksgivingday", "thanksgiving"],
    "blackfriday": ["blackfriday"],
    "cybermonday": ["cybermonday"],
    "martinlutherking": ["mlkday", "martinlutherkingday", "martinlutherkingjrday"],
    "washingtonsbirthday": ["washingtonsbirthday", "washingtonbirthday", "presidentsday"],
    "canberra": ["canberraday"],
    "labour": ["labourday", "laborday"],
    "columbus": ["columbusday"],
    "memorial": ["memorialday"],
    "yuandan": ["yuandan"],
    "maosbirthday": ["maosbirthday"],
    "teachersday": ["teachersday", "teacherday"],
    "singleday": ["singleday"],
    "allsaintsday": ["allsaintsday"],
    "youthday": ["youthday"],
    "childrenday": ["childrenday", "childday"],
    "femaleday": ["femaleday"],
    "treeplantingday": ["treeplantingday"],
    "arborday": ["arborday"],
    "girlsday": ["girlsday"],
    "whiteloverday": ["whiteloverday"],
    "loverday": ["loverday", "loversday"],
    "christmas": ["christmasday", "christmas"],
    "xmas": ["xmasday", "xmas"],
    "newyear": ["newyear"],
    "newyearday": ["newyearday"],
    "newyearsday": ["newyearsday"],
    "inaugurationday": ["inaugurationday"],
    "groundhougday": ["groundhougday"],
    "valentinesday": ["valentinesday"],
    "stpatrickday": ["stpatrickday", "stpatricksday", "stpatrick"],
    "aprilfools": ["aprilfools"],
    "stgeorgeday": ["stgeorgeday"],
    "mayday": ["mayday", "intlworkersday", "internationalworkersday", "workersday"],
    "cincodemayoday": ["cincodemayoday"],
    "baptisteday": ["baptisteday"],
    "usindependenceday": ["usindependenceday"],
    "independenceday": ["independenceday"],
    "bastilleday": ["bastilleday"],
    "halloweenday": ["halloweenday", "halloween"],
    "allhallowday": ["allhallowday"],
    "allsoulsday": ["allsoulsday"],
    "guyfawkesday": ["guyfawkesday"],
    "veteransday": ["veteransday"],
    "christmaseve": ["christmaseve"],
    "newyeareve": ["newyearseve", "newyeareve"],
    "juneteenth": ["juneteenth", "freedomday", "jubileeday"],
    "ramadan": ["ramadan", "ramazan", "ramzan", "ramadhan", "ramathan"],
    "sacrifice": ["eidaladha", "eidalazha", "eidulazha", "feastofthesacrifice"],
    "islamicnewyear": ["islamicnewyear", "hijrinewyear", "arabicnewyear"],
    "eidalfitr": ["eidalfitr", "festivalofbreakingthefast"],
  };

  static final writtenDecades = <String, int>{
    "hundreds": 0,
    "tens": 10,
    "twenties": 20,
    "thirties": 30,
    "forties": 40,
    "fifties": 50,
    "sixties": 60,
    "seventies": 70,
    "eighties": 80,
    "nineties": 90,
  };

  static final specialDecadeCases = <String, int>{
    "noughties": 2000,
    "aughts": 2000,
    "two thousands": 2000,
  };

  static final defaultLanguageFallback = "MDY";

  static final superfluousWordList = ["preferably", "how about", "maybe", "perhaps", "say", "like"];

  static final durationDateRestrictions = ["today", "now", "current date"];

  static final ambiguityFiltersDict = <String, String>{
    "^\\d{4}\$": "(\\d\\.\\d{4}|\\d{4}\\.\\d)",
    "^(morning|afternoon|evening|night|day)\\b":
        "\\b(good\\s+(morning|afternoon|evening|night|day))|(nighty\\s+night)\\b",
    "\\bnow\\b": "\\b(^now,)|\\b((is|are)\\s+now\\s+for|for\\s+now)\\b",
    "\\bmay\$":
        "\\b((((!|\\.|\\?|,|;|)\\s+|^)may i)|(i|you|he|she|we|they)\\s+may|(may\\s+((((also|not|(also not)|well)\\s+)?(be|ask|contain|constitute|e-?mail|take|have|result|involve|get|work|reply|differ))|(or may not)))|(?<!(in|during|through)\\s+)may,? at (its|h(is|er)|y?our|my))\\b",
    "^(a|one) second\$":
        "\\b(?<!an?\\s+)(a|one) second (round|time|wave|turn|chance|thought|opinion|cycle|take|meaning|life|job|home|hand|language|display|monitor|stimulus|dose|vaccination|shot|jab)\\b",
    "\\b(breakfast|brunch|lunch(time)?|dinner(time)?|supper)\$":
        "(?<!\\b(at|before|after|around|circa)\\b\\s)(breakfast|brunch|lunch|dinner|supper)(?!\\s*time)",
    "^\\d+m\$": "^\\d+m\$",
    "^(apr|aug|dec|feb|jan|jul|jun|mar|may|nov|oct|sept?)\$":
        "([\$%£&!?@#])(apr|aug|dec|feb|jan|jul|jun|mar|may|nov|oct|sept?)|(apr|aug|dec|feb|jan|jul|jun|mar|may|nov|oct|sept?)([\$%£&@#])",
    "^(to\\s+date)\$": "\\b((equals?|up)\\s+to\\s+date)\\b",
    "^\\d{1,4}-\\d{1,4}\$": "\\d{1,4}-\\d{1,4}-\\d|\\d-\\d{1,4}-\\d{1,4}",
    "^\\d{1,4}-\\d{1,4}-\\d{1,4}\$": "\\d{1,4}-\\d{1,4}-\\d{1,4}-\\d|\\d-\\d{1,4}-\\d{1,4}-\\d{1,4}",
  };

  static final ambiguityTimeFiltersDict = <String, String>{
    "^(\\p{L}+|\\d{1,2})(\\s+(morning|afternoon|evening|night))?\$":
        "\\b(one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|\\d{1,2})\\s+(morning|afternoon|evening|night)\\b",
  };

  static final ambiguityDurationFiltersDict = <String, String>{
    "night\$": "\\bnight(\\s*|-)(club|light|market|shift|work(er)?)s?\\b",
  };

  static final morningTermList = ["morning"];

  static final afternoonTermList = ["afternoon"];

  static final eveningTermList = ["evening"];

  static final mealtimeBreakfastTermList = ["breakfast"];

  static final mealtimeBrunchTermList = ["brunch"];

  static final mealtimeLunchTermList = ["lunch", "lunchtime"];

  static final mealtimeDinnerTermList = ["dinner", "dinnertime", "supper"];

  static final daytimeTermList = ["daytime"];

  static final nightTermList = ["night"];

  static final nighttimeTermList = ["nighttime", "night-time"];

  static final sameDayTerms = ["today", "current date", "otd"];

  static final plusOneDayTerms = ["tomorrow", "tmr", "tmrw", "day after"];

  static final minusOneDayTerms = ["yesterday", "day before"];

  static final plusTwoDayTerms = ["day after tomorrow", "day after tmr", "day after tmrw"];

  static final minusTwoDayTerms = ["day before yesterday"];

  static final futureTerms = ["this", "next"];

  static final lastCardinalTerms = ["last"];

  static final monthTerms = ["month"];

  static final monthToDateTerms = ["month to date"];

  static final weekendTerms = ["weekend"];

  static final weekTerms = ["week"];

  static final fortnightTerms = ["fortnight", "fourtenight"];

  static final yearTerms = ["year"];

  static final genericYearTerms = ["y"];

  static final yearToDateTerms = ["year to date"];

  static final doubleMultiplierRegex = "^(bi)(-|\\s)?";

  static final halfMultiplierRegex = "^(semi)(-|\\s)?";

  static final dayTypeRegex = "((week)?da(il)?ys?)\$";

  static final weekTypeRegex = "(week(s|ly)?)\$";

  static final weekendTypeRegex = "(weekends?)\$";

  static final monthTypeRegex = "(month(s|ly)?)\$";

  static final quarterTypeRegex = "(quarter(s|ly)?)\$";

  static final yearTypeRegex = "((years?|annual)(ly)?)\$";
}
