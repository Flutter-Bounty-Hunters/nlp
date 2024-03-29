final durationParserTestCases = [
  {
    "Input": "I'll leave for 3h",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3h",
        "Type": "duration",
        "Value": {
          "Timex": "PT3H",
          "FutureResolution": {"duration": "10800"},
          "PastResolution": {"duration": "10800"}
        },
        "Start": 15,
        "Length": 2
      }
    ]
  },
  {
    "Input": "I'll leave for 3day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3day",
        "Type": "duration",
        "Value": {
          "Timex": "P3D",
          "FutureResolution": {"duration": "259200"},
          "PastResolution": {"duration": "259200"}
        },
        "Start": 15,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll leave for 3.5years",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3.5years",
        "Type": "duration",
        "Value": {
          "Timex": "P3.5Y",
          "FutureResolution": {"duration": "110376000"},
          "PastResolution": {"duration": "110376000"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for 3 h",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 h",
        "Type": "duration",
        "Value": {
          "Timex": "PT3H",
          "FutureResolution": {"duration": "10800"},
          "PastResolution": {"duration": "10800"}
        },
        "Start": 15,
        "Length": 3
      }
    ]
  },
  {
    "Input": "I'll leave for 3 hours",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 hours",
        "Type": "duration",
        "Value": {
          "Timex": "PT3H",
          "FutureResolution": {"duration": "10800"},
          "PastResolution": {"duration": "10800"}
        },
        "Start": 15,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll leave for 3 hrs",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 hrs",
        "Type": "duration",
        "Value": {
          "Timex": "PT3H",
          "FutureResolution": {"duration": "10800"},
          "PastResolution": {"duration": "10800"}
        },
        "Start": 15,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll leave for 3 hr",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 hr",
        "Type": "duration",
        "Value": {
          "Timex": "PT3H",
          "FutureResolution": {"duration": "10800"},
          "PastResolution": {"duration": "10800"}
        },
        "Start": 15,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll leave for 3 day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 day",
        "Type": "duration",
        "Value": {
          "Timex": "P3D",
          "FutureResolution": {"duration": "259200"},
          "PastResolution": {"duration": "259200"}
        },
        "Start": 15,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll leave for 3 months",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 months",
        "Type": "duration",
        "Value": {
          "Timex": "P3M",
          "FutureResolution": {"duration": "7776000"},
          "PastResolution": {"duration": "7776000"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for 3 minutes",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 minutes",
        "Type": "duration",
        "Value": {
          "Timex": "PT3M",
          "FutureResolution": {"duration": "180"},
          "PastResolution": {"duration": "180"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for 3 min",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3 min",
        "Type": "duration",
        "Value": {
          "Timex": "PT3M",
          "FutureResolution": {"duration": "180"},
          "PastResolution": {"duration": "180"}
        },
        "Start": 15,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll leave for 3.5 second ",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3.5 second",
        "Type": "duration",
        "Value": {
          "Timex": "PT3.5S",
          "FutureResolution": {"duration": "3.5"},
          "PastResolution": {"duration": "3.5"}
        },
        "Start": 15,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave for 123.45 sec",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "123.45 sec",
        "Type": "duration",
        "Value": {
          "Timex": "PT123.45S",
          "FutureResolution": {"duration": "123.45"},
          "PastResolution": {"duration": "123.45"}
        },
        "Start": 15,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave for two weeks",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "two weeks",
        "Type": "duration",
        "Value": {
          "Timex": "P2W",
          "FutureResolution": {"duration": "1209600"},
          "PastResolution": {"duration": "1209600"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for twenty min",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "twenty min",
        "Type": "duration",
        "Value": {
          "Timex": "PT20M",
          "FutureResolution": {"duration": "1200"},
          "PastResolution": {"duration": "1200"}
        },
        "Start": 15,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave for twenty and four hours",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "twenty and four hours",
        "Type": "duration",
        "Value": {
          "Timex": "PT24H",
          "FutureResolution": {"duration": "86400"},
          "PastResolution": {"duration": "86400"}
        },
        "Start": 15,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll leave for all day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all day",
        "Type": "duration",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"duration": "86400"},
          "PastResolution": {"duration": "86400"}
        },
        "Start": 15,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll leave for all week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all week",
        "Type": "duration",
        "Value": {
          "Timex": "P1W",
          "FutureResolution": {"duration": "604800"},
          "PastResolution": {"duration": "604800"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for all month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all month",
        "Type": "duration",
        "Value": {
          "Timex": "P1M",
          "FutureResolution": {"duration": "2592000"},
          "PastResolution": {"duration": "2592000"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for all year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all year",
        "Type": "duration",
        "Value": {
          "Timex": "P1Y",
          "FutureResolution": {"duration": "31536000"},
          "PastResolution": {"duration": "31536000"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for all-day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all-day",
        "Type": "duration",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"duration": "86400"},
          "PastResolution": {"duration": "86400"}
        },
        "Start": 15,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll leave for all-week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all-week",
        "Type": "duration",
        "Value": {
          "Timex": "P1W",
          "FutureResolution": {"duration": "604800"},
          "PastResolution": {"duration": "604800"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for all-month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all-month",
        "Type": "duration",
        "Value": {
          "Timex": "P1M",
          "FutureResolution": {"duration": "2592000"},
          "PastResolution": {"duration": "2592000"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for all-year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "all-year",
        "Type": "duration",
        "Value": {
          "Timex": "P1Y",
          "FutureResolution": {"duration": "31536000"},
          "PastResolution": {"duration": "31536000"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for full day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full day",
        "Type": "duration",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"duration": "86400"},
          "PastResolution": {"duration": "86400"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for full week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full week",
        "Type": "duration",
        "Value": {
          "Timex": "P1W",
          "FutureResolution": {"duration": "604800"},
          "PastResolution": {"duration": "604800"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for full month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full month",
        "Type": "duration",
        "Value": {
          "Timex": "P1M",
          "FutureResolution": {"duration": "2592000"},
          "PastResolution": {"duration": "2592000"}
        },
        "Start": 15,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave for full year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full year",
        "Type": "duration",
        "Value": {
          "Timex": "P1Y",
          "FutureResolution": {"duration": "31536000"},
          "PastResolution": {"duration": "31536000"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for full-day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full-day",
        "Type": "duration",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"duration": "86400"},
          "PastResolution": {"duration": "86400"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for full-week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full-week",
        "Type": "duration",
        "Value": {
          "Timex": "P1W",
          "FutureResolution": {"duration": "604800"},
          "PastResolution": {"duration": "604800"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for full-month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full-month",
        "Type": "duration",
        "Value": {
          "Timex": "P1M",
          "FutureResolution": {"duration": "2592000"},
          "PastResolution": {"duration": "2592000"}
        },
        "Start": 15,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave for full-year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "full-year",
        "Type": "duration",
        "Value": {
          "Timex": "P1Y",
          "FutureResolution": {"duration": "31536000"},
          "PastResolution": {"duration": "31536000"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for an hour",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "an hour",
        "Type": "duration",
        "Value": {
          "Timex": "PT1H",
          "FutureResolution": {"duration": "3600"},
          "PastResolution": {"duration": "3600"}
        },
        "Start": 15,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll leave for whole day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "whole day",
        "Type": "duration",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"duration": "86400"},
          "PastResolution": {"duration": "86400"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "half year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "half year",
        "Type": "duration",
        "Value": {
          "Timex": "P0.5Y",
          "FutureResolution": {"duration": "15768000"},
          "PastResolution": {"duration": "15768000"}
        },
        "Start": 0,
        "Length": 9
      }
    ]
  },
  {
    "Input": "half an year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "half an year",
        "Type": "duration",
        "Value": {
          "Timex": "P0.5Y",
          "FutureResolution": {"duration": "15768000"},
          "PastResolution": {"duration": "15768000"}
        },
        "Start": 0,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll leave for 3-min",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3-min",
        "Type": "duration",
        "Value": {
          "Timex": "PT3M",
          "FutureResolution": {"duration": "180"},
          "PastResolution": {"duration": "180"}
        },
        "Start": 15,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll leave for 30-minutes",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "30-minutes",
        "Type": "duration",
        "Value": {
          "Timex": "PT30M",
          "FutureResolution": {"duration": "1800"},
          "PastResolution": {"duration": "1800"}
        },
        "Start": 15,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave for an hour and a half",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "an hour and a half",
        "Type": "duration",
        "Value": {
          "Timex": "PT1.5H",
          "FutureResolution": {"duration": "5400"},
          "PastResolution": {"duration": "5400"}
        },
        "Start": 15,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll leave for an hour and half",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "an hour and half",
        "Type": "duration",
        "Value": {
          "Timex": "PT1.5H",
          "FutureResolution": {"duration": "5400"},
          "PastResolution": {"duration": "5400"}
        },
        "Start": 15,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll leave for half hour",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "half hour",
        "Type": "duration",
        "Value": {
          "Timex": "PT0.5H",
          "FutureResolution": {"duration": "1800"},
          "PastResolution": {"duration": "1800"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave for two hour",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "two hour",
        "Type": "duration",
        "Value": {
          "Timex": "PT2H",
          "FutureResolution": {"duration": "7200"},
          "PastResolution": {"duration": "7200"}
        },
        "Start": 15,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave for two and a half hours",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "two and a half hours",
        "Type": "duration",
        "Value": {
          "Timex": "PT2.5H",
          "FutureResolution": {"duration": "9000"},
          "PastResolution": {"duration": "9000"}
        },
        "Start": 15,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll leave for 1 year 1 month 21 days",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1 year 1 month 21 days",
        "Type": "duration",
        "Value": {
          "Timex": "P1Y1M21D",
          "FutureResolution": {"duration": "35942400"},
          "PastResolution": {"duration": "35942400"}
        },
        "Start": 15,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll leave for 2 days 1 month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "2 days 1 month",
        "Type": "duration",
        "Value": {
          "Timex": "P1M2D",
          "FutureResolution": {"duration": "2764800"},
          "PastResolution": {"duration": "2764800"}
        },
        "Start": 15,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll leave for one week three days",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "one week three days",
        "Type": "duration",
        "Value": {
          "Timex": "P1W3D",
          "FutureResolution": {"duration": "864000"},
          "PastResolution": {"duration": "864000"}
        },
        "Start": 15,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll leave for couple of weeks",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "couple of weeks",
        "Type": "duration",
        "Value": {
          "Timex": "P2W",
          "FutureResolution": {"duration": "1209600"},
          "PastResolution": {"duration": "1209600"}
        },
        "Start": 15,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll be away for a couple of days.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "a couple of days",
        "Type": "duration",
        "Value": {
          "Timex": "P2D",
          "FutureResolution": {"duration": "172800"},
          "PastResolution": {"duration": "172800"}
        },
        "Start": 17,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll be away for less than a couple of days.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "less than a couple of days",
        "Type": "duration",
        "Value": {
          "Mod": "less",
          "Timex": "P2D",
          "FutureResolution": {"duration": "172800"},
          "PastResolution": {"duration": "172800"}
        },
        "Start": 17,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I'll leave for more than an hour",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "more than an hour",
        "Type": "duration",
        "Value": {
          "Timex": "PT1H",
          "Mod": "more",
          "FutureResolution": {"duration": "3600"},
          "PastResolution": {"duration": "3600"}
        },
        "Start": 15,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll leave for another hour",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "another hour",
        "Type": "duration",
        "Value": {
          "Timex": "PT1H",
          "FutureResolution": {"duration": "3600"},
          "PastResolution": {"duration": "3600"}
        },
        "Start": 15,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I realized that you are out for another week.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "another week",
        "Type": "duration",
        "Value": {
          "Timex": "P1W",
          "FutureResolution": {"duration": "604800"},
          "PastResolution": {"duration": "604800"}
        },
        "Start": 32,
        "Length": 12
      }
    ]
  },
  {
    "Input": "Can we wait another month?",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "another month",
        "Type": "duration",
        "Value": {
          "Timex": "P1M",
          "FutureResolution": {"duration": "2592000"},
          "PastResolution": {"duration": "2592000"}
        },
        "Start": 12,
        "Length": 13
      }
    ]
  },
  {
    "Input": "Can we wait another business day?",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "python, javascript",
    "Results": [
      {
        "Text": "another business day",
        "Type": "duration",
        "Value": {
          "Timex": "P1BD",
          "FutureResolution": {"duration": "86400"},
          "PastResolution": {"duration": "86400"}
        },
        "Start": 12,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll leave for two decades.",
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "two decades",
        "Type": "duration",
        "Value": {
          "Timex": "P20Y",
          "FutureResolution": {"duration": "630720000"},
          "PastResolution": {"duration": "630720000"}
        },
        "Start": 15,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll leave for a fortnight.",
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "a fortnight",
        "Type": "duration",
        "Value": {
          "Timex": "P2W",
          "FutureResolution": {"duration": "1209600"},
          "PastResolution": {"duration": "1209600"}
        },
        "Start": 15,
        "Length": 11
      }
    ]
  }
];
