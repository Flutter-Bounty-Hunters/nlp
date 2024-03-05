
//       import 'package:nlp/src/core/timex_utility.dart';
// import 'package:nlp/src/date_time/constants.dart';
// import 'package:nlp/src/date_time/resolution.dart';
// import 'package:nlp/src/date_time/timex_property.dart';

// class TimexResolver
//     {
//          static Resolution Resolve(List<String> timexArray, DateTime date)
//         {
//             var resolution = new Resolution();
//             for (var timex in timexArray)
//             {
//                 var t = new TimexProperty(timex);
//                 var r = ResolveTimex(t, date);
//                 resolution.Values.addAll(r);
//             }

//             return resolution;
//         }

//          static List<Entry> ResolveTimex(TimexProperty timex, DateTime date)
//         {
//             var types = timex.Types.length != 0 ? timex.Types : TimexInference.Infer(timex);

//             if (types.Contains(DateTimeConstants.TimexTypes.DateTimeRange))
//             {
//                 return ResolveDateTimeRange(timex, date);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.Definite) && types.Contains(DateTimeConstants.TimexTypes.Time))
//             {
//                 return ResolveDefiniteTime(timex, date);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.Definite) && types.Contains(DateTimeConstants.TimexTypes.DateRange))
//             {
//                 return ResolveDefiniteDateRange(timex, date);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.DateRange))
//             {
//                 return ResolveDateRange(timex, date);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.Definite))
//             {
//                 return ResolveDefinite(timex);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.TimeRange))
//             {
//                 return ResolveTimeRange(timex, date);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.DateTime))
//             {
//                 return ResolveDateTime(timex, date);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.Duration))
//             {
//                 return ResolveDuration(timex);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.Date))
//             {
//                 return ResolveDate(timex, date);
//             }

//             if (types.Contains(DateTimeConstants.TimexTypes.Time))
//             {
//                 return ResolveTime(timex, date);
//             }

//             return new List<Resolution.Entry>();
//         }

//          static List<Resolution.Entry> ResolveDefiniteTime(TimexProperty timex, DateTime date)
//         {
//             return new List<Resolution.Entry>
//             {
//                 new Resolution.Entry
//                 {
//                     Timex = timex.TimexValue,
//                     Type = "datetime",
//                     Value = $"{TimexValue.DateValue(timex)} {TimexValue.TimeValue(timex, date)}",
//                 },
//             };
//         }

//          static List<Resolution.Entry> ResolveDefinite(TimexProperty timex)
//         {
//             return new List<Resolution.Entry>
//             {
//                 new Resolution.Entry
//                 {
//                     Timex = timex.TimexValue,
//                     Type = "date",
//                     Value = TimexValue.DateValue(timex),
//                 },
//             };
//         }

//          static List<Resolution.Entry> ResolveDefiniteDateRange(TimexProperty timex, DateTime date)
//         {
//             var range = TimexHelpers.ExpandDateTimeRange(timex);

//             return new List<Resolution.Entry>
//             {
//                 new Resolution.Entry
//                 {
//                     Timex = timex.TimexValue,
//                     Type = "daterange",
//                     Start = TimexValue.DateValue(range.Start),
//                     End = TimexValue.DateValue(range.End),
//                 },
//             };
//         }

//          static List<Resolution.Entry> ResolveDate(TimexProperty timex, DateTime date)
//         {
//             var dateValueList = GetDateValues(timex, date);
//             var result = new List<Resolution.Entry> { };
//             for (String dateValue in dateValueList)
//             {
//                 result.Add(new Resolution.Entry
//                 {
//                     Timex = timex.TimexValue,
//                     Type = "date",
//                     Value = dateValue,
//                 });
//             }

//             return result;
//         }

//          static String LastDateValue(TimexProperty timex, DateTime date)
//         {
//             if (timex.DayOfMonth != null)
//             {
//                 var year = date.Year;
//                 var month = date.Month;
//                 if (timex.Month != null)
//                 {
//                     month = timex.Month.Value;
//                     if (date.Month <= month || (date.Month == month && date.Day <= timex.DayOfMonth))
//                     {
//                         year--;
//                     }
//                 }
//                 else
//                 {
//                     if (date.Day <= timex.DayOfMonth)
//                     {
//                         month--;
//                         if (month < 1)
//                         {
//                             month = (month + 12) % 12;
//                             year--;
//                         }
//                     }
//                 }

//                 return TimexValue.DateValue(new TimexProperty
//                 {
//                     Year = year,
//                     Month = month,
//                     DayOfMonth = timex.DayOfMonth,
//                 });
//             }

