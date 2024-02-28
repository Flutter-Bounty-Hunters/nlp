const dateTimePeriodParserTestCases = [
  {
    "Input": "I'll be out five to seven today",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "five to seven today",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T05,2016-11-07T07,PT2H)",
          "FutureResolution": {"startDateTime": "2016-11-07 05:00:00", "endDateTime": "2016-11-07 07:00:00"},
          "PastResolution": {"startDateTime": "2016-11-07 05:00:00", "endDateTime": "2016-11-07 07:00:00"}
        },
        "Start": 12,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll be out from 5 to 6 of 4/22/2016",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 5 to 6 of 4/22/2016",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-04-22T05,2016-04-22T06,PT1H)",
          "FutureResolution": {"startDateTime": "2016-04-22 05:00:00", "endDateTime": "2016-04-22 06:00:00"},
          "PastResolution": {"startDateTime": "2016-04-22 05:00:00", "endDateTime": "2016-04-22 06:00:00"}
        },
        "Start": 12,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll be out from 5 to 6 of April 22",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 5 to 6 of april 22",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-04-22T05,XXXX-04-22T06,PT1H)",
          "FutureResolution": {"startDateTime": "2017-04-22 05:00:00", "endDateTime": "2017-04-22 06:00:00"},
          "PastResolution": {"startDateTime": "2016-04-22 05:00:00", "endDateTime": "2016-04-22 06:00:00"}
        },
        "Start": 12,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll be out from 5 to 6pm of April 22",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 5 to 6pm of april 22",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-04-22T17,XXXX-04-22T18,PT1H)",
          "FutureResolution": {"startDateTime": "2017-04-22 17:00:00", "endDateTime": "2017-04-22 18:00:00"},
          "PastResolution": {"startDateTime": "2016-04-22 17:00:00", "endDateTime": "2016-04-22 18:00:00"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out from 5 to 6 on 1st Jan",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 5 to 6 on 1st jan",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-01-01T05,XXXX-01-01T06,PT1H)",
          "FutureResolution": {"startDateTime": "2017-01-01 05:00:00", "endDateTime": "2017-01-01 06:00:00"},
          "PastResolution": {"startDateTime": "2016-01-01 05:00:00", "endDateTime": "2016-01-01 06:00:00"}
        },
        "Start": 12,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll be out 3pm to 4pm tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "3pm to 4pm tomorrow",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-08T15,2016-11-08T16,PT1H)",
          "FutureResolution": {"startDateTime": "2016-11-08 15:00:00", "endDateTime": "2016-11-08 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-08 15:00:00", "endDateTime": "2016-11-08 16:00:00"}
        },
        "Start": 12,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll be out 3:00 to 4:00 tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "3:00 to 4:00 tomorrow",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-08T03:00,2016-11-08T04:00,PT1H)",
          "FutureResolution": {"startDateTime": "2016-11-08 03:00:00", "endDateTime": "2016-11-08 04:00:00"},
          "PastResolution": {"startDateTime": "2016-11-08 03:00:00", "endDateTime": "2016-11-08 04:00:00"}
        },
        "Start": 12,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll be out half past seven to 4pm tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "half past seven to 4pm tomorrow",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-08T07:30,2016-11-08T16,PT8H30M)",
          "FutureResolution": {"startDateTime": "2016-11-08 07:30:00", "endDateTime": "2016-11-08 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-08 07:30:00", "endDateTime": "2016-11-08 16:00:00"}
        },
        "Start": 12,
        "Length": 31
      }
    ]
  },
  {
    "Input": "I'll be out from 4pm today to 5pm tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "from 4pm today to 5pm tomorrow",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16,2016-11-08T17,PT25H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:00:00", "endDateTime": "2016-11-08 17:00:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:00:00", "endDateTime": "2016-11-08 17:00:00"}
        },
        "Start": 12,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I'll be out from 2:00pm, 2016-2-21 to 3:32, 04/23/2016",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Comment": "Java does not correctly handle lookbehinds.",
    "NotSupported": "java",
    "Results": [
      {
        "Text": "from 2:00pm, 2016-2-21 to 3:32, 04/23/2016",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-02-21T14:00,2016-04-23T03:32,PT1477H32M)",
          "FutureResolution": {"startDateTime": "2016-02-21 14:00:00", "endDateTime": "2016-04-23 03:32:00"},
          "PastResolution": {"startDateTime": "2016-02-21 14:00:00", "endDateTime": "2016-04-23 03:32:00"}
        },
        "Start": 12,
        "Length": 42
      }
    ]
  },
  {
    "Input": "I'll be out between 4pm and 5pm today",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "between 4pm and 5pm today",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16,2016-11-07T17,PT1H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:00:00", "endDateTime": "2016-11-07 17:00:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:00:00", "endDateTime": "2016-11-07 17:00:00"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out between 4pm on Jan 1, 2016 and 5pm today",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "between 4pm on jan 1, 2016 and 5pm today",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-01-01T16,2016-11-07T17,PT7465H)",
          "FutureResolution": {"startDateTime": "2016-01-01 16:00:00", "endDateTime": "2016-11-07 17:00:00"},
          "PastResolution": {"startDateTime": "2016-01-01 16:00:00", "endDateTime": "2016-11-07 17:00:00"}
        },
        "Start": 12,
        "Length": 40
      }
    ]
  },
  {
    "Input": "I'll go back tonight",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tonight",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-07TNI",
          "FutureResolution": {"startDateTime": "2016-11-07 20:00:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 20:00:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 13,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll go back tonight for 8",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tonight",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-07TNI",
          "FutureResolution": {"startDateTime": "2016-11-07 20:00:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 20:00:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 13,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll go back this night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "this night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-07TNI",
          "FutureResolution": {"startDateTime": "2016-11-07 20:00:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 20:00:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back this evening",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "this evening",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-07TEV",
          "FutureResolution": {"startDateTime": "2016-11-07 16:00:00", "endDateTime": "2016-11-07 20:00:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:00:00", "endDateTime": "2016-11-07 20:00:00"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back this morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "this morning",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-07TMO",
          "FutureResolution": {"startDateTime": "2016-11-07 08:00:00", "endDateTime": "2016-11-07 12:00:00"},
          "PastResolution": {"startDateTime": "2016-11-07 08:00:00", "endDateTime": "2016-11-07 12:00:00"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back this afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "this afternoon",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-07TAF",
          "FutureResolution": {"startDateTime": "2016-11-07 12:00:00", "endDateTime": "2016-11-07 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-07 12:00:00", "endDateTime": "2016-11-07 16:00:00"}
        },
        "Start": 13,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll go back next night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "next night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-08TNI",
          "FutureResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 23:59:59"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back last night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "last night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-06TNI",
          "FutureResolution": {"startDateTime": "2016-11-06 20:00:00", "endDateTime": "2016-11-06 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-06 20:00:00", "endDateTime": "2016-11-06 23:59:59"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back tomorrow night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tomorrow night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-08TNI",
          "FutureResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 23:59:59"}
        },
        "Start": 13,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll go back next monday afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "next monday afternoon",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-14TAF",
          "FutureResolution": {"startDateTime": "2016-11-14 12:00:00", "endDateTime": "2016-11-14 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-14 12:00:00", "endDateTime": "2016-11-14 16:00:00"}
        },
        "Start": 13,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back last 3 minute",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "last 3 minute",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:09:00,2016-11-07T16:12:00,PT3M)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"}
        },
        "Start": 13,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back past 3 minute",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "past 3 minute",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:09:00,2016-11-07T16:12:00,PT3M)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"}
        },
        "Start": 13,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back previous 3 minute",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "previous 3 minute",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:09:00,2016-11-07T16:12:00,PT3M)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"}
        },
        "Start": 13,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll go back previous 3mins",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "previous 3mins",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:09:00,2016-11-07T16:12:00,PT3M)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:09:00", "endDateTime": "2016-11-07 16:12:00"}
        },
        "Start": 13,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll go back next 5 hrs",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "next 5 hrs",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T21:12:00,PT5H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 21:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 21:12:00"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back last minute",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "last minute",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:11:00,2016-11-07T16:12:00,PT1M)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:11:00", "endDateTime": "2016-11-07 16:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:11:00", "endDateTime": "2016-11-07 16:12:00"}
        },
        "Start": 13,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll go back next hour",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "next hour",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T17:12:00,PT1H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 17:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 17:12:00"}
        },
        "Start": 13,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll go back next few hours",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "next few hours",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T19:12:00,PT3H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 19:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 19:12:00"}
        },
        "Start": 13,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll go back tuesday in the morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday in the morning",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "FutureResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 12:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 08:00:00", "endDateTime": "2016-11-01 12:00:00"}
        },
        "Start": 13,
        "Length": 22
      }
    ]
  },
  {
    "Input": "Can you help us find a time in the morning of this Tuesday please?",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the morning of this tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2016-11-08TMO",
          "FutureResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 12:00:00"},
          "PastResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 12:00:00"}
        },
        "Start": 28,
        "Length": 30
      }
    ]
  },
  {
    "Input": "Please organize a meeting for 30 minutes on Tuesday, in the morning.",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday, in the morning",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "FutureResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 12:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 08:00:00", "endDateTime": "2016-11-01 12:00:00"}
        },
        "Start": 44,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll go back tuesday in the afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday in the afternoon",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TAF",
          "FutureResolution": {"startDateTime": "2016-11-08 12:00:00", "endDateTime": "2016-11-08 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 12:00:00", "endDateTime": "2016-11-01 16:00:00"}
        },
        "Start": 13,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll go back tuesday in the evening",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday in the evening",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TEV",
          "FutureResolution": {"startDateTime": "2016-11-08 16:00:00", "endDateTime": "2016-11-08 20:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 16:00:00", "endDateTime": "2016-11-01 20:00:00"}
        },
        "Start": 13,
        "Length": 22
      }
    ]
  },
  {
    "Input": "let's meet in the early-morning Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-morning tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 10:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 08:00:00", "endDateTime": "2016-11-01 10:00:00"}
        },
        "Start": 11,
        "Length": 28
      }
    ]
  },
  {
    "Input": "let's meet in the early-morning on Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-morning on tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 10:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 08:00:00", "endDateTime": "2016-11-01 10:00:00"}
        },
        "Start": 11,
        "Length": 31
      }
    ]
  },
  {
    "Input": "let's meet in the late-morning Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-morning tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 10:00:00", "endDateTime": "2016-11-08 12:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 10:00:00", "endDateTime": "2016-11-01 12:00:00"}
        },
        "Start": 11,
        "Length": 27
      }
    ]
  },
  {
    "Input": "let's meet in the early-afternoon Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-afternoon tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TAF",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 12:00:00", "endDateTime": "2016-11-08 14:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 12:00:00", "endDateTime": "2016-11-01 14:00:00"}
        },
        "Start": 11,
        "Length": 30
      }
    ]
  },
  {
    "Input": "let's meet in the late-afternoon Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-afternoon tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TAF",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 14:00:00", "endDateTime": "2016-11-08 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 14:00:00", "endDateTime": "2016-11-01 16:00:00"}
        },
        "Start": 11,
        "Length": 29
      }
    ]
  },
  {
    "Input": "let's meet in the early-evening Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-evening tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TEV",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 16:00:00", "endDateTime": "2016-11-08 18:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 16:00:00", "endDateTime": "2016-11-01 18:00:00"}
        },
        "Start": 11,
        "Length": 28
      }
    ]
  },
  {
    "Input": "let's meet in the late-evening Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-evening tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TEV",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 18:00:00", "endDateTime": "2016-11-08 20:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 18:00:00", "endDateTime": "2016-11-01 20:00:00"}
        },
        "Start": 11,
        "Length": 27
      }
    ]
  },
  {
    "Input": "let's meet in the early-night Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early-night tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 22:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 20:00:00", "endDateTime": "2016-11-01 22:00:00"}
        },
        "Start": 11,
        "Length": 26
      }
    ]
  },
  {
    "Input": "let's meet in the late-night Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late-night tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 22:00:00", "endDateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-01 22:00:00", "endDateTime": "2016-11-01 23:59:59"}
        },
        "Start": 11,
        "Length": 25
      }
    ]
  },
  {
    "Input": "let's meet in the early night Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the early night tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 22:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 20:00:00", "endDateTime": "2016-11-01 22:00:00"}
        },
        "Start": 11,
        "Length": 26
      }
    ]
  },
  {
    "Input": "let's meet in the late night Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late night tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 22:00:00", "endDateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-01 22:00:00", "endDateTime": "2016-11-01 23:59:59"}
        },
        "Start": 11,
        "Length": 25
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday early-morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday early-morning",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 10:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 08:00:00", "endDateTime": "2016-11-01 10:00:00"}
        },
        "Start": 14,
        "Length": 21
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday late-morning",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday late-morning",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 10:00:00", "endDateTime": "2016-11-08 12:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 10:00:00", "endDateTime": "2016-11-01 12:00:00"}
        },
        "Start": 14,
        "Length": 20
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday early-afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday early-afternoon",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TAF",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 12:00:00", "endDateTime": "2016-11-08 14:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 12:00:00", "endDateTime": "2016-11-01 14:00:00"}
        },
        "Start": 14,
        "Length": 23
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday late-afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday late-afternoon",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TAF",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 14:00:00", "endDateTime": "2016-11-08 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 14:00:00", "endDateTime": "2016-11-01 16:00:00"}
        },
        "Start": 14,
        "Length": 22
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday early-evening",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday early-evening",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TEV",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 16:00:00", "endDateTime": "2016-11-08 18:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 16:00:00", "endDateTime": "2016-11-01 18:00:00"}
        },
        "Start": 14,
        "Length": 21
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday late-evening",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday late-evening",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TEV",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 18:00:00", "endDateTime": "2016-11-08 20:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 18:00:00", "endDateTime": "2016-11-01 20:00:00"}
        },
        "Start": 14,
        "Length": 20
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday early-night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday early-night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 22:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 20:00:00", "endDateTime": "2016-11-01 22:00:00"}
        },
        "Start": 14,
        "Length": 19
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday late-night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday late-night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 22:00:00", "endDateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-01 22:00:00", "endDateTime": "2016-11-01 23:59:59"}
        },
        "Start": 14,
        "Length": 18
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday early night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday early night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "start",
          "FutureResolution": {"startDateTime": "2016-11-08 20:00:00", "endDateTime": "2016-11-08 22:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 20:00:00", "endDateTime": "2016-11-01 22:00:00"}
        },
        "Start": 14,
        "Length": 19
      }
    ]
  },
  {
    "Input": "let's meet on Tuesday late night",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "tuesday late night",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 22:00:00", "endDateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-01 22:00:00", "endDateTime": "2016-11-01 23:59:59"}
        },
        "Start": 14,
        "Length": 18
      }
    ]
  },
  {
    "Input": "let's meet rest of the day",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "rest of the day",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T23:59:59,PT28079S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 11,
        "Length": 15
      }
    ]
  },
  {
    "Input": "let's meet rest of current day",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "rest of current day",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T23:59:59,PT28079S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 11,
        "Length": 19
      }
    ]
  },
  {
    "Input": "let's meet rest of my day",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "rest of my day",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T23:59:59,PT28079S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 11,
        "Length": 14
      }
    ]
  },
  {
    "Input": "let's meet rest of this day",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "rest of this day",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T23:59:59,PT28079S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 11,
        "Length": 16
      }
    ]
  },
  {
    "Input": "let's meet rest the day",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "rest the day",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T23:59:59,PT28079S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 23:59:59"}
        },
        "Start": 11,
        "Length": 12
      }
    ]
  },
  {
    "Input": "let's meet in the late night on Tuesday",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "Results": [
      {
        "Text": "in the late night on tuesday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TNI",
          "Mod": "end",
          "FutureResolution": {"startDateTime": "2016-11-08 22:00:00", "endDateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"startDateTime": "2016-11-01 22:00:00", "endDateTime": "2016-11-01 23:59:59"}
        },
        "Start": 11,
        "Length": 28
      }
    ]
  },
  {
    "Input": "Cortana, please schedule a skype for business meeting with Wayne, on Friday between 1PM and 4 PM.",
    "Context": {"ReferenceDateTime": "2017-11-09T16:12:00"},
    "Results": [
      {
        "Text": "friday between 1pm and 4 pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-WXX-5T13,XXXX-WXX-5T16,PT3H)",
          "FutureResolution": {"startDateTime": "2017-11-10 13:00:00", "endDateTime": "2017-11-10 16:00:00"},
          "PastResolution": {"startDateTime": "2017-11-03 13:00:00", "endDateTime": "2017-11-03 16:00:00"}
        },
        "Start": 69,
        "Length": 27
      }
    ]
  },
  {
    "Input": "Can you schedule us tomorrow between 8am and 2pm?",
    "Context": {"ReferenceDateTime": "2017-11-09T16:12:00"},
    "Results": [
      {
        "Text": "tomorrow between 8am and 2pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2017-11-10T08,2017-11-10T14,PT6H)",
          "FutureResolution": {"startDateTime": "2017-11-10 08:00:00", "endDateTime": "2017-11-10 14:00:00"},
          "PastResolution": {"startDateTime": "2017-11-10 08:00:00", "endDateTime": "2017-11-10 14:00:00"}
        },
        "Start": 20,
        "Length": 28
      }
    ]
  },
  {
    "Input": "Can you schedule us Dec 9th between 8am and 2pm?",
    "Context": {"ReferenceDateTime": "2017-11-09T16:12:00"},
    "Results": [
      {
        "Text": "dec 9th between 8am and 2pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-12-09T08,XXXX-12-09T14,PT6H)",
          "FutureResolution": {"startDateTime": "2017-12-09 08:00:00", "endDateTime": "2017-12-09 14:00:00"},
          "PastResolution": {"startDateTime": "2016-12-09 08:00:00", "endDateTime": "2016-12-09 14:00:00"}
        },
        "Start": 20,
        "Length": 27
      }
    ]
  },
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting this Friday, in the afternoon.",
    "Context": {"ReferenceDateTime": "2017-11-13T16:12:00"},
    "Results": [
      {
        "Text": "this friday, in the afternoon",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2017-11-17TAF",
          "FutureResolution": {"startDateTime": "2017-11-17 12:00:00", "endDateTime": "2017-11-17 16:00:00"},
          "PastResolution": {"startDateTime": "2017-11-17 12:00:00", "endDateTime": "2017-11-17 16:00:00"}
        },
        "Start": 84,
        "Length": 29
      }
    ]
  },
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting in the afternoon, this Friday!",
    "Context": {"ReferenceDateTime": "2017-11-13T16:12:00"},
    "Results": [
      {
        "Text": "in the afternoon, this friday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2017-11-17TAF",
          "FutureResolution": {"startDateTime": "2017-11-17 12:00:00", "endDateTime": "2017-11-17 16:00:00"},
          "PastResolution": {"startDateTime": "2017-11-17 12:00:00", "endDateTime": "2017-11-17 16:00:00"}
        },
        "Start": 84,
        "Length": 29
      }
    ]
  },
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting in the afternoon, next Friday!",
    "Context": {"ReferenceDateTime": "2017-11-13T16:12:00"},
    "Results": [
      {
        "Text": "in the afternoon, next friday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2017-11-24TAF",
          "FutureResolution": {"startDateTime": "2017-11-24 12:00:00", "endDateTime": "2017-11-24 16:00:00"},
          "PastResolution": {"startDateTime": "2017-11-24 12:00:00", "endDateTime": "2017-11-24 16:00:00"}
        },
        "Start": 84,
        "Length": 29
      }
    ]
  },
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting in the afternoon, last Friday!",
    "Context": {"ReferenceDateTime": "2017-11-13T16:12:00"},
    "Results": [
      {
        "Text": "in the afternoon, last friday",
        "Type": "datetimerange",
        "Value": {
          "Timex": "2017-11-10TAF",
          "FutureResolution": {"startDateTime": "2017-11-10 12:00:00", "endDateTime": "2017-11-10 16:00:00"},
          "PastResolution": {"startDateTime": "2017-11-10 12:00:00", "endDateTime": "2017-11-10 16:00:00"}
        },
        "Start": 84,
        "Length": 29
      }
    ]
  },
  {
    "Input":
        "Cortana, please schedule a skype for business meeting with Wayne, on Friday afternoon between 1PM and 4 PM.",
    "Context": {"ReferenceDateTime": "2017-11-14T19:12:00"},
    "Results": [
      {
        "Text": "friday afternoon between 1pm and 4 pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-WXX-5T13,XXXX-WXX-5T16,PT3H)",
          "FutureResolution": {"startDateTime": "2017-11-17 13:00:00", "endDateTime": "2017-11-17 16:00:00"},
          "PastResolution": {"startDateTime": "2017-11-10 13:00:00", "endDateTime": "2017-11-10 16:00:00"}
        },
        "Start": 69,
        "Length": 37
      }
    ]
  },
  {
    "Input":
        "Cortana, please schedule a skype for business meeting with Wayne, in the afternoon on Friday between 1PM and 4 PM.",
    "Context": {"ReferenceDateTime": "2017-11-14T19:12:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "in the afternoon on friday between 1pm and 4 pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-WXX-5T13,XXXX-WXX-5T16,PT3H)",
          "FutureResolution": {"startDateTime": "2017-11-17 13:00:00", "endDateTime": "2017-11-17 16:00:00"},
          "PastResolution": {"startDateTime": "2017-11-10 13:00:00", "endDateTime": "2017-11-10 16:00:00"}
        },
        "Start": 66,
        "Length": 47
      }
    ]
  },
  {
    "Input": "Cortana, please schedule a skype meeting 2018-09-23 1p.m. to 4",
    "Context": {"ReferenceDateTime": "2017-11-17T19:12:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "2018-09-23 1p.m. to 4",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2018-09-23T13,2018-09-23T16,PT3H)",
          "FutureResolution": {"startDateTime": "2018-09-23 13:00:00", "endDateTime": "2018-09-23 16:00:00"},
          "PastResolution": {"startDateTime": "2018-09-23 13:00:00", "endDateTime": "2018-09-23 16:00:00"}
        },
        "Start": 41,
        "Length": 21
      }
    ]
  },
  {
    "Input": "Cortana, please schedule a skype meeting 2018-09-23 1:30p.m. to 4.",
    "Context": {"ReferenceDateTime": "2017-11-17T19:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "2018-09-23 1:30p.m. to 4",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2018-09-23T13:30,2018-09-23T16,PT2H30M)",
          "FutureResolution": {"startDateTime": "2018-09-23 13:30:00", "endDateTime": "2018-09-23 16:00:00"},
          "PastResolution": {"startDateTime": "2018-09-23 13:30:00", "endDateTime": "2018-09-23 16:00:00"}
        },
        "Start": 41,
        "Length": 24
      }
    ]
  },
  {
    "Input": "let's meet on Feb 5 AM",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "feb 5 am",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-02-05TMO",
          "FutureResolution": {"startDateTime": "2017-02-05 08:00:00", "endDateTime": "2017-02-05 12:00:00"},
          "PastResolution": {"startDateTime": "2016-02-05 08:00:00", "endDateTime": "2016-02-05 12:00:00"}
        },
        "Start": 14,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back tuesday AM",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "tuesday am",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TMO",
          "FutureResolution": {"startDateTime": "2016-11-08 08:00:00", "endDateTime": "2016-11-08 12:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 08:00:00", "endDateTime": "2016-11-01 12:00:00"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back tuesday PM",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "tuesday pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "XXXX-WXX-2TAF",
          "FutureResolution": {"startDateTime": "2016-11-08 12:00:00", "endDateTime": "2016-11-08 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-01 12:00:00", "endDateTime": "2016-11-01 16:00:00"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "It will happen 2 hours in the future",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "2 hours in the future",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T18:12:00,PT2H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 18:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 18:12:00"}
        },
        "Start": 15,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I will be back within 15 seconds",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 15 seconds",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T16:12:15,PT15S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 16:12:15"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 16:12:15"}
        },
        "Start": 15,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I will be back within 5 minutes",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 5 minutes",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T16:17:00,PT5M)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 16:17:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 16:17:00"}
        },
        "Start": 15,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I will be back within 5 hours",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 5 hours",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T21:12:00,PT5H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 21:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 21:12:00"}
        },
        "Start": 15,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I will be back within 1 day and 5 hours",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 1 day and 5 hours",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-08T21:12:00,P1DT5H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-08 21:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-08 21:12:00"}
        },
        "Start": 15,
        "Length": 24
      }
    ]
  },
  {
    "Input": "This task would complete within 2 days 1 hour 5 minutes 30 seconds",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 2 days 1 hour 5 minutes 30 seconds",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-09T17:17:30,P2DT1H5M30S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-09 17:17:30"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-09 17:17:30"}
        },
        "Start": 25,
        "Length": 41
      }
    ]
  },
  {
    "Input": "This task would complete within next 2 days 1 hour 5 minutes 30 seconds",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within next 2 days 1 hour 5 minutes 30 seconds",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-09T17:17:30,P2DT1H5M30S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-09 17:17:30"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-09 17:17:30"}
        },
        "Start": 25,
        "Length": 46
      }
    ]
  },
  {
    "Input": "This task would complete within the upcoming 2 days 1 hour 5 minutes 30 seconds",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within the upcoming 2 days 1 hour 5 minutes 30 seconds",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-09T17:17:30,P2DT1H5M30S)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-09 17:17:30"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-09 17:17:30"}
        },
        "Start": 25,
        "Length": 54
      }
    ]
  },
  {
    "Input": "I will be back within the next 5 hours",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within the next 5 hours",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-07T16:12:00,2016-11-07T21:12:00,PT5H)",
          "FutureResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 21:12:00"},
          "PastResolution": {"startDateTime": "2016-11-07 16:12:00", "endDateTime": "2016-11-07 21:12:00"}
        },
        "Start": 15,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I will be back monday 8 to 9.",
    "Context": {"ReferenceDateTime": "2018-04-19T08:12:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "monday 8 to 9",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-WXX-1T08,XXXX-WXX-1T09,PT1H)",
          "FutureResolution": {"startDateTime": "2018-04-23 08:00:00", "endDateTime": "2018-04-23 09:00:00"},
          "PastResolution": {"startDateTime": "2018-04-16 08:00:00", "endDateTime": "2018-04-16 09:00:00"}
        },
        "Start": 15,
        "Length": 13
      }
    ]
  },
  {
    "Input": "Cortana can help us find a time Monday 12-4.",
    "Context": {"ReferenceDateTime": "2018-05-16T08:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "monday 12-4",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-WXX-1T00,XXXX-WXX-1T04,PT4H)",
          "FutureResolution": {"startDateTime": "2018-05-21 00:00:00", "endDateTime": "2018-05-21 04:00:00"},
          "PastResolution": {"startDateTime": "2018-05-14 00:00:00", "endDateTime": "2018-05-14 04:00:00"}
        },
        "Start": 32,
        "Length": 11
      }
    ]
  },
  {
    "Input": "Cortana can help us find a time Monday 11-4.",
    "Context": {"ReferenceDateTime": "2018-05-16T08:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "monday 11-4",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(XXXX-WXX-1T11,XXXX-WXX-1T16,PT5H)",
          "FutureResolution": {"startDateTime": "2018-05-21 11:00:00", "endDateTime": "2018-05-21 16:00:00"},
          "PastResolution": {"startDateTime": "2018-05-14 11:00:00", "endDateTime": "2018-05-14 16:00:00"}
        },
        "Start": 32,
        "Length": 11
      }
    ]
  },
  {
    "Input": "It will happen between 10 and 11:30 on 1/1/2015",
    "Context": {"ReferenceDateTime": "2018-05-16T08:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 10 and 11:30 on 1/1/2015",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2015-01-01T10,2015-01-01T11:30,PT1H30M)",
          "FutureResolution": {"startDateTime": "2015-01-01 10:00:00", "endDateTime": "2015-01-01 11:30:00"},
          "PastResolution": {"startDateTime": "2015-01-01 10:00:00", "endDateTime": "2015-01-01 11:30:00"}
        },
        "Start": 15,
        "Length": 32
      }
    ]
  },
  {
    "Input": "It will happen 1/1/2015 between 10 and 11:30",
    "Context": {"ReferenceDateTime": "2018-05-16T08:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1/1/2015 between 10 and 11:30",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2015-01-01T10,2015-01-01T11:30,PT1H30M)",
          "FutureResolution": {"startDateTime": "2015-01-01 10:00:00", "endDateTime": "2015-01-01 11:30:00"},
          "PastResolution": {"startDateTime": "2015-01-01 10:00:00", "endDateTime": "2015-01-01 11:30:00"}
        },
        "Start": 15,
        "Length": 29
      }
    ]
  },
  {
    "Input": "It will happen from 10:30 to 3 on 1/1/2015",
    "Context": {"ReferenceDateTime": "2018-05-16T08:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 10:30 to 3 on 1/1/2015",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2015-01-01T10:30,2015-01-01T15,PT4H30M)",
          "FutureResolution": {"startDateTime": "2015-01-01 10:30:00", "endDateTime": "2015-01-01 15:00:00"},
          "PastResolution": {"startDateTime": "2015-01-01 10:30:00", "endDateTime": "2015-01-01 15:00:00"}
        },
        "Start": 15,
        "Length": 27
      }
    ]
  },
  {
    "Input": "It will happen between 3 and 5 on 1/1/2015",
    "Context": {"ReferenceDateTime": "2018-05-16T08:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 3 and 5 on 1/1/2015",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2015-01-01T03,2015-01-01T05,PT2H)",
          "FutureResolution": {"startDateTime": "2015-01-01 03:00:00", "endDateTime": "2015-01-01 05:00:00"},
          "PastResolution": {"startDateTime": "2015-01-01 03:00:00", "endDateTime": "2015-01-01 05:00:00"}
        },
        "Start": 15,
        "Length": 27
      }
    ]
  },
  {
    "Input": "It will happen from 3:30 to 5:55 on 1/1/2015",
    "Context": {"ReferenceDateTime": "2018-05-16T08:12:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 3:30 to 5:55 on 1/1/2015",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2015-01-01T03:30,2015-01-01T05:55,PT2H25M)",
          "FutureResolution": {"startDateTime": "2015-01-01 03:30:00", "endDateTime": "2015-01-01 05:55:00"},
          "PastResolution": {"startDateTime": "2015-01-01 03:30:00", "endDateTime": "2015-01-01 05:55:00"}
        },
        "Start": 15,
        "Length": 29
      }
    ]
  },
  {
    "Input": "Can you schedule us on Friday next week between 8am and 2pm?",
    "Context": {"ReferenceDateTime": "2017-11-09T16:12:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "on friday next week between 8am and 2pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2017-11-17T08,2017-11-17T14,PT6H)",
          "FutureResolution": {"startDateTime": "2017-11-17 08:00:00", "endDateTime": "2017-11-17 14:00:00"},
          "PastResolution": {"startDateTime": "2017-11-17 08:00:00", "endDateTime": "2017-11-17 14:00:00"}
        },
        "Start": 20,
        "Length": 39
      }
    ]
  },
  {
    "Input": "Make me unavailable from 12-04-2019 6:00am until 12-05-2019 8:00pm",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "from 12-04-2019 6:00am until 12-05-2019 8:00pm",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2019-12-04T06:00,2019-12-05T20:00,PT38H)",
          "FutureResolution": {"startDateTime": "2019-12-04 06:00:00", "endDateTime": "2019-12-05 20:00:00"},
          "PastResolution": {"startDateTime": "2019-12-04 06:00:00", "endDateTime": "2019-12-05 20:00:00"}
        },
        "Start": 20,
        "Length": 46
      }
    ]
  },
  {
    "Input": "I'll be out between half past seven and 4pm of tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "between half past seven and 4pm of tomorrow",
        "Type": "datetimerange",
        "Value": {
          "Timex": "(2016-11-08T07:30,2016-11-08T16,PT8H30M)",
          "FutureResolution": {"startDateTime": "2016-11-08 07:30:00", "endDateTime": "2016-11-08 16:00:00"},
          "PastResolution": {"startDateTime": "2016-11-08 07:30:00", "endDateTime": "2016-11-08 16:00:00"}
        },
        "Start": 12,
        "Length": 43
      }
    ]
  }
];
