// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class EnglishDateTime {
  static final String LangMarker = "Eng";

  static final bool CheckBothBeforeAfter = false;

  static final String TillRegex =
      r"(?<till>\b(to|(un)?till?|thru|through)\b(\s+the\b)?|{BaseDateTime.RangeConnectorSymbolRegex})"
          .replaceAll("{BaseDateTime.RangeConnectorSymbolRegex}", BaseDateTime.RangeConnectorSymbolRegex);

  static final String RangeConnectorRegex =
      r"(?<and>\b(and|through|to)\b(\s+the\b)?|{BaseDateTime.RangeConnectorSymbolRegex})"
          .replaceAll("{BaseDateTime.RangeConnectorSymbolRegex}", BaseDateTime.RangeConnectorSymbolRegex);

  static final String LastNegPrefix =
      r"(?<!(w(ill|ould|on\s*'\s*t)|m(ay|ight|ust)|sh(all|ould(n\s*'\s*t)?)|c(an(\s*'\s*t|not)?|ould(n\s*'\s*t)?))(\s+not)?\s+)";

  static final String RelativeRegex =
      r"\b(?<order>following|next|(up)?coming|this|{LastNegPrefix}last|past|previous|current|the)\b"
          .replaceAll("{LastNegPrefix}", LastNegPrefix);

  static final String StrictRelativeRegex =
      r"\b(?<order>following|next|(up)?coming|this|{LastNegPrefix}last|past|previous|current)\b"
          .replaceAll("{LastNegPrefix}", LastNegPrefix);

  static final String UpcomingPrefixRegex = r"((this\s+)?((up)?coming))";

  static final String NextPrefixRegex =
      r"\b(following|next|{UpcomingPrefixRegex})\b".replaceAll("{UpcomingPrefixRegex}", UpcomingPrefixRegex);

  static final String AfterNextSuffixRegex = r"\b(after\s+(the\s+)?next)\b";

  static final String PastPrefixRegex = r"((this\s+)?past)\b";

  static final String PreviousPrefixRegex = r"({LastNegPrefix}last|previous|{PastPrefixRegex})\b"
      .replaceAll("{LastNegPrefix}", LastNegPrefix)
      .replaceAll("{PastPrefixRegex}", PastPrefixRegex);

  static final String ThisPrefixRegex = r"(this|current)\b";

  static final String RangePrefixRegex = r"(from|between)";

  static final String CenturySuffixRegex = r"(^century)\b";

  static final String ReferencePrefixRegex = r"(that|same)\b";

  static final String FutureSuffixRegex = r"\b((in\s+the\s+)?future|hence)\b";

  static final String PastSuffixRegex = r"\b((in\s+the\s+)past)\b";

  static final String DayRegex =
      r"(the\s*)?(?<!(\d:|\$)\s*|\d)(?<day>(?:3[0-1]|[1-2]\d|0?[1-9])(?:th|nd|rd|st)?)(?=\b|t)";

  static final String ImplicitDayRegex = r"(the\s*)?(?<day>(?:3[0-1]|[0-2]?\d)(?:th|nd|rd|st))\b";

  static final String MonthNumRegex = r"(?<month>1[0-2]|(0)?[1-9])\b";

  static final String WrittenOneToNineRegex = r"(?:one|two|three|four|five|six|seven|eight|nine)";

  static final String WrittenElevenToNineteenRegex = r"(?:eleven|twelve|(?:thir|four|fif|six|seven|eigh|nine)teen)";

  static final String WrittenTensRegex = r"(?:ten|twenty|thirty|fou?rty|fifty|sixty|seventy|eighty|ninety)";

  static final String WrittenNumRegex =
      r"(?:{WrittenOneToNineRegex}|{WrittenElevenToNineteenRegex}|{WrittenTensRegex}(\s+{WrittenOneToNineRegex})?)"
          .replaceAll("{WrittenOneToNineRegex}", WrittenOneToNineRegex)
          .replaceAll("{WrittenElevenToNineteenRegex}", WrittenElevenToNineteenRegex)
          .replaceAll("{WrittenTensRegex}", WrittenTensRegex);

  static final String WrittenOneToNineOrdinalRegex =
      r"(?:first|second|third|fourth|fifth|sixth|seventh|eighth|nine?th)";

  static final String WrittenTensOrdinalRegex =
      r"(?:tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth|eighteenth|nineteenth|twentieth|thirtieth|fortieth|fiftieth|sixtieth|seventieth|eightieth|ninetieth)";

  static final String WrittenOrdinalRegex =
      r"(?:{WrittenOneToNineOrdinalRegex}|{WrittenTensOrdinalRegex}|{WrittenTensRegex}\s+{WrittenOneToNineOrdinalRegex})"
          .replaceAll("{WrittenOneToNineOrdinalRegex}", WrittenOneToNineOrdinalRegex)
          .replaceAll("{WrittenTensOrdinalRegex}", WrittenTensOrdinalRegex)
          .replaceAll("{WrittenTensRegex}", WrittenTensRegex);

  static final String WrittenOrdinalDayRegex =
      r"\b(the\s+)?(?<day>(?<ordinal>{WrittenOneToNineOrdinalRegex}|(?:tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth|eighteenth|nineteenth|twentieth|thirtieth)|(?:ten|twenty)\s+{WrittenOneToNineOrdinalRegex}|thirty\s+first))\b"
          .replaceAll("{WrittenOneToNineOrdinalRegex}", WrittenOneToNineOrdinalRegex);

  static final String WrittenCenturyFullYearRegex =
      r"(?:(one|two)\s+thousand((\s+and)?\s+{WrittenOneToNineRegex}\s+hundred)?)"
          .replaceAll("{WrittenOneToNineRegex}", WrittenOneToNineRegex);

  static final String WrittenCenturyOrdinalYearRegex =
      r"(?:twenty(\s+(one|two))?|ten|eleven|twelve|thirteen|fifteen|eighteen|(?:four|six|seven|nine)(teen)?|one|two|three|five|eight)";

  static final String CenturyRegex =
      r"\b(?<century>{WrittenCenturyFullYearRegex}|{WrittenCenturyOrdinalYearRegex}(\s+hundred)?)\b"
          .replaceAll("{WrittenCenturyFullYearRegex}", WrittenCenturyFullYearRegex)
          .replaceAll("{WrittenCenturyOrdinalYearRegex}", WrittenCenturyOrdinalYearRegex);

  static final String LastTwoYearNumRegex =
      r"(?:(zero\s+)?{WrittenOneToNineRegex}|{WrittenElevenToNineteenRegex}|{WrittenTensRegex}(\s+{WrittenOneToNineRegex})?)"
          .replaceAll("{WrittenOneToNineRegex}", WrittenOneToNineRegex)
          .replaceAll("{WrittenElevenToNineteenRegex}", WrittenElevenToNineteenRegex)
          .replaceAll("{WrittenTensRegex}", WrittenTensRegex);

  static final String FullTextYearRegex =
      r"\b((?<firsttwoyearnum>{CenturyRegex})(\s+and)?\s+(?<lasttwoyearnum>{LastTwoYearNumRegex})\b|\b(?<firsttwoyearnum>{WrittenCenturyFullYearRegex}|{WrittenCenturyOrdinalYearRegex}\s+hundred))\b"
          .replaceAll("{CenturyRegex}", CenturyRegex)
          .replaceAll("{WrittenCenturyFullYearRegex}", WrittenCenturyFullYearRegex)
          .replaceAll("{WrittenCenturyOrdinalYearRegex}", WrittenCenturyOrdinalYearRegex)
          .replaceAll("{LastTwoYearNumRegex}", LastTwoYearNumRegex);

  static final String OclockRegex = r"(?<oclock>o\s*((’|‘|')\s*)?clock|sharp)";

  static final String SpecialDescRegex = r"((?<ipm>)p\b)";

  static final String TasksModeSpecialDescRegex = r"([0-9]+((?<ipm>)p\b))";

  static final String AmDescRegex =
      r"(?:{BaseDateTime.BaseAmDescRegex})".replaceAll("{BaseDateTime.BaseAmDescRegex}", BaseDateTime.BaseAmDescRegex);

  static final String PmDescRegex =
      r"(:?{BaseDateTime.BasePmDescRegex})".replaceAll("{BaseDateTime.BasePmDescRegex}", BaseDateTime.BasePmDescRegex);

  static final String AmPmDescRegex = r"(:?{BaseDateTime.BaseAmPmDescRegex})"
      .replaceAll("{BaseDateTime.BaseAmPmDescRegex}", BaseDateTime.BaseAmPmDescRegex);

  static final String DescRegex =
      r"(:?(:?({OclockRegex}\s+)?(?<desc>({AmPmDescRegex}|{AmDescRegex}|{PmDescRegex}|{SpecialDescRegex})))|{OclockRegex})"
          .replaceAll("{OclockRegex}", OclockRegex)
          .replaceAll("{AmDescRegex}", AmDescRegex)
          .replaceAll("{PmDescRegex}", PmDescRegex)
          .replaceAll("{AmPmDescRegex}", AmPmDescRegex)
          .replaceAll("{SpecialDescRegex}", SpecialDescRegex);

  static final String OfPrepositionRegex = r"(\bof\b)";

  static final String TwoDigitYearRegex =
      r"\b(?<![$])(?<year>([0-9]\d))(?!(\s*((\:\d)|{AmDescRegex}|{PmDescRegex}|\.\d)))\b"
          .replaceAll("{AmDescRegex}", AmDescRegex)
          .replaceAll("{PmDescRegex}", PmDescRegex);

  static final String YearRegex = r"(?:{BaseDateTime.FourDigitYearRegex}|{FullTextYearRegex})"
      .replaceAll("{BaseDateTime.FourDigitYearRegex}", BaseDateTime.FourDigitYearRegex)
      .replaceAll("{FullTextYearRegex}", FullTextYearRegex);

  static final String WeekDayRegex =
      r"\b(?<weekday>(?:sun|mon|tues?|thurs?|fri)(day)?|thu|wedn(esday)?|weds?|sat(urday)?)s?\b";

  static final String SingleWeekDayRegex =
      r"\b(?<weekday>(?<!(easter|palm)\s+)sunday|(?<!easter\s+)saturday|(?<!(easter|cyber)\s+)monday|mon|(?<!black\s+)friday|fri|(?:tues?|thurs?)(day)?|thu|wedn(esday)?|weds?|((?<=on\s+)(sat|sun)))\b";

  static final String RelativeMonthRegex =
      r"(?<relmonth>((day\s+)?of\s+)?{RelativeRegex}\s+month)\b".replaceAll("{RelativeRegex}", RelativeRegex);

  static final String MonthRegexNoWordBoundary =
      r"(?<month>apr(il)?|aug(ust)?|dec(ember)?|feb(ruary)?|jan(uary)?|july?|june?|mar(ch)?|may|nov(ember)?|oct(ober)?|sept(ember)?|sep)(?!\p{L})";

  static final String MonthRegex =
      r"\b{MonthRegexNoWordBoundary}".replaceAll("{MonthRegexNoWordBoundary}", MonthRegexNoWordBoundary);

  static final String WrittenMonthRegex =
      r"(((the\s+)?month of\s+)?{MonthRegex})".replaceAll("{MonthRegex}", MonthRegex);

  static final String MonthSuffixRegex = r"(?<msuf>(?:(in|of|on)\s+)?({RelativeMonthRegex}|{WrittenMonthRegex}))"
      .replaceAll("{RelativeMonthRegex}", RelativeMonthRegex)
      .replaceAll("{WrittenMonthRegex}", WrittenMonthRegex);

  static final String DateUnitRegex =
      r"(?<unit>(decade|y(ea)?(r)?|(?<uoy>month|week)|(?<business>(business\s+|week\s*))?(?<uoy>day)|fortnight|weekend)(?<plural>s)?|(?<=(^|\s)\d{1,4})[ymwd])\b";
  // ^ Added support for "ys", "yr", "yrs"
  //
  // Original is below:
  // r"(?<unit>(decade|year|(?<uoy>month|week)|(?<business>(business\s+|week\s*))?(?<uoy>day)|fortnight|weekend)(?<plural>s)?|(?<=(^|\s)\d{1,4})[ymwd])\b";

  static final String DateTokenPrefix = "on ";

  static final String TimeTokenPrefix = "at ";

  static final String TokenBeforeDate = "on ";

  static final String TokenBeforeTime = "at ";

  static final String HalfTokenRegex = r"^(half)";

  static final String QuarterTokenRegex = r"^((a\s+)?quarter)";

  static final String ThreeQuarterTokenRegex = r"^(three\s+quarters?)";

  static final String ToTokenRegex = r"\b(to)$";

  static final String FromRegex = r"\b(from(\s+the)?)$";

  static final String BetweenTokenRegex = r"\b(between(\s+the)?)$";

  static final String SimpleCasesRegex =
      r"\b({RangePrefixRegex}\s+)?({DayRegex}|{WrittenOrdinalDayRegex})\s*{TillRegex}\s*(({DayRegex}|{WrittenOrdinalDayRegex})\s+{MonthSuffixRegex}|{MonthSuffixRegex}\s+({DayRegex}|{WrittenOrdinalDayRegex}))((\s+|\s*,\s*){YearRegex})?\b"
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{TillRegex}", TillRegex)
          .replaceAll("{MonthSuffixRegex}", MonthSuffixRegex)
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RangePrefixRegex}", RangePrefixRegex)
          .replaceAll("{WrittenOrdinalDayRegex}", WrittenOrdinalDayRegex);

  static final String MonthFrontSimpleCasesRegex =
      r"\b({RangePrefixRegex}\s+)?{MonthSuffixRegex}\s+((from)\s+)?({DayRegex}|{WrittenOrdinalDayRegex})\s*{TillRegex}\s*({DayRegex}|{WrittenOrdinalDayRegex})((\s+|\s*,\s*){YearRegex})?\b"
          .replaceAll("{MonthSuffixRegex}", MonthSuffixRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{TillRegex}", TillRegex)
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RangePrefixRegex}", RangePrefixRegex)
          .replaceAll("{WrittenOrdinalDayRegex}", WrittenOrdinalDayRegex);

  static final String MonthFrontBetweenRegex =
      r"\b{MonthSuffixRegex}\s+(between\s+)({DayRegex}|{WrittenOrdinalDayRegex})\s*{RangeConnectorRegex}\s*({DayRegex}|{WrittenOrdinalDayRegex})((\s+|\s*,\s*){YearRegex})?\b"
          .replaceAll("{MonthSuffixRegex}", MonthSuffixRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{RangeConnectorRegex}", RangeConnectorRegex)
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{WrittenOrdinalDayRegex}", WrittenOrdinalDayRegex);

  static final String BetweenRegex =
      r"\b(between\s+)({DayRegex}|{WrittenOrdinalDayRegex})\s*{RangeConnectorRegex}\s*({DayRegex}|{WrittenOrdinalDayRegex})\s+{MonthSuffixRegex}((\s+|\s*,\s*){YearRegex})?\b"
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{RangeConnectorRegex}", RangeConnectorRegex)
          .replaceAll("{MonthSuffixRegex}", MonthSuffixRegex)
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{WrittenOrdinalDayRegex}", WrittenOrdinalDayRegex);

  static final String MonthWithYear =
      r"\b((({WrittenMonthRegex}[\.]?|((the\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|sixth|6th|seventh|7th|eighth|8th|ninth|9th|tenth|10th|eleventh|11th|twelfth|12th|last)\s+month(?=\s+(of|in))))((\s*)[/\\\-\.,]?(\s+(of|in))?(\s*)({YearRegex}|(?<order>following|next|last|this)\s+year)|\s+(of|in)\s+{TwoDigitYearRegex}))|(({YearRegex}|(?<order>following|next|last|this)\s+year)(\s*),?(\s*){WrittenMonthRegex}))\b"
          .replaceAll("{WrittenMonthRegex}", WrittenMonthRegex)
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{TwoDigitYearRegex}", TwoDigitYearRegex);

  static final String SpecialYearPrefixes = r"(calendar|(?<special>fiscal|school))";

  static final String OneWordPeriodRegex =
      r"\b((((the\s+)?month of\s+)?({StrictRelativeRegex}\s+)?{MonthRegex})|(month|year) to date|(?<toDate>((un)?till?|to)\s+date)|({RelativeRegex}\s+)?(my\s+)?((?<business>working\s+week|workweek)|week(end)?|month|fortnight|(({SpecialYearPrefixes}\s+)?year))(?!((\s+of)?\s+\d+(?!({BaseDateTime.BaseAmDescRegex}|{BaseDateTime.BasePmDescRegex}))|\s+to\s+date))(\s+{AfterNextSuffixRegex})?)\b"
          .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex)
          .replaceAll("{AfterNextSuffixRegex}", AfterNextSuffixRegex)
          .replaceAll("{SpecialYearPrefixes}", SpecialYearPrefixes)
          .replaceAll("{BaseDateTime.BaseAmDescRegex}", BaseDateTime.BaseAmDescRegex)
          .replaceAll("{BaseDateTime.BasePmDescRegex}", BaseDateTime.BasePmDescRegex)
          .replaceAll("{MonthRegex}", MonthRegex);

  static final String MonthNumWithYear =
      r"\b(({BaseDateTime.FourDigitYearRegex}(\s*)[/\-\.](\s*){MonthNumRegex})|({MonthNumRegex}(\s*)[/\-](\s*){BaseDateTime.FourDigitYearRegex}))\b"
          .replaceAll("{BaseDateTime.FourDigitYearRegex}", BaseDateTime.FourDigitYearRegex)
          .replaceAll("{MonthNumRegex}", MonthNumRegex);

  static final String WeekOfMonthRegex =
      r"\b(?<wom>(the\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|last)\s+week\s+{MonthSuffixRegex}(\s+{BaseDateTime.FourDigitYearRegex}|{RelativeRegex}\s+year)?)\b"
          .replaceAll("{MonthSuffixRegex}", MonthSuffixRegex)
          .replaceAll("{BaseDateTime.FourDigitYearRegex}", BaseDateTime.FourDigitYearRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex);

  static final String WeekOfYearRegex =
      r"\b(?<woy>(the\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|last)\s+week(\s+of)?\s+({YearRegex}|{RelativeRegex}\s+year))\b"
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex);

  static final String OfYearRegex = r"\b((of|in)\s+({YearRegex}|{StrictRelativeRegex}\s+year))\b"
      .replaceAll("{YearRegex}", YearRegex)
      .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex);

  static final String FirstLastRegex = r"\b(the\s+)?((?<first>first)|(?<last>last))\b";

  static final String FollowedDateUnit = r"^\s*{DateUnitRegex}".replaceAll("{DateUnitRegex}", DateUnitRegex);

  static final String NumberCombinedWithDateUnit =
      r"\b(?<num>\d+(\.\d*)?){DateUnitRegex}".replaceAll("{DateUnitRegex}", DateUnitRegex);

  static final String QuarterTermRegex =
      r"\b(((?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th)[ -]+quarter)|(q(?<number>[1-4])))\b";

  static final String RelativeQuarterTermRegex =
      r"\b(?<orderQuarter>{StrictRelativeRegex})\s+((?<num>[\w,]+)\s+)?quarters?\b"
          .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex);

  static final String QuarterRegex =
      r"((the\s+)?{QuarterTermRegex}(?:((\s+of)?\s+|\s*[,-]\s*)({YearRegex}|{RelativeRegex}\s+year))?)|{RelativeQuarterTermRegex}"
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex)
          .replaceAll("{QuarterTermRegex}", QuarterTermRegex)
          .replaceAll("{RelativeQuarterTermRegex}", RelativeQuarterTermRegex);

  static final String QuarterRegexYearFront =
      r"(?:{YearRegex}|{RelativeRegex}\s+year)('s)?(?:\s*-\s*|\s+(the\s+)?)?{QuarterTermRegex}"
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex)
          .replaceAll("{QuarterTermRegex}", QuarterTermRegex);

  static final String HalfYearTermRegex = r"(?<cardinal>first|1st|second|2nd)\s+half";

  static final String HalfYearFrontRegex =
      r"(?<year>((1[5-9]|20)\d{2})|2100)(\s*-\s*|\s+(the\s+)?)?h(?<number>[1-2])".replaceAll("{YearRegex}", YearRegex);

  static final String HalfYearBackRegex =
      r"(the\s+)?(h(?<number>[1-2])|({HalfYearTermRegex}))(\s+of|\s*,\s*)?\s+({YearRegex})"
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{HalfYearTermRegex}", HalfYearTermRegex);

  static final String HalfYearRelativeRegex = r"(the\s+)?{HalfYearTermRegex}(\s+of|\s*,\s*)?\s+({RelativeRegex}\s+year)"
      .replaceAll("{RelativeRegex}", RelativeRegex)
      .replaceAll("{HalfYearTermRegex}", HalfYearTermRegex);

  static final String AllHalfYearRegex = r"({HalfYearFrontRegex})|({HalfYearBackRegex})|({HalfYearRelativeRegex})"
      .replaceAll("{HalfYearFrontRegex}", HalfYearFrontRegex)
      .replaceAll("{HalfYearBackRegex}", HalfYearBackRegex)
      .replaceAll("{HalfYearRelativeRegex}", HalfYearRelativeRegex);

  static final String EarlyPrefixRegex =
      r"\b(?<EarlyPrefix>early|beginning of|start of|(?<RelEarly>earlier(\s+in)?))\b";

  static final String MidPrefixRegex = r"\b(?<MidPrefix>mid-?|middle of)\b";

  static final String LaterPrefixRegex = r"\b(?<LatePrefix>late|end of|(?<RelLate>later(\s+in)?))\b";

  static final String PrefixPeriodRegex = r"({EarlyPrefixRegex}|{MidPrefixRegex}|{LaterPrefixRegex})"
      .replaceAll("{EarlyPrefixRegex}", EarlyPrefixRegex)
      .replaceAll("{MidPrefixRegex}", MidPrefixRegex)
      .replaceAll("{LaterPrefixRegex}", LaterPrefixRegex);

  static final String PrefixDayRegex =
      r"\b((?<EarlyPrefix>earl(y|ier))|(?<MidPrefix>mid(dle)?)|(?<LatePrefix>later?))(\s+in)?(\s+the\s+day)?$";

  static final String SeasonDescRegex = r"(?<seas>spring|summer|fall|autumn|winter)";

  static final String SeasonRegex =
      r"\b(?<season>({PrefixPeriodRegex}\s+)?({RelativeRegex}\s+)?{SeasonDescRegex}((\s+of|\s*,\s*)?\s+({YearRegex}|{RelativeRegex}\s+year))?)\b"
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex)
          .replaceAll("{SeasonDescRegex}", SeasonDescRegex)
          .replaceAll("{PrefixPeriodRegex}", PrefixPeriodRegex);

  static final String WhichWeekRegex =
      r"\b(week)(\s*)(?<number>5[0-3]|[1-4]\d|0?[1-9])(\s+of\s+({YearRegex}|{RelativeRegex}\s+year))?\b"
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex);

  static final String WeekOfRegex = r"(the\s+)?((week)(\s+(of|(commencing|starting|beginning)(\s+on)?))|w/c)(\s+the)?";

  static final String MonthOfRegex = r"(month)(\s*)(of)";

  static final String DateYearRegex =
      r"(?<year>{BaseDateTime.FourDigitYearRegex}|(?<!,\s?){TwoDigitYearRegex}|{TwoDigitYearRegex}(?=(\.(?!\d)|[?!;]|$)))"
          .replaceAll("{BaseDateTime.FourDigitYearRegex}", BaseDateTime.FourDigitYearRegex)
          .replaceAll("{TwoDigitYearRegex}", TwoDigitYearRegex);

  static final String YearSuffix = r"((,|\sof)?\s*({DateYearRegex}|{FullTextYearRegex}))"
      .replaceAll("{DateYearRegex}", DateYearRegex)
      .replaceAll("{FullTextYearRegex}", FullTextYearRegex);

  static final String OnRegex = r"(?<=\bon\s+)({DayRegex}s?)\b".replaceAll("{DayRegex}", DayRegex);

  static final String RelaxedOnRegex = r"(?<=\b(on|at|in)\s+)((?<day>(3[0-1]|[0-2]?\d)(?:th|nd|rd|st))s?)\b";

  static final String PrefixWeekDayRegex = r"(\s*((,?\s*on)|[-—–]))";

  static final String ThisRegex =
      r"\b(this(\s*week{PrefixWeekDayRegex}?)?\s*{WeekDayRegex})|({WeekDayRegex}((\s+of)?\s+this\s*week))\b"
          .replaceAll("{WeekDayRegex}", WeekDayRegex)
          .replaceAll("{PrefixWeekDayRegex}", PrefixWeekDayRegex);

  static final String LastDateRegex =
      r"\b({PreviousPrefixRegex}(\s*week{PrefixWeekDayRegex}?)?\s*{WeekDayRegex})|({WeekDayRegex}(\s+(of\s+)?last\s*week))\b"
          .replaceAll("{PreviousPrefixRegex}", PreviousPrefixRegex)
          .replaceAll("{WeekDayRegex}", WeekDayRegex)
          .replaceAll("{PrefixWeekDayRegex}", PrefixWeekDayRegex);

  static final String NextDateRegex =
      r"\b({NextPrefixRegex}(\s*week{PrefixWeekDayRegex}?)?\s*{WeekDayRegex})|((on\s+)?{WeekDayRegex}((\s+of)?\s+(the\s+following|(the\s+)?next)\s*week))\b"
          .replaceAll("{NextPrefixRegex}", NextPrefixRegex)
          .replaceAll("{WeekDayRegex}", WeekDayRegex)
          .replaceAll("{PrefixWeekDayRegex}", PrefixWeekDayRegex);

  static final String SpecialDayRegex =
      r"\b((the\s+)?day before yesterday|(the\s+)?day after (tomorrow|tmrw?)|the\s+day\s+(before|after)(?!=\s+day)|((the\s+)?({RelativeRegex}|my)\s+day)|yesterday|tomorrow|tmrw?|today|otd|current date)\b"
          .replaceAll("{RelativeRegex}", RelativeRegex);

  static final String SpecialDayWithNumRegex =
      r"\b((?<number>{WrittenNumRegex})\s+days?\s+from\s+(?<day>yesterday|tomorrow|tmrw?|today|current date))\b"
          .replaceAll("{WrittenNumRegex}", WrittenNumRegex);

  static final String RelativeDayRegex =
      r"\b(((the\s+)?{RelativeRegex}\s+day))\b".replaceAll("{RelativeRegex}", RelativeRegex);

  static final String SetWeekDayRegex =
      r"\b(?<prefix>on\s+)?(?<weekday>morning|afternoon|evening|night|(sun|mon|tues|wednes|thurs|fri|satur)day)s\b";

  static final String WeekDayOfMonthRegex =
      r"(?<wom>(the\s+)?(?<cardinal>first|1st|second|2nd|third|3rd|fourth|4th|fifth|5th|last)\s+(week\s+{MonthSuffixRegex}[\.]?\s+(on\s+)?{WeekDayRegex}|{WeekDayRegex}\s+{MonthSuffixRegex}))"
          .replaceAll("{WeekDayRegex}", WeekDayRegex)
          .replaceAll("{MonthSuffixRegex}", MonthSuffixRegex);

  static final String RelativeWeekDayRegex = r"\b({WrittenNumRegex}\s+{WeekDayRegex}\s+(from\s+now|later))\b"
      .replaceAll("{WrittenNumRegex}", WrittenNumRegex)
      .replaceAll("{WeekDayRegex}", WeekDayRegex);

  static final String SpecialDate = r"(?=\b(on|at)\s+the\s+){DayRegex}\b".replaceAll("{DayRegex}", DayRegex);

  static final String DatePreposition = r"\b(on|in)";

  static final String DateExtractorYearTermRegex =
      r"(\s+|\s*[/\\.,-]\s*|\s+of\s+){DateYearRegex}".replaceAll("{DateYearRegex}", DateYearRegex);

  static final String DayPrefix = r"\b({WeekDayRegex}|{SpecialDayRegex})\b"
      .replaceAll("{WeekDayRegex}", WeekDayRegex)
      .replaceAll("{SpecialDayRegex}", SpecialDayRegex);

  static final String DateExtractor1 =
      r"\b({DayPrefix}\s*[,-]?\s*)?(({MonthRegex}[\.]?\s*[/\\.,-]?\s*{DayRegex})|(\({MonthRegex}\s*[-./]\s*{DayRegex}\)))(?!\s*\-\s*\d{2}\b)(\s*\(\s*{DayPrefix}\s*\))?({DateExtractorYearTermRegex}\b)?"
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{MonthRegex}", MonthRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{DateExtractorYearTermRegex}", DateExtractorYearTermRegex);

  static final String DateExtractor3 =
      r"\b({DayPrefix}(\s+|\s*,\s*))?({DayRegex}?[\.]?(\s+|\s*[-,/]\s*|\s+of\s+|\s*)(\b)?{MonthRegexNoWordBoundary}[\.]?((\s+in)?{DateExtractorYearTermRegex})?|{BaseDateTime.FourDigitYearRegex}\s*[-./]?\s*(the\s+)?(?<day>(?:3[0-1]|[1-2]\d|0?[1-9])(?:th|nd|rd|st)?)[\.]?(\s+|\s*[-,/]\s*|\s+of\s+){MonthRegex}[\.]?)\b"
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{MonthRegex}", MonthRegex)
          .replaceAll("{DateExtractorYearTermRegex}", DateExtractorYearTermRegex)
          .replaceAll("{BaseDateTime.FourDigitYearRegex}", BaseDateTime.FourDigitYearRegex)
          .replaceAll("{MonthRegexNoWordBoundary}", MonthRegexNoWordBoundary);

  static final String DateExtractor4 = r"\b{MonthNumRegex}\s*[/\\\-]\s*{DayRegex}[\.]?\s*[/\\\-]\s*{DateYearRegex}"
      .replaceAll("{MonthNumRegex}", MonthNumRegex)
      .replaceAll("{DayRegex}", DayRegex)
      .replaceAll("{DateYearRegex}", DateYearRegex);

  static final String DateExtractor5 =
      r"\b({DayPrefix}(\s*,)?\s+)?{DayRegex}\s*[/\\\-\.]\s*({MonthNumRegex}|{MonthRegex})\s*[/\\\-\.]\s*{DateYearRegex}(?!\s*[/\\\-\.]\s*\d+)"
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{MonthRegex}", MonthRegex)
          .replaceAll("{DateYearRegex}", DateYearRegex);

  static final String DateExtractor6 =
      r"(?<={DatePreposition}\s+)({StrictRelativeRegex}\s+)?({DayPrefix}\s+)?{MonthNumRegex}[\-\.]{DayRegex}(?![%]){BaseDateTime.CheckDecimalRegex}\b"
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{DatePreposition}", DatePreposition)
          .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex)
          .replaceAll("{BaseDateTime.CheckDecimalRegex}", BaseDateTime.CheckDecimalRegex);

  static final String DateExtractor7L =
      r"\b({DayPrefix}(\s*,)?\s+)?{MonthNumRegex}\s*/\s*{DayRegex}{DateExtractorYearTermRegex}(?![%])\b"
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{DateExtractorYearTermRegex}", DateExtractorYearTermRegex);

  static final String DateExtractor7S =
      r"\b({DayPrefix}(\s*,)?\s+)?{MonthNumRegex}\s*/\s*{DayRegex}(?![%]){BaseDateTime.CheckDecimalRegex}\b"
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{BaseDateTime.CheckDecimalRegex}", BaseDateTime.CheckDecimalRegex);

  static final String DateExtractor8 =
      r"(?<={DatePreposition}\s+)({StrictRelativeRegex}\s+)?({DayPrefix}\s+)?{DayRegex}[\\\-]{MonthNumRegex}(?![%]){BaseDateTime.CheckDecimalRegex}\b"
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{DatePreposition}", DatePreposition)
          .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex)
          .replaceAll("{BaseDateTime.CheckDecimalRegex}", BaseDateTime.CheckDecimalRegex);

  static final String DateExtractor9L =
      r"\b({DayPrefix}(\s*,)?\s+)?{DayRegex}\s*/\s*{MonthNumRegex}{DateExtractorYearTermRegex}(?![%])\b"
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{DateExtractorYearTermRegex}", DateExtractorYearTermRegex);

  static final String DateExtractor9S =
      r"\b({DayPrefix}(\s*,)?\s+)?{DayRegex}\s*/\s*{MonthNumRegex}{BaseDateTime.CheckDecimalRegex}(?![%])\b"
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{BaseDateTime.CheckDecimalRegex}", BaseDateTime.CheckDecimalRegex);

  static final String DateExtractorNoSep =
      r"\b((?<![$])(?<year>((1\d|20)\d{2})|2100)(\s+(?<month>1[0-2]|(0)?[1-9])\s+(?<day>(?:3[0-1]|[1-2]\d|0?[1-9]))|(?<month>1[0-2]|(0)?[1-9])(?<day>(?:3[0-1]|[1-2]\d|0?[1-9])))\b)";

  static final String DateExtractorA =
      r"\b({DayPrefix}(\s*,)?\s+)?(({BaseDateTime.FourDigitYearRegex}\s*[/\\\-\.]\s*({MonthNumRegex}|{MonthRegex})\s*[/\\\-\.]\s*{DayRegex})|({MonthRegex}\s*[/\\\-\.]\s*{BaseDateTime.FourDigitYearRegex}\s*[/\\\-\.]\s*(the\s+)?(?<day>(?:3[0-1]|[1-2]\d|0?[1-9])(?:th|nd|rd|st)?))|({DayRegex}\s*[/\\\-\.]\s*{BaseDateTime.FourDigitYearRegex}\s*[/\\\-\.]\s*{MonthRegex})|{DateExtractorNoSep})"
          .replaceAll("{BaseDateTime.FourDigitYearRegex}", BaseDateTime.FourDigitYearRegex)
          .replaceAll("{MonthNumRegex}", MonthNumRegex)
          .replaceAll("{MonthRegex}", MonthRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{DayPrefix}", DayPrefix)
          .replaceAll("{DateExtractorNoSep}", DateExtractorNoSep);

  static final String OfMonth = r"^(\s*(day\s+)?of)?\s*{MonthRegex}".replaceAll("{MonthRegex}", MonthRegex);

  static final String MonthEnd = r"{MonthRegex}\s*(the)?\s*$".replaceAll("{MonthRegex}", MonthRegex);

  static final String WeekDayEnd = r"(this\s+)?{WeekDayRegex}\s*,?\s*$".replaceAll("{WeekDayRegex}", WeekDayRegex);

  static final String WeekDayStart = r"^\s+(on\s+)?{WeekDayRegex}\b".replaceAll("{WeekDayRegex}", WeekDayRegex);

  static final String RangeUnitRegex = r"\b(?<unit>years?|months?|weeks?|fortnights?)\b";

  static final String HourNumRegex =
      r"\b(?<hournum>zero|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)\b";

  static final String MinuteNumRegex =
      r"(((?<tens>twenty|thirty|fou?rty|fifty)(\s*-?\s*))?(?<minnum>one|two|three|four|five|six|seven|eight|nine)|(?<minnum>ten|eleven|twelve|thirteen|fifteen|eighteen|(four|six|seven|nine)(teen)|twenty|thirty|forty|fifty))";

  static final String DeltaMinuteNumRegex =
      r"(((?<tens>twenty|thirty|fou?rty|fifty)(\s*-?\s*))?(?<deltaminnum>one|two|three|four|five|six|seven|eight|nine)|(?<deltaminnum>ten|eleven|twelve|thirteen|fifteen|eighteen|(four|six|seven|nine)(teen)|twenty|thirty|forty|fifty))";

  static final String PmRegex =
      r"(?<pm>(((?:at|in|around|circa|on|for)\s+(the\s+)?)?(((early|late)\s+)?(afternoon|evening)|midnight|lunchtime))|((at|in|around|on|for)\s+(the\s+)?night))";

  static final String PmRegexFull =
      r"(?<pm>((?:at|in|around|circa|on|for)\s+(the\s+)?)?(((early|late)\s+)?(afternoon|evening)|(mid)?night|lunchtime))";

  static final String AmRegex = r"(?<am>((?:at|in|around|circa|on|for)\s+(the\s+)?)?((early|late)\s+)?(morning))";

  static final String LunchRegex = r"\blunchtime\b";

  static final String NightRegex = r"\b(mid)?night\b";

  static final String CommonDatePrefixRegex = r"^[\.]";

  static final String LessThanOneHour =
      r"(?<lth>(a\s+)?quarter|three quarter(s)?|half( an hour)?|{BaseDateTime.DeltaMinuteRegex}(\s+(minutes?|mins?)|(?=\s+past))|{DeltaMinuteNumRegex}(\s+(minutes?|mins?)|(?=\s+past)))"
          .replaceAll("{BaseDateTime.DeltaMinuteRegex}", BaseDateTime.DeltaMinuteRegex)
          .replaceAll("{DeltaMinuteNumRegex}", DeltaMinuteNumRegex);

  static final String WrittenTimeRegex = r"(?<writtentime>{HourNumRegex}\s+{MinuteNumRegex}(\s+(minutes?|mins?))?)"
      .replaceAll("{HourNumRegex}", HourNumRegex)
      .replaceAll("{MinuteNumRegex}", MinuteNumRegex);

  static final String TimePrefix =
      r"(?<prefix>{LessThanOneHour}\s+(past|to))".replaceAll("{LessThanOneHour}", LessThanOneHour);

  static final String TimeSuffix = r"(?<suffix>{AmRegex}|{PmRegex}|{OclockRegex})"
      .replaceAll("{AmRegex}", AmRegex)
      .replaceAll("{PmRegex}", PmRegex)
      .replaceAll("{OclockRegex}", OclockRegex);

  static final String TimeSuffixFull = r"(?<suffix>{AmRegex}|{PmRegexFull}|{OclockRegex})"
      .replaceAll("{AmRegex}", AmRegex)
      .replaceAll("{PmRegexFull}", PmRegexFull)
      .replaceAll("{OclockRegex}", OclockRegex);

  static final String BasicTime =
      r"\b(?<basictime>{WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex}:{BaseDateTime.MinuteRegex}(:{BaseDateTime.SecondRegex})?|{BaseDateTime.HourRegex}(?![%\d]))"
          .replaceAll("{WrittenTimeRegex}", WrittenTimeRegex)
          .replaceAll("{HourNumRegex}", HourNumRegex)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{BaseDateTime.MinuteRegex}", BaseDateTime.MinuteRegex)
          .replaceAll("{BaseDateTime.SecondRegex}", BaseDateTime.SecondRegex);

  static final String MidnightRegex = r"(?<midnight>mid\s*(-\s*)?night)";

  static final String MidmorningRegex = r"(?<midmorning>mid\s*(-\s*)?morning)";

  static final String MidafternoonRegex = r"(?<midafternoon>mid\s*(-\s*)?afternoon)";

  static final String MiddayRegex = r"(?<midday>mid\s*(-\s*)?day|((12\s)?noon))";

  static final String MidTimeRegex = r"(?<mid>({MidnightRegex}|{MidmorningRegex}|{MidafternoonRegex}|{MiddayRegex}))"
      .replaceAll("{MidnightRegex}", MidnightRegex)
      .replaceAll("{MidmorningRegex}", MidmorningRegex)
      .replaceAll("{MidafternoonRegex}", MidafternoonRegex)
      .replaceAll("{MiddayRegex}", MiddayRegex);

  static final String AtRegex =
      r"\b(?:(?:(?<=\b(at|(at)?\s*around|circa)\s+)(?:{WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex}(?!\.\d)(\s*((?<iam>a)|(?<ipm>p)))?|{MidTimeRegex}))|{MidTimeRegex})\b"
          .replaceAll("{WrittenTimeRegex}", WrittenTimeRegex)
          .replaceAll("{HourNumRegex}", HourNumRegex)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{MidTimeRegex}", MidTimeRegex);

  static final String IshRegex = r"\b({BaseDateTime.HourRegex}(-|——)?ish|noon(ish)?)\b"
      .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex);

  static final String TimeUnitRegex = r"([^a-z]{1,}|\b)(?<unit>(h(ou)?r|min(ute)?|sec(ond)?)(?<plural>s)?|h)\b";

  static final String RestrictedTimeUnitRegex = r"(?<unit>hour|minute)\b";

  static final String FivesRegex = r"(?<tens>(?:fifteen|(?:twen|thir|fou?r|fif)ty(\s*five)?|ten|five))\b";

  static final String HourRegex =
      r"\b{BaseDateTime.HourRegex}".replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex);

  static final String PeriodHourNumRegex =
      r"\b(?<hour>twenty(\s+(one|two|three|four))?|eleven|twelve|thirteen|fifteen|eighteen|(four|six|seven|nine)(teen)?|zero|one|two|three|five|eight|ten)\b";

  static final String ConnectNumRegex = r"\b{BaseDateTime.HourRegex}(?<min>[0-5][0-9])\s*{DescRegex}"
      .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
      .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegexWithDotConnector = r"({BaseDateTime.HourRegex}(\s*\.\s*){BaseDateTime.MinuteRegex})"
      .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
      .replaceAll("{BaseDateTime.MinuteRegex}", BaseDateTime.MinuteRegex);

  static final String TimeRegex1 =
      r"\b({TimePrefix}\s+)?({WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex})(\s*|[.]){DescRegex}"
          .replaceAll("{TimePrefix}", TimePrefix)
          .replaceAll("{WrittenTimeRegex}", WrittenTimeRegex)
          .replaceAll("{HourNumRegex}", HourNumRegex)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex2 =
      r"(\b{TimePrefix}\s+)?(t)?{BaseDateTime.HourRegex}(\s*)?:(\s*)?{BaseDateTime.MinuteRegex}((\s*)?:(\s*)?{BaseDateTime.SecondRegex})?(?<iam>a)?((\s*{DescRegex})|\b)"
          .replaceAll("{TimePrefix}", TimePrefix)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{BaseDateTime.MinuteRegex}", BaseDateTime.MinuteRegex)
          .replaceAll("{BaseDateTime.SecondRegex}", BaseDateTime.SecondRegex)
          .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex3 =
      r"(\b{TimePrefix}\s+)?{BaseDateTime.HourRegex}\.{BaseDateTime.MinuteRegex}(\s*{DescRegex})"
          .replaceAll("{TimePrefix}", TimePrefix)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{BaseDateTime.MinuteRegex}", BaseDateTime.MinuteRegex)
          .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex4 = r"\b{TimePrefix}\s+{BasicTime}(\s*{DescRegex})?\s+{TimeSuffix}\b"
      .replaceAll("{TimePrefix}", TimePrefix)
      .replaceAll("{BasicTime}", BasicTime)
      .replaceAll("{DescRegex}", DescRegex)
      .replaceAll("{TimeSuffix}", TimeSuffix);

  static final String TimeRegex5 = r"\b{TimePrefix}\s+{BasicTime}((\s*{DescRegex})|\b)"
      .replaceAll("{TimePrefix}", TimePrefix)
      .replaceAll("{BasicTime}", BasicTime)
      .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex6 = r"({BasicTime})(\s*{DescRegex})?\s+{TimeSuffix}\b"
      .replaceAll("{BasicTime}", BasicTime)
      .replaceAll("{DescRegex}", DescRegex)
      .replaceAll("{TimeSuffix}", TimeSuffix);

  static final String TimeRegex7 = r"\b{TimeSuffixFull}\s+(at\s+)?{BasicTime}((\s*{DescRegex})|\b)"
      .replaceAll("{TimeSuffixFull}", TimeSuffixFull)
      .replaceAll("{BasicTime}", BasicTime)
      .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex8 = r".^"
      .replaceAll("{TimeSuffixFull}", TimeSuffixFull)
      .replaceAll("{BasicTime}", BasicTime)
      .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex9 = r"\b{PeriodHourNumRegex}(\s+|-){FivesRegex}((\s*{DescRegex})|\b)"
      .replaceAll("{PeriodHourNumRegex}", PeriodHourNumRegex)
      .replaceAll("{FivesRegex}", FivesRegex)
      .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex10 =
      r"\b({TimePrefix}\s+)?{BaseDateTime.HourRegex}(\s*h\s*){BaseDateTime.MinuteRegex}(\s*{DescRegex})?"
          .replaceAll("{TimePrefix}", TimePrefix)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{BaseDateTime.MinuteRegex}", BaseDateTime.MinuteRegex)
          .replaceAll("{DescRegex}", DescRegex);

  static final String TimeRegex11 =
      r"\b((?:({TimeTokenPrefix})?{TimeRegexWithDotConnector}(\s*{DescRegex}))|(?:(?:{TimeTokenPrefix}{TimeRegexWithDotConnector})(?!\s*per\s*cent|%)))"
          .replaceAll("{TimeTokenPrefix}", TimeTokenPrefix)
          .replaceAll("{TimeRegexWithDotConnector}", TimeRegexWithDotConnector)
          .replaceAll("{DescRegex}", DescRegex);

  static final String FirstTimeRegexInTimeRange = r"\b{TimeRegexWithDotConnector}(\s*{DescRegex})?"
      .replaceAll("{TimeRegexWithDotConnector}", TimeRegexWithDotConnector)
      .replaceAll("{DescRegex}", DescRegex);

  static final String PureNumFromTo =
      r"({RangePrefixRegex}\s+)?({HourRegex}|{PeriodHourNumRegex})(\s*(?<leftDesc>{DescRegex}))?\s*{TillRegex}\s*({HourRegex}|{PeriodHourNumRegex})(?<rightDesc>\s*({PmRegex}|{AmRegex}|{DescRegex}))?"
          .replaceAll("{HourRegex}", HourRegex)
          .replaceAll("{PeriodHourNumRegex}", PeriodHourNumRegex)
          .replaceAll("{DescRegex}", DescRegex)
          .replaceAll("{TillRegex}", TillRegex)
          .replaceAll("{PmRegex}", PmRegex)
          .replaceAll("{AmRegex}", AmRegex)
          .replaceAll("{RangePrefixRegex}", RangePrefixRegex);

  static final String PureNumBetweenAnd =
      r"(between\s+)(({BaseDateTime.TwoDigitHourRegex}{BaseDateTime.TwoDigitMinuteRegex})|{HourRegex}|{PeriodHourNumRegex})(\s*(?<leftDesc>{DescRegex}))?\s*{RangeConnectorRegex}\s*(({BaseDateTime.TwoDigitHourRegex}{BaseDateTime.TwoDigitMinuteRegex})|{HourRegex}|{PeriodHourNumRegex})(?<rightDesc>\s*({PmRegex}|{AmRegex}|{DescRegex}))?"
          .replaceAll("{HourRegex}", HourRegex)
          .replaceAll("{PeriodHourNumRegex}", PeriodHourNumRegex)
          .replaceAll("{BaseDateTime.TwoDigitHourRegex}", BaseDateTime.TwoDigitHourRegex)
          .replaceAll("{BaseDateTime.TwoDigitMinuteRegex}", BaseDateTime.TwoDigitMinuteRegex)
          .replaceAll("{DescRegex}", DescRegex)
          .replaceAll("{PmRegex}", PmRegex)
          .replaceAll("{AmRegex}", AmRegex)
          .replaceAll("{RangeConnectorRegex}", RangeConnectorRegex);

  static final String SpecificTimeFromTo =
      r"({RangePrefixRegex}\s+)?(?<time1>(({TimeRegex2}|{FirstTimeRegexInTimeRange})|({HourRegex}|{PeriodHourNumRegex})(\s*(?<leftDesc>{DescRegex}))?))\s*{TillRegex}\s*(?<time2>(({TimeRegex2}|{TimeRegexWithDotConnector}(?<rightDesc>\s*{DescRegex}))|({HourRegex}|{PeriodHourNumRegex})(\s*(?<rightDesc>{DescRegex}))?))"
          .replaceAll("{TimeRegex2}", TimeRegex2)
          .replaceAll("{FirstTimeRegexInTimeRange}", FirstTimeRegexInTimeRange)
          .replaceAll("{TimeRegexWithDotConnector}", TimeRegexWithDotConnector)
          .replaceAll("{TillRegex}", TillRegex)
          .replaceAll("{HourRegex}", HourRegex)
          .replaceAll("{PeriodHourNumRegex}", PeriodHourNumRegex)
          .replaceAll("{DescRegex}", DescRegex)
          .replaceAll("{PmRegex}", PmRegex)
          .replaceAll("{AmRegex}", AmRegex)
          .replaceAll("{RangePrefixRegex}", RangePrefixRegex);

  static final String SpecificTimeBetweenAnd =
      r"(between\s+)(?<time1>(({TimeRegex2}|{FirstTimeRegexInTimeRange})|({HourRegex}|{PeriodHourNumRegex})(\s*(?<leftDesc>{DescRegex}))?))\s*{RangeConnectorRegex}\s*(?<time2>(({TimeRegex2}|{TimeRegexWithDotConnector}(?<rightDesc>\s*{DescRegex}))|({HourRegex}|{PeriodHourNumRegex})(\s*(?<rightDesc>{DescRegex}))?))"
          .replaceAll("{TimeRegex2}", TimeRegex2)
          .replaceAll("{FirstTimeRegexInTimeRange}", FirstTimeRegexInTimeRange)
          .replaceAll("{TimeRegexWithDotConnector}", TimeRegexWithDotConnector)
          .replaceAll("{RangeConnectorRegex}", RangeConnectorRegex)
          .replaceAll("{HourRegex}", HourRegex)
          .replaceAll("{PeriodHourNumRegex}", PeriodHourNumRegex)
          .replaceAll("{DescRegex}", DescRegex)
          .replaceAll("{PmRegex}", PmRegex)
          .replaceAll("{AmRegex}", AmRegex);

  static final String SuffixAfterRegex = r"\b(((at)\s)?(or|and)\s+(above|after|later|greater)(?!\s+than))\b";

  static final String PrepositionRegex = r"(?<prep>^(,\s*)?(at|on|of)(\s+the)?$)";

  static final String LaterEarlyRegex = r"((?<early>earl(y|ier)(\s+|-))|(?<late>late(r?\s+|-)))";

  static final String MealTimeRegex =
      r"\b(at\s+)?(?<mealTime>breakfast|brunch|lunch(\s*time)?|dinner(\s*time)?|supper)\b";

  static final String UnspecificTimePeriodRegex = r"({MealTimeRegex})".replaceAll("{MealTimeRegex}", MealTimeRegex);

  static final String TimeOfDayRegex =
      r"\b(?<timeOfDay>((((in\s+the\s+){LaterEarlyRegex}?(morning|afternoon|night(-?time)?|evening)s)|((in\s+the\s+)?{LaterEarlyRegex}?(in(\s+the)?\s+)?(morning|afternoon|night(-?time)?|evening)))|{MealTimeRegex}|(((in\s+(the)?\s+)?)(daytime|business\s+hours?))))\b"
          .replaceAll("{LaterEarlyRegex}", LaterEarlyRegex)
          .replaceAll("{MealTimeRegex}", MealTimeRegex);

  static final String SpecificTimeOfDayRegex =
      r"\b(({StrictRelativeRegex}\s+{TimeOfDayRegex})\b|\b(?<pm>toni(ght|te)))s?\b"
          .replaceAll("{TimeOfDayRegex}", TimeOfDayRegex)
          .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex);

  static final String TimeFollowedUnit = r"^\s*{TimeUnitRegex}".replaceAll("{TimeUnitRegex}", TimeUnitRegex);

  static final String TimeNumberCombinedWithUnit =
      r"\b(?<num>\d+(\.\d*)?){TimeUnitRegex}".replaceAll("{TimeUnitRegex}", TimeUnitRegex);

  static final List<String> BusinessHourSplitStrings = ["business", "hour"];

  static final String NowRegex =
      r"\b(?<now>(right\s+)?now|as\s+soon\s+as\s+possible|asap|recently|previously|at\s+(present|this\s+time|th(e|is)\s+minute|the\s+(moment|present\s+time)))\b";

  static final String NowParseRegex = r"\b({NowRegex}|^(date)$)\b".replaceAll("{NowRegex}", NowRegex);

  static final String SuffixRegex = r"^\s*(in the\s+)?(morning|afternoon|evening|night)\b";

  static final String NonTimeContextTokens = r"(building)";

  static final String DateTimeTimeOfDayRegex = r"\b(?<timeOfDay>morning|(?<pm>afternoon|night|evening))\b";

  static final String DateTimeSpecificTimeOfDayRegex =
      r"\b(({RelativeRegex}\s+{DateTimeTimeOfDayRegex})\b|\btoni(ght|te))\b"
          .replaceAll("{DateTimeTimeOfDayRegex}", DateTimeTimeOfDayRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex);

  static final String TimeOfTodayAfterRegex = r"^\s*(,\s*)?(in\s+)?{DateTimeSpecificTimeOfDayRegex}"
      .replaceAll("{DateTimeSpecificTimeOfDayRegex}", DateTimeSpecificTimeOfDayRegex);

  static final String TimeOfTodayBeforeRegex =
      r"{DateTimeSpecificTimeOfDayRegex}(\s*,)?(\s+(at|around|circa|in|on))?\s*$"
          .replaceAll("{DateTimeSpecificTimeOfDayRegex}", DateTimeSpecificTimeOfDayRegex);

  static final String SimpleTimeOfTodayAfterRegex =
      r"(?<!{NonTimeContextTokens}\s*)\b({HourNumRegex}|{BaseDateTime.HourRegex})\s*(,\s*)?(in\s+)?{DateTimeSpecificTimeOfDayRegex}\b"
          .replaceAll("{NonTimeContextTokens}", NonTimeContextTokens)
          .replaceAll("{HourNumRegex}", HourNumRegex)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{DateTimeSpecificTimeOfDayRegex}", DateTimeSpecificTimeOfDayRegex);

  static final String SimpleTimeOfTodayBeforeRegex =
      r"\b{DateTimeSpecificTimeOfDayRegex}(\s*,)?(\s+(at|around|circa))?\s*({HourNumRegex}|{BaseDateTime.HourRegex})\b"
          .replaceAll("{DateTimeSpecificTimeOfDayRegex}", DateTimeSpecificTimeOfDayRegex)
          .replaceAll("{HourNumRegex}", HourNumRegex)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex);

  static final String SpecificEndOfRegex = r"(the\s+)?end of(\s+the)?\s*$";

  static final String UnspecificEndOfRegex = r"\b(the\s+)?(eod|(end\s+of\s+day))\b";

  static final String UnspecificEndOfRangeRegex = r"\b(eoy)\b";

  static final String PeriodTimeOfDayRegex =
      r"\b((in\s+(the\s+)?)?{LaterEarlyRegex}?((this\s+)?{DateTimeTimeOfDayRegex}|(?<timeOfDay>(?<pm>tonight))))\b"
          .replaceAll("{DateTimeTimeOfDayRegex}", DateTimeTimeOfDayRegex)
          .replaceAll("{LaterEarlyRegex}", LaterEarlyRegex);

  static final String PeriodSpecificTimeOfDayRegex =
      r"\b({LaterEarlyRegex}?this\s+{DateTimeTimeOfDayRegex}|({StrictRelativeRegex}\s+{PeriodTimeOfDayRegex})\b|\b(?<pm>toni(ght|te)))\b"
          .replaceAll("{PeriodTimeOfDayRegex}", PeriodTimeOfDayRegex)
          .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex)
          .replaceAll("{DateTimeTimeOfDayRegex}", DateTimeTimeOfDayRegex)
          .replaceAll("{LaterEarlyRegex}", LaterEarlyRegex);

  static final String PeriodTimeOfDayWithDateRegex =
      r"\b(({PeriodTimeOfDayRegex}(\s+(on|of))?))\b".replaceAll("{PeriodTimeOfDayRegex}", PeriodTimeOfDayRegex);

  static final String TasksmodeMealTimeofDayRegex =
      r"\b((in\s+(the)?\s+)?((?<early>earl(y|ier)(\s+|-))|(?<late>late(r?\s+|-)))?((this\s+)?\b(?<timeOfDay>lunch(\s*time)?|dinner(\s*time)?|brunch|breakfast)\b))\b"
          .replaceAll("{DateTimeTimeOfDayRegex}", DateTimeTimeOfDayRegex)
          .replaceAll("{LaterEarlyRegex}", LaterEarlyRegex);

  static final String LessThanRegex = r"\b(less\s+than)\b";

  static final String MoreThanRegex = r"\b(more\s+than)\b";

  static final String DurationUnitRegex = r"(?<unit>{DateUnitRegex}|h(ou)?rs?|h|min(ute)?s?|sec(ond)?s?|nights?)\b"
      .replaceAll("{DateUnitRegex}", DateUnitRegex);

  static final String SuffixAndRegex = r"(?<suffix>\s*(and)\s+(an?\s+)?(?<suffix_num>half|quarter))";

  static final String PeriodicRegex =
      r"\b(?<periodic>((?<multiplier>semi|bi|tri)(\s*|-))?(daily|monthly|weekly|quarterly|yearly|annual(ly)?))\b";

  static final String EachUnitRegex =
      r"\b(?<each>(every|(each|any|once an|one a|once a)\s?)(?<other>\s+(other|alternate|second))?\s*({DurationUnitRegex}|(?<specialUnit>quarters?|weekends?)|{WeekDayRegex})|(?<specialUnit>weekends))"
          .replaceAll("{DurationUnitRegex}", DurationUnitRegex)
          .replaceAll("{WeekDayRegex}", WeekDayRegex);

  static final String EachPrefixRegex = r"\b(?<each>(each|every|once an?)\s*$)";

  static final String SetEachRegex = r"\b(?<each>(each|every)(?<other>\s+(other|alternate))?\s*)(?!the|that)\b";

  static final String SetLastRegex = r"(?<last>following|next|upcoming|this|{LastNegPrefix}last|past|previous|current)"
      .replaceAll("{LastNegPrefix}", LastNegPrefix);

  static final String EachDayRegex = r"^\s*(each|every)\s*day\b";

  static final String DurationFollowedUnit =
      r"(^\s*{DurationUnitRegex}\s+{SuffixAndRegex})|(^\s*{SuffixAndRegex}?(\s+|-)?{DurationUnitRegex})"
          .replaceAll("{SuffixAndRegex}", SuffixAndRegex)
          .replaceAll("{DurationUnitRegex}", DurationUnitRegex);

  static final String NumberCombinedWithDurationUnit =
      r"\b(?<num>\d+(\.\d*)?)(-)?{DurationUnitRegex}".replaceAll("{DurationUnitRegex}", DurationUnitRegex);

  static final String AnUnitRegex = r"(\b((?<half>(half)\s+)?an?|another)|(?<half>(1/2|½|half)))\s+{DurationUnitRegex}"
      .replaceAll("{DurationUnitRegex}", DurationUnitRegex);

  static final String DuringRegex = r"\b(for|during)\s+the\s+(?<unit>year|month|week|day|fortnight)\b";

  static final String AllRegex = r"\b(?<all>(all|full|whole)(\s+|-)(?<unit>year|month|week|day|fortnight))\b";

  static final String HalfRegex = r"((an?\s*)|\b)(?<half>half\s+(?<unit>year|month|week|fortnight|day|hour))\b";

  static final String ConjunctionRegex = r"\b((and(\s+for)?)|with)\b";

  static final String HolidayList1 =
      r"(?<holiday>mardi gras|(washington|mao)'s birthday|juneteenth|(jubilee|freedom)(\s+day)|chinese new year|(new\s+(years'|year\s*'s|years?)\s+eve)|(new\s+(years'|year\s*'s|years?)(\s+day)?)|may\s*day|yuan dan|christmas eve|(christmas|xmas)(\s+day)?|black friday|yuandan|easter(\s+(sunday|saturday|monday))?|clean monday|ash wednesday|palm sunday|maundy thursday|good friday|white\s+(sunday|monday)|trinity sunday|pentecost|corpus christi|cyber monday)";

  static final String HolidayList2 =
      r"(?<holiday>(thanks\s*giving|all saint's|white lover|s(?:ain)?t?(\.)?\s+(?:patrick|george)(?:')?(?:s)?|us independence|all hallow|all souls|guy fawkes|cinco de mayo|halloween|qingming|dragon boat|april fools|tomb\s*sweeping)(\s+day)?)";

  static final String HolidayList3 =
      r"(?<holiday>(?:independence|presidents(?:')?|mlk|martin luther king( jr)?|canberra|ascension|columbus|tree( planting)?|arbor|labou?r|((international|int'?l)\s+)?workers'?|mother'?s?|father'?s?|female|women('s)?|single|teacher'?s|youth|children|girls|lovers?|earth|inauguration|groundhog|valentine'?s|baptiste|bastille|veterans(?:')?|memorial|mid[ \-]autumn|moon|spring|lantern)\s+day)";

  static final String HolidayList4 =
      r"(?<holiday>ramad(h)?an|ram(a)?zan|ramathan|eid al(-|\s+)adha|eid al(-|\s+)azha|eidul(-|\s+)azha|feast of the sacrifice|(islamic|arabic|hijri) new year|eid al(-|\s+)fitr|festival of breaking the fast)";

  static final String HolidayRegex =
      r"\b(({StrictRelativeRegex}\s+({HolidayList1}|{HolidayList2}|{HolidayList3}|{HolidayList4}))|(?<holidayWeekend>((the\s+)?weekend\s+of\s+)({HolidayList1}|{HolidayList2}|{HolidayList3}|{HolidayList4})(\s+((of\s+)?({YearRegex}|{RelativeRegex}\s+year)))?)|(({HolidayList1}|{HolidayList2}|{HolidayList3}|{HolidayList4})((?<holidayWeekend>(\s+weekend)(\s+((of\s+)?({YearRegex}|{RelativeRegex}\s+year)))?)|(\s+(of\s+)?({YearRegex}|{RelativeRegex}\s+year)(?<holidayWeekend>\s+weekend)?))?))\b"
          .replaceAll("{HolidayList1}", HolidayList1)
          .replaceAll("{HolidayList2}", HolidayList2)
          .replaceAll("{HolidayList3}", HolidayList3)
          .replaceAll("{HolidayList4}", HolidayList4)
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{RelativeRegex}", RelativeRegex)
          .replaceAll("{StrictRelativeRegex}", StrictRelativeRegex);

  static final String TasksModeHolidayListSupression =
      r"(?<holiday>(?:independence|teacher'?s|youth|children|girls)\s+day)|(?<holiday>ramad(h)?an|ram(a)?zan|ramathan|eid al(-|\s+)adha|eid al(-|\s+)azha|eidul(-|\s+)azha|feast of the sacrifice|(islamic|arabic|hijri) new year|eid al(-|\s+)fitr|festival of breaking the fast)\b"
          .replaceAll("{HolidayList4}", HolidayList4);

  static final String AMTimeRegex = r"(?<am>morning)";

  static final String PMTimeRegex = r"\b(?<pm>afternoon|evening|night)\b";

  static final String NightTimeRegex = r"(night)";

  static final String NowTimeRegex =
      r"(now|at\s+(present|this\s+time|th(e|is)\s+minute|the\s+(moment|(current|present)\s+time)))";

  static final String RecentlyTimeRegex = r"(recently|previously)";

  static final String AsapTimeRegex = r"(as soon as possible|asap)";

  static final String InclusiveModPrepositions = r"(?<include>((on|in|at)\s+or\s+)|(\s+or\s+(on|in|at)))";

  static final String AroundRegex = r"(?:\b(?:around|circa)\s*?\b)(\s+the)?";

  static final String BeforeRegex =
      r"((\b{InclusiveModPrepositions}?(?:before|in\s+advance\s+of|prior\s+to|(no\s+later|earlier|sooner)\s+than|ending\s+(with|on)|by|(un)?till?|(?<include>as\s+late\s+as)){InclusiveModPrepositions}?\b\s*?)|(?<!\w|>)((?<include><\s*=)|<))(\s+the)?"
          .replaceAll("{InclusiveModPrepositions}", InclusiveModPrepositions);

  static final String AfterRegex =
      r"((\b{InclusiveModPrepositions}?((after(\s+on)?(?!\sfrom)|(?<!no\s+)later\s+than)|((year\s+)?greater\s+than))(?!\s+or\s+equal\s+to){InclusiveModPrepositions}?\b\s*?)|(?<!\w|<)((?<include>>\s*=)|>))(\s+the)?"
          .replaceAll("{InclusiveModPrepositions}", InclusiveModPrepositions);

  static final String SinceRegex =
      r"(?:(?:\b(?:since|after\s+or\s+equal\s+to|(starting|beginning)(\s)?(?:from|on|with)?|as\s+early\s+as|(any\s+time\s+)from)\b\s*?)|(?<!\w|<)(>=))(\s+the)?";

  static final String SinceRegexExp = r"({SinceRegex}|\bfrom(\s+the)?\b)".replaceAll("{SinceRegex}", SinceRegex);

  static final String AgoRegex = r"\b(ago|earlier|before\s+(?<day>yesterday|today))\b";

  static final String LaterRegex =
      r"\b(?:later(?!((\s+in)?\s*{OneWordPeriodRegex})|(\s+{TimeOfDayRegex})|\s+than\b)|from now|(from|after)\s+(?<day>tomorrow|tmrw?|today))\b"
          .replaceAll("{OneWordPeriodRegex}", OneWordPeriodRegex)
          .replaceAll("{TimeOfDayRegex}", TimeOfDayRegex);

  static final String BeforeAfterRegex = r"\b((?<before>before)|(?<after>from|after))\b";

  static final String ModPrefixRegex = r"\b({RelativeRegex}|{AroundRegex}|{BeforeRegex}|{AfterRegex}|{SinceRegex})\b"
      .replaceAll("{RelativeRegex}", RelativeRegex)
      .replaceAll("{AroundRegex}", AroundRegex)
      .replaceAll("{BeforeRegex}", BeforeRegex)
      .replaceAll("{AfterRegex}", AfterRegex)
      .replaceAll("{SinceRegex}", SinceRegex);

  static final String ModSuffixRegex =
      r"\b({AgoRegex}|{LaterRegex}|{BeforeAfterRegex}|{FutureSuffixRegex}|{PastSuffixRegex})\b"
          .replaceAll("{AgoRegex}", AgoRegex)
          .replaceAll("{LaterRegex}", LaterRegex)
          .replaceAll("{BeforeAfterRegex}", BeforeAfterRegex)
          .replaceAll("{FutureSuffixRegex}", FutureSuffixRegex)
          .replaceAll("{PastSuffixRegex}", PastSuffixRegex);

  static final String InConnectorRegex = r"\b(in)\b";

  static final String SinceYearSuffixRegex = r"(^\s*{SinceRegex}(\s*(the\s+)?year\s*)?{YearSuffix})"
      .replaceAll("{SinceRegex}", SinceRegex)
      .replaceAll("{YearSuffix}", YearSuffix);

  static final String WithinNextPrefixRegex =
      r"\b(within(\s+the)?(\s+(?<next>{NextPrefixRegex}))?)\b".replaceAll("{NextPrefixRegex}", NextPrefixRegex);

  static final String TodayNowRegex = r"\b(today|now|current (date|time))\b";

  static final String MorningStartEndRegex =
      r"(^(morning|{AmDescRegex}))|((morning|{AmDescRegex})$)".replaceAll("{AmDescRegex}", AmDescRegex);

  static final String AfternoonStartEndRegex =
      r"(^(afternoon|{PmDescRegex}))|((afternoon|{PmDescRegex})$)".replaceAll("{PmDescRegex}", PmDescRegex);

  static final String EveningStartEndRegex = r"(^(evening))|((evening)$)";

  static final String NightStartEndRegex = r"(^(over|to)?ni(ght|te))|((over|to)?ni(ght|te)$)";

  static final String InexactNumberRegex = r"\b((a\s+)?few|some|several|(?<NumTwoTerm>(a\s+)?couple(\s+of)?))\b";

  static final String InexactNumberUnitRegex = r"({InexactNumberRegex})\s+({DurationUnitRegex})"
      .replaceAll("{InexactNumberRegex}", InexactNumberRegex)
      .replaceAll("{DurationUnitRegex}", DurationUnitRegex);

  static final String RelativeTimeUnitRegex =
      r"(?:(?:(?:{NextPrefixRegex}|{PreviousPrefixRegex}|{ThisPrefixRegex})\s+({TimeUnitRegex}))|((the|my))\s+({RestrictedTimeUnitRegex}))"
          .replaceAll("{NextPrefixRegex}", NextPrefixRegex)
          .replaceAll("{PreviousPrefixRegex}", PreviousPrefixRegex)
          .replaceAll("{ThisPrefixRegex}", ThisPrefixRegex)
          .replaceAll("{TimeUnitRegex}", TimeUnitRegex)
          .replaceAll("{RestrictedTimeUnitRegex}", RestrictedTimeUnitRegex);

  static final String RelativeDurationUnitRegex =
      r"(?:(?:(?<=({NextPrefixRegex}|{PreviousPrefixRegex}|{ThisPrefixRegex})\s+)({DurationUnitRegex}))|((the|my))\s+({RestrictedTimeUnitRegex}))"
          .replaceAll("{NextPrefixRegex}", NextPrefixRegex)
          .replaceAll("{PreviousPrefixRegex}", PreviousPrefixRegex)
          .replaceAll("{ThisPrefixRegex}", ThisPrefixRegex)
          .replaceAll("{DurationUnitRegex}", DurationUnitRegex)
          .replaceAll("{RestrictedTimeUnitRegex}", RestrictedTimeUnitRegex);

  static final String ReferenceDatePeriodRegex =
      r"\b{ReferencePrefixRegex}\s+(?<duration>week(end)?|fortnight|month|year|decade)\b"
          .replaceAll("{ReferencePrefixRegex}", ReferencePrefixRegex);

  static final String ConnectorRegex = r"^(-|,|for|t|around|circa|@)$";

  static final String FromToRegex = r"(\b(from).+(to|and|or)\b.+)";

  static final String SingleAmbiguousMonthRegex = r"^(the\s+)?(may|march)$";

  static final String SingleAmbiguousTermsRegex = r"^(the\s+)?(day|week|month|year)$";

  static final String UnspecificDatePeriodRegex = r"^(week|fortnight|month|year)$";

  static final String PrepositionSuffixRegex = r"\b(on|in|at|around|circa|from|to)$";

  static final String FlexibleDayRegex = r"(?<DayOfMonth>([A-Za-z]+\s)?[A-Za-z\d]+)";

  static final String ForTheRegex =
      r"\b((((?<=\bfor\s+)the\s+{FlexibleDayRegex})|((?<=\bon\s+)(the\s+)?{FlexibleDayRegex}(?<=(st|nd|rd|th))))(?<end>\s*(,|\.(?!\d)|!|\?|$)))"
          .replaceAll("{FlexibleDayRegex}", FlexibleDayRegex);

  static final String WeekDayAndDayOfMonthRegex = r"\b{WeekDayRegex}\s+(the\s+{FlexibleDayRegex})\b"
      .replaceAll("{WeekDayRegex}", WeekDayRegex)
      .replaceAll("{FlexibleDayRegex}", FlexibleDayRegex);

  static final String WeekDayAndDayRegex =
      r"\b{WeekDayRegex}\s+(?!(the)){DayRegex}(?!([-:]|(\s+({AmDescRegex}|{PmDescRegex}|{OclockRegex}))))\b"
          .replaceAll("{WeekDayRegex}", WeekDayRegex)
          .replaceAll("{DayRegex}", DayRegex)
          .replaceAll("{AmDescRegex}", AmDescRegex)
          .replaceAll("{PmDescRegex}", PmDescRegex)
          .replaceAll("{OclockRegex}", OclockRegex);

  static final String RestOfDateRegex =
      r"\b(rest|remaining)\s+(of\s+)?((the|my|this|current)\s+)?(?<duration>week|fortnight|month|year|decade)\b";

  static final String RestOfDateTimeRegex = r"\b(rest|remaining)\s+(of\s+)?((the|my|this|current)\s+)?(?<unit>day)\b";

  static final String AmbiguousRangeModifierPrefix = r"(from)";

  static final String NumberEndingRegex =
      r"^(?:\s+(?<meeting>meeting|appointment|conference|((skype|teams|zoom|facetime)\s+)?call)\s+to\s+(?<newTime>{PeriodHourNumRegex}|{HourRegex})([\.]?$|(\.,|,|!|\?)))"
          .replaceAll("{PeriodHourNumRegex}", PeriodHourNumRegex)
          .replaceAll("{HourRegex}", HourRegex);

  static final String OneOnOneRegex = r"\b(1\s*:\s*1(?!\d))|(one (on )?one|one\s*-\s*one|one\s*:\s*one)\b";

  static final String LaterEarlyPeriodRegex =
      r"\b(({PrefixPeriodRegex})\s*\b\s*(?<suffix>{OneWordPeriodRegex}|(?<FourDigitYear>{BaseDateTime.FourDigitYearRegex}))|({UnspecificEndOfRangeRegex}))\b"
          .replaceAll("{PrefixPeriodRegex}", PrefixPeriodRegex)
          .replaceAll("{OneWordPeriodRegex}", OneWordPeriodRegex)
          .replaceAll("{BaseDateTime.FourDigitYearRegex}", BaseDateTime.FourDigitYearRegex)
          .replaceAll("{UnspecificEndOfRangeRegex}", UnspecificEndOfRangeRegex);

  static final String WeekWithWeekDayRangeRegex =
      r"\b((?<week>({NextPrefixRegex}|{PreviousPrefixRegex}|this)\s+week)((\s+between\s+{WeekDayRegex}\s+and\s+{WeekDayRegex})|(\s+from\s+{WeekDayRegex}\s+to\s+{WeekDayRegex})))\b"
          .replaceAll("{NextPrefixRegex}", NextPrefixRegex)
          .replaceAll("{PreviousPrefixRegex}", PreviousPrefixRegex)
          .replaceAll("{WeekDayRegex}", WeekDayRegex);

  static final String GeneralEndingRegex = r"^\s*((\.,)|\.|,|!|\?)?\s*$";

  static final String MiddlePauseRegex = r"\s*(,)\s*";

  static final String DurationConnectorRegex = r"^\s*(?<connector>\s+|and|,)\s*$";

  static final String PrefixArticleRegex = r"\bthe\s+";

  static final String OrRegex = r"\s*((\b|,\s*)(or|and)\b|,)\s*";

  static final String SpecialYearTermsRegex = r"\b((({SpecialYearPrefixes}\s+)?year)|(cy|(?<special>fy|sy)))"
      .replaceAll("{SpecialYearPrefixes}", SpecialYearPrefixes);

  static final String YearPlusNumberRegex = r"\b({SpecialYearTermsRegex}\s*((?<year>(\d{2,4}))|{FullTextYearRegex}))\b"
      .replaceAll("{FullTextYearRegex}", FullTextYearRegex)
      .replaceAll("{SpecialYearTermsRegex}", SpecialYearTermsRegex);

  static final String NumberAsTimeRegex = r"\b({WrittenTimeRegex}|{PeriodHourNumRegex}|{BaseDateTime.HourRegex})\b"
      .replaceAll("{WrittenTimeRegex}", WrittenTimeRegex)
      .replaceAll("{PeriodHourNumRegex}", PeriodHourNumRegex)
      .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex);

  static final String TimeBeforeAfterRegex =
      r"\b(((?<=\b(before|no later than|by|after)\s+)({WrittenTimeRegex}|{HourNumRegex}|{BaseDateTime.HourRegex}|{MidTimeRegex}))|{MidTimeRegex})\b"
          .replaceAll("{WrittenTimeRegex}", WrittenTimeRegex)
          .replaceAll("{HourNumRegex}", HourNumRegex)
          .replaceAll("{BaseDateTime.HourRegex}", BaseDateTime.HourRegex)
          .replaceAll("{MidTimeRegex}", MidTimeRegex);

  static final String DateNumberConnectorRegex = r"^\s*(?<connector>\s+at)\s*$";

  static final String DecadeRegex = r"(?<decade>(?:nough|twen|thir|fou?r|fif|six|seven|eigh|nine)ties|two\s+thousands)";

  static final String DecadeWithCenturyRegex =
      r"(the\s+)?(((?<century>\d|1\d|2\d)?(')?(?<decade>\d0)(')?(\s)?s\b)|(({CenturyRegex}(\s+|-)(and\s+)?)?{DecadeRegex})|({CenturyRegex}(\s+|-)(and\s+)?(?<decade>tens|hundreds)))"
          .replaceAll("{CenturyRegex}", CenturyRegex)
          .replaceAll("{DecadeRegex}", DecadeRegex);

  static final String RelativeDecadeRegex =
      r"\b((the\s+)?{RelativeRegex}\s+((?<number>[\w,]+)\s+)?decades?)\b".replaceAll("{RelativeRegex}", RelativeRegex);

  static final String YearPeriodRegex =
      r"((((from|during|in)\s+)?{YearRegex}\s*({TillRegex})\s*{YearRegex})|(((between)\s+){YearRegex}\s*({RangeConnectorRegex})\s*{YearRegex}))"
          .replaceAll("{YearRegex}", YearRegex)
          .replaceAll("{TillRegex}", TillRegex)
          .replaceAll("{RangeConnectorRegex}", RangeConnectorRegex);

  static final String StrictTillRegex =
      r"(?<till>\b(to|(un)?till?|thru|through)\b|{BaseDateTime.RangeConnectorSymbolRegex}(?!\s*(h[1-2]|q[1-4])(?!(\s+of|\s*,\s*))))"
          .replaceAll("{BaseDateTime.RangeConnectorSymbolRegex}", BaseDateTime.RangeConnectorSymbolRegex);

  static final String StrictRangeConnectorRegex =
      r"(?<and>\b(and|through|to)\b|{BaseDateTime.RangeConnectorSymbolRegex}(?!\s*(h[1-2]|q[1-4])(?!(\s+of|\s*,\s*))))"
          .replaceAll("{BaseDateTime.RangeConnectorSymbolRegex}", BaseDateTime.RangeConnectorSymbolRegex);

  static final String StartMiddleEndRegex =
      r"\b((?<StartOf>((the\s+)?(start|beginning)\s+of\s+)?)(?<MiddleOf>((the\s+)?middle\s+of\s+)?)(?<EndOf>((the\s+)?end\s+of\s+)?))";

  static final String ComplexDatePeriodRegex =
      r"(?:((from|during|in)\s+)?{StartMiddleEndRegex}(?<start>.+)\s*({StrictTillRegex})\s*{StartMiddleEndRegex}(?<end>.+)|((between)\s+){StartMiddleEndRegex}(?<start>.+)\s*({StrictRangeConnectorRegex})\s*{StartMiddleEndRegex}(?<end>.+))"
          .replaceAll("{StrictTillRegex}", StrictTillRegex)
          .replaceAll("{StrictRangeConnectorRegex}", StrictRangeConnectorRegex)
          .replaceAll("{StartMiddleEndRegex}", StartMiddleEndRegex);

  static final String FailFastRegex =
      r"{BaseDateTime.DeltaMinuteRegex}|\b(?:{BaseDateTime.BaseAmDescRegex}|{BaseDateTime.BasePmDescRegex})|{BaseDateTime.BaseAmPmDescRegex}|\b(?:zero|{WrittenOneToNineRegex}|{WrittenElevenToNineteenRegex}|{WrittenTensRegex}|{WrittenMonthRegex}|{SeasonDescRegex}|{DecadeRegex}|centur(y|ies)|weekends?|quarters?|hal(f|ves)|yesterday|to(morrow|day|night)|tmr|noonish|\d(-|——)?ish|((the\s+\w*)|\d)(th|rd|nd|st)|(mid\s*(-\s*)?)?(night|morning|afternoon|day)s?|evenings?|noon|lunch(time)?|dinner(time)?|(day|night)time|overnight|dawn|dusk|sunset|hours?|hrs?|h|minutes?|mins?|seconds?|secs?|eo[dmy]|mardi[ -]?gras|birthday|eve|christmas|xmas|thanksgiving|halloween|yuandan|easter|yuan dan|april fools|cinco de mayo|all (hallow|souls)|guy fawkes|(st )?patrick|hundreds?|noughties|aughts|thousands?)\b|{WeekDayRegex}|{SetWeekDayRegex}|{NowRegex}|{PeriodicRegex}|\b({DateUnitRegex}|{ImplicitDayRegex})"
          .replaceAll("{BaseDateTime.DeltaMinuteRegex}", BaseDateTime.DeltaMinuteRegex)
          .replaceAll("{BaseDateTime.BaseAmDescRegex}", BaseDateTime.BaseAmDescRegex)
          .replaceAll("{BaseDateTime.BasePmDescRegex}", BaseDateTime.BasePmDescRegex)
          .replaceAll("{BaseDateTime.BaseAmPmDescRegex}", BaseDateTime.BaseAmPmDescRegex)
          .replaceAll("{ImplicitDayRegex}", ImplicitDayRegex)
          .replaceAll("{DateUnitRegex}", DateUnitRegex)
          .replaceAll("{WeekDayRegex}", WeekDayRegex)
          .replaceAll("{SetWeekDayRegex}", SetWeekDayRegex)
          .replaceAll("{NowRegex}", NowRegex)
          .replaceAll("{PeriodicRegex}", PeriodicRegex)
          .replaceAll("{DecadeRegex}", DecadeRegex)
          .replaceAll("{SeasonDescRegex}", SeasonDescRegex)
          .replaceAll("{WrittenMonthRegex}", WrittenMonthRegex)
          .replaceAll("{WrittenTensRegex}", WrittenTensRegex)
          .replaceAll("{WrittenElevenToNineteenRegex}", WrittenElevenToNineteenRegex)
          .replaceAll("{WrittenOneToNineRegex}", WrittenOneToNineRegex);

  static final String TasksModeSupressionRegexes =
      r"({AmPmDescRegex}|{TasksModeSpecialDescRegex}|{TasksModeHolidayListSupression}|{DecadeRegex}|{DecadeWithCenturyRegex}|{QuarterRegex}|{QuarterRegexYearFront}|{AllHalfYearRegex}|{SeasonRegex})"
          .replaceAll("{AmPmDescRegex}", AmPmDescRegex)
          .replaceAll("{TasksModeSpecialDescRegex}", TasksModeSpecialDescRegex)
          .replaceAll("{TasksModeHolidayListSupression}", TasksModeHolidayListSupression)
          .replaceAll("{DecadeRegex}", DecadeRegex)
          .replaceAll("{DecadeWithCenturyRegex}", DecadeWithCenturyRegex)
          .replaceAll("{QuarterRegex}", QuarterRegex)
          .replaceAll("{QuarterRegexYearFront}", QuarterRegexYearFront)
          .replaceAll("{AllHalfYearRegex}", AllHalfYearRegex)
          .replaceAll("{SeasonRegex}", SeasonRegex);

  static final String TasksModeNextPrefix = r"(?<next>next\s+)";

  static final String TasksModeDurationToDatePatterns =
      r"\b({TasksModeNextPrefix}((?<week>week)|(?<month>month)|(?<year>year)))\b"
          .replaceAll("{TasksModeNextPrefix}", TasksModeNextPrefix);

  static final UnitMap = Map<String, String>.unmodifiable({
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
  });

  static final UnitValueMap = Map<String, int>.unmodifiable({
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
  });

  static final SpecialYearPrefixesMap = Map<String, String>.unmodifiable({
    "fiscal": "FY",
    "school": "SY",
    "fy": "FY",
    "sy": "SY",
  });

  static final SeasonMap = Map<String, String>.unmodifiable({
    "spring": "SP",
    "summer": "SU",
    "fall": "FA",
    "autumn": "FA",
    "winter": "WI",
  });

  static final SeasonValueMap = Map<String, int>.unmodifiable({
    "SP": 3,
    "SU": 6,
    "FA": 9,
    "WI": 12,
  });

  static final CardinalMap = Map<String, int>.unmodifiable({
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
  });

  static final DayOfWeek = Map<String, int>.unmodifiable({
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
  });

  static final MonthOfYear = Map<String, int>.unmodifiable({
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
  });

  static final Numbers = Map<String, int>.unmodifiable({
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
  });

  static final DayOfMonth = Map<String, int>.unmodifiable({
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
  });

  static final DoubleNumbers = Map<String, double>.unmodifiable({
    "half": 0.5,
    "quarter": 0.25,
  });

  static final HolidayNames = Map<String, List<String>>.unmodifiable({
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
  });

  static final WrittenDecades = Map<String, int>.unmodifiable({
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
  });

  static final SpecialDecadeCases = Map<String, int>.unmodifiable({
    "noughties": 2000,
    "aughts": 2000,
    "two thousands": 2000,
  });

  static final String DefaultLanguageFallback = "MDY";

  static final List<String> SuperfluousWordList = ["preferably", "how about", "maybe", "perhaps", "say", "like"];

  static final List<String> DurationDateRestrictions = ["today", "now", "current date"];

  static final AmbiguityFiltersDict = Map<String, String>.unmodifiable({
    r"^\d{4}$": r"(\d\.\d{4}|\d{4}\.\d)",
    r"^(morning|afternoon|evening|night|day)\b": r"\b(good\s+(morning|afternoon|evening|night|day))|(nighty\s+night)\b",
    r"\bnow\b": r"\b(^now,)|\b((is|are)\s+now\s+for|for\s+now)\b",
    r"\bmay$":
        r"\b((((!|\.|\?|,|;|)\s+|^)may i)|(i|you|he|she|we|they)\s+may|(may\s+((((also|not|(also not)|well)\s+)?(be|ask|contain|constitute|e-?mail|take|have|result|involve|get|work|reply|differ))|(or may not)))|(?<!(in|during|through)\s+)may,? at (its|h(is|er)|y?our|my))\b",
    r"^(a|one) second$":
        r"\b(?<!an?\s+)(a|one) second (round|time|wave|turn|chance|thought|opinion|cycle|take|meaning|life|job|home|hand|language|display|monitor|stimulus|dose|vaccination|shot|jab)\b",
    r"\b(breakfast|brunch|lunch(time)?|dinner(time)?|supper)$":
        r"(?<!\b(at|before|after|around|circa)\b\s)(breakfast|brunch|lunch|dinner|supper)(?!\s*time)",
    r"^\d+m$": r"^\d+m$",
    r"^(apr|aug|dec|feb|jan|jul|jun|mar|may|nov|oct|sept?)$":
        r"([$%£&!?@#])(apr|aug|dec|feb|jan|jul|jun|mar|may|nov|oct|sept?)|(apr|aug|dec|feb|jan|jul|jun|mar|may|nov|oct|sept?)([$%£&@#])",
    r"^(to\s+date)$": r"\b((equals?|up)\s+to\s+date)\b",
    r"^\d{1,4}-\d{1,4}$": r"\d{1,4}-\d{1,4}-\d|\d-\d{1,4}-\d{1,4}",
    r"^\d{1,4}-\d{1,4}-\d{1,4}$": r"\d{1,4}-\d{1,4}-\d{1,4}-\d|\d-\d{1,4}-\d{1,4}-\d{1,4}",
  });

  static final AmbiguityTimeFiltersDict = Map<String, String>.unmodifiable({
    r"^(\p{L}+|\d{1,2})(\s+(morning|afternoon|evening|night))?$":
        r"\b(one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|\d{1,2})\s+(morning|afternoon|evening|night)\b",
  });

  static final AmbiguityDurationFiltersDict = Map<String, String>.unmodifiable({
    r"night$": r"\bnight(\s*|-)(club|light|market|shift|work(er)?)s?\b",
  });

  static final List<String> MorningTermList = ["morning"];

  static final List<String> AfternoonTermList = ["afternoon"];

  static final List<String> EveningTermList = ["evening"];

  static final List<String> MealtimeBreakfastTermList = ["breakfast"];

  static final List<String> MealtimeBrunchTermList = ["brunch"];

  static final List<String> MealtimeLunchTermList = ["lunch", "lunchtime"];

  static final List<String> MealtimeDinnerTermList = ["dinner", "dinnertime", "supper"];

  static final List<String> DaytimeTermList = ["daytime"];

  static final List<String> NightTermList = ["night"];

  static final List<String> NighttimeTermList = ["nighttime", "night-time"];

  static final List<String> SameDayTerms = ["today", "current date", "otd"];

  static final List<String> PlusOneDayTerms = ["tomorrow", "tmr", "tmrw", "day after"];

  static final List<String> MinusOneDayTerms = ["yesterday", "day before"];

  static final List<String> PlusTwoDayTerms = ["day after tomorrow", "day after tmr", "day after tmrw"];

  static final List<String> MinusTwoDayTerms = ["day before yesterday"];

  static final List<String> FutureTerms = ["this", "next"];

  static final List<String> LastCardinalTerms = ["last"];

  static final List<String> MonthTerms = ["month"];

  static final List<String> MonthToDateTerms = ["month to date"];

  static final List<String> WeekendTerms = ["weekend"];

  static final List<String> WeekTerms = ["week"];

  static final List<String> FortnightTerms = ["fortnight", "fourtenight"];

  static final List<String> YearTerms = ["year"];

  static final List<String> GenericYearTerms = ["y"];

  static final List<String> YearToDateTerms = ["year to date"];

  static final String DoubleMultiplierRegex = r"^(bi)(-|\s)?";

  static final String HalfMultiplierRegex = r"^(semi)(-|\s)?";

  static final String DayTypeRegex = r"((week)?da(il)?ys?)$";

  static final String WeekTypeRegex = r"(week(s|ly)?)$";

  static final String WeekendTypeRegex = r"(weekends?)$";

  static final String MonthTypeRegex = r"(month(s|ly)?)$";

  static final String QuarterTypeRegex = r"(quarter(s|ly)?)$";

  static final String YearTypeRegex = r"((years?|annual)(ly)?)$";
}

