// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:nlp/src/date_time/date_util.dart';

import 'english_date_time.dart';

class DateTimeConstants {
  static const SYS_DATETIME_DATE = "date";
  static const SYS_DATETIME_TIME = "time";
  static const SYS_DATETIME_DATEPERIOD = "daterange";
  static const SYS_DATETIME_DATETIME = "datetime";
  static const SYS_DATETIME_TIMEPERIOD = "timerange";
  static const SYS_DATETIME_DATETIMEPERIOD = "datetimerange";
  static const SYS_DATETIME_DURATION = "duration";
  static const SYS_DATETIME_SET = "set";
  static const SYS_DATETIME_DATETIMEALT = "datetimealt";
  static const SYS_DATETIME_TIMEZONE = "timezone";

  // SourceEntity Types
  static const SYS_DATETIME_DATETIMEPOINT = "datetimepoint";

  // Model Name
  static const MODEL_DATETIME = "datetime";

  // Multiple Duration Types
  static const MultipleDuration_Prefix = "multipleDuration";
  static const MultipleDuration_Type = "${MultipleDuration_Prefix}Type";
  static const MultipleDuration_DateTime = "${MultipleDuration_Prefix}DateTime";
  static const MultipleDuration_Date = "${MultipleDuration_Prefix}Date";
  static const MultipleDuration_Time = "${MultipleDuration_Prefix}Time";

  // DateTime Parse
  static const Resolve = "resolve";
  static const ResolveToPast = "resolveToPast";
  static const ResolveToFuture = "resolveToFuture";
  static const FutureDate = "futureDate";
  static const PastDate = "pastDate";
  static const ParseResult1 = "parseResult1";
  static const ParseResult2 = "parseResult2";

  // In the ExtractResult data
  static const Context = "context";
  static const ContextType_RelativePrefix = "relativePrefix";
  static const ContextType_RelativeSuffix = "relativeSuffix";
  static const ContextType_AmPm = "AmPm";
  static const SubType = "subType";

  // Comment - internal tag used during entity processing, never exposed to users.
  // Tags are filtered out in BaseMergedDateTimeParser DateTimeResolution()
  static const Comment = "Comment";
  // AmPm time representation for time parser
  static const Comment_AmPm = "ampm";
  // Prefix early/late for time parser
  static const Comment_Early = "early";
  static const Comment_Late = "late";
  // Parse week of date format
  static const Comment_WeekOf = "WeekOf";
  static const Comment_MonthOf = "MonthOf";

  static const Comment_DoubleTimex = "doubleTimex";

  static const InvalidDateString = "0001-01-01";
  static const CompositeTimexDelimiter = "|";
  static const CompositeTimexSplit = "\\|";

  // Mod Value
  // "before" -> To mean "preceding in time". I.e. Does not include the extracted datetime entity in the resolution's ending point. Equivalent to "<"
  static const BEFORE_MOD = "before";

  // "after" -> To mean "following in time". I.e. Does not include the extracted datetime entity in the resolution's starting point. Equivalent to ">"
  static const AFTER_MOD = "after";

  // "since" -> Same as "after", but including the extracted datetime entity. Equivalent to ">="
  static const SINCE_MOD = "since";

  // "until" -> Same as "before", but including the extracted datetime entity. Equivalent to "<="
  static const UNTIL_MOD = "until";

  static const EARLY_MOD = "start";
  static const MID_MOD = "mid";
  static const LATE_MOD = "end";

  static const MORE_THAN_MOD = "more";
  static const LESS_THAN_MOD = "less";

  static const REF_UNDEF_MOD = "ref_undef";

  static const APPROX_MOD = "approx";

  // Invalid year
  static const int InvalidYear = intMin;
  static const int InvalidMonth = intMin;
  static const int InvalidDay = intMin;
  static const int InvalidHour = intMin;
  static const int InvalidMinute = intMin;
  static const int InvalidSecond = intMin;
  static final DateTime InvalidDate = DateUtil.minValue();

  static const int INVALID_CONNECTOR_CODE = -1;

  static const int MinYearNum = BaseDateTime.MinYearNum;
  static const int MaxYearNum = BaseDateTime.MaxYearNum;

  static const int MaxTwoDigitYearFutureNum = BaseDateTime.MaxTwoDigitYearFutureNum;
  static const int MinTwoDigitYearPastNum = BaseDateTime.MinTwoDigitYearPastNum;

