// ignore_for_file: non_constant_identifier_names, constant_identifier_names

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
  // hours of a half mid-day-duration
  static const int HalfMidDayDurationHourCount = 2;

  // the length of four digits year, e.g., 2018
  static const int FourDigitsYearLength = 4;

  // specifies the priority interpreting month and day order
  static const DefaultLanguageFallback_MDY = "MDY";
  static const DefaultLanguageFallback_DMY = "DMY";
  static const DefaultLanguageFallback_YMD = "YMD"; // ZH

  // Groups' names for named groups in regexes
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

  static const DECADE_UNIT = "10Y";
  static const FORTNIGHT_UNIT = "2W";

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
  static const TimexFuzzyMonth = "XX";
  static const TimexFuzzyWeek = "WXX";
  static const TimexFuzzyDay = "XX";
  static const DateTimexConnector = "-";
  static const TimeTimexConnector = ":";
  static const GeneralPeriodPrefix = "P";
  static const TimeTimexPrefix = "T";

  // Timex of TimeOfDay
  static const EarlyMorning = "TDA";
  static const Morning = "TMO";
  static const Afternoon = "TAF";
  static const Evening = "TEV";
  static const Daytime = "TDT";
  static const Night = "TNI";
  static const BusinessHour = "TBH";

  const DateTimeConstants._();
}

// Min/max integer values were taken from Java because Dart doesn't expose this info.
const intMin = -2147483648;
const intMax = 2147483647;