class BaseDateTime {
  static final String HourRegex = r"(?<!\d[,.])(?<hour>2[0-4]|[0-1]?\d)(h)?";

  static final String TwoDigitHourRegex = r"(?<hour>[0-1]\d|2[0-4])(h)?";

  static final String MinuteRegex = r"(?<min>[0-5]\d)(?!\d)";

  static final String TwoDigitMinuteRegex = r"(?<min>[0-5]\d)(?!\d)";

  static final String DeltaMinuteRegex = r"(?<deltamin>[0-5]?\d)";

  static final String SecondRegex = r"(?<sec>[0-5]?\d)";

  static final String FourDigitYearRegex = r"\b(?<![$])(?<year>((1\d|20)\d{2})|2100)(?!\.0\b)\b";

  static final String HyphenDateRegex =
      r"((?<year1>[0-9]{4})-?(?<month1>1[0-2]|0[1-9])-?(?<day1>3[01]|0[1-9]|[12][0-9]))|((?<month2>1[0-2]|0[1-9])-?(?<day2>3[01]|0[1-9]|[12][0-9])-?(?<year2>[0-9]{4}))|((?<day3>3[01]|0[1-9]|[12][0-9])-?(?<month3>1[0-2]|0[1-9])-?(?<year3>[0-9]{4}))";

