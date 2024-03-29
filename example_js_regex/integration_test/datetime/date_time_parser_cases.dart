const dateTimeParserTestCases = [
  {
    "Input": "I'll go back now",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "now",
        "Type": "datetime",
        "Value": {
          "Timex": "PRESENT_REF",
          "FutureResolution": {"dateTime": "2016-11-07 00:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 00:00:00"}
        },
        "Start": 13,
        "Length": 3
      }
    ]
  },
  {
    "Input": "I'll go back as soon as possible",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "as soon as possible",
        "Type": "datetime",
        "Value": {
          "Timex": "FUTURE_REF",
          "FutureResolution": {"dateTime": "2016-11-07 00:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 00:00:00"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll go back on 15 at 8:00",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "15 at 8:00",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-15T08:00",
          "FutureResolution": {"dateTime": "2016-11-15 08:00:00"},
          "PastResolution": {"dateTime": "2016-10-15 08:00:00"}
        },
        "Start": 16,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back on 15 at 8:00:20",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "15 at 8:00:20",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-15T08:00:20",
          "FutureResolution": {"dateTime": "2016-11-15 08:00:20"},
          "PastResolution": {"dateTime": "2016-10-15 08:00:20"}
        },
        "Start": 16,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back on 15, 8pm",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "15, 8pm",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-15T20",
          "FutureResolution": {"dateTime": "2016-11-15 20:00:00"},
          "PastResolution": {"dateTime": "2016-10-15 20:00:00"}
        },
        "Start": 16,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll go back at 5th at 4 a.m.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "5th at 4 a.m.",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-05T04",
          "FutureResolution": {"dateTime": "2016-12-05 04:00:00"},
          "PastResolution": {"dateTime": "2016-11-05 04:00:00"}
        },
        "Start": 16,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back 04/21/2016, 8:00pm",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "04/21/2016, 8:00pm",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-04-21T20:00",
          "FutureResolution": {"dateTime": "2016-04-21 20:00:00"},
          "PastResolution": {"dateTime": "2016-04-21 20:00:00"}
        },
        "Start": 13,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll go back 04/21/2016, 8:00:20pm",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "04/21/2016, 8:00:20pm",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-04-21T20:00:20",
          "FutureResolution": {"dateTime": "2016-04-21 20:00:20"},
          "PastResolution": {"dateTime": "2016-04-21 20:00:20"}
        },
        "Start": 13,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back Oct.23 at seven",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Oct.23 at seven",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-23T07",
          "FutureResolution": {"dateTime": "2017-10-23 07:00:00"},
          "PastResolution": {"dateTime": "2016-10-23 07:00:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll go back October 14 8:00am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October 14 8:00am",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-14T08:00",
          "FutureResolution": {"dateTime": "2017-10-14 08:00:00"},
          "PastResolution": {"dateTime": "2016-10-14 08:00:00"}
        },
        "Start": 13,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll go back October 14 8:00:31am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October 14 8:00:31am",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-14T08:00:31",
          "FutureResolution": {"dateTime": "2017-10-14 08:00:31"},
          "PastResolution": {"dateTime": "2016-10-14 08:00:31"}
        },
        "Start": 13,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll go back October 14 around 8:00am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October 14 around 8:00am",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-14T08:00",
          "FutureResolution": {"dateTime": "2017-10-14 08:00:00"},
          "PastResolution": {"dateTime": "2016-10-14 08:00:00"}
        },
        "Start": 13,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll go back October 14 for 8:00:31am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October 14 for 8:00:31am",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-14T08:00:31",
          "FutureResolution": {"dateTime": "2017-10-14 08:00:31"},
          "PastResolution": {"dateTime": "2016-10-14 08:00:31"}
        },
        "Start": 13,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll go back October 14, 8:00am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October 14, 8:00am",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-14T08:00",
          "FutureResolution": {"dateTime": "2017-10-14 08:00:00"},
          "PastResolution": {"dateTime": "2016-10-14 08:00:00"}
        },
        "Start": 13,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll go back October 14, 8:00:25am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October 14, 8:00:25am",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-14T08:00:25",
          "FutureResolution": {"dateTime": "2017-10-14 08:00:25"},
          "PastResolution": {"dateTime": "2016-10-14 08:00:25"}
        },
        "Start": 13,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back May 5, 2016, 20 min past eight in the evening",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "May 5, 2016, 20 min past eight in the evening",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-05-05T20:20",
          "FutureResolution": {"dateTime": "2016-05-05 20:20:00"},
          "PastResolution": {"dateTime": "2016-05-05 20:20:00"}
        },
        "Start": 13,
        "Length": 45
      }
    ]
  },
  {
    "Input": "I'll go back 8pm on 15",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8pm on 15",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-15T20",
          "FutureResolution": {"dateTime": "2016-11-15 20:00:00"},
          "PastResolution": {"dateTime": "2016-10-15 20:00:00"}
        },
        "Start": 13,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll go back 8pm on the 15",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8pm on the 15",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-15T20",
          "FutureResolution": {"dateTime": "2016-11-15 20:00:00"},
          "PastResolution": {"dateTime": "2016-10-15 20:00:00"}
        },
        "Start": 13,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back at seven on 15",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "seven on 15",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-15T07",
          "FutureResolution": {"dateTime": "2016-11-15 07:00:00"},
          "PastResolution": {"dateTime": "2016-10-15 07:00:00"}
        },
        "Start": 16,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll go back 8pm today",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8pm today",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T20",
          "FutureResolution": {"dateTime": "2016-11-07 20:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 20:00:00"}
        },
        "Start": 13,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll go back a quarter to seven tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "a quarter to seven tomorrow",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-08T06:45",
          "FutureResolution": {"dateTime": "2016-11-08 06:45:00"},
          "PastResolution": {"dateTime": "2016-11-08 06:45:00"}
        },
        "Start": 13,
        "Length": 27
      }
    ]
  },
  {
    "Input": "I'll go back 19:00, 2016-12-22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "19:00, 2016-12-22",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-12-22T19:00",
          "FutureResolution": {"dateTime": "2016-12-22 19:00:00"},
          "PastResolution": {"dateTime": "2016-12-22 19:00:00"}
        },
        "Start": 13,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll go back tomorrow 8:00am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "tomorrow 8:00am",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-08T08:00",
          "FutureResolution": {"dateTime": "2016-11-08 08:00:00"},
          "PastResolution": {"dateTime": "2016-11-08 08:00:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll go back tomorrow morning at 7",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "tomorrow morning at 7",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-08T07",
          "FutureResolution": {"dateTime": "2016-11-08 07:00:00"},
          "PastResolution": {"dateTime": "2016-11-08 07:00:00"}
        },
        "Start": 13,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back tonight around 7",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "tonight around 7",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T19",
          "FutureResolution": {"dateTime": "2016-11-07 19:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 19:00:00"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back 7:00 on next Sunday afternoon",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "7:00 on next Sunday afternoon",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-20T19:00",
          "FutureResolution": {"dateTime": "2016-11-20 19:00:00"},
          "PastResolution": {"dateTime": "2016-11-20 19:00:00"}
        },
        "Start": 13,
        "Length": 29
      }
    ]
  },
  {
    "Input": "I'll go back twenty minutes past five tomorrow morning",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "twenty minutes past five tomorrow morning",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-08T05:20",
          "FutureResolution": {"dateTime": "2016-11-08 05:20:00"},
          "PastResolution": {"dateTime": "2016-11-08 05:20:00"}
        },
        "Start": 13,
        "Length": 41
      }
    ]
  },
  {
    "Input": "I'll go back 7, this morning",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "7, this morning",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T07",
          "FutureResolution": {"dateTime": "2016-11-07 07:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 07:00:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll go back 10, tonight",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "10, tonight",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T22",
          "FutureResolution": {"dateTime": "2016-11-07 22:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 22:00:00"}
        },
        "Start": 13,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll go back 8pm in the evening, Sunday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8pm in the evening, Sunday",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-WXX-7T20",
          "FutureResolution": {"dateTime": "2016-11-13 20:00:00"},
          "PastResolution": {"dateTime": "2016-11-06 20:00:00"}
        },
        "Start": 13,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I'll go back 8pm in the evening, 1st Jan",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8pm in the evening, 1st Jan",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-01-01T20",
          "FutureResolution": {"dateTime": "2017-01-01 20:00:00"},
          "PastResolution": {"dateTime": "2016-01-01 20:00:00"}
        },
        "Start": 13,
        "Length": 27
      }
    ]
  },
  {
    "Input": "I'll go back 8pm in the evening, 1 Jan",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8pm in the evening, 1 Jan",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-01-01T20",
          "FutureResolution": {"dateTime": "2017-01-01 20:00:00"},
          "PastResolution": {"dateTime": "2016-01-01 20:00:00"}
        },
        "Start": 13,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll go back 10pm tonight",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "10pm tonight",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T22",
          "FutureResolution": {"dateTime": "2016-11-07 22:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 22:00:00"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back 8am this morning",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8am this morning",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T08",
          "FutureResolution": {"dateTime": "2016-11-07 08:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 08:00:00"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back 8pm this evening",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "8pm this evening",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T20",
          "FutureResolution": {"dateTime": "2016-11-07 20:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 20:00:00"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back the end of the day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the end of the day",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T23:59:59",
          "FutureResolution": {"dateTime": "2016-11-07 23:59:59"},
          "PastResolution": {"dateTime": "2016-11-07 23:59:59"}
        },
        "Start": 13,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll go back end of tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "end of tomorrow",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-08T23:59:59",
          "FutureResolution": {"dateTime": "2016-11-08 23:59:59"},
          "PastResolution": {"dateTime": "2016-11-08 23:59:59"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll go back end of the sunday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "end of the sunday",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-WXX-7T23:59:59",
          "FutureResolution": {"dateTime": "2016-11-13 23:59:59"},
          "PastResolution": {"dateTime": "2016-11-06 23:59:59"}
        },
        "Start": 13,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll go back in 5 hours",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "in 5 hours",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T05:00:00",
          "FutureResolution": {"dateTime": "2016-11-07 05:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 05:00:00"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back on 15 at 8:00:24",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "15 at 8:00:24",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-XX-15T08:00:24",
          "FutureResolution": {"dateTime": "2016-11-15 08:00:24"},
          "PastResolution": {"dateTime": "2016-10-15 08:00:24"}
        },
        "Start": 16,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back 04/21/2016, 8:00:24pm",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "04/21/2016, 8:00:24pm",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-04-21T20:00:24",
          "FutureResolution": {"dateTime": "2016-04-21 20:00:24"},
          "PastResolution": {"dateTime": "2016-04-21 20:00:24"}
        },
        "Start": 13,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back October 14 8:00:13am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October 14 8:00:13am",
        "Type": "datetime",
        "Value": {
          "Timex": "XXXX-10-14T08:00:13",
          "FutureResolution": {"dateTime": "2017-10-14 08:00:13"},
          "PastResolution": {"dateTime": "2016-10-14 08:00:13"}
        },
        "Start": 13,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll go back this morning at 7",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this morning at 7",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T07",
          "FutureResolution": {"dateTime": "2016-11-07 07:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 07:00:00"}
        },
        "Start": 13,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll go back this morning at 7am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this morning at 7am",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T07",
          "FutureResolution": {"dateTime": "2016-11-07 07:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 07:00:00"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll go back this morning at seven",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this morning at seven",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T07",
          "FutureResolution": {"dateTime": "2016-11-07 07:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 07:00:00"}
        },
        "Start": 13,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back this morning at 7:00",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this morning at 7:00",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T07:00",
          "FutureResolution": {"dateTime": "2016-11-07 07:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 07:00:00"}
        },
        "Start": 13,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll go back this night at 7",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this night at 7",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T19",
          "FutureResolution": {"dateTime": "2016-11-07 19:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 19:00:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll go back tonight at 7",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "tonight at 7",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-07T19",
          "FutureResolution": {"dateTime": "2016-11-07 19:00:00"},
          "PastResolution": {"dateTime": "2016-11-07 19:00:00"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back 2016-12-16T12:23:59",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016-12-16T12:23:59",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-12-16T12:23:59",
          "FutureResolution": {"dateTime": "2016-12-16 12:23:59"},
          "PastResolution": {"dateTime": "2016-12-16 12:23:59"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll go back 6 jan 2017 - 6:37am",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "6 jan 2017 - 6:37am",
        "Type": "datetime",
        "Value": {
          "Timex": "2017-01-06T06:37",
          "FutureResolution": {"dateTime": "2017-01-06 06:37:00"},
          "PastResolution": {"dateTime": "2017-01-06 06:37:00"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "16. Nov. 2016 10:38",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "16. Nov. 2016 10:38",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-11-16T10:38",
          "FutureResolution": {"dateTime": "2016-11-16 10:38:00"},
          "PastResolution": {"dateTime": "2016-11-16 10:38:00"}
        },
        "Start": 0,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I will leave 1 day 2 hours later",
    "Context": {"ReferenceDateTime": "2017-11-23T19:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1 day 2 hours later",
        "Type": "datetime",
        "Value": {
          "Timex": "2017-11-24T21:00:00",
          "FutureResolution": {"dateTime": "2017-11-24 21:00:00"},
          "PastResolution": {"dateTime": "2017-11-24 21:00:00"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "We met 1 month 2 days 2 hours 30 mins ago",
    "Context": {"ReferenceDateTime": "2017-11-23T19:15:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1 month 2 days 2 hours 30 mins ago",
        "Type": "datetime",
        "Value": {
          "Timex": "2017-10-21T16:45:00",
          "FutureResolution": {"dateTime": "2017-10-21 16:45:00"},
          "PastResolution": {"dateTime": "2017-10-21 16:45:00"}
        },
        "Start": 7,
        "Length": 34
      }
    ]
  },
  {
    "Input": "I will be busy in an hour, so call me later",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "in an hour",
        "Type": "datetime",
        "Value": {
          "Timex": "2017-11-23T01:00:00",
          "FutureResolution": {"dateTime": "2017-11-23 01:00:00"},
          "PastResolution": {"dateTime": "2017-11-23 01:00:00"}
        },
        "Start": 15,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I will be free in less than an hour, so call me later",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "in less than an hour",
        "Type": "datetime",
        "Value": {
          "Mod": "less",
          "Timex": "2017-11-23T01:00:00",
          "FutureResolution": {"dateTime": "2017-11-23 01:00:00"},
          "PastResolution": {"dateTime": "2017-11-23 01:00:00"}
        },
        "Start": 15,
        "Length": 20
      }
    ]
  },
  {
    "Input": "You shouldn't always go to bed end of the day since it will do harm to your health.",
    "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
    "Results": [
      {
        "Text": "end of the day",
        "Type": "datetime",
        "Value": {
          "Timex": "2018-11-21T23:59:59",
          "FutureResolution": {"dateTime": "2018-11-21 23:59:59"},
          "PastResolution": {"dateTime": "2018-11-21 23:59:59"}
        },
        "Start": 31,
        "Length": 14
      }
    ]
  },
  {
    "Input": "You shouldn't always go to bed end of day since it will do harm to your health.",
    "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
    "Results": [
      {
        "Text": "end of day",
        "Type": "datetime",
        "Value": {
          "Timex": "2018-11-21T23:59:59",
          "FutureResolution": {"dateTime": "2018-11-21 23:59:59"},
          "PastResolution": {"dateTime": "2018-11-21 23:59:59"}
        },
        "Start": 31,
        "Length": 10
      }
    ]
  },
  {
    "Input": "Bob and Alice usually exchange their encrypted messages at the eod.",
    "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
    "Results": [
      {
        "Text": "the eod",
        "Type": "datetime",
        "Value": {
          "Timex": "2018-11-21T23:59:59",
          "FutureResolution": {"dateTime": "2018-11-21 23:59:59"},
          "PastResolution": {"dateTime": "2018-11-21 23:59:59"}
        },
        "Start": 59,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I will go back on wed Oct 26 15:50:06 2016.",
    "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
    "NotSupported": "java,javascript, python",
    "Results": [
      {
        "Text": "wed Oct 26 15:50:06 2016",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-10-26T15:50:06",
          "FutureResolution": {"dateTime": "2016-10-26 15:50:06"},
          "PastResolution": {"dateTime": "2016-10-26 15:50:06"}
        },
        "Start": 18,
        "Length": 24
      }
    ]
  },
  {
    "Input": "Wed Oct 26 15:50:06 2016 is not a day in 2019.",
    "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
    "NotSupported": "java,javascript, python",
    "Results": [
      {
        "Text": "Wed Oct 26 15:50:06 2016",
        "Type": "datetime",
        "Value": {
          "Timex": "2016-10-26T15:50:06",
          "FutureResolution": {"dateTime": "2016-10-26 15:50:06"},
          "PastResolution": {"dateTime": "2016-10-26 15:50:06"}
        },
        "Start": 0,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll go back at 8.30pm today",
    "Context": {"ReferenceDateTime": "2018-12-26T12:00:00"},
    "Results": [
      {
        "Text": "at 8.30pm today",
        "Type": "datetime",
        "Value": {
          "Timex": "2018-12-26T20:30",
          "FutureResolution": {"dateTime": "2018-12-26 20:30:00"},
          "PastResolution": {"dateTime": "2018-12-26 20:30:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll go back today at 8.30pm",
    "Context": {"ReferenceDateTime": "2018-12-26T12:00:00"},
    "Results": [
      {
        "Text": "today at 8.30pm",
        "Type": "datetime",
        "Value": {
          "Timex": "2018-12-26T20:30",
          "FutureResolution": {"dateTime": "2018-12-26 20:30:00"},
          "PastResolution": {"dateTime": "2018-12-26 20:30:00"}
        },
        "Start": 13,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll go back 8.30pm today",
    "Context": {"ReferenceDateTime": "2018-12-26T12:00:00"},
    "Results": [
      {
        "Text": "8.30pm today",
        "Type": "datetime",
        "Value": {
          "Timex": "2018-12-26T20:30",
          "FutureResolution": {"dateTime": "2018-12-26 20:30:00"},
          "PastResolution": {"dateTime": "2018-12-26 20:30:00"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back 8.30 pm today",
    "Context": {"ReferenceDateTime": "2018-12-26T12:00:00"},
    "Results": [
      {
        "Text": "8.30 pm today",
        "Type": "datetime",
        "Value": {
          "Timex": "2018-12-26T20:30",
          "FutureResolution": {"dateTime": "2018-12-26 20:30:00"},
          "PastResolution": {"dateTime": "2018-12-26 20:30:00"}
        },
        "Start": 13,
        "Length": 13
      }
    ]
  }
];