//             if (timex.DayOfWeek != null)
//             {
//                 var start = GenerateWeekDate(timex, date, true);
//                 return TimexValue.DateValue(new TimexProperty
//                 {
//                     Year = start.Year,
//                     Month = start.Month,
//                     DayOfMonth = start.Day,
//                 });
//             }

//             return String.Empty;
//         }

//          static String NextDateValue(TimexProperty timex, DateTime date)
//         {
//             if (timex.DayOfMonth != null)
//             {
//                 var year = date.Year;
//                 var month = date.Month;
//                 if (timex.Month != null)
//                 {
//                     month = timex.Month.Value;
//                     if (date.Month > month || (date.Month == month && date.Day > timex.DayOfMonth))
//                     {
//                         year++;
//                     }
//                 }
//                 else
//                 {
//                     if (date.Day > timex.DayOfMonth)
//                     {
//                         month++;
//                         if (month > 12)
//                         {
//                             month = month % 12;
//                             year--;
//                         }
//                     }
//                 }

//                 return TimexValue.DateValue(new TimexProperty
//                 {
//                     Year = year,
//                     Month = month,
//                     DayOfMonth = timex.DayOfMonth,
//                 });
//             }

//             if (timex.DayOfWeek != null)
//             {
//                 var start = GenerateWeekDate(timex, date, false);
//                 return TimexValue.DateValue(new TimexProperty
//                 {
//                     Year = start.Year,
//                     Month = start.Month,
//                     DayOfMonth = start.Day,
//                 });
//             }

//             return String.Empty;
//         }

//          static List<Resolution.Entry> ResolveTime(TimexProperty timex, DateTime date)
//         {
//             return new List<Resolution.Entry>
//             {
//                 new Resolution.Entry
//                 {
//                     Timex = timex.TimexValue,
//                     Type = "time",
//                     Value = TimexValue.TimeValue(timex, date),
//                 },
//             };
//         }

//          static List<Resolution.Entry> ResolveDuration(TimexProperty timex)
//         {
//             return new List<Resolution.Entry>
//             {
//                 new Resolution.Entry
//                 {
//                     Timex = timex.TimexValue,
//                     Type = "duration",
//                     Value = TimexValue.DurationValue(timex),
//                 },
//             };
//         }

//          static Tuple<String, String> YearDateRange(int year)
//         {
//             var yearDateRange = TimexHelpers.YearDateRange(year);

//             return new Tuple<String, String>(
//                 TimexValue.DateValue(yearDateRange.Item1),
//                 TimexValue.DateValue(yearDateRange.Item2));
//         }

//          static Tuple<String, String> MonthDateRange(int year, int month)
//         {
//             var monthDateRange = TimexHelpers.MonthDateRange(year, month);

//             return new Tuple<String, String>(
//                 TimexValue.DateValue(monthDateRange.Item1),
//                 TimexValue.DateValue(monthDateRange.Item2));
//         }

//          static Tuple<String, String> YearWeekDateRange(int year, int weekOfYear, bool? isWeekend)
//         {
//             var yearWeekDateRange = TimexHelpers.YearWeekDateRange(year, weekOfYear, isWeekend);

//             return new Tuple<String, String>(
//                 TimexValue.DateValue(yearWeekDateRange.Item1),
//                 TimexValue.DateValue(yearWeekDateRange.Item2));
//         }

//          static Tuple<String, String> MonthWeekDateRange(int year, int month, int weekOfMonth)
//         {
//             var monthWeekDateRange = TimexHelpers.MonthWeekDateRange(year, month, weekOfMonth);

//             return new Tuple<String, String>(
//                 TimexValue.DateValue(monthWeekDateRange.Item1),
//                 TimexValue.DateValue(monthWeekDateRange.Item2));
//         }