  static final String IllegalYearRegex =
      r"([-])({FourDigitYearRegex})([-])".replaceAll("{FourDigitYearRegex}", FourDigitYearRegex);

  static final String InvalidDayNumberPrefix = r"(\d[.,:]|[$£€]\s*)$";

  static final String CheckDecimalRegex = r"(?![,.]\d)";

  static final String RangeConnectorSymbolRegex = r"(--|-|—|——|~|–)";

  static final String BaseAmDescRegex = r"(am\b|a\s*\.\s*m\s*\.|a[\.]?\s*m\b)";

  static final String BasePmDescRegex = r"(pm\b|p\s*\.\s*m\s*\.|p[\.]?\s*m\b)";

  static final String BaseAmPmDescRegex = r"(ampm)";

  static final String EqualRegex = r"(?<!<|>)=";

  static final String BracketRegex = r"^\s*[\)\]]|[\[\(]\s*$";

  static const int MinYearNum = 1500;

  static const int MaxYearNum = 2100;

  static const int MaxTwoDigitYearFutureNum = 30;

  static const int MinTwoDigitYearPastNum = 40;

  static final DayOfMonthDictionary = Map<String, int>.unmodifiable({
    "01": 1,
    "02": 2,
    "03": 3,
    "04": 4,
    "05": 5,
    "06": 6,
    "07": 7,
    "08": 8,
    "09": 9,
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
    "13": 13,
    "14": 14,
    "15": 15,
    "16": 16,
    "17": 17,
    "18": 18,
    "19": 19,
    "20": 20,
    "21": 21,
    "22": 22,
    "23": 23,
    "24": 24,
    "25": 25,
    "26": 26,
    "27": 27,
    "28": 28,
    "29": 29,
    "30": 30,
    "31": 31,
  });

  static final VariableHolidaysTimexDictionary = Map.unmodifiable({
    "fathers": "-06-WXX-7-3",
    "mothers": "-05-WXX-7-2",
    "thanksgiving": "-11-WXX-4-4",
    "martinlutherking": "-01-WXX-1-3",
    "washingtonsbirthday": "-02-WXX-1-3",
    "canberra": "-03-WXX-1-1",
    "labour": "-09-WXX-1-1",
    "columbus": "-10-WXX-1-2",
    "memorial": "-05-WXX-1-4",
  });
}
