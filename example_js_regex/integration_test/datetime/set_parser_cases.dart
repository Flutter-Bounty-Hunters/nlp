const setParserTestCases = [
  {
    "Input": "I'll leave weekly",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2744475+08:00"},
    "Results": [
      {
        "Text": "weekly",
        "Type": "set",
        "Value": {
          "Timex": "P1W",
          "FutureResolution": {"set": "Set: P1W"},
          "PastResolution": {"set": "Set: P1W"}
        },
        "Start": 11,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll leave biweekly",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2754476+08:00"},
    "Results": [
      {
        "Text": "biweekly",
        "Type": "set",
        "Value": {
          "Timex": "P2W",
          "FutureResolution": {"set": "Set: P2W"},
          "PastResolution": {"set": "Set: P2W"}
        },
        "Start": 11,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave daily",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2779449+08:00"},
    "Results": [
      {
        "Text": "daily",
        "Type": "set",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"set": "Set: P1D"},
          "PastResolution": {"set": "Set: P1D"}
        },
        "Start": 11,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll leave every day",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2794445+08:00"},
    "Results": [
      {
        "Text": "every day",
        "Type": "set",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"set": "Set: P1D"},
          "PastResolution": {"set": "Set: P1D"}
        },
        "Start": 11,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave each month",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2829445+08:00"},
    "Results": [
      {
        "Text": "each month",
        "Type": "set",
        "Value": {
          "Timex": "P1M",
          "FutureResolution": {"set": "Set: P1M"},
          "PastResolution": {"set": "Set: P1M"}
        },
        "Start": 11,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave annually",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2844439+08:00"},
    "Results": [
      {
        "Text": "annually",
        "Type": "set",
        "Value": {
          "Timex": "P1Y",
          "FutureResolution": {"set": "Set: P1Y"},
          "PastResolution": {"set": "Set: P1Y"}
        },
        "Start": 11,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll leave annual",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2854444+08:00"},
    "Results": [
      {
        "Text": "annual",
        "Type": "set",
        "Value": {
          "Timex": "P1Y",
          "FutureResolution": {"set": "Set: P1Y"},
          "PastResolution": {"set": "Set: P1Y"}
        },
        "Start": 11,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll leave each two days",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2909444+08:00"},
    "Results": [
      {
        "Text": "each two days",
        "Type": "set",
        "Value": {
          "Timex": "P2D",
          "FutureResolution": {"set": "Set: P2D"},
          "PastResolution": {"set": "Set: P2D"}
        },
        "Start": 11,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll leave every three week",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2959472+08:00"},
    "Results": [
      {
        "Text": "every three week",
        "Type": "set",
        "Value": {
          "Timex": "P3W",
          "FutureResolution": {"set": "Set: P3W"},
          "PastResolution": {"set": "Set: P3W"}
        },
        "Start": 11,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll leave 3pm every day",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.2989494+08:00"},
    "Results": [
      {
        "Text": "3pm every day",
        "Type": "set",
        "Value": {
          "Timex": "T15",
          "FutureResolution": {"set": "Set: T15"},
          "PastResolution": {"set": "Set: T15"}
        },
        "Start": 11,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll leave 3pm each day",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3039501+08:00"},
    "Results": [
      {
        "Text": "3pm each day",
        "Type": "set",
        "Value": {
          "Timex": "T15",
          "FutureResolution": {"set": "Set: T15"},
          "PastResolution": {"set": "Set: T15"}
        },
        "Start": 11,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll leave each 4/15",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3109498+08:00"},
    "Results": [
      {
        "Text": "each 4/15",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-04-15",
          "FutureResolution": {"set": "Set: XXXX-04-15"},
          "PastResolution": {"set": "Set: XXXX-04-15"}
        },
        "Start": 11,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll leave every monday",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3259514+08:00"},
    "Results": [
      {
        "Text": "every monday",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-1",
          "FutureResolution": {"set": "Set: XXXX-WXX-1"},
          "PastResolution": {"set": "Set: XXXX-WXX-1"}
        },
        "Start": 11,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll leave each monday 4pm",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3379507+08:00"},
    "Results": [
      {
        "Text": "each monday 4pm",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-1T16",
          "FutureResolution": {"set": "Set: XXXX-WXX-1T16"},
          "PastResolution": {"set": "Set: XXXX-WXX-1T16"}
        },
        "Start": 11,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll leave every morning",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3429518+08:00"},
    "Results": [
      {
        "Text": "every morning",
        "Type": "set",
        "Value": {
          "Timex": "TMO",
          "FutureResolution": {"set": "Set: TMO"},
          "PastResolution": {"set": "Set: TMO"}
        },
        "Start": 11,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll leave every morning at 9am",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3609535+08:00"},
    "Results": [
      {
        "Text": "every morning at 9am",
        "Type": "set",
        "Value": {
          "Timex": "T09",
          "FutureResolution": {"set": "Set: T09"},
          "PastResolution": {"set": "Set: T09"}
        },
        "Start": 11,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll leave every afternoon at 4pm",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3730732+08:00"},
    "Results": [
      {
        "Text": "every afternoon at 4pm",
        "Type": "set",
        "Value": {
          "Timex": "T16",
          "FutureResolution": {"set": "Set: T16"},
          "PastResolution": {"set": "Set: T16"}
        },
        "Start": 11,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll leave every night at 9pm",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3840706+08:00"},
    "Results": [
      {
        "Text": "every night at 9pm",
        "Type": "set",
        "Value": {
          "Timex": "T21",
          "FutureResolution": {"set": "Set: T21"},
          "PastResolution": {"set": "Set: T21"}
        },
        "Start": 11,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll leave every night at 9",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.3930718+08:00"},
    "Results": [
      {
        "Text": "every night at 9",
        "Type": "set",
        "Value": {
          "Timex": "T21",
          "FutureResolution": {"set": "Set: T21"},
          "PastResolution": {"set": "Set: T21"}
        },
        "Start": 11,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll leave mornings at 9am",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.4065719+08:00"},
    "Results": [
      {
        "Text": "mornings at 9am",
        "Type": "set",
        "Value": {
          "Timex": "T09",
          "FutureResolution": {"set": "Set: T09"},
          "PastResolution": {"set": "Set: T09"}
        },
        "Start": 11,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll leave on mornings at 9",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.4170727+08:00"},
    "Results": [
      {
        "Text": "on mornings at 9",
        "Type": "set",
        "Value": {
          "Timex": "T09",
          "FutureResolution": {"set": "Set: T09"},
          "PastResolution": {"set": "Set: T09"}
        },
        "Start": 11,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll leave at 9am every sunday",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.4295727+08:00"},
    "Results": [
      {
        "Text": "9am every sunday",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-7T09",
          "FutureResolution": {"set": "Set: XXXX-WXX-7T09"},
          "PastResolution": {"set": "Set: XXXX-WXX-7T09"}
        },
        "Start": 14,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll leave at 9am on sundays",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.438575+08:00"},
    "Results": [
      {
        "Text": "9am on sundays",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-7T09",
          "FutureResolution": {"set": "Set: XXXX-WXX-7T09"},
          "PastResolution": {"set": "Set: XXXX-WXX-7T09"}
        },
        "Start": 14,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll leave at 9am sundays",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.4505726+08:00"},
    "Results": [
      {
        "Text": "9am sundays",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-7T09",
          "FutureResolution": {"set": "Set: XXXX-WXX-7T09"},
          "PastResolution": {"set": "Set: XXXX-WXX-7T09"}
        },
        "Start": 14,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll leave on mondays",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.4570731+08:00"},
    "Results": [
      {
        "Text": "on mondays",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-1",
          "FutureResolution": {"set": "Set: XXXX-WXX-1"},
          "PastResolution": {"set": "Set: XXXX-WXX-1"}
        },
        "Start": 11,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave on sundays",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.4635727+08:00"},
    "Results": [
      {
        "Text": "on sundays",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-7",
          "FutureResolution": {"set": "Set: XXXX-WXX-7"},
          "PastResolution": {"set": "Set: XXXX-WXX-7"}
        },
        "Start": 11,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave sundays",
    "Context": {"ReferenceDateTime": "2017-09-27T17:25:54.4710739+08:00"},
    "Results": [
      {
        "Text": "sundays",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-7",
          "FutureResolution": {"set": "Set: XXXX-WXX-7"},
          "PastResolution": {"set": "Set: XXXX-WXX-7"}
        },
        "Start": 11,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I go on vacation once a year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "once a year",
        "Type": "set",
        "Value": {
          "Timex": "P1Y",
          "FutureResolution": {"set": "Set: P1Y"},
          "PastResolution": {"set": "Set: P1Y"}
        },
        "Start": 17,
        "Length": 11
      }
    ]
  },
  {
    "Input": "Let's meet once a week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "once a week",
        "Type": "set",
        "Value": {
          "Timex": "P1W",
          "FutureResolution": {"set": "Set: P1W"},
          "PastResolution": {"set": "Set: P1W"}
        },
        "Start": 11,
        "Length": 11
      }
    ]
  },
  {
    "Input": "every other friday",
    "Context": {"ReferenceDateTime": "2019-11-25T17:00:00"},
    "Results": [
      {
        "Text": "every other friday",
        "Type": "set",
        "Value": {
          "Timex": "XXXX-WXX-5",
          "FutureResolution": {"set": "Set: XXXX-WXX-5"},
          "PastResolution": {"set": "Set: XXXX-WXX-5"}
        },
        "Start": 0,
        "Length": 18
      }
    ]
  },
  {
    "Input": "Let's have a quarterly meeting.",
    "Context": {"ReferenceDateTime": "2019-11-25T17:00:00"},
    "Results": [
      {
        "Text": "quarterly",
        "Type": "set",
        "Value": {
          "Timex": "P3M",
          "FutureResolution": {"set": "Set: P3M"},
          "PastResolution": {"set": "Set: P3M"}
        },
        "Start": 13,
        "Length": 9
      }
    ]
  },
  {
    "Input": "It's an everyday routine.",
    "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
    "Results": [
      {
        "Text": "everyday",
        "Type": "set",
        "Value": {
          "Timex": "P1D",
          "FutureResolution": {"set": "Set: P1D"},
          "PastResolution": {"set": "Set: P1D"}
        },
        "Start": 8,
        "Length": 8
      }
    ]
  }
];
