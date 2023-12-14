class BaseDateTime {
  static final String hourRegex = "(?<!\\d[,.])(?<hour>2[0-4]|[0-1]?\\d)(h)?";

  static final String twoDigitHourRegex = "(?<hour>[0-1]\\d|2[0-4])(h)?";

  static final String minuteRegex = "(?<min>[0-5]\\d)(?!\\d)";

  static final String twoDigitMinuteRegex = "(?<min>[0-5]\\d)(?!\\d)";

  static final String deltaMinuteRegex = "(?<deltamin>[0-5]?\\d)";

  static final String secondRegex = "(?<sec>[0-5]?\\d)";

  static final String fourDigitYearRegex = "\\b(?<![\$])(?<year>((1\\d|20)\\d{2})|2100)(?!\\.0\\b)\\b";

  static final String hyphenDateRegex =
      "((?<year1>[0-9]{4})-?(?<month1>1[0-2]|0[1-9])-?(?<day1>3[01]|0[1-9]|[12][0-9]))|((?<month2>1[0-2]|0[1-9])-?(?<day2>3[01]|0[1-9]|[12][0-9])-?(?<year2>[0-9]{4}))|((?<day3>3[01]|0[1-9]|[12][0-9])-?(?<month3>1[0-2]|0[1-9])-?(?<year3>[0-9]{4}))";

  static final String illegalYearRegex =
      "([-])({FourDigitYearRegex})([-])".replaceFirst("{FourDigitYearRegex}", fourDigitYearRegex);

  static final String invalidDayNumberPrefix = "(\\d[.,:]|[\$£€]\\s*)\$";

  static final String checkDecimalRegex = "(?![,.]\\d)";

  static final String rangeConnectorSymbolRegex = "(--|-|—|——|~|–)";

  static final String baseAmDescRegex = "(am\\b|a\\s*\\.\\s*m\\s*\\.|a[\\.]?\\s*m\\b)";

  static final String basePmDescRegex = "(pm\\b|p\\s*\\.\\s*m\\s*\\.|p[\\.]?\\s*m\\b)";

  static final String baseAmPmDescRegex = "(ampm)";

  static final String equalRegex = "(?<!<|>)=";

  static final String bracketRegex = "^\\s*[\\)\\]]|[\\[\\(]\\s*\$";

  static final int minYearNum = 1500;

  static final int maxYearNum = 2100;

  static final int maxTwoDigitYearFutureNum = 30;

  static final int minTwoDigitYearPastNum = 40;

  static final dayOfMonthDictionary = <String, int>{
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
  };

  static final variableHolidaysTimexDictionary = <String, String>{
    "fathers": "-06-WXX-7-3",
    "mothers": "-05-WXX-7-2",
    "thanksgiving": "-11-WXX-4-4",
    "martinlutherking": "-01-WXX-1-3",
    "washingtonsbirthday": "-02-WXX-1-3",
    "canberra": "-03-WXX-1-1",
    "labour": "-09-WXX-1-1",
    "columbus": "-10-WXX-1-2",
    "memorial": "-05-WXX-1-4",
  };
}
