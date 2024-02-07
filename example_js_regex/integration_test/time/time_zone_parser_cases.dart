final timeZoneParserTestCases = [
  {
    "Input": "Book me a room at beijing time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "beijing time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+08:00", "UtcOffsetMins": 480}
        },
        "Start": 18,
        "Length": 12
      }
    ]
  },
  {
    "Input": "Book me a room at utc4:30",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "utc4:30",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+04:30", "UtcOffsetMins": 270}
        },
        "Start": 18,
        "Length": 7
      }
    ]
  },
  {
    "Input": "Book me a room at gmt-3",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "gmt-3",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-03:00", "UtcOffsetMins": -180}
        },
        "Start": 18,
        "Length": 5
      }
    ]
  },
  {
    "Input": "Book me a room at afghanistan standard time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "afghanistan standard time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+04:30", "UtcOffsetMins": 270}
        },
        "Start": 18,
        "Length": 25
      }
    ]
  },
  {
    "Input": "Book me a room at aft",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "aft",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+04:30", "UtcOffsetMins": 270}
        },
        "Start": 18,
        "Length": 3
      }
    ]
  },
  {
    "Input": "Book me a room at utc±0",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "utc±0",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+00:00", "UtcOffsetMins": 0}
        },
        "Start": 18,
        "Length": 5
      }
    ]
  },
  {
    "Input": "Book me a room at pdst",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "pdst",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-07:00", "UtcOffsetMins": -420}
        },
        "Start": 18,
        "Length": 4
      }
    ]
  },
  {
    "Input": "Book me a room at awdt",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "awdt",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+09:00", "UtcOffsetMins": 540}
        },
        "Start": 18,
        "Length": 4
      }
    ]
  },
  {
    "Input": "Book me a room at cot",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "cot",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-05:00", "UtcOffsetMins": -300}
        },
        "Start": 18,
        "Length": 3
      }
    ]
  },
  {
    "Input": "Book me a room at hkt",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "hkt",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+08:00", "UtcOffsetMins": 480}
        },
        "Start": 18,
        "Length": 3
      }
    ]
  },
  {
    "Input": "Book me a room at pacific daylight saving time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "pacific daylight saving time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-07:00", "UtcOffsetMins": -420}
        },
        "Start": 18,
        "Length": 28
      }
    ]
  },
  {
    "Input": "Book me a room at austrialian western daylight time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "austrialian western daylight time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+09:00", "UtcOffsetMins": 540}
        },
        "Start": 18,
        "Length": 33
      }
    ]
  },
  {
    "Input": "Book me a room at australian western daylight time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "australian western daylight time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+09:00", "UtcOffsetMins": 540}
        },
        "Start": 18,
        "Length": 32
      }
    ]
  },
  {
    "Input": "Book me a room at australian west daylight time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "australian west daylight time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+09:00", "UtcOffsetMins": 540}
        },
        "Start": 18,
        "Length": 29
      }
    ]
  },
  {
    "Input": "Book me a room at colombia time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "colombia time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-05:00", "UtcOffsetMins": -300}
        },
        "Start": 18,
        "Length": 13
      }
    ]
  },
  {
    "Input": "Book me a room at hong kong time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "hong kong time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+08:00", "UtcOffsetMins": 480}
        },
        "Start": 18,
        "Length": 14
      }
    ]
  },
  {
    "Input": "Book me a room at aedt",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "aedt",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+11:00", "UtcOffsetMins": 660}
        },
        "Start": 18,
        "Length": 4
      }
    ]
  },
  {
    "Input": "Book me a room at pdt",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "pdt",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-07:00", "UtcOffsetMins": -420}
        },
        "Start": 18,
        "Length": 3
      }
    ]
  },
  {
    "Input": "Book me a room at tost",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "tost",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+14:00", "UtcOffsetMins": 840}
        },
        "Start": 18,
        "Length": 4
      }
    ]
  },
  {
    "Input": "Book me a room at pacific daylight time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "pacific daylight time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-07:00", "UtcOffsetMins": -420}
        },
        "Start": 18,
        "Length": 21
      }
    ]
  },
  {
    "Input": "Book me a room at 10:30am montreal time.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "montreal time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": -10000}
        },
        "Start": 26,
        "Length": 13
      }
    ]
  },
  {
    "Input": "Book me a room at Saint Barthélemy time.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "Saint Barthélemy time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": -10000}
        },
        "Start": 18,
        "Length": 21
      }
    ]
  },
  {
    "Input": "Book me a room at 16:30 WET.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "WET",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+00:00", "UtcOffsetMins": 0}
        },
        "Start": 24,
        "Length": 3
      }
    ]
  },
  {
    "Input": "Book me a room at 16:30 Central Europe Std Time.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "Central Europe Std Time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+01:00", "UtcOffsetMins": 60}
        },
        "Start": 24,
        "Length": 23
      }
    ]
  },
  {
    "Input": "We can do either New York time or Sao Paulo time.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "New York time",
        "Start": 17,
        "Length": 13,
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": "-10000"}
        }
      },
      {
        "Text": "Sao Paulo time",
        "Start": 34,
        "Length": 14,
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": "-10000"}
        }
      }
    ]
  },
  {
    "Input": "Make sure to accommodate west coast timezone.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "west coast timezone",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-07:00", "UtcOffsetMins": -420}
        },
        "Start": 25,
        "Length": 19
      }
    ]
  },
  {
    "Input": "tonight at 6PM CDT time",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "CDT",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": "-10000"}
        },
        "Start": 15,
        "Length": 3
      }
    ]
  },
  {
    "Input": "Please schedule 30 minute teams call during central time business hours",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Comment": "Central by default resolves to standard time, not daylight. Returning both options is in the roadmap.",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "central time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-06:00", "UtcOffsetMins": -360}
        },
        "Start": 44,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I’m open at 11:30 AMPDT/1:30CST today",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "dotnet, javascript, java, python",
    "Results": [
      {
        "Text": "PDT",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-07:00", "UtcOffsetMins": -420}
        },
        "Start": 20,
        "Length": 3
      },
      {
        "Text": "CST",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": -10000}
        },
        "Start": 28,
        "Length": 3
      }
    ]
  },
  {
    "Input": "I'm in the pacific timezone",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "pacific timezone",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"value": "UTC-08:00", "utcOffsetMins": "-480"}
        },
        "Start": 11,
        "Length": 16
      }
    ]
  },
  {
    "Input": "Let's meet at 1pm mountain timezone",
    "NotSupported": "javascript",
    "Comment": "Mountain by default resolves to standard time, not daylight. Returning both options is in the roadmap.",
    "Results": [
      {
        "Text": "mountain timezone",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "-420", "value": "UTC-07:00"}
        },
        "Start": 18,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'm in the Madrid time",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "Madrid time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "60", "value": "UTC+01:00"}
        },
        "Start": 11,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'm in the Madrid timezone",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "Madrid timezone",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "60", "value": "UTC+01:00"}
        },
        "Start": 11,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'm in the Madrid  timezone",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "Madrid  timezone",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "60", "value": "UTC+01:00"}
        },
        "Start": 11,
        "Length": 16
      }
    ]
  },
  {"Input": "I'm in Madrid.", "NotSupported": "javascript", "Results": []},
  {
    "Input": "I'm on Russia time zone 3",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "russia time zone 3",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "240", "value": "UTC+04:00"}
        },
        "Start": 7,
        "Length": 18
      }
    ]
  },
  {
    "Input": "All times in central standard time (mexico)",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "central standard time (mexico)",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "-360", "value": "UTC-06:00"}
        },
        "Start": 13,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I'm on Russia time zone 10",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "russia time zone 10",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "660", "value": "UTC+11:00"}
        },
        "Start": 7,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'm at MSK+7, not MSK",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "MSK+7",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "600", "value": "UTC+10:00"}
        },
        "Start": 7,
        "Length": 5
      },
      {
        "Text": "MSK",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "180", "value": "UTC+03:00"}
        },
        "Start": 18,
        "Length": 3
      }
    ]
  },
  {
    "Input": "I'm at MSK-1.",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "MSK-1",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"utcOffsetMins": "120", "value": "UTC+02:00"}
        },
        "Start": 7,
        "Length": 5
      }
    ]
  },
  {
    "Input": "Book me a room at UTC + 4",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "utc + 4",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+04:00", "UtcOffsetMins": 240}
        },
        "Start": 18,
        "Length": 7
      }
    ]
  },
  {
    "Input": "Book me a room at UTC -4",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "UTC -4",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-04:00", "UtcOffsetMins": -240}
        },
        "Start": 18,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'm at Eastern Daylight Time",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "eastern daylight time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": -10000}
        },
        "Start": 7,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'm at Central Daylight Time",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "central daylight Time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": -10000}
        },
        "Start": 7,
        "Length": 21
      }
    ]
  },
  {
    "Input": "It's about 1pm ACDT",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "acdt",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+10:30", "UtcOffsetMins": 630}
        },
        "Start": 15,
        "Length": 4
      }
    ]
  },
  {
    "Input": "Kiribati's Line Islands is in UTC+14",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "utc+14",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+14:00", "UtcOffsetMins": 840}
        },
        "Start": 30,
        "Length": 6
      }
    ]
  },
  {
    "Input": "All deadlines are 11.59 pm UTC -12h (\"anywhere on Earth / AoE\")",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "UTC -12h",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-12:00", "UtcOffsetMins": -720}
        },
        "Start": 27,
        "Length": 8
      },
      {
        "Text": "anywhere on earth",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-12:00", "UtcOffsetMins": -720}
        },
        "Start": 38,
        "Length": 17
      },
      {
        "Text": "aoe",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC-12:00", "UtcOffsetMins": -720}
        },
        "Start": 58,
        "Length": 3
      }
    ]
  },
  {
    "Input": "Don't forget we're in UK time",
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "uk time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": -10000}
        },
        "Start": 22,
        "Length": 7
      }
    ]
  },
  {
    "Input": "Can you find a slot in a US-friendly time?",
    "NotSupported": "javascript,python,java",
    "Results": [
      {
        "Text": "US-friendly time",
        "Type": "timezone",
        "Value": {
          "TimeZoneResolution": {"Value": "UTC+XX:XX", "UtcOffsetMins": -10000}
        },
        "Start": 25,
        "Length": 16
      }
    ]
  }
];