  // These are some particular values for timezone recognition
  static const int InvalidOffsetValue = -10000;
  static const UtcOffsetMinsKey = "utcOffsetMins";
  static const TimeZoneText = "timezoneText";
  static const TimeZone = "timezone";
  static const ResolveTimeZone = "resolveTimeZone";
  static const int PositiveSign = 1;
  static const int NegativeSign = -1;

  static const int TrimesterMonthCount = 3;
  static const int QuarterCount = 4;
  static const int SemesterMonthCount = 6;
  static const int WeekDayCount = 7;
  static const int CenturyYearsCount = 100;
  static const int MaxWeekOfMonth = 5;

  // hours of one half day
  static const int HalfDayHourCount = 12;

  // hours of one full day
  static const int DayHourCount = 24;

  // hours of a half mid-day-duration
  static const int HalfMidDayDurationHourCount = 2;

  // Hours in a quarter of a day
  static const int QuarterDayHourCount = 6;

  // the length of four digits year, e.g., 2018
  static const int FourDigitsYearLength = 4;

  static const int EARLY_LATE_TIME_DELTA = 2;

  // specifies the priority interpreting month and day order
  static const DefaultLanguageFallback_MDY = "MDY";
  static const DefaultLanguageFallback_DMY = "DMY";
  static const DefaultLanguageFallback_YMD = "YMD"; // ZH

  // Groups' names for named groups in regexes
  static const FirstGroupName = "first";
  static const NextGroupName = "next";
  static const AmGroupName = "am";
  static const PmGroupName = "pm";
  static const ImplicitAmGroupName = "iam";
  static const ImplicitPmGroupName = "ipm";
  static const PrefixGroupName = "prefix";
  static const SuffixGroupName = "suffix";
  static const DescGroupName = "desc";
  static const SecondGroupName = "sec";
  static const MinuteGroupName = "min";
  static const HourGroupName = "hour";
  static const TimeOfDayGroupName = "timeOfDay";
  static const BusinessDayGroupName = "business";
  static const LeftAmPmGroupName = "leftDesc";
  static const RightAmPmGroupName = "rightDesc";
  static const MealTimeGroupName = "mealTime";
  static const IncludeGroupName = "include";

  static const NumGroupName = "num";
  static const NumberGroupName = "number";

  static const DECADE_UNIT = "10Y";
  static const FORTNIGHT_UNIT = "2W";
  static const WEEKEND_UNIT = "WE";

  static const AmbiguousPattern = "ambiguous";

  // Timex
  static const DatePeriodTimexSplitter = [",", "(", ")"];
  static const TimexYear = "Y";
  static const TimexMonth = "M";
  static const TimexMonthFull = "MON";
  static const TimexWeek = "W";
  static const TimexDay = "D";
  static const TimexBusinessDay = "BD";
  static const TimexWeekend = "WE";
  static const TimexHour = "H";
  static const TimexMinute = "M";
  static const TimexSecond = "S";
  static const TimexFuzzy = 'X';
  static const TimexFuzzyYear = "XXXX";
  static const TimexFuzzyTwoDigitYear = "XX";
  static const TimexFuzzyMonth = "XX";
  static const TimexFuzzyWeek = "WXX";
  static const TimexFuzzyDay = "XX";
  static const DateTimexConnector = "-";
  static const TimeTimexConnector = ":";
  static const GeneralPeriodPrefix = "P";
  static const TimeTimexPrefix = "T";
  static const TimexNow = "PRESENT_REF";
  static const TimexFortnight = "W";

  // Timex of TimeOfDay
  static const EarlyMorning = "TDA";
  static const Morning = "TMO";
  static const Afternoon = "TAF";
  static const Evening = "TEV";
  static const Daytime = "TDT";
  static const Night = "TNI";
  static const Nighttime = "TNT";
  static const BusinessHour = "TBH";
  static const MidDay = "TMI";

  static final HolidayWeekend = "holidayWeekend";
  static final Holiday = "holiday";

  static final YearGroupName = "year";
  static final DayGroupName = "day";
  static final MonthGroupName = "month";
  static final WeekdayGroupName = "weekday";

  static final UnitOfYearGroupName = "uoy";

  static final OrdinalGroupName = "ordinal";
  static final OrderGroupName = "order";

  static const PluralUnit = "plural";

  static const String MealtimeBreakfast = "TMEB";
  static const String MealtimeBrunch = "TMER";
  static const String MealtimeLunch = "TMEL";
  static const String MealtimeDinner = "TMED";

  static const String HAS_MOD = "mod";

  static final BASE_YEAR_PAST_CENTURY = 1900;
  static final BASE_YEAR_CURRENT_CENTURY = 2000;

