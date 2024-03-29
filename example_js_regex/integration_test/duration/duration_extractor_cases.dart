const durationExtractorTestCases = [
  {
    "Input": "I'll leave for 3h",
    "Results": [
      {"Text": "3h", "Type": "duration", "Start": 15, "Length": 2}
    ]
  },
  {
    "Input": "I'll leave for 3day",
    "Results": [
      {"Text": "3day", "Type": "duration", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll leave for 3.5years",
    "Results": [
      {"Text": "3.5years", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for 3.5 years",
    "Results": [
      {"Text": "3.5 years", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for 3 h",
    "Results": [
      {"Text": "3 h", "Type": "duration", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll leave for 3 hours",
    "Results": [
      {"Text": "3 hours", "Type": "duration", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll leave for 3 hrs",
    "Results": [
      {"Text": "3 hrs", "Type": "duration", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll leave for 3 hr",
    "Results": [
      {"Text": "3 hr", "Type": "duration", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll leave for 3 day",
    "Results": [
      {"Text": "3 day", "Type": "duration", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll leave for 3 months",
    "Results": [
      {"Text": "3 months", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for 3 minutes",
    "Results": [
      {"Text": "3 minutes", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for 3 min",
    "Results": [
      {"Text": "3 min", "Type": "duration", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll leave for 3.5 second ",
    "Results": [
      {"Text": "3.5 second", "Type": "duration", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave for 123.45 sec",
    "Results": [
      {"Text": "123.45 sec", "Type": "duration", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave for two weeks",
    "Results": [
      {"Text": "two weeks", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for twenty min",
    "Results": [
      {"Text": "twenty min", "Type": "duration", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave for twenty and four hours",
    "Results": [
      {"Text": "twenty and four hours", "Type": "duration", "Start": 15, "Length": 21}
    ]
  },
  {
    "Input": "I'll leave for all day",
    "Results": [
      {"Text": "all day", "Type": "duration", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll leave for all week",
    "Results": [
      {"Text": "all week", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for all month",
    "Results": [
      {"Text": "all month", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for all year",
    "Results": [
      {"Text": "all year", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for all-day",
    "Results": [
      {"Text": "all-day", "Type": "duration", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll leave for all-week",
    "Results": [
      {"Text": "all-week", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for all-month",
    "Results": [
      {"Text": "all-month", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for all-year",
    "Results": [
      {"Text": "all-year", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for full day",
    "Results": [
      {"Text": "full day", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for full week",
    "Results": [
      {"Text": "full week", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for full month",
    "Results": [
      {"Text": "full month", "Type": "duration", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave for full year",
    "Results": [
      {"Text": "full year", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for full-day",
    "Results": [
      {"Text": "full-day", "Type": "duration", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave for full-week",
    "Results": [
      {"Text": "full-week", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for full-month",
    "Results": [
      {"Text": "full-month", "Type": "duration", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave for full-year",
    "Results": [
      {"Text": "full-year", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for an hour",
    "Results": [
      {"Text": "an hour", "Type": "duration", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll leave for a year",
    "Results": [
      {"Text": "a year", "Type": "duration", "Start": 15, "Length": 6}
    ]
  },
  {
    "Input": "half year",
    "Results": [
      {"Text": "half year", "Type": "duration", "Start": 0, "Length": 9}
    ]
  },
  {
    "Input": "half an year",
    "Results": [
      {"Text": "half an year", "Type": "duration", "Start": 0, "Length": 12}
    ]
  },
  {
    "Input": "I'll leave for 3-min",
    "Results": [
      {"Text": "3-min", "Type": "duration", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll leave for 30-minutes",
    "Results": [
      {"Text": "30-minutes", "Type": "duration", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave for a half hour",
    "Results": [
      {"Text": "a half hour", "Type": "duration", "Start": 15, "Length": 11}
    ]
  },
  {
    "Input": "I'll leave for half an hour",
    "Results": [
      {"Text": "half an hour", "Type": "duration", "Start": 15, "Length": 12}
    ]
  },
  {
    "Input": "I'll leave for an hour and half",
    "Results": [
      {"Text": "an hour and half", "Type": "duration", "Start": 15, "Length": 16}
    ]
  },
  {
    "Input": "I'll leave for an hour and a half",
    "Results": [
      {"Text": "an hour and a half", "Type": "duration", "Start": 15, "Length": 18}
    ]
  },
  {
    "Input": "I'll leave for half hour",
    "Results": [
      {"Text": "half hour", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for two hours",
    "Results": [
      {"Text": "two hours", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for two and a half hours",
    "Results": [
      {"Text": "two and a half hours", "Type": "duration", "Start": 15, "Length": 20}
    ]
  },
  {
    "Input": "In a week",
    "Results": [
      {"Text": "a week", "Type": "duration", "Start": 3, "Length": 6}
    ]
  },
  {
    "Input": "In a day",
    "Results": [
      {"Text": "a day", "Type": "duration", "Start": 3, "Length": 5}
    ]
  },
  {
    "Input": "for an hour",
    "Results": [
      {"Text": "an hour", "Type": "duration", "Start": 4, "Length": 7}
    ]
  },
  {
    "Input": "for a month",
    "Results": [
      {"Text": "a month", "Type": "duration", "Start": 4, "Length": 7}
    ]
  },
  {
    "Input": "I'll leave for few hours",
    "Results": [
      {"Text": "few hours", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for a few minutes",
    "Results": [
      {"Text": "a few minutes", "Type": "duration", "Start": 15, "Length": 13}
    ]
  },
  {
    "Input": "I'll leave for some days",
    "Results": [
      {"Text": "some days", "Type": "duration", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave for several days",
    "Results": [
      {"Text": "several days", "Type": "duration", "Start": 15, "Length": 12}
    ]
  },
  {
    "Input": "I'll leave for 1 year 1 month 21 days",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "1 year 1 month 21 days", "Type": "duration", "Start": 15, "Length": 22}
    ]
  },
  {
    "Input": "I'll leave for 2 days 1 month",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "2 days 1 month", "Type": "duration", "Start": 15, "Length": 14}
    ]
  },
  {
    "Input": "I realized that you are out for another week.",
    "Results": [
      {"Text": "another week", "Type": "duration", "Start": 32, "Length": 12}
    ]
  },
  {
    "Input": "Can we wait another month?",
    "Results": [
      {"Text": "another month", "Type": "duration", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "Can we wait another business day?",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "another business day", "Type": "duration", "Start": 12, "Length": 20}
    ]
  },
  {
    "Input": "I'll leave for half an business days.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "half an business days", "Type": "duration", "Start": 15, "Length": 21}
    ]
  },
  {
    "Input": "I'll leave for two decades.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "two decades", "Type": "duration", "Start": 15, "Length": 11}
    ]
  },
  {
    "Input": "I'll leave for a fortnight.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "a fortnight", "Type": "duration", "Start": 15, "Length": 11}
    ]
  },
  {
    "Input": "we've been in pakistan for 2ys",
    "NotSupported": "dotnet,javascript,python,java",
    "Results": [
      {"Text": "2ys", "Type": "duration", "Start": 27, "Length": 3}
    ]
  },
  {
    "Input": "the project estimative is a 2 ys duration",
    "NotSupported": "dotnet,javascript,python,java",
    "Results": [
      {"Text": "2 ys", "Type": "duration", "Start": 28, "Length": 4}
    ]
  }
];
