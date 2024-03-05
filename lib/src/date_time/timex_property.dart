// class TimexProperty {
//   DateTime time;

//   TimexProperty(String timex) {
//     TimexParsing.ParseString(timex, this);
//   }

  //  String TimexValue => TimexFormat.Format(this);

  //  HashSet<String> Types => TimexInference.Infer(this);

  //  bool? Now { get; set; }

  //  decimal? Years { get; set; }

  //  decimal? Months { get; set; }

  //  decimal? Weeks { get; set; }

  //  decimal? Days { get; set; }

  //  decimal? Hours { get; set; }

  //  decimal? Minutes { get; set; }

  //  decimal? Seconds { get; set; }

  //  int? Year { get; set; }

  //  int? Month { get; set; }

  //  int? DayOfMonth { get; set; }

  //  int? DayOfWeek { get; set; }

  //  String Season { get; set; }

  //  int? WeekOfYear { get; set; }

  //  bool? Weekend { get; set; }

  //  int? WeekOfMonth { get; set; }

  //  int? Hour
  // {
  //     get => time?.Hour;

  //     set
  //     {
  //         if (value.HasValue)
  //         {
  //             if (time == null)
  //             {
  //                 time = new Time(value.Value, 0, 0);
  //             }
  //             else
  //             {
  //                 time.Hour = value.Value;
  //             }
  //         }
  //         else
  //         {
  //             time = null;
  //         }
  //     }
  // }

  //  int? Minute
  // {
  //     get => time?.Minute;

  //     set
  //     {
  //         if (value.HasValue)
  //         {
  //             if (time == null)
  //             {
  //                 time = new Time(0, value.Value, 0);
  //             }
  //             else
  //             {
  //                 time.Minute = value.Value;
  //             }
  //         }
  //         else
  //         {
  //             time = null;
  //         }
  //     }
  // }

  //  int? Second
  // {
  //     get => time?.Second;

  //     set
  //     {
  //         if (value.HasValue)
  //         {
  //             if (time == null)
  //             {
  //                 time = new Time(0, 0, value.Value);
  //             }
  //             else
  //             {
  //                 time.Second = value.Value;
  //             }
  //         }
  //         else
  //         {
  //             time = null;
  //         }
  //     }
  // }

  //  String PartOfDay { get; set; }

  //  static TimexProperty FromDate(DateObject date)
  // {
  //     return new TimexProperty
  //     {
  //         Year = date.Year,
  //         Month = date.Month,
  //         DayOfMonth = date.Day,
  //     };
  // }

  //  static TimexProperty FromDateTime(DateObject datetime)
  // {
  //     var timex = FromDate(datetime);
  //     timex.Hour = datetime.Hour;
  //     timex.Minute = datetime.Minute;
  //     timex.Second = datetime.Second;
  //     return timex;
  // }

  //  static TimexProperty FromTime(Time time)
  // {
  //     return new TimexProperty
  //     {
  //         Hour = time.Hour,
  //         Minute = time.Minute,
  //         Second = time.Second,
  //     };
  // }

  //  override String ToString()
  // {
  //     return TimexConvert.ConvertTimexToString(this);
  // }

  //  String ToNaturalLanguage(DateObject referenceDate)
  // {
  //     return TimexRelativeConvert.ConvertTimexToStringRelative(this, referenceDate);
  // }

  //  TimexProperty Clone()
  // {
  //     return new TimexProperty
  //     {
  //         Now = Now,
  //         Years = Years,
  //         Months = Months,
  //         Weeks = Weeks,
  //         Days = Days,
  //         Hours = Hours,
  //         Minutes = Minutes,
  //         Seconds = Seconds,
  //         Year = Year,
  //         Month = Month,
  //         DayOfMonth = DayOfMonth,
  //         DayOfWeek = DayOfWeek,
  //         Season = Season,
  //         WeekOfYear = WeekOfYear,
  //         Weekend = Weekend,
  //         WeekOfMonth = WeekOfMonth,
  //         Hour = Hour,
  //         Minute = Minute,
  //         Second = Second,
  //         PartOfDay = PartOfDay,
  //     };
  // }

  //  void AssignProperties(IDictionary<String, String> source)
  // {
  //     foreach (var item in source)
  //     {
  //         if (String.IsNullOrEmpty(item.Value))
  //         {
  //             continue;
  //         }

  //         switch (item.Key)
  //         {
  //             case "year":
  //                 Year = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "month":
  //                 Month = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "dayOfMonth":
  //                 DayOfMonth = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "dayOfWeek":
  //                 DayOfWeek = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "season":
  //                 Season = item.Value;
  //                 break;

  //             case "weekOfYear":
  //                 WeekOfYear = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "weekend":
  //                 Weekend = true;
  //                 break;

  //             case "weekOfMonth":
  //                 WeekOfMonth = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "hour":
  //                 Hour = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "minute":
  //                 Minute = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;
  //             case "second":
  //                 Second = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "partOfDay":
  //                 PartOfDay = item.Value;
  //                 break;

  //             case "dateUnit":
  //                 AssignDateDuration(source);
  //                 break;

  //             case "hourAmount":
  //                 Hours = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "minuteAmount":
  //                 Minutes = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;

  //             case "secondAmount":
  //                 Seconds = int.Parse(item.Value, CultureInfo.InvariantCulture);
  //                 break;
  //         }
  //     }
  // }

  //  void AssignDateDuration(IDictionary<String, String> source)
  // {
  //     switch (source["dateUnit"])
  //     {
  //         case "Y":
  //             Years = decimal.Parse(source["amount"], CultureInfo.InvariantCulture);
  //             break;

  //         case "M":
  //             Months = decimal.Parse(source["amount"], CultureInfo.InvariantCulture);
  //             break;

  //         case "W":
  //             Weeks = decimal.Parse(source["amount"], CultureInfo.InvariantCulture);
  //             break;

  //         case "D":
  //             Days = decimal.Parse(source["amount"], CultureInfo.InvariantCulture);
  //             break;
  //     }
  // }
//}