  static const int EarlyMorningBeginHour = 4;
  static const int EarlyMorningEndHour = 8;
  static const int MorningBeginHour = 8;
  static const int MorningEndHour = 12;
  static const int MidDayBeginHour = 11;
  static const int MidDayEndHour = 13;
  static const int AfternoonBeginHour = 12;
  static const int AfternoonEndHour = 16;
  static const int EveningBeginHour = 16;
  static const int EveningEndHour = 20;
  static const int DaytimeBeginHour = 8;
  static const int DaytimeEndHour = 18;
  static const int NighttimeBeginHour = 0;
  static const int NighttimeEndHour = 8;
  static const int BusinessBeginHour = 8;
  static const int BusinessEndHour = 18;
  static const int NightBeginHour = 20;
  static const int NightEndHour = 23;
  static const int NightEndMin = 59;
  static const int MealtimeBreakfastBeginHour = 8;
  static const int MealtimeBreakfastEndHour = 12;
  static const int MealtimeBrunchBeginHour = 8;
  static const int MealtimeBrunchEndHour = 12;
  static const int MealtimeLunchBeginHour = 11;
  static const int MealtimeLunchEndHour = 13;
  static const int MealtimeDinnerBeginHour = 16;
  static const int MealtimeDinnerEndHour = 20;

  const DateTimeConstants._();
}

class TasksModeConstants {
  // These are some particular values for timezone recognition
  static const int WeekDayCount = 7;

  // Hours in a half day
  static const int HalfDayHourCount = 12;

  // Default boundaries for time of day resolution under TasksMode
  static const int EarlyMorningBeginHour = 6;
  static const int EarlyMorningEndHour = 6;
  static const int MorningBeginHour = 6;
  static const int MorningEndHour = 6;
  static const int MidDayBeginHour = 12;
  static const int MidDayEndHour = 12;
  static const int AfternoonBeginHour = 12;
  static const int AfternoonEndHour = 12;
  static const int EveningBeginHour = 18;
  static const int EveningEndHour = 18;
  static const int DaytimeBeginHour = 16;
  static const int DaytimeEndHour = 16;
  static const int NighttimeBeginHour = 21;
  static const int NighttimeEndHour = 21;
  static const int BusinessBeginHour = 8;
  static const int BusinessEndHour = 18;
  static const int NightBeginHour = 21;
  static const int NightEndHour = 21;
  static const int NightEndMin = 0;
  static const int MealtimeBreakfastBeginHour = 8;
  static const int MealtimeBreakfastEndHour = 12;
  static const int MealtimeBrunchBeginHour = 8;
  static const int MealtimeBrunchEndHour = 12;
  static const int MealtimeLunchBeginHour = 11;
  static const int MealtimeLunchEndHour = 13;
  static const int MealtimeDinnerBeginHour = 20;
  static const int MealtimeDinnerEndHour = 21;

  // constants
  static const String PeriodDaySuffix = "P1D";
  static const String YearlyPeriodSuffix = "P1Y";
  static const String WeeklyPeriodSuffix = "P1W";
  static const String DailyPeriodPrefix = "P1";
  static const String AlternatePeriodPrefix = "P2";
  static const String WeekEndPrefix = "WE";
  static const String WeekDayPrefix = "WD";

  // Fuzzy timex
  static const String FuzzyYearAndMonth = "XXXX-XX-";
  static const String FuzzyYearAndWeek = "XXXX-WXX-";
  static const String FuzzyYear = "XXXX-";

  // Default time in String format
  static const String StringMorningHHMMSS = "06:00:00";
  static const String StringAfternoonHHMMSS = "12:00:00";
  static const String StringEveningHHMMSS = "18:00:00";
  static const String StringNightHHMMSS = "21:00:00";

  // timex pattern to be extracted by SetHandler
  static const String PeriodString = "period";
  static const String AmountString = "amount";
  static const String DateUnitString = "dateUnit";

  // TasksMode Additional units and constants in SetParser
  static const String KeyIntSize = "intervalSize";
  static const String KeyIntType = "intervalType";
  static const String KeySetTypeName = "setTypename";
  static const String KeySet = "Set: ";
  static const String NextWeekGroupName = "next week";

  // TasksMode SetParser Date calucation constant from value
  static const int IntDateStartIdx = 0;
  static const int IntDateEndIdx = 10;
}

// Min/max integer values were taken from Java because Dart doesn't expose this info.
const intMin = -2147483648;
const intMax = 2147483647;
