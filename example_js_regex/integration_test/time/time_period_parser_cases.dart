final timePeriodParserTestCases = [
  {
    "Input": "I'll be out 5 to 6pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "5 to 6pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T17,T18,PT1H)",
          "FutureResolution": {"startTime": "17:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "17:00:00", "endTime": "18:00:00"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out 5 to 6 p.m",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "5 to 6 p.m",
        "Type": "timerange",
        "Value": {
          "Timex": "(T17,T18,PT1H)",
          "FutureResolution": {"startTime": "17:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "17:00:00", "endTime": "18:00:00"}
        },
        "Start": 12,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll be out 5 to seven in the morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "5 to seven in the morning",
        "Type": "timerange",
        "Value": {
          "Timex": "(T05,T07,PT2H)",
          "FutureResolution": {"startTime": "05:00:00", "endTime": "07:00:00"},
          "PastResolution": {"startTime": "05:00:00", "endTime": "07:00:00"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out from 5 to 6 pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 5 to 6 pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T17,T18,PT1H)",
          "FutureResolution": {"startTime": "17:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "17:00:00", "endTime": "18:00:00"}
        },
        "Start": 12,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll be out between 5 and 6pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "between 5 and 6pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T17,T18,PT1H)",
          "FutureResolution": {"startTime": "17:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "17:00:00", "endTime": "18:00:00"}
        },
        "Start": 12,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll be out between 5pm and 6pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "between 5pm and 6pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T17,T18,PT1H)",
          "FutureResolution": {"startTime": "17:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "17:00:00", "endTime": "18:00:00"}
        },
        "Start": 12,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll be out between 5 and 6 in the afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "between 5 and 6 in the afternoon",
        "Type": "timerange",
        "Value": {
          "Timex": "(T17,T18,PT1H)",
          "FutureResolution": {"startTime": "17:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "17:00:00", "endTime": "18:00:00"}
        },
        "Start": 12,
        "Length": 32
      }
    ]
  },
  {
    "Input": "I'll be out from 1am to 5pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 1am to 5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T01,T17,PT16H)",
          "FutureResolution": {"startTime": "01:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "01:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll be out 4pm till 5pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "4pm till 5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T16,T17,PT1H)",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll be out 4 til 5pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "4 til 5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T16,T17,PT1H)",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out 4:00 to 7 oclock",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "4:00 to 7 oclock",
        "Type": "timerange",
        "Value": {
          "Timex": "(T04:00,T07,PT3H)",
          "FutureResolution": {"startTime": "04:00:00", "endTime": "07:00:00"},
          "PastResolution": {"startTime": "04:00:00", "endTime": "07:00:00"}
        },
        "Start": 12,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll be out 4pm-5pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "4pm-5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T16,T17,PT1H)",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out 4pm - 5pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "4pm - 5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T16,T17,PT1H)",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out from 3 in the morning until 5pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 3 in the morning until 5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T03,T17,PT14H)",
          "FutureResolution": {"startTime": "03:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "03:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 31
      }
    ]
  },
  {
    "Input": "I'll be out between 3 in the morning and 5pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "between 3 in the morning and 5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T03,T17,PT14H)",
          "FutureResolution": {"startTime": "03:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "03:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 32
      }
    ]
  },
  {
    "Input": "I'll be out between 4pm and 5pm today",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "between 4pm and 5pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T16,T17,PT1H)",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "17:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "17:00:00"}
        },
        "Start": 12,
        "Length": 19
      }
    ]
  },
  {
    "Input": "let's meet in the morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the morning",
        "Type": "timerange",
        "Value": {
          "Timex": "TMO",
          "FutureResolution": {"startTime": "08:00:00", "endTime": "12:00:00"},
          "PastResolution": {"startTime": "08:00:00", "endTime": "12:00:00"}
        },
        "Start": 11,
        "Length": 14
      }
    ]
  },
  {
    "Input": "let's meet in the afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the afternoon",
        "Type": "timerange",
        "Value": {
          "Timex": "TAF",
          "FutureResolution": {"startTime": "12:00:00", "endTime": "16:00:00"},
          "PastResolution": {"startTime": "12:00:00", "endTime": "16:00:00"}
        },
        "Start": 11,
        "Length": 16
      }
    ]
  },
  {
    "Input": "let's meet in the night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the night",
        "Type": "timerange",
        "Value": {
          "Timex": "TNI",
          "FutureResolution": {"startTime": "20:00:00", "endTime": "23:59:59"},
          "PastResolution": {"startTime": "20:00:00", "endTime": "23:59:59"}
        },
        "Start": 11,
        "Length": 12
      }
    ]
  },
  {
    "Input": "let's meet in the evening",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the evening",
        "Type": "timerange",
        "Value": {
          "Timex": "TEV",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "20:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "20:00:00"}
        },
        "Start": 11,
        "Length": 14
      }
    ]
  },
  {
    "Input": "let's meet in the evenings",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the evenings",
        "Type": "timerange",
        "Value": {
          "Timex": "TEV",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "20:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "20:00:00"}
        },
        "Start": 11,
        "Length": 15
      }
    ]
  },
  {
    "Input": "let's meet in the early-mornings",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-mornings",
        "Type": "timerange",
        "Value": {
          "Timex": "TMO",
          "Mod": "start",
          "FutureResolution": {"startTime": "08:00:00", "endTime": "10:00:00"},
          "PastResolution": {"startTime": "08:00:00", "endTime": "10:00:00"}
        },
        "Start": 11,
        "Length": 21
      }
    ]
  },
  {
    "Input": "let's meet in the late-mornings",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-mornings",
        "Type": "timerange",
        "Value": {
          "Timex": "TMO",
          "Mod": "end",
          "FutureResolution": {"startTime": "10:00:00", "endTime": "12:00:00"},
          "PastResolution": {"startTime": "10:00:00", "endTime": "12:00:00"}
        },
        "Start": 11,
        "Length": 20
      }
    ]
  },
  {
    "Input": "let's meet in the early-morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-morning",
        "Type": "timerange",
        "Value": {
          "Timex": "TMO",
          "Mod": "start",
          "FutureResolution": {"startTime": "08:00:00", "endTime": "10:00:00"},
          "PastResolution": {"startTime": "08:00:00", "endTime": "10:00:00"}
        },
        "Start": 11,
        "Length": 20
      }
    ]
  },
  {
    "Input": "let's meet in the late-morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-morning",
        "Type": "timerange",
        "Value": {
          "Timex": "TMO",
          "Mod": "end",
          "FutureResolution": {"startTime": "10:00:00", "endTime": "12:00:00"},
          "PastResolution": {"startTime": "10:00:00", "endTime": "12:00:00"}
        },
        "Start": 11,
        "Length": 19
      }
    ]
  },
  {
    "Input": "let's meet in the early-afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-afternoon",
        "Type": "timerange",
        "Value": {
          "Timex": "TAF",
          "Mod": "start",
          "FutureResolution": {"startTime": "12:00:00", "endTime": "14:00:00"},
          "PastResolution": {"startTime": "12:00:00", "endTime": "14:00:00"}
        },
        "Start": 11,
        "Length": 22
      }
    ]
  },
  {
    "Input": "let's meet in the late-afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-afternoon",
        "Type": "timerange",
        "Value": {
          "Timex": "TAF",
          "Mod": "end",
          "FutureResolution": {"startTime": "14:00:00", "endTime": "16:00:00"},
          "PastResolution": {"startTime": "14:00:00", "endTime": "16:00:00"}
        },
        "Start": 11,
        "Length": 21
      }
    ]
  },
  {
    "Input": "let's meet in the early-evening",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-evening",
        "Type": "timerange",
        "Value": {
          "Timex": "TEV",
          "Mod": "start",
          "FutureResolution": {"startTime": "16:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "16:00:00", "endTime": "18:00:00"}
        },
        "Start": 11,
        "Length": 20
      }
    ]
  },
  {
    "Input": "let's meet in the late-evening",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-evening",
        "Type": "timerange",
        "Value": {
          "Timex": "TEV",
          "Mod": "end",
          "FutureResolution": {"startTime": "18:00:00", "endTime": "20:00:00"},
          "PastResolution": {"startTime": "18:00:00", "endTime": "20:00:00"}
        },
        "Start": 11,
        "Length": 19
      }
    ]
  },
  {
    "Input": "let's meet in the early-night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-night",
        "Type": "timerange",
        "Value": {
          "Timex": "TNI",
          "Mod": "start",
          "FutureResolution": {"startTime": "20:00:00", "endTime": "22:00:00"},
          "PastResolution": {"startTime": "20:00:00", "endTime": "22:00:00"}
        },
        "Start": 11,
        "Length": 18
      }
    ]
  },
  {
    "Input": "let's meet in the late-night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-night",
        "Type": "timerange",
        "Value": {
          "Timex": "TNI",
          "Mod": "end",
          "FutureResolution": {"startTime": "22:00:00", "endTime": "23:59:59"},
          "PastResolution": {"startTime": "22:00:00", "endTime": "23:59:59"}
        },
        "Start": 11,
        "Length": 17
      }
    ]
  },
  {
    "Input": "let's meet in the early night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early night",
        "Type": "timerange",
        "Value": {
          "Timex": "TNI",
          "Mod": "start",
          "FutureResolution": {"startTime": "20:00:00", "endTime": "22:00:00"},
          "PastResolution": {"startTime": "20:00:00", "endTime": "22:00:00"}
        },
        "Start": 11,
        "Length": 18
      }
    ]
  },
  {
    "Input": "let's meet in the late night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late night",
        "Type": "timerange",
        "Value": {
          "Timex": "TNI",
          "Mod": "end",
          "FutureResolution": {"startTime": "22:00:00", "endTime": "23:59:59"},
          "PastResolution": {"startTime": "22:00:00", "endTime": "23:59:59"}
        },
        "Start": 11,
        "Length": 17
      }
    ]
  },
  {
    "Input": "let's meet from 1p.m. to 4",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 1p.m. to 4",
        "Type": "timerange",
        "Value": {
          "Timex": "(T13,T16,PT3H)",
          "FutureResolution": {"startTime": "13:00:00", "endTime": "16:00:00"},
          "PastResolution": {"startTime": "13:00:00", "endTime": "16:00:00"}
        },
        "Start": 11,
        "Length": 15
      }
    ]
  },
  {
    "Input": "let's meet from 1:30p.m. to 4.",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 1:30p.m. to 4",
        "Type": "timerange",
        "Value": {
          "Timex": "(T13:30,T16,PT2H30M)",
          "FutureResolution": {"startTime": "13:30:00", "endTime": "16:00:00"},
          "PastResolution": {"startTime": "13:30:00", "endTime": "16:00:00"}
        },
        "Start": 11,
        "Length": 18
      }
    ]
  },
  {
    "Input": "Schedule during the morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "morning",
        "Type": "timerange",
        "Value": {
          "Timex": "TMO",
          "FutureResolution": {"startTime": "08:00:00", "endTime": "12:00:00"},
          "PastResolution": {"startTime": "08:00:00", "endTime": "12:00:00"}
        },
        "Start": 20,
        "Length": 7
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 1:30am to 3",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 1:30am to 3",
        "Type": "timerange",
        "Value": {
          "Timex": "(T01:30,T03,PT1H30M)",
          "FutureResolution": {"startTime": "01:30:00", "endTime": "03:00:00"},
          "PastResolution": {"startTime": "01:30:00", "endTime": "03:00:00"}
        },
        "Start": 32,
        "Length": 16
      }
    ]
  },
  {
    "Input": "The class is from 11 am to 3",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11 am to 3",
        "Type": "timerange",
        "Value": {
          "Timex": "(T11,T15,PT4H)",
          "FutureResolution": {"startTime": "11:00:00", "endTime": "15:00:00"},
          "PastResolution": {"startTime": "11:00:00", "endTime": "15:00:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "The class is from 11 pm to 3",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11 pm to 3",
        "Type": "timerange",
        "Value": {
          "Timex": "(T23,T03,PT4H)",
          "FutureResolution": {"startTime": "23:00:00", "endTime": "03:00:00"},
          "PastResolution": {"startTime": "23:00:00", "endTime": "03:00:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "The class is from 11:01 pm to 11",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11:01 pm to 11",
        "Type": "timerange",
        "Value": {
          "Timex": "(T23:01,T11,PT11H59M)",
          "FutureResolution": {"startTime": "23:01:00", "endTime": "11:00:00"},
          "PastResolution": {"startTime": "23:01:00", "endTime": "11:00:00"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "The class is from 11:01 am to 11",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11:01 am to 11",
        "Type": "timerange",
        "Value": {
          "Timex": "(T11:01,T23,PT11H59M)",
          "FutureResolution": {"startTime": "11:01:00", "endTime": "23:00:00"},
          "PastResolution": {"startTime": "11:01:00", "endTime": "23:00:00"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 11am to 11:50",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11am to 11:50",
        "Type": "timerange",
        "Value": {
          "Timex": "(T11,T11:50,PT50M)",
          "FutureResolution": {"startTime": "11:00:00", "endTime": "11:50:00"},
          "PastResolution": {"startTime": "11:00:00", "endTime": "11:50:00"}
        },
        "Start": 32,
        "Length": 18
      }
    ]
  },
  {
    "Input": "set up meeting from 1:30 pm to 3:30",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 1:30 pm to 3:30",
        "Type": "timerange",
        "Value": {
          "Timex": "(T13:30,T15:30,PT2H)",
          "FutureResolution": {"startTime": "13:30:00", "endTime": "15:30:00"},
          "PastResolution": {"startTime": "13:30:00", "endTime": "15:30:00"}
        },
        "Start": 15,
        "Length": 20
      }
    ]
  },
  {
    "Input": "set up meeting from 1:30 pm to 3:30 pm",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 1:30 pm to 3:30 pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T13:30,T15:30,PT2H)",
          "FutureResolution": {"startTime": "13:30:00", "endTime": "15:30:00"},
          "PastResolution": {"startTime": "13:30:00", "endTime": "15:30:00"}
        },
        "Start": 15,
        "Length": 23
      }
    ]
  },
  {
    "Input": "set up meeting from 3 pm to 3:30 pm",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 3 pm to 3:30 pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T15,T15:30,PT30M)",
          "FutureResolution": {"startTime": "15:00:00", "endTime": "15:30:00"},
          "PastResolution": {"startTime": "15:00:00", "endTime": "15:30:00"}
        },
        "Start": 15,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I have been waiting from 0:01 am to 1 pm",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "from 0:01 am to 1 pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T00:01,T13,PT12H59M)",
          "FutureResolution": {"startTime": "00:01:00", "endTime": "13:00:00"},
          "PastResolution": {"startTime": "00:01:00", "endTime": "13:00:00"}
        },
        "Start": 20,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I have been waiting from 0:01 am to 1",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 0:01 am to 1",
        "Type": "timerange",
        "Value": {
          "Timex": "(T00:01,T01,PT59M)",
          "FutureResolution": {"startTime": "00:01:00", "endTime": "01:00:00"},
          "PastResolution": {"startTime": "00:01:00", "endTime": "01:00:00"}
        },
        "Start": 20,
        "Length": 17
      }
    ]
  },
  {
    "Input": "set up meeting from 3 to 3:30",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 3 to 3:30",
        "Type": "timerange",
        "Value": {
          "Timex": "(T03,T03:30,PT30M)",
          "FutureResolution": {"startTime": "03:00:00", "endTime": "03:30:00"},
          "PastResolution": {"startTime": "03:00:00", "endTime": "03:30:00"}
        },
        "Start": 15,
        "Length": 14
      }
    ]
  },
  {
    "Input": "set up meeting from 1:30 to 3",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 1:30 to 3",
        "Type": "timerange",
        "Value": {
          "Timex": "(T01:30,T03,PT1H30M)",
          "FutureResolution": {"startTime": "01:30:00", "endTime": "03:00:00"},
          "PastResolution": {"startTime": "01:30:00", "endTime": "03:00:00"}
        },
        "Start": 15,
        "Length": 14
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 1:30 to 3pm",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 1:30 to 3pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T13:30,T15,PT1H30M)",
          "FutureResolution": {"startTime": "13:30:00", "endTime": "15:00:00"},
          "PastResolution": {"startTime": "13:30:00", "endTime": "15:00:00"}
        },
        "Start": 32,
        "Length": 16
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 11 to 3pm",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11 to 3pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T11,T15,PT4H)",
          "FutureResolution": {"startTime": "11:00:00", "endTime": "15:00:00"},
          "PastResolution": {"startTime": "11:00:00", "endTime": "15:00:00"}
        },
        "Start": 32,
        "Length": 14
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 11 to 11:50am",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11 to 11:50am",
        "Type": "timerange",
        "Value": {
          "Timex": "(T11,T11:50,PT50M)",
          "FutureResolution": {"startTime": "11:00:00", "endTime": "11:50:00"},
          "PastResolution": {"startTime": "11:00:00", "endTime": "11:50:00"}
        },
        "Start": 32,
        "Length": 18
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 11 to 3am",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 11 to 3am",
        "Type": "timerange",
        "Value": {
          "Timex": "(T23,T03,PT4H)",
          "FutureResolution": {"startTime": "23:00:00", "endTime": "03:00:00"},
          "PastResolution": {"startTime": "23:00:00", "endTime": "03:00:00"}
        },
        "Start": 32,
        "Length": 14
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 10 to 11am",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 10 to 11am",
        "Type": "timerange",
        "Value": {
          "Timex": "(T10,T11,PT1H)",
          "FutureResolution": {"startTime": "10:00:00", "endTime": "11:00:00"},
          "PastResolution": {"startTime": "10:00:00", "endTime": "11:00:00"}
        },
        "Start": 32,
        "Length": 15
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 23 to 3am",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 23 to 3am",
        "Type": "timerange",
        "Value": {
          "Timex": "(T23,T03,PT4H)",
          "FutureResolution": {"startTime": "23:00:00", "endTime": "03:00:00"},
          "PastResolution": {"startTime": "23:00:00", "endTime": "03:00:00"}
        },
        "Start": 32,
        "Length": 14
      }
    ]
  },
  {
    "Input": "please help me set up a meeting from 23 to 3pm",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "Results": [
      {
        "Text": "from 23 to 3pm",
        "Type": "timerange",
        "Value": {
          "Timex": "(T23,T15,PT16H)",
          "FutureResolution": {"startTime": "23:00:00", "endTime": "15:00:00"},
          "PastResolution": {"startTime": "23:00:00", "endTime": "15:00:00"}
        },
        "Start": 32,
        "Length": 14
      }
    ]
  },
  {
    "Input": "set up meeting between 10 and 11:30",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 10 and 11:30",
        "Type": "timerange",
        "Value": {
          "Timex": "(T10,T11:30,PT1H30M)",
          "FutureResolution": {"startTime": "10:00:00", "endTime": "11:30:00"},
          "PastResolution": {"startTime": "10:00:00", "endTime": "11:30:00"}
        },
        "Start": 15,
        "Length": 20
      }
    ]
  },
  {
    "Input": "set up meeting between 10:10am and 12:50",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 10:10am and 12:50",
        "Type": "timerange",
        "Value": {
          "Timex": "(T10:10,T12:50,PT2H40M)",
          "FutureResolution": {"startTime": "10:10:00", "endTime": "12:50:00"},
          "PastResolution": {"startTime": "10:10:00", "endTime": "12:50:00"}
        },
        "Start": 15,
        "Length": 25
      }
    ]
  },
  {
    "Input": "set up meeting between 10:10pm and 3",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 10:10pm and 3",
        "Type": "timerange",
        "Value": {
          "Timex": "(T22:10,T03,PT4H50M)",
          "FutureResolution": {"startTime": "22:10:00", "endTime": "03:00:00"},
          "PastResolution": {"startTime": "22:10:00", "endTime": "03:00:00"}
        },
        "Start": 15,
        "Length": 21
      }
    ]
  },
  {
    "Input": "set up meeting from 10:10pm to 10",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 10:10pm to 10",
        "Type": "timerange",
        "Value": {
          "Timex": "(T22:10,T10,PT11H50M)",
          "FutureResolution": {"startTime": "22:10:00", "endTime": "10:00:00"},
          "PastResolution": {"startTime": "22:10:00", "endTime": "10:00:00"}
        },
        "Start": 15,
        "Length": 18
      }
    ]
  },
  {
    "Input": "set up meeting from 10:30am to 23",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 10:30am to 23",
        "Type": "timerange",
        "Value": {
          "Timex": "(T10:30,T23,PT12H30M)",
          "FutureResolution": {"startTime": "10:30:00", "endTime": "23:00:00"},
          "PastResolution": {"startTime": "10:30:00", "endTime": "23:00:00"}
        },
        "Start": 15,
        "Length": 18
      }
    ]
  },
  {
    "Input": "Don't call me in the business hours.",
    "Context": {"ReferenceDateTime": "2017-12-01T13:37:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "in the business hours",
        "Type": "timerange",
        "Value": {
          "Timex": "TBH",
          "FutureResolution": {"startTime": "08:00:00", "endTime": "18:00:00"},
          "PastResolution": {"startTime": "08:00:00", "endTime": "18:00:00"}
        },
        "Start": 14,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll be out lunch time",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "lunch time",
        "Type": "timerange",
        "Value": {
          "Timex": "TMEL",
          "FutureResolution": {"startTime": "11:00:00", "endTime": "13:00:00"},
          "PastResolution": {"startTime": "11:00:00", "endTime": "13:00:00"}
        },
        "Start": 12,
        "Length": 10
      }
    ]
  },
  {
    "Input": "He is at lunch",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "at lunch",
        "Type": "timerange",
        "Value": {
          "Timex": "TMEL",
          "FutureResolution": {"startTime": "11:00:00", "endTime": "13:00:00"},
          "PastResolution": {"startTime": "11:00:00", "endTime": "13:00:00"}
        },
        "Start": 6,
        "Length": 8
      }
    ]
  },
  {
    "Input":
        "This popular family friendly concert returns to the Hall for another lunchtime filled with traditional carols and festive favourites",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "lunchtime",
        "Type": "timerange",
        "Value": {
          "Timex": "TMEL",
          "FutureResolution": {"startTime": "11:00:00", "endTime": "13:00:00"},
          "PastResolution": {"startTime": "11:00:00", "endTime": "13:00:00"}
        },
        "Start": 69,
        "Length": 9
      }
    ]
  }
];