//          static DateTime GenerateWeekDate(TimexProperty timex, DateTime date, bool isBefore)
//         {
//             DateTime start;
//             if (timex.WeekOfMonth == null && timex.WeekOfYear == null)
//             {
//                 var day = timex.DayOfWeek == 7 ? DayOfWeek.Sunday : (DayOfWeek)timex.DayOfWeek;
//                 if (isBefore)
//                 {
//                     start = TimexDateHelpers.DateOfLastDay(day, date);
//                 }
//                 else
//                 {
//                     start = TimexDateHelpers.DateOfNextDay(day, date);
//                 }
//             }
//             else
//             {
//                 int dayOfWeek = timex.DayOfWeek.Value - 1;
//                 int year = timex.Year ?? date.Year;
//                 if (timex.WeekOfYear != null)
//                 {
//                     int weekOfYear = timex.WeekOfYear.Value;
//                     start = TimexHelpers.FirstDateOfWeek(year, weekOfYear, CultureInfo.InvariantCulture).AddDays(dayOfWeek);
//                     if (timex.Year == null)
//                     {
//                         if (isBefore && start > date)
//                         {
//                             start = TimexHelpers.FirstDateOfWeek(year - 1, weekOfYear, CultureInfo.InvariantCulture).AddDays(dayOfWeek);
//                         }
//                         else if (!isBefore && start < date)
//                         {
//                             start = TimexHelpers.FirstDateOfWeek(year + 1, weekOfYear, CultureInfo.InvariantCulture).AddDays(dayOfWeek);
//                         }
//                     }
//                 }
//                 else
//                 {
//                     int month = timex.Month ?? date.Month;
//                     int weekOfMonth = timex.WeekOfMonth.Value;
//                     start = TimexHelpers.GenerateMonthWeekDateStart(year, month, weekOfMonth).AddDays(dayOfWeek);
//                     if (timex.Year == null || timex.Month == null)
//                     {
//                         if (isBefore && start > date)
//                         {
//                             start = TimexHelpers.GenerateMonthWeekDateStart(timex.Month != null ? year - 1 : year, timex.Month == null ? month - 1 : month, weekOfMonth).AddDays(dayOfWeek);
//                         }
//                         else if (!isBefore && start < date)
//                         {
//                             start = TimexHelpers.GenerateMonthWeekDateStart(timex.Month != null ? year + 1 : year, timex.Month == null ? month + 1 : month, weekOfMonth).AddDays(dayOfWeek);
//                         }
//                     }
//                 }
//             }

//             return start;
//         }

//          static List<Resolution.Entry> ResolveDateRange(TimexProperty timex, DateTime date)
//         {
//             if (timex.Season != null)
//             {
//                 return new List<Resolution.Entry>
//                 {
//                     new Resolution.Entry
//                     {
//                         Timex = timex.TimexValue,
//                         Type = "daterange",
//                         Value = "not resolved",
//                     },
//                 };
//             }
//             else
//             {
//                 if (timex.Month != null && timex.WeekOfMonth != null)
//                 {
//                     var yearDateRangeList = GetMonthWeekDateRange(timex.Year ?? DateTimeConstants.InvalidValue, timex.Month.Value, timex.WeekOfMonth.Value, date.Year);
//                     var result = new List<Resolution.Entry> { };
//                     for (Tuple<String, String> yearDateRange in yearDateRangeList)
//                     {
//                         result.Add(new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "daterange",
//                             Start = yearDateRange.Item1,
//                             End = yearDateRange.Item2,
//                         });
//                     }

//                     return result;
//                 }

//                 if (timex.Year != null && timex.Month != null)
//                 {
//                     var dateRange = MonthDateRange(timex.Year.Value, timex.Month.Value);
//                     return new List<Resolution.Entry>
//                     {
//                         new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "daterange",
//                             Start = dateRange.Item1,
//                             End = dateRange.Item2,
//                         },
//                     };
//                 }

//                 if (timex.Year != null && timex.WeekOfYear != null)
//                 {
//                     var dateRange = YearWeekDateRange(timex.Year.Value, timex.WeekOfYear.Value, timex.Weekend);

//                     return new List<Resolution.Entry>
//                     {
//                         new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "daterange",
//                             Start = dateRange.Item1,
//                             End = dateRange.Item2,
//                         },
//                     };
//                 }

//                 if (timex.Month != null)
//                 {
//                     var y = date.Year;
//                     var lastYearDateRange = MonthDateRange(y - 1, timex.Month.Value);
//                     var thisYearDateRange = MonthDateRange(y, timex.Month.Value);

//                     return new List<Resolution.Entry>
//                     {
//                         new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "daterange",
//                             Start = lastYearDateRange.Item1,
//                             End = lastYearDateRange.Item2,
//                         },
//                         new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "daterange",
//                             Start = thisYearDateRange.Item1,
//                             End = thisYearDateRange.Item2,
//                         },
//                     };
//                 }

//                 if (timex.Year != null)
//                 {
//                     var dateRange = YearDateRange(timex.Year.Value);

//                     return new List<Resolution.Entry>
//                     {
//                         new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "daterange",
//                             Start = dateRange.Item1,
//                             End = dateRange.Item2,
//                         },
//                     };
//                 }

//                 return new List<Resolution.Entry>();
//             }
//         }

//          static Tuple<String, String> PartOfDayTimeRange(TimexProperty timex)
//         {
//             switch (timex.PartOfDay)
//             {
//                 case "MO": return new Tuple<String, String>("08:00:00", "12:00:00");
//                 case "AF": return new Tuple<String, String>("12:00:00", "16:00:00");
//                 case "EV": return new Tuple<String, String>("16:00:00", "20:00:00");
//                 case "NI": return new Tuple<String, String>("20:00:00", "24:00:00");
//             }

//             return new Tuple<String, String>("not resolved", "not resolved");
//         }

//          static List<Resolution.Entry> ResolveTimeRange(TimexProperty timex, DateTime date)
//         {
//             if (timex.PartOfDay != null)
//             {
//                 var range = PartOfDayTimeRange(timex);
//                 return new List<Resolution.Entry>
//                 {
//                     new Resolution.Entry
//                     {
//                         Timex = timex.TimexValue,
//                         Type = "timerange",
//                         Start = range.Item1,
//                         End = range.Item2,
//                     },
//                 };
//             }
//             else
//             {
//                 var range = TimexHelpers.ExpandTimeRange(timex);
//                 return new List<Resolution.Entry>
//                 {
//                     new Resolution.Entry
//                     {
//                         Timex = timex.TimexValue,
//                         Type = "timerange",
//                         Start = TimexValue.TimeValue(range.Start, date),
//                         End = TimexValue.TimeValue(range.End, date),
//                     },
//                 };
//             }
//         }

//          static List<Resolution.Entry> ResolveDateTime(TimexProperty timex, DateTime date)
//         {
//             var resolvedDates = ResolveDate(timex, date);
//             for (var resolved in resolvedDates)
//             {
//                 resolved.Type = "datetime";
//                 resolved.Value = $"{resolved.Value} {TimexValue.TimeValue(timex, date)}";
//             }

//             return resolvedDates;
//         }

//          static List<String> GetDateValues(TimexProperty timex, DateTime date)
//         {
//             List<String> result = new List<String> { };
//             if (timex.Year != null && timex.Month != null && timex.DayOfMonth != null)
//             {
//                 result.Add(TimexValue.DateValue(timex));
//             }
//             else
//             {
//                 result.Add(LastDateValue(timex, date));
//                 if (timex.Year == null)
//                 {
//                     result.Add(NextDateValue(timex, date));
//                 }
//             }

//             return result;
//         }

//          static List<Tuple<String, String>> GetMonthWeekDateRange(int year, int month, int weekOfMonth, int referYear)
//         {
//             var result = new List<Tuple<String, String>> { };
//             if (year == DateTimeConstants.InvalidValue)
//             {
//                 result.Add(MonthWeekDateRange(referYear - 1, month, weekOfMonth));
//                 result.Add(MonthWeekDateRange(referYear, month, weekOfMonth));
//             }
//             else
//             {
//                 result.Add(MonthWeekDateRange(year, month, weekOfMonth));
//             }

//             return result;
//         }

//          static List<Resolution.Entry> ResolveDateTimeRange(TimexProperty timex, DateTime date)
//         {
//             if (timex.PartOfDay != null)
//             {
//                 var dateValues = GetDateValues(timex, date);
//                 var timeRange = PartOfDayTimeRange(timex);
//                 var result = new List<Resolution.Entry> { };
//                 for (String dateValue in dateValues)
//                 {
//                     result.Add(
//                         new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "datetimerange",
//                             Start = TimexHelpers.FormatResolvedDateValue(dateValue, timeRange.Item1),
//                             End = TimexHelpers.FormatResolvedDateValue(dateValue, timeRange.Item2),
//                         });
//                 }

//                 return result;
//             }
//             else
//             {
//                 var range = TimexHelpers.ExpandDateTimeRange(timex);
//                 var startDateValues = GetDateValues(range.Start, date);
//                 var endDateValues = GetDateValues(range.End, date);
//                 var result = new List<Resolution.Entry> { };
//                 for (var dateRange in startDateValues.Zip(endDateValues, (n, w) => new { start = n, end = w }))
//                 {
//                     result.Add(
//                         new Resolution.Entry
//                         {
//                             Timex = timex.TimexValue,
//                             Type = "datetimerange",
//                             Start = TimexHelpers.FormatResolvedDateValue(dateRange.start, TimexValue.TimeValue(range.Start, date)),
//                             End = TimexHelpers.FormatResolvedDateValue(dateRange.end, TimexValue.TimeValue(range.End, date)),
//                         });
//                 }

//                 return result;
//             }
//         }
//     }
