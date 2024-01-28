﻿const dateTimeModelTestCases = [
  {
    "Input": "I'll go back 04th Jan 2019.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "04th jan 2019",
        "Start": 13,
        "End": 25,
        "TypeName": "datetimeV2.date",
        "Resolution": {
          "values": [
            {"timex": "2019-01-04", "type": "date", "value": "2019-01-04"}
          ]
        }
      }
    ]
  },
  // {
  //   "Input": "I'll go back 03rd Jan 2019.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "03rd jan 2019",
  //       "Start": 13,
  //       "End": 25,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-03", "type": "date", "value": "2019-01-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 02nd Jan 2019.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "02nd jan 2019",
  //       "Start": 13,
  //       "End": 25,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-02", "type": "date", "value": "2019-01-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 01st Jan 2019.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "01st jan 2019",
  //       "Start": 13,
  //       "End": 25,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-01", "type": "date", "value": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Who are us presidents in 1990 s.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "1990 s",
  //       "Start": 25,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(1990-01-01,2000-01-01,P10Y)", "type": "daterange", "start": "1990-01-01", "end": "2000-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Oct/2",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "oct/2",
  //       "Start": 13,
  //       "End": 17,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-10-02", "type": "date", "value": "2016-10-02"},
  //           {"timex": "XXXX-10-02", "type": "date", "value": "2017-10-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on 22/04",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "22/04",
  //       "Start": 16,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-04-22", "type": "date", "value": "2016-04-22"},
  //           {"timex": "XXXX-04-22", "type": "date", "value": "2017-04-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back May twenty nine",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "may twenty nine",
  //       "Start": 13,
  //       "End": 27,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-29", "type": "date", "value": "2016-05-29"},
  //           {"timex": "XXXX-05-29", "type": "date", "value": "2017-05-29"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back second of Aug.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "second of aug",
  //       "Start": 13,
  //       "End": 25,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-08-02", "type": "date", "value": "2016-08-02"},
  //           {"timex": "XXXX-08-02", "type": "date", "value": "2017-08-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back today",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "today",
  //       "Start": 13,
  //       "End": 17,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-07", "type": "date", "value": "2016-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back tomorrow",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tomorrow",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-08", "type": "date", "value": "2016-11-08"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back yesterday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "yesterday",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-06", "type": "date", "value": "2016-11-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on Friday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday",
  //       "Start": 16,
  //       "End": 21,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2016-11-04"},
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2016-11-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out from 4-23 in next month",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from 4-23 in next month",
  //       "Start": 12,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-12-04,2016-12-23,P19D)", "type": "daterange", "start": "2016-12-04", "end": "2016-12-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out between 3 and 12 of Sept hahaha",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "between 3 and 12 of sept",
  //       "Start": 12,
  //       "End": 35,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-09-03,XXXX-09-12,P9D)", "type": "daterange", "start": "2016-09-03", "end": "2016-09-12"},
  //           {"timex": "(XXXX-09-03,XXXX-09-12,P9D)", "type": "daterange", "start": "2017-09-03", "end": "2017-09-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out this September",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this september",
  //       "Start": 12,
  //       "End": 25,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-09", "type": "daterange", "start": "2016-09-01", "end": "2016-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out January 12, 2016 - 01/22/2016",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "january 12, 2016 - 01/22/2016",
  //       "Start": 12,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-01-12,2016-01-22,P10D)", "type": "daterange", "start": "2016-01-12", "end": "2016-01-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out next 3 days",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next 3 days",
  //       "Start": 12,
  //       "End": 22,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-11-08,2016-11-11,P3D)", "type": "daterange", "start": "2016-11-08", "end": "2016-11-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out the last week of july",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "the last week of july",
  //       "Start": 12,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-07-W05", "type": "daterange", "start": "2016-07-25", "end": "2016-08-01"},
  //           {"timex": "XXXX-07-W05", "type": "daterange", "start": "2017-07-24", "end": "2017-07-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out 2015-3",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2015-3",
  //       "Start": 12,
  //       "End": 17,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015-03", "type": "daterange", "start": "2015-03-01", "end": "2015-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave this SUMMER",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this summer",
  //       "Start": 11,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-SU", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out since tomorrow",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "since tomorrow",
  //       "Start": 12,
  //       "End": 25,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-11-08",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2016-11-08",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out since August",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "since august",
  //       "Start": 12,
  //       "End": 23,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-08",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2016-08-01",
  //             "sourceEntity": "datetimerange"
  //           },
  //           {
  //             "timex": "XXXX-08",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2017-08-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out since this August",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "since this august",
  //       "Start": 12,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-08",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2016-08-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back now",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "now",
  //       "Start": 13,
  //       "End": 15,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2016-11-07 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back October 14 for 8:00:31am",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "october 14 for 8:00:31am",
  //       "Start": 13,
  //       "End": 36,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-10-14T08:00:31", "type": "datetime", "value": "2016-10-14 08:00:31"},
  //           {"timex": "XXXX-10-14T08:00:31", "type": "datetime", "value": "2017-10-14 08:00:31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back tomorrow 8:00am",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tomorrow 8:00am",
  //       "Start": 13,
  //       "End": 27,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-08T08:00", "type": "datetime", "value": "2016-11-08 08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 10, tonight",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "10, tonight",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-07T22", "type": "datetime", "value": "2016-11-07 22:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 8am this morning",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "8am this morning",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-07T08", "type": "datetime", "value": "2016-11-07 08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back end of tomorrow",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of tomorrow",
  //       "Start": 13,
  //       "End": 27,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-08T23:59:59", "type": "datetime", "value": "2016-11-08 23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back end of the sunday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of the sunday",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-7T23:59:59", "type": "datetime", "value": "2016-11-06 23:59:59"},
  //           {"timex": "XXXX-WXX-7T23:59:59", "type": "datetime", "value": "2016-11-13 23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back end of this sunday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of this sunday",
  //       "Start": 13,
  //       "End": 30,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-13T23:59:59", "type": "datetime", "value": "2016-11-13 23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out five to seven today",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "five to seven today",
  //       "Start": 12,
  //       "End": 30,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T05,2016-11-07T07,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 05:00:00",
  //             "end": "2016-11-07 07:00:00"
  //           },
  //           {
  //             "timex": "(2016-11-07T17,2016-11-07T19,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 17:00:00",
  //             "end": "2016-11-07 19:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out from 5 to 6pm of April 22",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "from 5 to 6pm of april 22",
  //       "Start": 12,
  //       "End": 36,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-04-22T17,XXXX-04-22T18,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2016-04-22 17:00:00",
  //             "end": "2016-04-22 18:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-04-22T17,XXXX-04-22T18,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2017-04-22 17:00:00",
  //             "end": "2017-04-22 18:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out 3:00 to 4:00 tomorrow",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "3:00 to 4:00 tomorrow",
  //       "Start": 12,
  //       "End": 32,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-08T03:00,2016-11-08T04:00,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 03:00:00",
  //             "end": "2016-11-08 04:00:00"
  //           },
  //           {
  //             "timex": "(2016-11-08T15:00,2016-11-08T16:00,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 15:00:00",
  //             "end": "2016-11-08 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back this evening",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "this evening",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-11-07TEV",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 16:00:00",
  //             "end": "2016-11-07 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back tomorrow night",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "tomorrow night",
  //       "Start": 13,
  //       "End": 26,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-11-08TNI",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 20:00:00",
  //             "end": "2016-11-08 23:59:59"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back next monday afternoon",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "next monday afternoon",
  //       "Start": 13,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-11-14TAF",
  //             "type": "datetimerange",
  //             "start": "2016-11-14 12:00:00",
  //             "end": "2016-11-14 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back next hour",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "next hour",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T16:12:00,2016-11-07T17:12:00,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 16:12:00",
  //             "end": "2016-11-07 17:12:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back tuesday in the morning",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "tuesday in the morning",
  //       "Start": 13,
  //       "End": 34,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-WXX-2TMO",
  //             "type": "datetimerange",
  //             "start": "2016-11-01 08:00:00",
  //             "end": "2016-11-01 12:00:00"
  //           },
  //           {
  //             "timex": "XXXX-WXX-2TMO",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 08:00:00",
  //             "end": "2016-11-08 12:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for 3h",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3h",
  //       "Start": 15,
  //       "End": 16,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT3H", "type": "duration", "value": "10800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for 3.5years",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3.5years",
  //       "Start": 15,
  //       "End": 22,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3.5Y", "type": "duration", "value": "110376000"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for 3 minutes",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3 minutes",
  //       "Start": 15,
  //       "End": 23,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT3M", "type": "duration", "value": "180"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for 123.45 sec",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "123.45 sec",
  //       "Start": 15,
  //       "End": 24,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT123.45S", "type": "duration", "value": "123.45"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for all day",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "all day",
  //       "Start": 15,
  //       "End": 21,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "duration", "value": "86400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for twenty and four hours",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "twenty and four hours",
  //       "Start": 15,
  //       "End": 35,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT24H", "type": "duration", "value": "86400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for all month",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "all month",
  //       "Start": 15,
  //       "End": 23,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1M", "type": "duration", "value": "2592000"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for an hour",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "an hour",
  //       "Start": 15,
  //       "End": 21,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1H", "type": "duration", "value": "3600"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for few hours",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "few hours",
  //       "Start": 15,
  //       "End": 23,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT3H", "type": "duration", "value": "10800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for a few minutes",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "a few minutes",
  //       "Start": 15,
  //       "End": 27,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT3M", "type": "duration", "value": "180"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for some days",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "some days",
  //       "Start": 15,
  //       "End": 23,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3D", "type": "duration", "value": "259200"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for several weeks",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "several weeks",
  //       "Start": 15,
  //       "End": 27,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3W", "type": "duration", "value": "1814400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave weekly",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "weekly",
  //       "Start": 11,
  //       "End": 16,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave every day",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "every day",
  //       "Start": 11,
  //       "End": 19,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave everyday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "everyday",
  //       "Start": 11,
  //       "End": 18,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave annually",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "annually",
  //       "Start": 11,
  //       "End": 18,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1Y", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave each two days",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "each two days",
  //       "Start": 11,
  //       "End": 23,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave every three week",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "every three week",
  //       "Start": 11,
  //       "End": 26,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3W", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave 3pm each day",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3pm each day",
  //       "Start": 11,
  //       "End": 22,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T15", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave every monday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "every monday",
  //       "Start": 11,
  //       "End": 22,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-1", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave each monday at 4pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "each monday at 4pm",
  //       "Start": 11,
  //       "End": 28,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-1T16", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back 7:56:30 pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "7:56:30 pm",
  //       "Start": 13,
  //       "End": 22,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T19:56:30", "type": "time", "value": "19:56:30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It's half past seven o'clock",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "half past seven o'clock",
  //       "Start": 5,
  //       "End": 27,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T07:30", "type": "time", "value": "07:30:00"},
  //           {"timex": "T19:30", "type": "time", "value": "19:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It's 20 min past eight in the evening",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "20 min past eight in the evening",
  //       "Start": 5,
  //       "End": 36,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T20:20", "type": "time", "value": "20:20:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back in the morning at 7",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "in the morning at 7",
  //       "Start": 13,
  //       "End": 31,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T07", "type": "time", "value": "07:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back in the afternoon at 7",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "in the afternoon at 7",
  //       "Start": 13,
  //       "End": 33,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T19", "type": "time", "value": "19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back noonish",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "noonish",
  //       "Start": 13,
  //       "End": 19,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T12", "type": "time", "value": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back 11ish",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "11ish",
  //       "Start": 13,
  //       "End": 17,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T11", "type": "time", "value": "11:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back 1140 a.m.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "1140 a.m.",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T11:40", "type": "time", "value": "11:40:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "12 noon",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "12 noon",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T12", "type": "time", "value": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out 5 to 6pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "5 to 6pm",
  //       "Start": 12,
  //       "End": 19,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T17,T18,PT1H)", "type": "timerange", "start": "17:00:00", "end": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out 5 to seven in the morning",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "5 to seven in the morning",
  //       "Start": 12,
  //       "End": 36,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T05,T07,PT2H)", "type": "timerange", "start": "05:00:00", "end": "07:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out between 5 and 6 in the afternoon",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "between 5 and 6 in the afternoon",
  //       "Start": 12,
  //       "End": 43,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T17,T18,PT1H)", "type": "timerange", "start": "17:00:00", "end": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out 4:00 to 7 oclock",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "4:00 to 7 oclock",
  //       "Start": 12,
  //       "End": 27,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T04:00,T07,PT3H)", "type": "timerange", "start": "04:00:00", "end": "07:00:00"},
  //           {"timex": "(T16:00,T19,PT3H)", "type": "timerange", "start": "16:00:00", "end": "19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out from 3 in the morning until 5pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "from 3 in the morning until 5pm",
  //       "Start": 12,
  //       "End": 42,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T03,T17,PT14H)", "type": "timerange", "start": "03:00:00", "end": "17:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out between 4pm and 5pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "between 4pm and 5pm",
  //       "Start": 12,
  //       "End": 30,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T16,T17,PT1H)", "type": "timerange", "start": "16:00:00", "end": "17:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet in the morning",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "in the morning",
  //       "Start": 11,
  //       "End": 24,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "timerange", "start": "08:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet in the evening",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "in the evening",
  //       "Start": 11,
  //       "End": 24,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TEV", "type": "timerange", "start": "16:00:00", "end": "20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back now",
  //   "Context": {"ReferenceDateTime": "2017-09-28T14:11:10.9626841"},
  //   "Results": [
  //     {
  //       "Text": "now",
  //       "Start": 13,
  //       "End": 15,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2017-09-28 14:11:10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back in 5 minutes",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "in 5 minutes",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-07T00:05:00", "type": "datetime", "value": "2016-11-07 00:05:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "in 5 minutes",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "in 5 minutes",
  //       "Start": 0,
  //       "End": 11,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-07T00:05:00", "type": "datetime", "value": "2016-11-07 00:05:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a meeting next week Mon 9 am or 1 pm",
  //   "Context": {"ReferenceDateTime": "2017-12-04T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next week mon 9 am",
  //       "Start": 22,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-12-11T09", "type": "datetime", "value": "2017-12-11 09:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "1 pm",
  //       "Start": 44,
  //       "End": 47,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T13", "type": "time", "value": "13:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a meeting next week Mon or Tue",
  //   "Context": {"ReferenceDateTime": "2017-12-04T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next week mon",
  //       "Start": 22,
  //       "End": 34,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-12-11", "type": "date", "value": "2017-12-11"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tue",
  //       "Start": 39,
  //       "End": 41,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2017-11-28"},
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2017-12-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a meeting in the morning 9 oclock or 10 oclock",
  //   "Context": {"ReferenceDateTime": "2017-12-04T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in the morning 9 oclock",
  //       "Start": 22,
  //       "End": 44,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T09", "type": "time", "value": "09:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "10 oclock",
  //       "Start": 49,
  //       "End": 57,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T10", "type": "time", "value": "10:00:00"},
  //           {"timex": "T22", "type": "time", "value": "22:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a meeting next Monday 1-3 pm or 5-6 pm",
  //   "Context": {"ReferenceDateTime": "2017-12-04T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next monday 1-3 pm",
  //       "Start": 22,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2017-12-11T13,2017-12-11T15,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2017-12-11 13:00:00",
  //             "end": "2017-12-11 15:00:00"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "5-6 pm",
  //       "Start": 44,
  //       "End": 49,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T17,T18,PT1H)", "type": "timerange", "start": "17:00:00", "end": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Monday 8-9am or 9-10 am works.",
  //   "Context": {"ReferenceDateTime": "2017-12-04T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "monday 8-9am",
  //       "Start": 0,
  //       "End": 11,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-1T08,XXXX-WXX-1T09,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2017-11-27 08:00:00",
  //             "end": "2017-11-27 09:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T08,XXXX-WXX-1T09,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2017-12-04 08:00:00",
  //             "end": "2017-12-04 09:00:00"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "9-10 am",
  //       "Start": 16,
  //       "End": 22,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T09,T10,PT1H)", "type": "timerange", "start": "09:00:00", "end": "10:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana could try to arrange a Skype call next week on Tuesday or Thursday please?",
  //   "Context": {"ReferenceDateTime": "2017-12-04T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next week on tuesday",
  //       "Start": 42,
  //       "End": 61,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-12-12", "type": "date", "value": "2017-12-12"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "thursday",
  //       "Start": 66,
  //       "End": 73,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2017-11-30"},
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2017-12-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana could try to arrange a Skype call next week on Tuesday 9 am or Thursday 1 pm please?",
  //   "Context": {"ReferenceDateTime": "2017-12-04T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next week on tuesday 9 am",
  //       "Start": 42,
  //       "End": 66,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-12-12T09", "type": "datetime", "value": "2017-12-12 09:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "thursday 1 pm",
  //       "Start": 71,
  //       "End": 83,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-4T13", "type": "datetime", "value": "2017-11-30 13:00:00"},
  //           {"timex": "XXXX-WXX-4T13", "type": "datetime", "value": "2017-12-07 13:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This may or may not be right.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": []
  // },
  // {
  //   "Input": "This may take longer than expected.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "Book this lunch in my calendar on Tue May 9. Don't contact people.",
  //   "Comment": "Disable this for now because of new features in .NET",
  //   "NotSupported": "javascript, Java",
  //   "Context": {"ReferenceDateTime": "2018-01-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tue may 9",
  //       "Start": 34,
  //       "End": 42,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-09", "type": "date", "value": "2017-05-09"},
  //           {"timex": "XXXX-05-09", "type": "date", "value": "2018-05-09"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It may be in may",
  //   "Context": {"ReferenceDateTime": "2018-01-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "may",
  //       "Start": 13,
  //       "End": 15,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05", "type": "daterange", "start": "2017-05-01", "end": "2017-06-01"},
  //           {"timex": "XXXX-05", "type": "daterange", "start": "2018-05-01", "end": "2018-06-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "Let’s find 1 hour on Tuesday March 7 to discuss recent xxxxx from xxxx.    Cortana will attempt to find time for us.    Rob  Please be advised that this email may contain confidential information.",
  //   "Context": {"ReferenceDateTime": "2018-03-14T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "1 hour",
  //       "Start": 11,
  //       "End": 16,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1H", "type": "duration", "value": "3600"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tuesday march 7",
  //       "Start": 21,
  //       "End": 35,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-03-07", "type": "date", "value": "2018-03-07"},
  //           {"timex": "XXXX-03-07", "type": "date", "value": "2019-03-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "We do have a few dates available the week of April 10th.  I suggest that we get on a call to discuss the need as there may be other options.",
  //   "Context": {"ReferenceDateTime": "2018-03-14T01:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "the week of april 10th",
  //       "Start": 33,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-04-10", "type": "daterange", "start": "2017-04-10", "end": "2017-04-17"},
  //           {"timex": "XXXX-04-10", "type": "daterange", "start": "2018-04-09", "end": "2018-04-16"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "Confidentiality Notice: The information in this document and attachments is confidential and may also be legally privileged.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "She may email you with a few times available on my schedule.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "please excuse any insanity that may result.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "This email may not be disclosed.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "I have placed your agenda into draft mode as it may have to be changed.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "You may get a message from me suggesting times today.",
  //   "Context": {"ReferenceDateTime": "2018-03-14T01:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "today",
  //       "Start": 47,
  //       "End": 51,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-03-14", "type": "date", "value": "2018-03-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This doc may well be considered confidential.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "May I ask what this is for?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "you may not!",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "I will handle all the stuff within 9 months and be back within next 10 months.",
  //   "Context": {"ReferenceDateTime": "2018-03-23T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "within 9 months",
  //       "Start": 28,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-03-23,2018-12-23,P9M)", "type": "daterange", "start": "2018-03-23", "end": "2018-12-23"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "within next 10 months",
  //       "Start": 56,
  //       "End": 76,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-03-23,2019-01-23,P10M)", "type": "daterange", "start": "2018-03-23", "end": "2019-01-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Tom and I will have a meeting in 2 weeks, so please help me schedule a meeting in 2 weeks.",
  //   "Context": {"ReferenceDateTime": "2018-03-23T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in 2 weeks",
  //       "Start": 30,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-04-06", "type": "date", "value": "2018-04-06"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "in 2 weeks",
  //       "Start": 79,
  //       "End": 88,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-04-06", "type": "date", "value": "2018-04-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will go to China next five days or next forty days.",
  //   "Context": {"ReferenceDateTime": "2018-03-23T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next five days",
  //       "Start": 19,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-03-24,2018-03-29,P5D)", "type": "daterange", "start": "2018-03-24", "end": "2018-03-29"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "next forty days",
  //       "Start": 37,
  //       "End": 51,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-03-24,2018-05-03,P40D)", "type": "daterange", "start": "2018-03-24", "end": "2018-05-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back July 1st, 17th times.",
  //   "Context": {"ReferenceDateTime": "2018-04-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "july 1st",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-07-01", "type": "date", "value": "2017-07-01"},
  //           {"timex": "XXXX-07-01", "type": "date", "value": "2018-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please book 2 hours next month",
  //   "Context": {"ReferenceDateTime": "2018-03-25T01:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2 hours",
  //       "Start": 21,
  //       "End": 27,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT2H", "type": "duration", "value": "7200"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "next month",
  //       "Start": 29,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-04", "type": "daterange", "start": "2018-04-01", "end": "2018-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please check my work 2 hours last week",
  //   "Context": {"ReferenceDateTime": "2018-03-25T01:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2 hours",
  //       "Start": 30,
  //       "End": 36,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT2H", "type": "duration", "value": "7200"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "last week",
  //       "Start": 38,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W11", "type": "daterange", "start": "2018-03-12", "end": "2018-03-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana can help us find a time Monday 12-4.",
  //   "Context": {"ReferenceDateTime": "2018-05-16T16:12:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "monday 12-4",
  //       "Start": 32,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-1T00,XXXX-WXX-1T04,PT4H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-14 00:00:00",
  //             "end": "2018-05-14 04:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T00,XXXX-WXX-1T04,PT4H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-21 00:00:00",
  //             "end": "2018-05-21 04:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T12,XXXX-WXX-1T16,PT4H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-14 12:00:00",
  //             "end": "2018-05-14 16:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T12,XXXX-WXX-1T16,PT4H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-21 12:00:00",
  //             "end": "2018-05-21 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana can help us find a time Monday 11-4.",
  //   "Context": {"ReferenceDateTime": "2018-05-16T16:12:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "monday 11-4",
  //       "Start": 32,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-1T11,XXXX-WXX-1T16,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-14 11:00:00",
  //             "end": "2018-05-14 16:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T11,XXXX-WXX-1T16,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-21 11:00:00",
  //             "end": "2018-05-21 16:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T23,XXXX-WXX-2T04,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-14 23:00:00",
  //             "end": "2018-05-15 04:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T23,XXXX-WXX-2T04,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-21 23:00:00",
  //             "end": "2018-05-22 04:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for another day",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "another day",
  //       "Start": 15,
  //       "End": 25,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "duration", "value": "86400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Each week and another thing this week",
  //   "Context": {"ReferenceDateTime": "2018-05-20T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "each week",
  //       "Start": 0,
  //       "End": 8,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "this week",
  //       "Start": 28,
  //       "End": 36,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W20", "type": "daterange", "start": "2018-05-14", "end": "2018-05-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "The notes are shared out in the LT working session notes attached each week and highlights are shared in the Data insights section. For this week’s special topic the data team has written an overview of some of the new features the dashboard supports and how it is built. If you have not seen the dashboard, this may be a great opportunity to learn something new.I would like to ask Cortana to schedule 45 minutes in November. I would also like to share news that Skype integration with our OWA Rea",
  //   "Context": {"ReferenceDateTime": "2018-05-20T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "each week",
  //       "Start": 66,
  //       "End": 74,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "this week",
  //       "Start": 136,
  //       "End": 144,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W20", "type": "daterange", "start": "2018-05-14", "end": "2018-05-21"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "45 minutes",
  //       "Start": 403,
  //       "End": 412,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT45M", "type": "duration", "value": "2700"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "november",
  //       "Start": 417,
  //       "End": 424,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11", "type": "daterange", "start": "2017-11-01", "end": "2017-12-01"},
  //           {"timex": "XXXX-11", "type": "daterange", "start": "2018-11-01", "end": "2018-12-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I was not there the same week that it happened.",
  //   "Context": {"ReferenceDateTime": "2017-11-17T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "same week",
  //       "Start": 20,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX", "Mod": "ref_undef", "type": "daterange", "start": "2017-11-13", "end": "2017-11-20"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I was not there the same month that it happened.",
  //   "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "same month",
  //       "Start": 20,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-XX", "Mod": "ref_undef", "type": "daterange", "start": "2017-11-01", "end": "2017-12-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I was not there that weekend.",
  //   "Context": {"ReferenceDateTime": "2016-11-11T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "that weekend",
  //       "Start": 16,
  //       "End": 27,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-WXX-WE",
  //             "Mod": "ref_undef",
  //             "type": "daterange",
  //             "start": "2016-11-12",
  //             "end": "2016-11-14"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I was not there the same year that it happened. ",
  //   "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "same year",
  //       "Start": 20,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX", "Mod": "ref_undef", "type": "daterange", "start": "2017-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'm blocked for the day",
  //   "Context": {"ReferenceDateTime": "2018-05-22T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "the day",
  //       "Start": 16,
  //       "End": 22,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-22", "type": "date", "value": "2018-05-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'm away for the month",
  //   "Context": {"ReferenceDateTime": "2018-05-22T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "the month",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05", "type": "daterange", "start": "2018-05-01", "end": "2018-06-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for Beijing early in the day Wednesday.",
  //   "Context": {"ReferenceDateTime": "2018-05-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "early in the day wednesday",
  //       "Start": 23,
  //       "End": 48,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-WXX-3",
  //             "Mod": "start",
  //             "type": "datetimerange",
  //             "start": "2018-05-23 00:00:00",
  //             "end": "2018-05-23 12:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for Beijing mid today.",
  //   "Context": {"ReferenceDateTime": "2018-05-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "mid today",
  //       "Start": 23,
  //       "End": 31,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-05-18",
  //             "Mod": "mid",
  //             "type": "datetimerange",
  //             "start": "2018-05-18 10:00:00",
  //             "end": "2018-05-18 14:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for Beijing later in today.",
  //   "Context": {"ReferenceDateTime": "2018-05-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "later in today",
  //       "Start": 23,
  //       "End": 36,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-05-18",
  //             "Mod": "end",
  //             "type": "datetimerange",
  //             "start": "2018-05-18 12:00:00",
  //             "end": "2018-05-19 00:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Hey, we got Cloud partner of the year.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the year",
  //       "Start": 29,
  //       "End": 36,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-01-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Hey, we got a partner of the month.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the month",
  //       "Start": 25,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05", "type": "daterange", "start": "2018-05-01", "end": "2018-06-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Hey, we got a partner of the week.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the week",
  //       "Start": 25,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W21", "type": "daterange", "start": "2018-05-21", "end": "2018-05-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Hey, we got a partner of the day.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the day",
  //       "Start": 25,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-24", "type": "date", "value": "2018-05-24"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Have a great month.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "Nice day.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Have a great week!",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "What is the april 2017 bonus.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "april 2017",
  //       "Start": 12,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-04", "type": "daterange", "start": "2017-04-01", "end": "2017-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I went back to China in 2017 april.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2017 april",
  //       "Start": 24,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-04", "type": "daterange", "start": "2017-04-01", "end": "2017-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I went back to China in the april.",
  //   "Context": {"ReferenceDateTime": "2018-05-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "april",
  //       "Start": 28,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-04", "type": "daterange", "start": "2018-04-01", "end": "2018-05-01"},
  //           {"timex": "XXXX-04", "type": "daterange", "start": "2019-04-01", "end": "2019-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We could have scheduled a time to meet earlier in the week.",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "earlier in the week",
  //       "Start": 39,
  //       "End": 57,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W22", "type": "daterange", "start": "2018-05-28", "end": "2018-05-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We could have scheduled a time to meet earlier this month.",
  //   "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "earlier this month",
  //       "Start": 39,
  //       "End": 56,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05", "type": "daterange", "start": "2018-05-01", "end": "2018-05-16"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We could have scheduled a time to meet earlier this year.",
  //   "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "earlier this year",
  //       "Start": 39,
  //       "End": 55,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-01-01", "end": "2018-05-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please find us a time to meet later this week",
  //   "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "later this week",
  //       "Start": 30,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W22", "type": "daterange", "start": "2018-05-31", "end": "2018-06-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "He will come after his parents after 2016 and before 2018, or before 2019",
  //   "Context": {"ReferenceDateTime": "2015-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "after 2016",
  //       "Start": 31,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "2017-01-01"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "before 2018",
  //       "Start": 46,
  //       "End": 56,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2018-01-01"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "before 2019",
  //       "Start": 62,
  //       "End": 72,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2019-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please find us a time to meet later this month",
  //   "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "later this month",
  //       "Start": 30,
  //       "End": 45,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05", "type": "daterange", "start": "2018-05-28", "end": "2018-06-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please find us a time to meet later this year",
  //   "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "later this year",
  //       "Start": 30,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-07-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please find us a time to meet later in the year",
  //   "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "later in the year",
  //       "Start": 30,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-07-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available two days after today?",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "two days after today",
  //       "Start": 18,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-02", "type": "date", "value": "2018-06-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available three weeks from tomorrow?",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "three weeks from tomorrow",
  //       "Start": 18,
  //       "End": 42,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-22", "type": "date", "value": "2018-06-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available three weeks from tmrw?",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "three weeks from tmrw",
  //       "Start": 18,
  //       "End": 38,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-22", "type": "date", "value": "2018-06-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you two days before yesterday?",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "two days before yesterday",
  //       "Start": 15,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-28", "type": "date", "value": "2018-05-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Eli Lilly sold IVAC on Dec. 31 , 1994",
  //   "Context": {"ReferenceDateTime": "2018-05-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "dec. 31 , 1994",
  //       "Start": 23,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1994-12-31", "type": "date", "value": "1994-12-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Eli Lilly sold IVAC on Dec31 , 1994",
  //   "Context": {"ReferenceDateTime": "2018-05-01T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "dec31 , 1994",
  //       "Start": 23,
  //       "End": 34,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1994-12-31", "type": "date", "value": "1994-12-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 5/3/18 @ 17:49:19",
  //   "Context": {"ReferenceDateTime": "2018-05-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "5/3/18 @ 17:49:19",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-03T17:49:19", "type": "datetime", "value": "2018-05-03 17:49:19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen between 10 and 11:30 on 1/1/2015",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between 10 and 11:30 on 1/1/2015",
  //       "Start": 15,
  //       "End": 46,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2015-01-01T10,2015-01-01T11:30,PT1H30M)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 10:00:00",
  //             "end": "2015-01-01 11:30:00"
  //           },
  //           {
  //             "timex": "(2015-01-01T22,2015-01-01T23:30,PT1H30M)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 22:00:00",
  //             "end": "2015-01-01 23:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen 1/1/2015 between 10 and 11:30",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "1/1/2015 between 10 and 11:30",
  //       "Start": 15,
  //       "End": 43,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2015-01-01T10,2015-01-01T11:30,PT1H30M)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 10:00:00",
  //             "end": "2015-01-01 11:30:00"
  //           },
  //           {
  //             "timex": "(2015-01-01T22,2015-01-01T23:30,PT1H30M)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 22:00:00",
  //             "end": "2015-01-01 23:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen from 10:30 to 3 on 1/1/2015",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 10:30 to 3 on 1/1/2015",
  //       "Start": 15,
  //       "End": 41,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2015-01-01T10:30,2015-01-01T15,PT4H30M)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 10:30:00",
  //             "end": "2015-01-01 15:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen between 3 and 5 on 1/1/2015",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "between 3 and 5 on 1/1/2015",
  //       "Start": 15,
  //       "End": 41,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2015-01-01T03,2015-01-01T05,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 03:00:00",
  //             "end": "2015-01-01 05:00:00"
  //           },
  //           {
  //             "timex": "(2015-01-01T15,2015-01-01T17,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 15:00:00",
  //             "end": "2015-01-01 17:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen from 3:30 to 5:55 on 1/1/2015",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 3:30 to 5:55 on 1/1/2015",
  //       "Start": 15,
  //       "End": 43,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2015-01-01T03:30,2015-01-01T05:55,PT2H25M)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 03:30:00",
  //             "end": "2015-01-01 05:55:00"
  //           },
  //           {
  //             "timex": "(2015-01-01T15:30,2015-01-01T17:55,PT2H25M)",
  //             "type": "datetimerange",
  //             "start": "2015-01-01 15:30:00",
  //             "end": "2015-01-01 17:55:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "show me sales before 2010 or after 2018",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "before 2010",
  //       "Start": 14,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2010",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "end": "2010-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "after 2018",
  //       "Start": 29,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2019-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "show me sales after 2010 and before 2018 or before 2000 but not 1998",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "after 2010",
  //       "Start": 14,
  //       "End": 23,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2010",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2011-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "before 2018",
  //       "Start": 29,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "end": "2018-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "before 2000",
  //       "Start": 44,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2000",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "end": "2000-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "1998",
  //       "Start": 64,
  //       "End": 67,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1998", "type": "daterange", "start": "1998-01-01", "end": "1999-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please set up a Skype call sometime this Friday-Jun-15 with Jim",
  //   "Context": {"ReferenceDateTime": "2018-06-20T00:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "this friday-jun-15",
  //       "Start": 45,
  //       "End": 62,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-15", "type": "date", "value": "2018-06-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please set up a Skype call sometime this friday (jun-15) with Jim",
  //   "Context": {"ReferenceDateTime": "2018-06-20T00:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "this friday (jun-15)",
  //       "Start": 45,
  //       "End": 64,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-15", "type": "date", "value": "2018-06-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please tell me the sale by year of Microsoft.",
  //   "Context": {"ReferenceDateTime": "2018-06-20T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "show me records more than 4 days and less than 1 week",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "more than 4 days",
  //       "Start": 16,
  //       "End": 31,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P4D", "Mod": "more", "type": "duration", "value": "345600"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "less than 1 week",
  //       "Start": 37,
  //       "End": 52,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "Mod": "less", "type": "duration", "value": "604800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show me records more than 1 hour and 30 minutes",
  //   "Context": {"ReferenceDateTime": "2018-06-20T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "more than 1 hour and 30 minutes",
  //       "Start": 16,
  //       "End": 46,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1H30M", "Mod": "more", "type": "duration", "value": "5400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I have already finished all my work more than 2 weeks before today",
  //   "Context": {"ReferenceDateTime": "2018-06-12T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "more than 2 weeks before today",
  //       "Start": 36,
  //       "End": 65,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-29", "Mod": "before", "type": "daterange", "end": "2018-05-29"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should have been done more than 2 days before yesterday",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "more than 2 days before yesterday",
  //       "Start": 32,
  //       "End": 64,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-26", "Mod": "before", "type": "daterange", "end": "2018-05-26"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task will be done less than 3 days after tomorrow",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "less than 3 days after tomorrow",
  //       "Start": 23,
  //       "End": 53,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-05-30,2018-06-02,P3D)", "type": "daterange", "start": "2018-05-30", "end": "2018-06-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task will start more than 2 weeks after today",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "more than 2 weeks after today",
  //       "Start": 21,
  //       "End": 49,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-12", "Mod": "after", "type": "daterange", "start": "2018-06-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's start 3 minutes from now",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "3 minutes from now",
  //       "Start": 12,
  //       "End": 29,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-29T00:03:00", "type": "datetime", "value": "2018-05-29 00:03:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's start 3 minutes from today",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "3 minutes",
  //       "Start": 12,
  //       "End": 20,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT3M", "type": "duration", "value": "180"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "today",
  //       "Start": 27,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-29", "type": "date", "value": "2018-05-29"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Can I do a booking for the 09th of May for 2 nights?",
  //   "Context": {"ReferenceDateTime": "2018-06-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the 09th of may",
  //       "Start": 23,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-09", "type": "date", "value": "2018-05-09"},
  //           {"timex": "XXXX-05-09", "type": "date", "value": "2019-05-09"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2 nights",
  //       "Start": 43,
  //       "End": 50,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2D", "type": "duration", "value": "172800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Can I do a booking for the 09th of May for 2 days?",
  //   "Context": {"ReferenceDateTime": "2018-06-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the 09th of may",
  //       "Start": 23,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-09", "type": "date", "value": "2018-05-09"},
  //           {"timex": "XXXX-05-09", "type": "date", "value": "2019-05-09"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2 days",
  //       "Start": 43,
  //       "End": 48,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2D", "type": "duration", "value": "172800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It happens in 15th  century",
  //   "Context": {"ReferenceDateTime": "2018-06-22T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "15th  century",
  //       "Start": 14,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(1400-01-01,1500-01-01,P100Y)", "type": "daterange", "start": "1400-01-01", "end": "1500-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show me the records in 21st century",
  //   "Context": {"ReferenceDateTime": "2018-06-22T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "21st century",
  //       "Start": 23,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2000-01-01,2100-01-01,P100Y)", "type": "daterange", "start": "2000-01-01", "end": "2100-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Maybe we can leave after 2018",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "after 2018",
  //       "Start": 19,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2019-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Maybe we can leave after Feb 2018",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "after feb 2018",
  //       "Start": 19,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-02",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2018-03-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Maybe we can leave after Feb",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "after feb",
  //       "Start": 19,
  //       "End": 27,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-02",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2018-03-01",
  //             "sourceEntity": "datetimerange"
  //           },
  //           {
  //             "timex": "XXXX-02",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2019-03-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen 1/1/2015 after 2:00",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "1/1/2015 after 2:00",
  //       "Start": 15,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015-01-01T02:00", "Mod": "after", "type": "datetimerange", "start": "2015-01-01 02:00:00"},
  //           {"timex": "2015-01-01T14:00", "Mod": "after", "type": "datetimerange", "start": "2015-01-01 14:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen today before 4pm",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "today before 4pm",
  //       "Start": 15,
  //       "End": 30,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-26T16", "Mod": "before", "type": "datetimerange", "end": "2018-06-26 16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen next Wednesday later than 10 in the morning",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next wednesday later than 10 in the morning",
  //       "Start": 15,
  //       "End": 57,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-07-04T10", "Mod": "after", "type": "datetimerange", "start": "2018-07-04 10:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It happened on previous Tuesday by 2 in the afternoon",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "previous tuesday by 2 in the afternoon",
  //       "Start": 15,
  //       "End": 52,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-19T14", "Mod": "before", "type": "datetimerange", "end": "2018-06-19 14:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go on Feb 1st no later than 6:00",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "feb 1st no later than 6:00",
  //       "Start": 12,
  //       "End": 37,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-01T06:00", "Mod": "before", "type": "datetimerange", "end": "2018-02-01 06:00:00"},
  //           {"timex": "XXXX-02-01T06:00", "Mod": "before", "type": "datetimerange", "end": "2019-02-01 06:00:00"},
  //           {"timex": "XXXX-02-01T18:00", "Mod": "before", "type": "datetimerange", "end": "2018-02-01 18:00:00"},
  //           {"timex": "XXXX-02-01T18:00", "Mod": "before", "type": "datetimerange", "end": "2019-02-01 18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It happened on next week after 2:00",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next week",
  //       "Start": 15,
  //       "End": 23,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W27", "type": "daterange", "start": "2018-07-02", "end": "2018-07-09"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "after 2:00",
  //       "Start": 25,
  //       "End": 34,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "T02:00",
  //             "Mod": "after",
  //             "type": "timerange",
  //             "start": "02:00:00",
  //             "sourceEntity": "datetimepoint"
  //           },
  //           {
  //             "timex": "T14:00",
  //             "Mod": "after",
  //             "type": "timerange",
  //             "start": "14:00:00",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in 2007 and 2009",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "2007",
  //       "Start": 14,
  //       "End": 17,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2007", "type": "daterange", "start": "2007-01-01", "end": "2008-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2009",
  //       "Start": 23,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2009", "type": "daterange", "start": "2009-01-01", "end": "2010-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales between 2007 and 2009",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between 2007 and 2009",
  //       "Start": 11,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2007-01-01,2009-01-01,P2Y)", "type": "daterange", "start": "2007-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please book Skype call today at 9a.",
  //   "Context": {"ReferenceDateTime": "2018-06-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "today at 9a",
  //       "Start": 23,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-28T09", "type": "datetime", "value": "2018-06-28 09:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please book Skype call today at 9p.",
  //   "Context": {"ReferenceDateTime": "2018-06-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "today at 9p",
  //       "Start": 23,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-28T21", "type": "datetime", "value": "2018-06-28 21:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the year 2008",
  //   "Context": {"ReferenceDateTime": "2018-06-28T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "year 2008",
  //       "Start": 18,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2008", "type": "daterange", "start": "2008-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the year",
  //   "Context": {"ReferenceDateTime": "2018-06-28T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "the year",
  //       "Start": 14,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-01-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the week",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "the week",
  //       "Start": 14,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W27", "type": "daterange", "start": "2018-07-02", "end": "2018-07-09"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the week after next",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the week after next",
  //       "Start": 14,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W29", "type": "daterange", "start": "2018-07-16", "end": "2018-07-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the week 31",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "week 31",
  //       "Start": 18,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W31", "type": "daterange", "start": "2018-07-30", "end": "2018-08-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the week 1",
  //   "Context": {"ReferenceDateTime": "2019-03-02T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "week 1",
  //       "Start": 18,
  //       "End": 23,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W01", "type": "daterange", "start": "2018-12-31", "end": "2019-01-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the week 1",
  //   "Context": {"ReferenceDateTime": "2011-07-02T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "week 1",
  //       "Start": 18,
  //       "End": 23,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2011-W01", "type": "daterange", "start": "2011-01-03", "end": "2011-01-10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "There is no week 00, nor W00",
  //   "Context": {"ReferenceDateTime": "2019-03-02T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "I will leave in 2 minutes",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in 2 minutes",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-26T00:02:00", "type": "datetime", "value": "2018-06-26 00:02:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave in two months",
  //   "Context": {"ReferenceDateTime": "2018-07-05T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in two months",
  //       "Start": 13,
  //       "End": 25,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-09-05", "type": "date", "value": "2018-09-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave in two weeks",
  //   "Context": {"ReferenceDateTime": "2018-07-05T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in two weeks",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-07-19", "type": "date", "value": "2018-07-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave in two years",
  //   "Context": {"ReferenceDateTime": "2018-07-05T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in two years",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-07-05", "type": "date", "value": "2020-07-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave in two days from today",
  //   "Context": {"ReferenceDateTime": "2018-07-05T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "two days from today",
  //       "Start": 16,
  //       "End": 34,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-07-07", "type": "date", "value": "2018-07-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is 2014-2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2014-2018",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is 2014~2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2014~2018",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is 2014 to 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2014 to 2018",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is between 2014-2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between 2014-2018",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is between 2014~2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between 2014~2018",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is between 2014 and 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between 2014 and 2018",
  //       "Start": 13,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is between 2014 through 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between 2014 through 2018",
  //       "Start": 13,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2014 to 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2014 to 2018",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2014 till 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2014 till 2018",
  //       "Start": 13,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2014-2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2014-2018",
  //       "Start": 13,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2014~2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2014~2018",
  //       "Start": 13,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2014 through 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2014 through 2018",
  //       "Start": 13,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is in 2014 through 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "in 2014 through 2018",
  //       "Start": 13,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-01-01,P4Y)", "type": "daterange", "start": "2014-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is in 2014 through May 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2014 through may 2018",
  //       "Start": 16,
  //       "End": 36,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-05-01,P52M)", "type": "daterange", "start": "2014-01-01", "end": "2018-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is in 2014 through May 2nd 2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2014 through may 2nd 2018",
  //       "Start": 16,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-01-01,2018-05-02,P1582D)", "type": "daterange", "start": "2014-01-01", "end": "2018-05-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please set up a Skype call sometime on Friday 7.6 with Jim.",
  //   "Context": {"ReferenceDateTime": "2018-07-06T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday 7.6",
  //       "Start": 48,
  //       "End": 57,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-07-06", "type": "date", "value": "2018-07-06"},
  //           {"timex": "XXXX-07-06", "type": "date", "value": "2019-07-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please set up a Skype call sometime Friday 7/6 with Jim.",
  //   "Context": {"ReferenceDateTime": "2018-07-06T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday 7/6",
  //       "Start": 45,
  //       "End": 54,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-07-06", "type": "date", "value": "2018-07-06"},
  //           {"timex": "XXXX-07-06", "type": "date", "value": "2019-07-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please set up a Skype call sometime on Friday 7-6 with Jim.",
  //   "Context": {"ReferenceDateTime": "2018-07-06T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday 7-6",
  //       "Start": 48,
  //       "End": 57,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-07-06", "type": "date", "value": "2018-07-06"},
  //           {"timex": "XXXX-07-06", "type": "date", "value": "2019-07-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please set up a Skype call sometime Friday 2018-7-6 with Jim.",
  //   "Context": {"ReferenceDateTime": "2018-07-06T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday 2018-7-6",
  //       "Start": 45,
  //       "End": 59,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-07-06", "type": "date", "value": "2018-07-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Find records last for less than 2 hours or more than 4 days, and not less than 30 minutes.",
  //   "Context": {"ReferenceDateTime": "2018-07-09T22:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "less than 2 hours",
  //       "Start": 22,
  //       "End": 38,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT2H", "Mod": "less", "type": "duration", "value": "7200"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "more than 4 days",
  //       "Start": 43,
  //       "End": 58,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P4D", "Mod": "more", "type": "duration", "value": "345600"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "less than 30 minutes",
  //       "Start": 69,
  //       "End": 88,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT30M", "Mod": "less", "type": "duration", "value": "1800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show me sales in the year of 2008",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "2008",
  //       "Start": 29,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2008", "type": "daterange", "start": "2008-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I left there january twenty fourth one thirty p m.",
  //   "Context": {"ReferenceDateTime": "2018-07-11T20:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "january twenty fourth one thirty p m",
  //       "Start": 13,
  //       "End": 48,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-01-24T13:30", "type": "datetime", "value": "2018-01-24 13:30:00"},
  //           {"timex": "XXXX-01-24T13:30", "type": "datetime", "value": "2019-01-24 13:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will go back to China in the mid-November.",
  //   "Context": {"ReferenceDateTime": "2018-07-13T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "mid-november",
  //       "Start": 31,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11", "Mod": "mid", "type": "daterange", "start": "2017-11-10", "end": "2017-11-21"},
  //           {"timex": "XXXX-11", "Mod": "mid", "type": "daterange", "start": "2018-11-10", "end": "2018-11-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Suprise office party for Ted on Sat at 5.",
  //   "Context": {"ReferenceDateTime": "2018-07-13T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "sat at 5",
  //       "Start": 32,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-6T05", "type": "datetime", "value": "2018-07-07 05:00:00"},
  //           {"timex": "XXXX-WXX-6T05", "type": "datetime", "value": "2018-07-14 05:00:00"},
  //           {"timex": "XXXX-WXX-6T17", "type": "datetime", "value": "2018-07-07 17:00:00"},
  //           {"timex": "XXXX-WXX-6T17", "type": "datetime", "value": "2018-07-14 17:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Last night 26 people disappeared",
  //   "Context": {"ReferenceDateTime": "2018-07-17T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "last night",
  //       "Start": 0,
  //       "End": 9,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-07-16TNI",
  //             "type": "datetimerange",
  //             "start": "2018-07-16 20:00:00",
  //             "end": "2018-07-16 23:59:59"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The story happened the year before independence.",
  //   "Context": {"ReferenceDateTime": "2018-07-17T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the year",
  //       "Start": 19,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-01-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "There is a event in the independence day of this year.",
  //   "Context": {"ReferenceDateTime": "2018-07-17T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "independence day of this year",
  //       "Start": 24,
  //       "End": 52,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-07-04", "type": "date", "value": "2018-07-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I plan to leave before independence day.",
  //   "Context": {"ReferenceDateTime": "2018-07-24T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "before independence day",
  //       "Start": 16,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-07-04",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "end": "2018-07-04",
  //             "sourceEntity": "datetimepoint"
  //           },
  //           {
  //             "timex": "XXXX-07-04",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "end": "2019-07-04",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can find us a time Tuesday or Wednesday from 10-4",
  //   "Context": {"ReferenceDateTime": "2018-07-30T13:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "tuesday",
  //       "Start": 28,
  //       "End": 34,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2018-07-24"},
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2018-07-31"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "wednesday from 10-4",
  //       "Start": 39,
  //       "End": 57,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-3T10,XXXX-WXX-3T16,PT6H)",
  //             "type": "datetimerange",
  //             "start": "2018-07-25 10:00:00",
  //             "end": "2018-07-25 16:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-3T10,XXXX-WXX-3T16,PT6H)",
  //             "type": "datetimerange",
  //             "start": "2018-08-01 10:00:00",
  //             "end": "2018-08-01 16:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-3T22,XXXX-WXX-4T04,PT6H)",
  //             "type": "datetimerange",
  //             "start": "2018-07-25 22:00:00",
  //             "end": "2018-07-26 04:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-3T22,XXXX-WXX-4T04,PT6H)",
  //             "type": "datetimerange",
  //             "start": "2018-08-01 22:00:00",
  //             "end": "2018-08-02 04:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "please schedule something for the following week",
  //   "Context": {"ReferenceDateTime": "2018-07-31T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "following week",
  //       "Start": 34,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W32", "type": "daterange", "start": "2018-08-06", "end": "2018-08-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's arrange that over the next couple weeks, ok?",
  //   "Context": {"ReferenceDateTime": "2018-07-31T13:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "next couple weeks",
  //       "Start": 28,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-08-01,2018-08-15,P2W)", "type": "daterange", "start": "2018-08-01", "end": "2018-08-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "it's on monday of the following week",
  //   "Context": {"ReferenceDateTime": "2018-07-31T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "on monday of the following week",
  //       "Start": 5,
  //       "End": 35,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-08-06", "type": "date", "value": "2018-08-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave on May/22(Tue)-11:30 AM PT.",
  //   "Context": {"ReferenceDateTime": "2018-07-30T20:00:00"},
  //   "Results": [
  //     {
  //       "Text": "may/22(tue)-11:30 am",
  //       "Start": 14,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-22T11:30", "type": "datetime", "value": "2018-05-22 11:30:00"},
  //           {"timex": "XXXX-05-22T11:30", "type": "datetime", "value": "2019-05-22 11:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The door is opened from today pm to tomorrow am.",
  //   "Context": {"ReferenceDateTime": "2018-07-31T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "today pm",
  //       "Start": 24,
  //       "End": 31,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-07-31TAF",
  //             "type": "datetimerange",
  //             "start": "2018-07-31 12:00:00",
  //             "end": "2018-07-31 16:00:00"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tomorrow am",
  //       "Start": 36,
  //       "End": 46,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-08-01TMO",
  //             "type": "datetimerange",
  //             "start": "2018-08-01 08:00:00",
  //             "end": "2018-08-01 12:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for Wednesday evening next week.",
  //   "Context": {"ReferenceDateTime": "2018-08-01T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "wednesday evening next week",
  //       "Start": 45,
  //       "End": 71,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-08-08TEV",
  //             "type": "datetimerange",
  //             "start": "2018-08-08 16:00:00",
  //             "end": "2018-08-08 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for the first Monday evening of next month.",
  //   "Context": {"ReferenceDateTime": "2018-08-01T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "first monday evening of next month",
  //       "Start": 49,
  //       "End": 82,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-09-WXX-1-#1TEV",
  //             "type": "datetimerange",
  //             "start": "2018-09-03 16:00:00",
  //             "end": "2018-09-03 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for the first Monday 1pm to 3pm of next month.",
  //   "Context": {"ReferenceDateTime": "2018-08-01T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "first monday 1pm to 3pm of next month",
  //       "Start": 49,
  //       "End": 85,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-09-WXX-1-#1T13,XXXX-09-WXX-1-#1T15,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-09-03 13:00:00",
  //             "end": "2018-09-03 15:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for the week of the 18th.",
  //   "Context": {"ReferenceDateTime": "2018-08-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the week of the 18th",
  //       "Start": 45,
  //       "End": 64,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-XX-18", "type": "daterange", "start": "2018-07-16", "end": "2018-07-23"},
  //           {"timex": "XXXX-XX-18", "type": "daterange", "start": "2018-08-13", "end": "2018-08-20"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up on the 18th.",
  //   "Context": {"ReferenceDateTime": "2018-08-07T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the 18th",
  //       "Start": 44,
  //       "End": 51,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-XX-18", "type": "date", "value": "2018-07-18"},
  //           {"timex": "XXXX-XX-18", "type": "date", "value": "2018-08-18"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up on the 4th.",
  //   "Context": {"ReferenceDateTime": "2018-08-07T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the 4th",
  //       "Start": 44,
  //       "End": 50,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-XX-04", "type": "date", "value": "2018-08-04"},
  //           {"timex": "XXXX-XX-04", "type": "date", "value": "2018-09-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up between the 21st and 23rd.",
  //   "Comment": "Only supported in CalendarMode",
  //   "Context": {"ReferenceDateTime": "2018-08-08T10:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Cortana, can you please set something up the 21st.",
  //   "Comment": "Only supported in CalendarMode",
  //   "Context": {"ReferenceDateTime": "2018-08-08T10:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Good Morning Paul",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "Good night Cortana",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "Cortana, can you please set something up around the 21st.",
  //   "Comment": "Only supported in CalendarMode",
  //   "Context": {"ReferenceDateTime": "2018-08-08T10:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "Cortana, can you please set something up around the 21st this month.",
  //   "Context": {"ReferenceDateTime": "2018-08-08T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "around the 21st this month",
  //       "Start": 41,
  //       "End": 66,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-08-21", "Mod": "approx", "type": "daterange", "value": "2018-08-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up around tomorrow 10am.",
  //   "Context": {"ReferenceDateTime": "2018-08-16T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "around tomorrow 10am",
  //       "Start": 41,
  //       "End": 60,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-08-17T10", "Mod": "approx", "type": "datetimerange", "value": "2018-08-17 10:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet this week as early as 7:00 am",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this week",
  //       "Start": 11,
  //       "End": 19,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W33", "type": "daterange", "start": "2018-08-13", "end": "2018-08-20"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "as early as 7:00 am",
  //       "Start": 21,
  //       "End": 39,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "T07:00",
  //             "Mod": "since",
  //             "type": "timerange",
  //             "start": "07:00:00",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave as late as 7:00 am",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "as late as 7:00 am",
  //       "Start": 11,
  //       "End": 28,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T07:00", "Mod": "until", "type": "timerange", "end": "07:00:00", "sourceEntity": "datetimepoint"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave as late as tomorrow.",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "as late as tomorrow",
  //       "Start": 11,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-08-18",
  //             "Mod": "until",
  //             "type": "daterange",
  //             "end": "2018-08-18",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for the next 4 business days.",
  //   "Context": {"ReferenceDateTime": "2018-08-20T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next 4 business days",
  //       "Start": 49,
  //       "End": 68,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-08-21,2018-08-25,P4BD)",
  //             "type": "daterange",
  //             "list": "2018-08-21,2018-08-22,2018-08-23,2018-08-24",
  //             "start": "2018-08-21",
  //             "end": "2018-08-25"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for the next 4 business days.",
  //   "Context": {"ReferenceDateTime": "2018-08-21T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next 4 business days",
  //       "Start": 49,
  //       "End": 68,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-08-22,2018-08-28,P4BD)",
  //             "type": "daterange",
  //             "list": "2018-08-22,2018-08-23,2018-08-24,2018-08-27",
  //             "start": "2018-08-22",
  //             "end": "2018-08-28"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for the previous 4 business days.",
  //   "Context": {"ReferenceDateTime": "2018-08-21T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "previous 4 business days",
  //       "Start": 49,
  //       "End": 72,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-08-15,2018-08-21,P4BD)",
  //             "type": "daterange",
  //             "list": "2018-08-15,2018-08-16,2018-08-17,2018-08-20",
  //             "start": "2018-08-15",
  //             "end": "2018-08-21"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, can you please set something up for October, 1st.",
  //   "Context": {"ReferenceDateTime": "2018-08-21T10:00:00"},
  //   "Results": [
  //     {
  //       "Text": "october, 1st",
  //       "Start": 45,
  //       "End": 56,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-10-01", "type": "date", "value": "2017-10-01"},
  //           {"timex": "XXXX-10-01", "type": "date", "value": "2018-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "set up a 15 minute skype call next Monday or Tuesday after 1pm GMT.",
  //   "Context": {"ReferenceDateTime": "2018-08-29T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "15 minute",
  //       "Start": 9,
  //       "End": 17,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT15M", "type": "duration", "value": "900"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "next monday",
  //       "Start": 30,
  //       "End": 40,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-09-03", "type": "date", "value": "2018-09-03"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tuesday after 1pm",
  //       "Start": 45,
  //       "End": 61,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2T13", "Mod": "after", "type": "datetimerange", "start": "2018-08-28 13:00:00"},
  //           {"timex": "XXXX-WXX-2T13", "Mod": "after", "type": "datetimerange", "start": "2018-09-04 13:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, I am looking at 18 and 19 June.",
  //   "Context": {"ReferenceDateTime": "2018-08-29T12:00:00"},
  //   "Comment": "Not currently supported. The first number will be tagged as time.",
  //   "NotSupported": "dotnet, javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "18",
  //       "Start": 25,
  //       "End": 26,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-18", "type": "date", "value": "2018-06-18"},
  //           {"timex": "XXXX-06-18", "type": "date", "value": "2019-06-18"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "19 june",
  //       "Start": 32,
  //       "End": 38,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2018-06-19"},
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2019-06-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen in the 5 upcoming years?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "5 upcoming years",
  //       "Start": 24,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-08-31,2023-08-31,P5Y)", "type": "daterange", "start": "2018-08-31", "end": "2023-08-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen in the 2 upcoming months?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2 upcoming months",
  //       "Start": 24,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-08-31,2018-10-31,P2M)", "type": "daterange", "start": "2018-08-31", "end": "2018-10-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen in the 2 next days?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2 next days",
  //       "Start": 24,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-08-31,2018-09-02,P2D)", "type": "daterange", "start": "2018-08-31", "end": "2018-09-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen in the 5 coming minutes?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "5 coming minutes",
  //       "Start": 24,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-08-30T10:00:00,2018-08-30T10:05:00,PT5M)",
  //             "type": "datetimerange",
  //             "start": "2018-08-30 10:00:00",
  //             "end": "2018-08-30 10:05:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened in the 5 past minutes?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "5 past minutes",
  //       "Start": 21,
  //       "End": 34,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-08-30T09:55:00,2018-08-30T10:00:00,PT5M)",
  //             "type": "datetimerange",
  //             "start": "2018-08-30 09:55:00",
  //             "end": "2018-08-30 10:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened in the 5 past years?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "5 past years",
  //       "Start": 21,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2013-08-30,2018-08-30,P5Y)", "type": "daterange", "start": "2013-08-30", "end": "2018-08-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened in the 10 previous weeks?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "10 previous weeks",
  //       "Start": 21,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-06-21,2018-08-30,P10W)", "type": "daterange", "start": "2018-06-21", "end": "2018-08-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "book me a meeting room tomorrow from 10am-12am tomorrow",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "tomorrow from 10am-12am",
  //       "Start": 23,
  //       "End": 45,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-09-01T10,2018-09-01T12,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-09-01 10:00:00",
  //             "end": "2018-09-01 12:00:00"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tomorrow",
  //       "Start": 47,
  //       "End": 54,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-09-01", "type": "date", "value": "2018-09-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back as early as next year's first quarter.",
  //   "Context": {"ReferenceDateTime": "2018-09-06T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "as early as next year's first quarter",
  //       "Start": 13,
  //       "End": 49,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2019-01-01,2019-04-01,P3M)",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2019-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's the sales for year greater than 2012",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "year greater than 2012",
  //       "Start": 21,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2012",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2013-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I want sales for year 2012 or later",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "year 2012 or later",
  //       "Start": 17,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2012",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2012-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about year 2016 and greater",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "year 2016 and greater",
  //       "Start": 10,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2016-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "You can only leave on 1/1/2016 and later",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "1/1/2016 and later",
  //       "Start": 22,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-01-01",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2016-01-01",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "You can only leave on 1/1/2016 and after",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "1/1/2016 and after",
  //       "Start": 22,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-01-01",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2016-01-01",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I can only leave on 1/1/2016 and after my work item is done",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "Comment": "Known false positive needs to be supported in the future",
  //   "NotSupported": "javascript, java, dotnet, python",
  //   "Results": [
  //     {
  //       "Text": "1/1/2016",
  //       "Start": 20,
  //       "End": 27,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-01-01", "type": "date", "value": "2016-01-01", "sourceEntity": "datetimepoint"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I can only leave on 1/1/2016 and after 6PM",
  //   "Context": {"ReferenceDateTime": "2018-08-31T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "1/1/2016",
  //       "Start": 20,
  //       "End": 27,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-01-01", "type": "date", "value": "2016-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "after 6pm",
  //       "Start": 33,
  //       "End": 41,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T18", "Mod": "after", "type": "timerange", "start": "18:00:00", "sourceEntity": "datetimepoint"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This bank stock is down 20% in the year to date.",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "year to date",
  //       "Start": 35,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-01-01", "end": "2018-09-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Shall we leave on 2018 or later, is this ok for you?",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2018 or later",
  //       "Start": 18,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "start": "2018-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's the sales for between 2015 and 2018 or later than 2020",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between 2015 and 2018",
  //       "Start": 21,
  //       "End": 41,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2015-01-01,2018-01-01,P3Y)", "type": "daterange", "start": "2015-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "later than 2020",
  //       "Start": 46,
  //       "End": 60,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2020",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2021-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet this week any time from 7:00 am",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this week",
  //       "Start": 11,
  //       "End": 19,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W33", "type": "daterange", "start": "2018-08-13", "end": "2018-08-20"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "any time from 7:00 am",
  //       "Start": 21,
  //       "End": 41,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "T07:00",
  //             "Mod": "since",
  //             "type": "timerange",
  //             "start": "07:00:00",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "later than 2018",
  //   "Context": {"ReferenceDateTime": "2018-09-25T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "later than 2018",
  //       "Start": 0,
  //       "End": 14,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2019-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please schedule a meeting for Monday at 2.30",
  //   "Context": {"ReferenceDateTime": "2018-09-21T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "monday at 2.30",
  //       "Start": 30,
  //       "End": 43,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-1T02:30", "type": "datetime", "value": "2018-09-17 02:30:00"},
  //           {"timex": "XXXX-WXX-1T02:30", "type": "datetime", "value": "2018-09-24 02:30:00"},
  //           {"timex": "XXXX-WXX-1T14:30", "type": "datetime", "value": "2018-09-17 14:30:00"},
  //           {"timex": "XXXX-WXX-1T14:30", "type": "datetime", "value": "2018-09-24 14:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Shall we leave before 2.30pm?",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "before 2.30pm",
  //       "Start": 15,
  //       "End": 27,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "T14:30",
  //             "Mod": "before",
  //             "type": "timerange",
  //             "end": "14:30:00",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "hi thursday 29/03 11.00am is good",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "thursday 29/03 11.00am",
  //       "Start": 3,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-03-29T11:00", "type": "datetime", "value": "2018-03-29 11:00:00"},
  //           {"timex": "XXXX-03-29T11:00", "type": "datetime", "value": "2019-03-29 11:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please book something for 6/4 between 9.30-4.30pm PST",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "6/4 between 9.30-4.30pm",
  //       "Start": 26,
  //       "End": 48,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-06-04T09:30,XXXX-06-04T16:30,PT7H)",
  //             "type": "datetimerange",
  //             "start": "2018-06-04 09:30:00",
  //             "end": "2018-06-04 16:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-06-04T09:30,XXXX-06-04T16:30,PT7H)",
  //             "type": "datetimerange",
  //             "start": "2019-06-04 09:30:00",
  //             "end": "2019-06-04 16:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you from March to May",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from march to may",
  //       "Start": 15,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-03-01,XXXX-05-01,P2M)", "type": "daterange", "start": "2018-03-01", "end": "2018-05-01"},
  //           {"timex": "(XXXX-03-01,XXXX-05-01,P2M)", "type": "daterange", "start": "2019-03-01", "end": "2019-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen between august and october",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between august and october",
  //       "Start": 17,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-08-01,XXXX-10-01,P2M)", "type": "daterange", "start": "2018-08-01", "end": "2018-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen May to March",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "may to march",
  //       "Start": 17,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-05-01,XXXX-03-01,P10M)", "type": "daterange", "start": "2018-05-01", "end": "2019-03-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen from Sep to Nov",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from sep to nov",
  //       "Start": 17,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-09-01,XXXX-11-01,P2M)", "type": "daterange", "start": "2017-09-01", "end": "2017-11-01"},
  //           {"timex": "(XXXX-09-01,XXXX-11-01,P2M)", "type": "daterange", "start": "2018-09-01", "end": "2018-11-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen from May to September",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from may to september",
  //       "Start": 17,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-05-01,XXXX-09-01,P4M)", "type": "daterange", "start": "2018-05-01", "end": "2018-09-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What will happen from Nov to March",
  //   "Context": {"ReferenceDateTime": "2018-09-07T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from nov to march",
  //       "Start": 17,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-11-01,XXXX-03-01,P4M)", "type": "daterange", "start": "2017-11-01", "end": "2018-03-01"},
  //           {"timex": "(XXXX-11-01,XXXX-03-01,P4M)", "type": "daterange", "start": "2018-11-01", "end": "2019-03-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Mortgages were at 6.45 percent",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Shall we leave at 6.45?",
  //   "Context": {"ReferenceDateTime": "2018-08-30T10:00:00"},
  //   "Results": [
  //     {
  //       "Text": "at 6.45",
  //       "Start": 15,
  //       "End": 21,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T06:45", "type": "time", "value": "06:45:00"},
  //           {"timex": "T18:45", "type": "time", "value": "18:45:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "Typhoon Xangsane hit Metro Manila and southern Luzon two months ago, killing at least 200 and destroying billions of pesos of properties and infrastructures. Another typhoon, Cimaron, hit the northern part of the country one month ago, killing a dozen people.",
  //   "Context": {"ReferenceDateTime": "2018-10-17T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "two months ago",
  //       "Start": 53,
  //       "End": 66,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-08-17", "type": "date", "value": "2018-08-17"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "one month ago",
  //       "Start": 221,
  //       "End": 233,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-09-17", "type": "date", "value": "2018-09-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Will he be back in two days? or in a week?",
  //   "Context": {"ReferenceDateTime": "2018-10-17T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in two days",
  //       "Start": 16,
  //       "End": 26,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-10-19", "type": "date", "value": "2018-10-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "in a week",
  //       "Start": 32,
  //       "End": 40,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-10-24", "type": "date", "value": "2018-10-24"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "<a href=\"https://localhost:44300/api/redir/?r=&id=~.~3am3ioYcY0KBufXFAiTvCA~.~&userid=cc6f1c38-cc23-413d-b8ab-4aa5b54eb896&requestid=410c74a8-1687-4ea7-8418-4d958c33eab5\" style=\"text-decoration: none; color: black;\">https://localhost:44300 </a>",
  //   "Context": {"ReferenceDateTime": "2018-10-16T12:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "from 10/1 to 11/7",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from 10/1 to 11/7",
  //       "Start": 0,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-10-01,XXXX-11-07,P37D)", "type": "daterange", "start": "2018-10-01", "end": "2018-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "from 10/25 to 01/25",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from 10/25 to 01/25",
  //       "Start": 0,
  //       "End": 18,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-10-25,XXXX-01-25,P92D)", "type": "daterange", "start": "2017-10-25", "end": "2018-01-25"},
  //           {"timex": "(XXXX-10-25,XXXX-01-25,P92D)", "type": "daterange", "start": "2018-10-25", "end": "2019-01-25"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "My vacation is from 10-1-2018-10-7-2018",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 10-1-2018-10-7-2018",
  //       "Start": 15,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-10-01,2018-10-07,P6D)", "type": "daterange", "start": "2018-10-01", "end": "2018-10-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "My vacation is from 10/1/2018 - 10/7/2018",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 10/1/2018 - 10/7/2018",
  //       "Start": 15,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-10-01,2018-10-07,P6D)", "type": "daterange", "start": "2018-10-01", "end": "2018-10-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "My vacation is from 10/1/2018-10/7/2018",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 10/1/2018-10/7/2018",
  //       "Start": 15,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-10-01,2018-10-07,P6D)", "type": "daterange", "start": "2018-10-01", "end": "2018-10-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will have a long vacation between 10/1-11/7",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "between 10/1-11/7",
  //       "Start": 28,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-10-01,XXXX-11-07,P37D)", "type": "daterange", "start": "2018-10-01", "end": "2018-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "APEC will happen in Korea Jan-Feb 2017",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "jan-feb 2017",
  //       "Start": 26,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-01-01,2017-02-01,P1M)", "type": "daterange", "start": "2017-01-01", "end": "2017-02-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "APEC will happen in Korea Nov-Feb 2017",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "nov-feb 2017",
  //       "Start": 26,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-11-01,2017-02-01,P3M)", "type": "daterange", "start": "2016-11-01", "end": "2017-02-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "APEC will happen in Korea Nov-Feb 5th, 2017",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "nov-feb 5th, 2017",
  //       "Start": 26,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-11-01,2017-02-05,P96D)", "type": "daterange", "start": "2016-11-01", "end": "2017-02-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "APEC will happen in Korea Nov 18-Dec 19, 2015",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "nov 18-dec 19, 2015",
  //       "Start": 26,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2015-11-18,2015-12-19,P31D)", "type": "daterange", "start": "2015-11-18", "end": "2015-12-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "APEC will happen in Korea Nov 18 2014-Dec 19 2015",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "nov 18 2014-dec 19 2015",
  //       "Start": 26,
  //       "End": 48,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2014-11-18,2015-12-19,P396D)", "type": "daterange", "start": "2014-11-18", "end": "2015-12-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "APEC will happen in Korea on November 18-19",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "on november 18-19",
  //       "Start": 26,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-11-18,XXXX-11-19,P1D)", "type": "daterange", "start": "2017-11-18", "end": "2017-11-19"},
  //           {"timex": "(XXXX-11-18,XXXX-11-19,P1D)", "type": "daterange", "start": "2018-11-18", "end": "2018-11-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave from this May to Oct 2020",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from this may to oct 2020",
  //       "Start": 13,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-05-01,2020-10-01,P29M)", "type": "daterange", "start": "2018-05-01", "end": "2020-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave from May to Oct 2020",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from may to oct 2020",
  //       "Start": 13,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-05-01,2020-10-01,P5M)", "type": "daterange", "start": "2020-05-01", "end": "2020-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave from 5/1-5/7, 2020",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 5/1-5/7, 2020",
  //       "Start": 13,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-05-01,2020-05-07,P6D)", "type": "daterange", "start": "2020-05-01", "end": "2020-05-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave from 5/1-5/7/2020",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 5/1-5/7/2020",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-05-01,2020-05-07,P6D)", "type": "daterange", "start": "2020-05-01", "end": "2020-05-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave from 5/1/2019-5/7/2020",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 5/1/2019-5/7/2020",
  //       "Start": 13,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-05-01,2020-05-07,P372D)", "type": "daterange", "start": "2019-05-01", "end": "2020-05-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The date should be 05-Aug-2016",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "05-aug-2016",
  //       "Start": 19,
  //       "End": 29,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-08-05", "type": "date", "value": "2016-08-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available on Monday morning from 10am to 12pm",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "monday morning from 10am to 12pm",
  //       "Start": 21,
  //       "End": 52,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-1T10,XXXX-WXX-1T12,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-29 10:00:00",
  //             "end": "2018-10-29 12:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T10,XXXX-WXX-1T12,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 10:00:00",
  //             "end": "2018-11-05 12:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available 10am to 12pm Monday morning",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "10am to 12pm monday morning",
  //       "Start": 18,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-1T10,XXXX-WXX-1T12,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-29 10:00:00",
  //             "end": "2018-10-29 12:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T10,XXXX-WXX-1T12,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 10:00:00",
  //             "end": "2018-11-05 12:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you yesterday afternoon from 3-8pm",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "yesterday afternoon from 3-8pm",
  //       "Start": 15,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-10-31T15,2018-10-31T20,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-31 15:00:00",
  //             "end": "2018-10-31 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you from 3-8pm yesterday afternoon",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 3-8pm yesterday afternoon",
  //       "Start": 15,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-10-31T15,2018-10-31T20,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-31 15:00:00",
  //             "end": "2018-10-31 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you from 8am-3 yesterday afternoon",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from 8am-3 yesterday afternoon",
  //       "Start": 15,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-10-31T8,2018-10-31T15,PT7H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-31 08:00:00",
  //             "end": "2018-10-31 15:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you Monday 3-8",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "monday 3-8",
  //       "Start": 15,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-1T03,XXXX-WXX-1T08,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-29 03:00:00",
  //             "end": "2018-10-29 08:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T03,XXXX-WXX-1T08,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 03:00:00",
  //             "end": "2018-11-05 08:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T15,XXXX-WXX-1T20,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-29 15:00:00",
  //             "end": "2018-10-29 20:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T15,XXXX-WXX-1T20,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 15:00:00",
  //             "end": "2018-11-05 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you between 3 and 8 yesterday",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "between 3 and 8 yesterday",
  //       "Start": 15,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-10-31T03,2018-10-31T08,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-31 03:00:00",
  //             "end": "2018-10-31 08:00:00"
  //           },
  //           {
  //             "timex": "(2018-10-31T15,2018-10-31T20,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-10-31 15:00:00",
  //             "end": "2018-10-31 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available between 3 and 8am next Monday",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "between 3 and 8am next monday",
  //       "Start": 18,
  //       "End": 46,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-11-05T03,2018-11-05T08,PT5H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 03:00:00",
  //             "end": "2018-11-05 08:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available between 3am - 12pm next Monday",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "between 3am - 12pm next monday",
  //       "Start": 18,
  //       "End": 47,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-11-05T03,2018-11-05T12,PT9H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 03:00:00",
  //             "end": "2018-11-05 12:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available 6-8 next Monday",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "6-8 next monday",
  //       "Start": 18,
  //       "End": 32,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-11-05T06,2018-11-05T08,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 06:00:00",
  //             "end": "2018-11-05 08:00:00"
  //           },
  //           {
  //             "timex": "(2018-11-05T18,2018-11-05T20,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 18:00:00",
  //             "end": "2018-11-05 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available next Monday 6-8",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next monday 6-8",
  //       "Start": 18,
  //       "End": 32,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-11-05T06,2018-11-05T08,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 06:00:00",
  //             "end": "2018-11-05 08:00:00"
  //           },
  //           {
  //             "timex": "(2018-11-05T18,2018-11-05T20,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 18:00:00",
  //             "end": "2018-11-05 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Are you available next Monday morning 6-8",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next monday morning 6-8",
  //       "Start": 18,
  //       "End": 40,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-11-05T06,2018-11-05T08,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-11-05 06:00:00",
  //             "end": "2018-11-05 08:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's your plan for Dec-2018",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "dec-2018",
  //       "Start": 21,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-12", "type": "daterange", "start": "2018-12-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's your plan for Dec/2018",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "dec/2018",
  //       "Start": 21,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-12", "type": "daterange", "start": "2018-12-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's your plan for Dec, 2018",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "dec, 2018",
  //       "Start": 21,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-12", "type": "daterange", "start": "2018-12-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's your plan for Dec/2018-May/2019",
  //   "Context": {"ReferenceDateTime": "2018-11-01T12:00:00"},
  //   "NotSupportedByDesign": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "dec/2018-may/2019",
  //       "Start": 21,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-12-01,2019-05-01,P5M)", "type": "daterange", "start": "2018-12-01", "end": "2019-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened the day before",
  //   "Context": {"ReferenceDateTime": "2018-11-08T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the day before",
  //       "Start": 14,
  //       "End": 27,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-07", "type": "date", "value": "2018-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's your plan for the day after?",
  //   "Context": {"ReferenceDateTime": "2018-11-08T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the day after",
  //       "Start": 21,
  //       "End": 33,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-09", "type": "date", "value": "2018-11-09"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I waited for news, day after day, expecting to hear something.",
  //   "Context": {"ReferenceDateTime": "2018-11-08T12:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "I don't remember the date, it should be next Monday or next Tuesday.",
  //   "Context": {"ReferenceDateTime": "2018-11-15T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next monday",
  //       "Start": 40,
  //       "End": 50,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-19", "type": "date", "value": "2018-11-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "next tuesday",
  //       "Start": 55,
  //       "End": 66,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-20", "type": "date", "value": "2018-11-20"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I don't remember the date, it should be next Monday or previous Monday",
  //   "Context": {"ReferenceDateTime": "2018-11-15T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next monday",
  //       "Start": 40,
  //       "End": 50,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-19", "type": "date", "value": "2018-11-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "previous monday",
  //       "Start": 55,
  //       "End": 69,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-05", "type": "date", "value": "2018-11-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I don't remember the date, it should be next Monday or Tuesday or previous Wednesday.",
  //   "Context": {"ReferenceDateTime": "2018-11-15T12:00:00"},
  //   "NotSupportedByDesign": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next monday",
  //       "Start": 40,
  //       "End": 50,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-19", "type": "date", "value": "2018-11-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tuesday",
  //       "Start": 55,
  //       "End": 61,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2018-11-13"},
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2018-11-20"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "previous wednesday",
  //       "Start": 66,
  //       "End": 83,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-07", "type": "date", "value": "2018-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What's your plan for next week Wednesday?",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next week wednesday",
  //       "Start": 21,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-12-05", "type": "date", "value": "2018-12-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened on previous week - Monday",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "previous week - monday",
  //       "Start": 17,
  //       "End": 38,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-19", "type": "date", "value": "2018-11-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened on this week Monday",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this week monday",
  //       "Start": 17,
  //       "End": 32,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-26", "type": "date", "value": "2018-11-26"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please find us 30 minutes on 11/20, 11/22 or 11/25",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "30 minutes",
  //       "Start": 24,
  //       "End": 33,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT30M", "type": "duration", "value": "1800"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "11/20",
  //       "Start": 38,
  //       "End": 42,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11-20", "type": "date", "value": "2018-11-20"},
  //           {"timex": "XXXX-11-20", "type": "date", "value": "2019-11-20"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "11/22",
  //       "Start": 45,
  //       "End": 49,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11-22", "type": "date", "value": "2018-11-22"},
  //           {"timex": "XXXX-11-22", "type": "date", "value": "2019-11-22"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "11/25",
  //       "Start": 54,
  //       "End": 58,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11-25", "type": "date", "value": "2018-11-25"},
  //           {"timex": "XXXX-11-25", "type": "date", "value": "2019-11-25"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "You shouldn't always go to bed end of the day since it will do harm to your health.",
  //   "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of the day",
  //       "Start": 31,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-21T23:59:59", "type": "datetime", "value": "2018-11-21 23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "You shouldn't always go to bed end of day since it will do harm to your health.",
  //   "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of day",
  //       "Start": 31,
  //       "End": 40,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-21T23:59:59", "type": "datetime", "value": "2018-11-21 23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Bob and Alice usually exchange their encrypted messages at the eod",
  //   "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the eod",
  //       "Start": 59,
  //       "End": 65,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11-21T23:59:59", "type": "datetime", "value": "2018-11-21 23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "A big party will be held at the EOY.",
  //   "Context": {"ReferenceDateTime": "2018-11-23T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "eoy",
  //       "Start": 32,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "Mod": "end", "type": "daterange", "start": "2018-07-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you know the date? 11/20, 12 of Nov?",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "11/20",
  //       "Start": 22,
  //       "End": 26,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11-20", "type": "date", "value": "2018-11-20"},
  //           {"timex": "XXXX-11-20", "type": "date", "value": "2019-11-20"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "12 of nov",
  //       "Start": 29,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11-12", "type": "date", "value": "2018-11-12"},
  //           {"timex": "XXXX-11-12", "type": "date", "value": "2019-11-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "A big party will be held at the end of year.",
  //   "Context": {"ReferenceDateTime": "2018-11-23T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of year",
  //       "Start": 32,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "Mod": "end", "type": "daterange", "start": "2018-07-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I heard you will hold a birthday party end of month",
  //   "Context": {"ReferenceDateTime": "2018-11-27T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of month",
  //       "Start": 39,
  //       "End": 50,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-11", "Mod": "end", "type": "daterange", "start": "2018-11-16", "end": "2018-12-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Don't forget to push your code as all the disks will be renewed the end of the week.",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of the week",
  //       "Start": 68,
  //       "End": 82,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W48", "Mod": "end", "type": "daterange", "start": "2018-11-29", "end": "2018-12-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Can you please find time for a conference call on Wednesday, Thursday or Friday, between 9-6 PT?",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "Comment": "between 9-6 PT can't be extracted as TimeZone is not enabled for now",
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "wednesday",
  //       "Start": 50,
  //       "End": 58,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-3", "type": "date", "value": "2018-11-28"},
  //           {"timex": "XXXX-WXX-3", "type": "date", "value": "2018-12-05"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "thursday",
  //       "Start": 61,
  //       "End": 68,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2018-11-22"},
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2018-11-29"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "friday",
  //       "Start": 73,
  //       "End": 78,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2018-11-23"},
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2018-11-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about between 6:30 to 9 pst",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "Comment": "Not supported as the TimeZone is not enabled for now",
  //   "NotSupported": "javascript, dotnet, java, python",
  //   "Results": [
  //     {
  //       "Text": "between 6:30 to 9 pst",
  //       "Start": 10,
  //       "End": 30,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(T06:30,T09,PT2H30M)",
  //             "type": "timerange",
  //             "timezone": "UTC-08:00",
  //             "timezoneText": "pst",
  //             "utcOffsetMins": "-480",
  //             "start": "06:30:00",
  //             "end": "09:00:00"
  //           },
  //           {
  //             "timex": "(T18:30,T21,PT2H30M)",
  //             "type": "timerange",
  //             "timezone": "UTC-08:00",
  //             "timezoneText": "pst",
  //             "utcOffsetMins": "-480",
  //             "start": "18:30:00",
  //             "end": "21:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about between 9 to 10:30 cst",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "Comment": "Cst can't be recognized as TimeZone is not enabled for now",
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "between 9 to 10:30",
  //       "Start": 10,
  //       "End": 27,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T09,T10:30,PT1H30M)", "type": "timerange", "start": "09:00:00", "end": "10:30:00"},
  //           {"timex": "(T21,T22:30,PT1H30M)", "type": "timerange", "start": "21:00:00", "end": "22:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about first week of 2015",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "first week of 2015",
  //       "Start": 10,
  //       "End": 27,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015-W01", "type": "daterange", "start": "2014-12-29", "end": "2015-01-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about first week of Jan 2015",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "first week of jan 2015",
  //       "Start": 10,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015-01-W01", "type": "daterange", "start": "2014-12-29", "end": "2015-01-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about last week of 2016",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "last week of 2016",
  //       "Start": 10,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-W52", "type": "daterange", "start": "2016-12-26", "end": "2017-01-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about last week of Dec 2016",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "last week of dec 2016",
  //       "Start": 10,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-12-W05", "type": "daterange", "start": "2016-12-26", "end": "2017-01-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about first week of 2019",
  //   "Context": {"ReferenceDateTime": "2019-03-02T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "first week of 2019",
  //       "Start": 10,
  //       "End": 27,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W01", "type": "daterange", "start": "2018-12-31", "end": "2019-01-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about last week of 2019",
  //   "Context": {"ReferenceDateTime": "2019-03-02T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "last week of 2019",
  //       "Start": 10,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W52", "type": "daterange", "start": "2019-12-23", "end": "2019-12-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about 3rd week of 2018",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "3rd week of 2018",
  //       "Start": 10,
  //       "End": 25,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W03", "type": "daterange", "start": "2018-01-15", "end": "2018-01-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about 3rd week of Jan",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "3rd week of jan",
  //       "Start": 10,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-01-W03", "type": "daterange", "start": "2018-01-15", "end": "2018-01-22"},
  //           {"timex": "XXXX-01-W03", "type": "daterange", "start": "2019-01-14", "end": "2019-01-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "He took a test earlier previous week",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "earlier previous week",
  //       "Start": 15,
  //       "End": 35,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W47", "Mod": "start", "type": "daterange", "start": "2018-11-19", "end": "2018-11-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will finish the work later this week",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "later this week",
  //       "Start": 23,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W48", "type": "daterange", "start": "2018-11-30", "end": "2018-12-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "create appointment at 3 p . m .",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3 p . m .",
  //       "Start": 22,
  //       "End": 30,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T15", "type": "time", "value": "15:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I suppose one hour and half is sufficient to finish the task.",
  //   "Context": {"ReferenceDateTime": "2018-12-05T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one hour and half",
  //       "Start": 10,
  //       "End": 26,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1.5H", "type": "duration", "value": "5400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I suppose one hour and a half is sufficient to finish the task.",
  //   "Context": {"ReferenceDateTime": "2018-12-05T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one hour and a half",
  //       "Start": 10,
  //       "End": 28,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1.5H", "type": "duration", "value": "5400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I suppose one and a half hour is sufficient to finish the task.",
  //   "Context": {"ReferenceDateTime": "2018-12-05T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one and a half hour",
  //       "Start": 10,
  //       "End": 28,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1.5H", "type": "duration", "value": "5400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I suppose one and half hour is sufficient to finish the task.",
  //   "Context": {"ReferenceDateTime": "2018-12-05T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one and half hour",
  //       "Start": 10,
  //       "End": 26,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1.5H", "type": "duration", "value": "5400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I suppose one and a half hours are sufficient to finish the task.",
  //   "Context": {"ReferenceDateTime": "2018-12-05T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one and a half hours",
  //       "Start": 10,
  //       "End": 29,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1.5H", "type": "duration", "value": "5400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "He will take a one and a quarter year gap to work as an intern at an Internet company.",
  //   "Context": {"ReferenceDateTime": "2018-12-05T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one and a quarter year",
  //       "Start": 15,
  //       "End": 36,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1.25Y", "type": "duration", "value": "39420000"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "He will take a one year and a quarter gap to work as an intern at an Internet company.",
  //   "Context": {"ReferenceDateTime": "2018-12-05T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one year and a quarter",
  //       "Start": 15,
  //       "End": 36,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1.25Y", "type": "duration", "value": "39420000"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I have twenty-one coins in my pocket",
  //   "Context": {"ReferenceDateTime": "2018-12-07T12:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "There are two to four people in the room",
  //   "Context": {"ReferenceDateTime": "2018-12-07T12:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "One may ask a question to themselves",
  //   "Context": {"ReferenceDateTime": "2018-12-07T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Comment": "Not extracted may as a datetime range is not supported for now",
  //   "Results": []
  // },
  // {
  //   "Input": "Twenty-six people die in accident at Techiman",
  //   "Context": {"ReferenceDateTime": "2018-12-13T12:00:00"},
  //   "NotSupportedByDesign": "java",
  //   "Results": []
  // },
  // {
  //   "Input": "That one Tuesday was a blast!",
  //   "Context": {"ReferenceDateTime": "2019-01-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "tuesday",
  //       "Start": 9,
  //       "End": 15,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2019-01-22"},
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2019-01-29"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any arrangement on Monday 21!",
  //   "Context": {"ReferenceDateTime": "2019-01-25T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "monday 21",
  //       "Start": 31,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2019-01-21"},
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2019-10-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any arrangement on Monday 21!",
  //   "Context": {"ReferenceDateTime": "2019-01-21T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "monday 21",
  //       "Start": 31,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-21", "type": "date", "value": "2019-01-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any arrangement on Sunday 31!",
  //   "Context": {"ReferenceDateTime": "2019-01-25T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "sunday 31",
  //       "Start": 31,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-7", "type": "date", "value": "2017-12-31"},
  //           {"timex": "XXXX-WXX-7", "type": "date", "value": "2019-03-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any arrangement on Friday 31!",
  //   "Context": {"ReferenceDateTime": "2019-02-25T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "friday 31",
  //       "Start": 31,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2018-08-31"},
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2019-05-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any plan after mid May?",
  //   "Context": {"ReferenceDateTime": "2019-02-25T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "after mid may",
  //       "Start": 21,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-05",
  //             "Mod": "after-mid",
  //             "type": "daterange",
  //             "start": "2018-05-21",
  //             "sourceEntity": "datetimerange"
  //           },
  //           {
  //             "timex": "XXXX-05",
  //             "Mod": "after-mid",
  //             "type": "daterange",
  //             "start": "2019-05-21",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened before early September",
  //   "Context": {"ReferenceDateTime": "2019-02-25T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "before early september",
  //       "Start": 14,
  //       "End": 35,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-09",
  //             "Mod": "before-start",
  //             "type": "daterange",
  //             "end": "2018-09-01",
  //             "sourceEntity": "datetimerange"
  //           },
  //           {
  //             "timex": "XXXX-09",
  //             "Mod": "before-start",
  //             "type": "daterange",
  //             "end": "2019-09-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened since late July?",
  //   "Context": {"ReferenceDateTime": "2019-02-25T12:00:00"},
  //   "NotSupportedByDesign": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "since late july",
  //       "Start": 14,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-07",
  //             "Mod": "since-end",
  //             "type": "daterange",
  //             "start": "2018-07-16",
  //             "sourceEntity": "datetimerange"
  //           },
  //           {
  //             "timex": "XXXX-07",
  //             "Mod": "since-end",
  //             "type": "daterange",
  //             "start": "2019-07-16",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "Unless indicated, these views are the author's and may differ from those of X or others in the firm. We do not represent this is accurate or complete and we may not update this. Past performance is not indicative of future returns. You should not use e-mail to request or authorize any transaction. CONFIDENTIALITY NOTICE: All information in and with this message may be legally privileged, and is provided only for the use of the individuals(s) named above. This information may not be disseminated and we do not waive confidentiality by mis-transmission.",
  //   "Context": {"ReferenceDateTime": "2019-01-24T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Do you have any arrangement on this upcoming Friday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "this upcoming friday",
  //       "Start": 31,
  //       "End": 50,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-01", "type": "date", "value": "2019-02-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any arrangement on next Friday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "next friday",
  //       "Start": 31,
  //       "End": 41,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-08", "type": "date", "value": "2019-02-08"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any arrangement on following Friday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "following friday",
  //       "Start": 31,
  //       "End": 46,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-08", "type": "date", "value": "2019-02-08"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Do you have any arrangement on coming Thursday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "coming thursday",
  //       "Start": 31,
  //       "End": 45,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-07", "type": "date", "value": "2019-02-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you on this past Wednesday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "this past wednesday",
  //       "Start": 18,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-30", "type": "date", "value": "2019-01-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you on past Wednesday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "past wednesday",
  //       "Start": 18,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-30", "type": "date", "value": "2019-01-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you on previous Wednesday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "previous wednesday",
  //       "Start": 18,
  //       "End": 35,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-23", "type": "date", "value": "2019-01-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you on last Wednesday?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "last wednesday",
  //       "Start": 18,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-23", "type": "date", "value": "2019-01-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you the 12th between 0730-0930",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "between 0730-0930",
  //       "Start": 24,
  //       "End": 40,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T07:30,T09:30,PT2H)", "type": "timerange", "start": "07:30:00", "end": "09:30:00"},
  //           {"timex": "(T19:30,T21:30,PT2H)", "type": "timerange", "start": "19:30:00", "end": "21:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you between 0730-0930?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "between 0730-0930",
  //       "Start": 15,
  //       "End": 31,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T07:30,T09:30,PT2H)", "type": "timerange", "start": "07:30:00", "end": "09:30:00"},
  //           {"timex": "(T19:30,T21:30,PT2H)", "type": "timerange", "start": "19:30:00", "end": "21:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you between 0930-0730?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "between 0930-0730",
  //       "Start": 15,
  //       "End": 31,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T09:30,T19:30,PT10H)", "type": "timerange", "start": "09:30:00", "end": "19:30:00"},
  //           {"timex": "(T21:30,T07:30,PT10H)", "type": "timerange", "start": "21:30:00", "end": "07:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Where were you between 730-930?",
  //   "Context": {"ReferenceDateTime": "2019-01-31T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Book a meeting for Monday 21 between 9:30 and 3:00 pm PST.",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "monday 21 between 9:30 and 3:00 pm",
  //       "Start": 19,
  //       "End": 52,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-1T09:30,XXXX-WXX-1T15:00,PT5H30M)",
  //             "type": "datetimerange",
  //             "start": "2019-01-21 09:30:00",
  //             "end": "2019-01-21 15:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-1T09:30,XXXX-WXX-1T15:00,PT5H30M)",
  //             "type": "datetimerange",
  //             "start": "2019-10-21 09:30:00",
  //             "end": "2019-10-21 15:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Will you be free Tuesday, Jan 15, 1:00 PM - 1:15 PM?",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "tuesday, jan 15, 1:00 pm - 1:15 pm",
  //       "Start": 17,
  //       "End": 50,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-01-15T13:00,XXXX-01-15T13:15,PT15M)",
  //             "type": "datetimerange",
  //             "start": "2019-01-15 13:00:00",
  //             "end": "2019-01-15 13:15:00"
  //           },
  //           {
  //             "timex": "(XXXX-01-15T13:00,XXXX-01-15T13:15,PT15M)",
  //             "type": "datetimerange",
  //             "start": "2020-01-15 13:00:00",
  //             "end": "2020-01-15 13:15:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "Your renewal will be January 18, 2019.  You have until then to add the paid support. @Cortana, Please schedule a Skype call at 3pm today.",
  //   "Context": {"ReferenceDateTime": "2019-02-28T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "january 18, 2019",
  //       "Start": 21,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-01-18", "type": "date", "value": "2019-01-18"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "3pm today",
  //       "Start": 127,
  //       "End": 135,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-28T15", "type": "datetime", "value": "2019-02-28 15:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "book my time for swimming every Tuesday and Thursday 19:00 - 21:00.",
  //   "Context": {"ReferenceDateTime": "2019-03-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "every tuesday",
  //       "Start": 26,
  //       "End": 38,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "thursday 19:00 - 21:00",
  //       "Start": 44,
  //       "End": 65,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-4T19:00,XXXX-WXX-4T21:00,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2019-02-28 19:00:00",
  //             "end": "2019-02-28 21:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-4T19:00,XXXX-WXX-4T21:00,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2019-03-07 19:00:00",
  //             "end": "2019-03-07 21:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Is this a valid date? 12-2015",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "12-2015",
  //       "Start": 22,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015-12", "type": "daterange", "start": "2015-12-01", "end": "2016-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Is this a valid date? 32-2015",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Is this a valid date? 32 - 2015",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Is this a valid date? 2015-12",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "2015-12",
  //       "Start": 22,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015-12", "type": "daterange", "start": "2015-12-01", "end": "2016-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Is this a valid date? 2015-32",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Is this a valid date? 2015 - 32",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Tel: +86 138-2010-2015",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Tel: +86 2010-2015-86",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "Tel: 000 111 82-2100",
  //   "Context": {"ReferenceDateTime": "2019-02-27T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": []
  // },
  // {
  //   "Input": "I'll be back at 9:00a.",
  //   "Context": {"ReferenceDateTime": "2019-03-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "9:00a",
  //       "Start": 16,
  //       "End": 20,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T09:00", "type": "time", "value": "09:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back tomorrow at 8:45a.",
  //   "Context": {"ReferenceDateTime": "2019-03-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tomorrow at 8:45a",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-03-29T08:45", "type": "datetime", "value": "2019-03-29 08:45:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The event happened in two years since 2011.",
  //   "Context": {"ReferenceDateTime": "2019-03-10T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "in two years since 2011",
  //       "Start": 19,
  //       "End": 41,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2013-01-01", "type": "date", "value": "2013-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The event happened in two weeks since the year 2011.",
  //   "Context": {"ReferenceDateTime": "2019-03-10T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "in two weeks since the year 2011",
  //       "Start": 19,
  //       "End": 50,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2011-01-15", "type": "date", "value": "2011-01-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll stay in China before the year 2019.",
  //   "Context": {"ReferenceDateTime": "2019-03-10T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "before the year 2019",
  //       "Start": 19,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "end": "2019-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be there on wednesday 4 oclock.",
  //   "Context": {"ReferenceDateTime": "2019-04-15T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "wednesday 4 oclock",
  //       "Start": 17,
  //       "End": 34,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-3T04", "type": "datetime", "value": "2019-04-10 04:00:00"},
  //           {"timex": "XXXX-WXX-3T04", "type": "datetime", "value": "2019-04-17 04:00:00"},
  //           {"timex": "XXXX-WXX-3T16", "type": "datetime", "value": "2019-04-10 16:00:00"},
  //           {"timex": "XXXX-WXX-3T16", "type": "datetime", "value": "2019-04-17 16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Meet me at 3 pm or later.",
  //   "Context": {"ReferenceDateTime": "2019-04-22T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "3 pm or later",
  //       "Start": 11,
  //       "End": 23,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T15", "Mod": "since", "type": "timerange", "start": "15:00:00", "sourceEntity": "datetimepoint"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Meet me at 3 pm or later on Monday.",
  //   "Context": {"ReferenceDateTime": "2019-04-22T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "3 pm or later on monday",
  //       "Start": 11,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-WXX-1T15",
  //             "Mod": "since",
  //             "type": "datetimerange",
  //             "start": "2019-04-15 15:00:00",
  //             "sourceEntity": "datetimepoint"
  //           },
  //           {
  //             "timex": "XXXX-WXX-1T15",
  //             "Mod": "since",
  //             "type": "datetimerange",
  //             "start": "2019-04-22 15:00:00",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back at 9.am.",
  //   "Context": {"ReferenceDateTime": "2019-04-19T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "9.am",
  //       "Start": 16,
  //       "End": 19,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T09", "type": "time", "value": "09:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on march eighteenth nine thirty.",
  //   "Context": {"ReferenceDateTime": "2019-04-25T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "march eighteenth nine thirty",
  //       "Start": 14,
  //       "End": 41,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-03-18T09:30", "type": "datetime", "value": "2019-03-18 09:30:00"},
  //           {"timex": "XXXX-03-18T09:30", "type": "datetime", "value": "2020-03-18 09:30:00"},
  //           {"timex": "XXXX-03-18T21:30", "type": "datetime", "value": "2019-03-18 21:30:00"},
  //           {"timex": "XXXX-03-18T21:30", "type": "datetime", "value": "2020-03-18 21:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on february twenty second.",
  //   "Context": {"ReferenceDateTime": "2019-04-25T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "february twenty second",
  //       "Start": 14,
  //       "End": 35,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-22", "type": "date", "value": "2019-02-22"},
  //           {"timex": "XXXX-02-22", "type": "date", "value": "2020-02-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on february twenty second 3:30.",
  //   "Context": {"ReferenceDateTime": "2019-04-25T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "february twenty second 3:30",
  //       "Start": 14,
  //       "End": 40,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-22T03:30", "type": "datetime", "value": "2019-02-22 03:30:00"},
  //           {"timex": "XXXX-02-22T03:30", "type": "datetime", "value": "2020-02-22 03:30:00"},
  //           {"timex": "XXXX-02-22T15:30", "type": "datetime", "value": "2019-02-22 15:30:00"},
  //           {"timex": "XXXX-02-22T15:30", "type": "datetime", "value": "2020-02-22 15:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please can you arrange a Microsoft Teams Meeting starting January 7th to discuss ARM Templates?",
  //   "Context": {"ReferenceDateTime": "2019-04-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "starting january 7th",
  //       "Start": 49,
  //       "End": 68,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2019-01-07"
  //           },
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2020-01-07"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please can you arrange a Microsoft Teams Meeting starting on January 7th to discuss ARM Templates?",
  //   "Context": {"ReferenceDateTime": "2019-04-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "starting on january 7th",
  //       "Start": 49,
  //       "End": 71,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2019-01-07"
  //           },
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2020-01-07"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on february twenty second at 3:30",
  //   "Context": {"ReferenceDateTime": "2019-04-25T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "february twenty second at 3:30",
  //       "Start": 14,
  //       "End": 43,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-22T03:30", "type": "datetime", "value": "2019-02-22 03:30:00"},
  //           {"timex": "XXXX-02-22T03:30", "type": "datetime", "value": "2020-02-22 03:30:00"},
  //           {"timex": "XXXX-02-22T15:30", "type": "datetime", "value": "2019-02-22 15:30:00"},
  //           {"timex": "XXXX-02-22T15:30", "type": "datetime", "value": "2020-02-22 15:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on february 22nd 3:30.",
  //   "Context": {"ReferenceDateTime": "2019-04-25T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "february 22nd 3:30",
  //       "Start": 14,
  //       "End": 31,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-22T03:30", "type": "datetime", "value": "2019-02-22 03:30:00"},
  //           {"timex": "XXXX-02-22T03:30", "type": "datetime", "value": "2020-02-22 03:30:00"},
  //           {"timex": "XXXX-02-22T15:30", "type": "datetime", "value": "2019-02-22 15:30:00"},
  //           {"timex": "XXXX-02-22T15:30", "type": "datetime", "value": "2020-02-22 15:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please can you arrange a Microsoft Teams Meeting beginning January 7th to discuss ARM Templates?",
  //   "Context": {"ReferenceDateTime": "2019-04-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "beginning january 7th",
  //       "Start": 49,
  //       "End": 69,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2019-01-07"
  //           },
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2020-01-07"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please can you arrange a Microsoft Teams Meeting beginning on January 7th to discuss ARM Templates?",
  //   "Context": {"ReferenceDateTime": "2019-04-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "beginning on january 7th",
  //       "Start": 49,
  //       "End": 72,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2019-01-07"
  //           },
  //           {
  //             "timex": "XXXX-01-07",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2020-01-07"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on friday march fifteenth nine a m.",
  //   "Context": {"ReferenceDateTime": "2019-04-25T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "friday march fifteenth nine a m",
  //       "Start": 14,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-03-15T09", "type": "datetime", "value": "2019-03-15 09:00:00"},
  //           {"timex": "XXXX-03-15T09", "type": "datetime", "value": "2020-03-15 09:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on january first two thousand and thirty two",
  //   "Context": {"ReferenceDateTime": "2019-04-25T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "january first two thousand and thirty two",
  //       "Start": 14,
  //       "End": 54,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2032-01-01", "type": "date", "value": "2032-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Wed Oct 26 15:50:06 2016 is not a day in 2019.",
  //   "Context": {"ReferenceDateTime": "2018-11-21T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "wed oct 26 15:50:06 2016",
  //       "Start": 0,
  //       "End": 23,
  //       "Typename": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-10-26T15:50:06", "type": "datetime", "value": "2016-10-26 15:50:06"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "a day",
  //       "Start": 32,
  //       "End": 36,
  //       "Typename": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "duration", "value": "86400"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2019",
  //       "Start": 41,
  //       "End": 44,
  //       "Typename": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019", "type": "daterange", "start": "2019-01-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will do my work between now and November 15th",
  //   "Context": {"ReferenceDateTime": "2019-04-23T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "between now and november 15th",
  //       "Start": 18,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-04-23,XXXX-11-15,P206D)", "type": "daterange", "start": "2019-04-23", "end": "2019-11-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I have finished my work between Jan 22 and now",
  //   "Context": {"ReferenceDateTime": "2019-04-25T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "between jan 22 and now",
  //       "Start": 24,
  //       "End": 45,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-01-22,2019-04-25,P93D)", "type": "daterange", "start": "2019-01-22", "end": "2019-04-25"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet between now and May 21th, not right now, ok?",
  //   "Context": {"ReferenceDateTime": "2019-05-09T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "between now and may 21th",
  //       "Start": 11,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-05-09,XXXX-05-21,P12D)", "type": "daterange", "start": "2019-05-09", "end": "2019-05-21"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "right now",
  //       "Start": 41,
  //       "End": 49,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2019-05-09 12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Total sales from april to June in 2017 were below expectations.",
  //   "Context": {"ReferenceDateTime": "2019-05-16T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from april to june in 2017",
  //       "Start": 12,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-04-01,2017-06-01,P2M)", "type": "daterange", "start": "2017-04-01", "end": "2017-06-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Total sales from april in 2016 to June in 2017 were below expectations.",
  //   "Context": {"ReferenceDateTime": "2019-05-16T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from april in 2016 to june in 2017",
  //       "Start": 12,
  //       "End": 45,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-04-01,2017-06-01,P14M)", "type": "daterange", "start": "2016-04-01", "end": "2017-06-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "the conflict lasted from January to april 2015",
  //   "Context": {"ReferenceDateTime": "2019-05-22T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "from january to april 2015",
  //       "Start": 20,
  //       "End": 45,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2015-01-01,2015-04-01,P3M)", "type": "daterange", "start": "2015-01-01", "end": "2015-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana, please set up a Skype call sometime on this Friday 7.6 with Jim.",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "this friday 7.6",
  //       "Start": 48,
  //       "End": 62,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-07-06", "type": "date", "value": "2019-07-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be done on 5.12",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "5.12",
  //       "Start": 28,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2019-05-12"},
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2020-05-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be done friday 5/12",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday 5/12",
  //       "Start": 25,
  //       "End": 35,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2019-05-12"},
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2020-05-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be done this friday 5/12",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "this friday 5/12",
  //       "Start": 25,
  //       "End": 40,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2019-05-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be done next friday 5/12",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "next friday 5/12",
  //       "Start": 25,
  //       "End": 40,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2019-05-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be done this 5/12",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "this 5/12",
  //       "Start": 25,
  //       "End": 33,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2019-05-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be done next 5/12",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "next 5/12",
  //       "Start": 25,
  //       "End": 33,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-12", "type": "date", "value": "2020-05-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be done next 6th of April",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "next 6th of april",
  //       "Start": 25,
  //       "End": 41,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-04-06", "type": "date", "value": "2020-04-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "from this 5/12 to next 5/19",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "from this 5/12 to next 5/19",
  //       "Start": 0,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-05-12,XXXX-05-19,P373D)", "type": "daterange", "start": "2019-05-12", "end": "2020-05-19"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "from this friday 5/12 to next sunday 5/20",
  //   "Context": {"ReferenceDateTime": "2019-05-20T12:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "from this friday 5/12 to next sunday 5/20",
  //       "Start": 0,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-05-12,XXXX-05-20,P8D)", "type": "daterange", "start": "2019-05-12", "end": "2019-05-20"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'm not talking about this, but about Jan/3",
  //   "Context": {"ReferenceDateTime": "2019-05-22T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "jan/3",
  //       "Start": 38,
  //       "End": 42,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-01-03", "type": "date", "value": "2019-01-03"},
  //           {"timex": "XXXX-01-03", "type": "date", "value": "2020-01-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "There are 10 students.",
  //   "Context": {"ReferenceDateTime": "2019-05-23T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "There are 10 stars.",
  //   "Context": {"ReferenceDateTime": "2019-05-23T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Who are us presidents in 90 s.",
  //   "Context": {"ReferenceDateTime": "2019-05-23T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "90 s",
  //       "Start": 25,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XX90-01-01,XX00-01-01,P10Y)", "type": "daterange", "start": "1990-01-01", "end": "2000-01-01"},
  //           {"timex": "(XX90-01-01,XX00-01-01,P10Y)", "type": "daterange", "start": "2090-01-01", "end": "2100-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll stay in China after the year 2020.",
  //   "Context": {"ReferenceDateTime": "2019-05-23T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "after the year 2020",
  //       "Start": 19,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2020",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "start": "2021-01-01",
  //             "sourceEntity": "datetimerange"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana find 30 minutes later this week",
  //   "Context": {"ReferenceDateTime": "2019-05-27T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "30 minutes",
  //       "Start": 13,
  //       "End": 22,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT30M", "type": "duration", "value": "1800"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "later this week",
  //       "Start": 24,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W22", "type": "daterange", "start": "2019-05-30", "end": "2019-06-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's take a walk 30 minutes later",
  //   "Context": {"ReferenceDateTime": "2019-05-27T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "30 minutes later",
  //       "Start": 18,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-05-27T12:30:00", "type": "datetime", "value": "2019-05-27 12:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will travel in Japan on 26 june to 28 june in 2020.",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "26 june to 28 june in 2020",
  //       "Start": 26,
  //       "End": 51,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-06-26,2020-06-28,P2D)", "type": "daterange", "start": "2020-06-26", "end": "2020-06-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will travel in Japan on 26 june in 2019 to 28 june in 2020.",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "26 june in 2019 to 28 june in 2020",
  //       "Start": 26,
  //       "End": 59,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-06-26,2020-06-28,P368D)", "type": "daterange", "start": "2019-06-26", "end": "2020-06-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will go back to China on 28 june in 2020.",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "28 june in 2020",
  //       "Start": 27,
  //       "End": 41,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-06-28", "type": "date", "value": "2020-06-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on black friday 2010",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "python",
  //   "Results": [
  //     {
  //       "Text": "black friday 2010",
  //       "Start": 16,
  //       "End": 32,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2010-11-26", "type": "date", "value": "2010-11-26"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on earth day 2010",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "earth day 2010",
  //       "Start": 16,
  //       "End": 29,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2010-04-22", "type": "date", "value": "2010-04-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on easter 2018",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "easter 2018",
  //       "Start": 16,
  //       "End": 26,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-04-01", "type": "date", "value": "2018-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on monday the twenty seventh at six pm",
  //   "Context": {"ReferenceDateTime": "2019-05-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "monday the twenty seventh at six pm",
  //       "Start": 16,
  //       "End": 50,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-05-27T18", "type": "datetime", "value": "2019-05-27 18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on monday the twenty fourth six pm",
  //   "Context": {"ReferenceDateTime": "2019-06-13T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "monday the twenty fourth six pm",
  //       "Start": 16,
  //       "End": 46,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-06-24T18", "type": "datetime", "value": "2019-06-24 18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sales went up during 2017-q1",
  //   "Context": {"ReferenceDateTime": "2019-06-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2017-q1",
  //       "Start": 25,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-01-01,2017-04-01,P3M)", "type": "daterange", "start": "2017-01-01", "end": "2017-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sales went up during 2017 q1",
  //   "Context": {"ReferenceDateTime": "2019-06-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2017 q1",
  //       "Start": 25,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-01-01,2017-04-01,P3M)", "type": "daterange", "start": "2017-01-01", "end": "2017-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "2019 H2 will bring challenges",
  //   "Context": {"ReferenceDateTime": "2019-06-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019 h2",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-07-01,2020-01-01,P6M)", "type": "daterange", "start": "2019-07-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "2019-H2 will bring challenges",
  //   "Context": {"ReferenceDateTime": "2019-06-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019-h2",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-07-01,2020-01-01,P6M)", "type": "daterange", "start": "2019-07-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sales went up during from 2017-q1 to 2018-q1",
  //   "Context": {"ReferenceDateTime": "2019-06-11T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2017-q1 to 2018-q1",
  //       "Start": 25,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-01-01,2018-01-01,P12M)", "type": "daterange", "start": "2017-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sales went up during from 2017 q1 to 2018 q1",
  //   "Context": {"ReferenceDateTime": "2019-06-11T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2017 q1 to 2018 q1",
  //       "Start": 25,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-01-01,2018-01-01,P12M)", "type": "daterange", "start": "2017-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sales went up during from q1 of 2017 - q3 of 2018",
  //   "Context": {"ReferenceDateTime": "2019-06-11T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from q1 of 2017 - q3 of 2018",
  //       "Start": 25,
  //       "End": 52,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-01-01,2018-07-01,P18M)", "type": "daterange", "start": "2017-01-01", "end": "2018-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "January first 2000 was a special day for me",
  //   "Context": {"ReferenceDateTime": "2019-06-03T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "january first 2000",
  //       "Start": 0,
  //       "End": 17,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2000-01-01", "type": "date", "value": "2000-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "January first 12 was a special day for me",
  //   "Context": {"ReferenceDateTime": "2019-06-03T12:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "january first 12",
  //       "Start": 0,
  //       "End": 15,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2012-01-01", "type": "date", "value": "2012-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This contract will end in 2150, right?",
  //   "Context": {"ReferenceDateTime": "2019-06-03T12:00:00"},
  //   "Comment": "Not supported as currently a cutoff on year by itself is needed for legacy reasons.",
  //   "NotSupported": "dotnet, javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "2150",
  //       "Start": 26,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2150", "type": "daterange", "start": "2150-01-01", "end": "2151-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Brunch with Anna at 13:00 February 28, 2013",
  //   "Context": {"ReferenceDateTime": "2013-06-03T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "13:00 february 28, 2013",
  //       "Start": 20,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2013-02-28T13:00", "type": "datetime", "value": "2013-02-28 13:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I have a lot of gains in this school year.",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "this school year",
  //       "Start": 25,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "SY2019", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I got a lot of gains in last fiscal year.",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "last fiscal year",
  //       "Start": 24,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "FY2018", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I have a lot of gains in this calendar year.",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "this calendar year",
  //       "Start": 25,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019", "type": "daterange", "start": "2019-01-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the fiscal year 2008",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "fiscal year 2008",
  //       "Start": 18,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "FY2008", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the school year 2008",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "school year 2008",
  //       "Start": 18,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "SY2008", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the calendar year 2008",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "calendar year 2008",
  //       "Start": 18,
  //       "End": 35,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2008", "type": "daterange", "start": "2008-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the cy 2008",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "cy 2008",
  //       "Start": 18,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2008", "type": "daterange", "start": "2008-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the sy 2008",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "sy 2008",
  //       "Start": 18,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "SY2008", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in fiscal year",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "fiscal year",
  //       "Start": 14,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "FYXXXX", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the sy18",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "sy18",
  //       "Start": 18,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "SY2018", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the cy18",
  //   "Context": {"ReferenceDateTime": "2019-06-18T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "cy18",
  //       "Start": 18,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-01-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on saint patrick 2020",
  //   "Context": {"ReferenceDateTime": "2019-06-28T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "saint patrick 2020",
  //       "Start": 16,
  //       "End": 33,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-03-17", "type": "date", "value": "2020-03-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back at five-thirty tomorrow evening",
  //   "Context": {"ReferenceDateTime": "2019-06-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "five-thirty tomorrow evening",
  //       "Start": 16,
  //       "End": 43,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-06-29T17:30", "type": "datetime", "value": "2019-06-29 17:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's play basketball from three thirty to four thirty",
  //   "Context": {"ReferenceDateTime": "2019-06-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from three thirty to four thirty",
  //       "Start": 22,
  //       "End": 53,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T03:30,T04:30,PT1H)", "type": "timerange", "start": "03:30:00", "end": "04:30:00"},
  //           {"timex": "(T15:30,T16:30,PT1H)", "type": "timerange", "start": "15:30:00", "end": "16:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's play basketball from two thirty to two forty five",
  //   "Context": {"ReferenceDateTime": "2019-06-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from two thirty to two forty five",
  //       "Start": 22,
  //       "End": 54,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T02:30,T02:45,PT15M)", "type": "timerange", "start": "02:30:00", "end": "02:45:00"},
  //           {"timex": "(T14:30,T14:45,PT15M)", "type": "timerange", "start": "14:30:00", "end": "14:45:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "=2019",
  //   "Context": {"ReferenceDateTime": "2019-06-28T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "=2019",
  //       "Start": 0,
  //       "End": 4,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019", "type": "daterange", "start": "2019-01-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "> = 2019",
  //   "Context": {"ReferenceDateTime": "2019-06-28T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "> = 2019",
  //       "Start": 0,
  //       "End": 7,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "2019-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "< =2019",
  //   "Context": {"ReferenceDateTime": "2019-06-28T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "< =2019",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019", "Mod": "until", "type": "daterange", "sourceEntity": "datetimerange", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Sales for this quarter",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this quarter",
  //       "Start": 10,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-07-01,2019-10-01,P3M)", "type": "daterange", "start": "2019-07-01", "end": "2019-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Sales for current quarter",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "current quarter",
  //       "Start": 10,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-07-01,2019-10-01,P3M)", "type": "daterange", "start": "2019-07-01", "end": "2019-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Sales for last quarter",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "last quarter",
  //       "Start": 10,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-04-01,2019-07-01,P3M)", "type": "daterange", "start": "2019-04-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Sales for last quarter",
  //   "Context": {"ReferenceDateTime": "2019-01-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "last quarter",
  //       "Start": 10,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-10-01,2019-01-01,P3M)", "type": "daterange", "start": "2018-10-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's discuss the work for the next quarter.",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next quarter",
  //       "Start": 31,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-10-01,2020-01-01,P3M)", "type": "daterange", "start": "2019-10-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's discuss the work for the next quarter.",
  //   "Context": {"ReferenceDateTime": "2019-12-28T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next quarter",
  //       "Start": 31,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-01-01,2020-04-01,P3M)", "type": "daterange", "start": "2020-01-01", "end": "2020-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's discuss the work for the coming quarter.",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "coming quarter",
  //       "Start": 31,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-10-01,2020-01-01,P3M)", "type": "daterange", "start": "2019-10-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's discuss the work for the following quarter.",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "following quarter",
  //       "Start": 31,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-10-01,2020-01-01,P3M)", "type": "daterange", "start": "2019-10-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Sales for previous quarter",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "previous quarter",
  //       "Start": 10,
  //       "End": 25,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-04-01,2019-07-01,P3M)", "type": "daterange", "start": "2019-04-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Sales for past quarter",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "past quarter",
  //       "Start": 10,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-04-01,2019-07-01,P3M)", "type": "daterange", "start": "2019-04-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will be out in 11:30 am to 12:30 december 27th",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "11:30 am to 12:30 december 27th",
  //       "Start": 17,
  //       "End": 47,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-12-27T11:30,XXXX-12-27T12:30,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2018-12-27 11:30:00",
  //             "end": "2018-12-27 12:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-12-27T11:30,XXXX-12-27T12:30,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2019-12-27 11:30:00",
  //             "end": "2019-12-27 12:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's have a meeting in 12:30 december 27th",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "12:30 december 27th",
  //       "Start": 24,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-27T12:30", "type": "datetime", "value": "2018-12-27 12:30:00"},
  //           {"timex": "XXXX-12-27T12:30", "type": "datetime", "value": "2019-12-27 12:30:00"},
  //           {"timex": "XXXX-12-27T00:30", "type": "datetime", "value": "2018-12-27 00:30:00"},
  //           {"timex": "XXXX-12-27T00:30", "type": "datetime", "value": "2019-12-27 00:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I bought it for \$12 December 27",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "december 27",
  //       "Start": 20,
  //       "End": 30,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-27", "type": "date", "value": "2018-12-27"},
  //           {"timex": "XXXX-12-27", "type": "date", "value": "2019-12-27"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I bought it for \$ 12 December 27",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "december 27",
  //       "Start": 21,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-27", "type": "date", "value": "2018-12-27"},
  //           {"timex": "XXXX-12-27", "type": "date", "value": "2019-12-27"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Tim says:30 December is OK",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "30 december",
  //       "Start": 9,
  //       "End": 19,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-30", "type": "date", "value": "2018-12-30"},
  //           {"timex": "XXXX-12-30", "type": "date", "value": "2019-12-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "3pm : I'll be out on this week",
  //   "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3pm",
  //       "Start": 0,
  //       "End": 2,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T15", "type": "time", "value": "15:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "this week",
  //       "Start": 21,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W28", "type": "daterange", "start": "2019-07-08", "end": "2019-07-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "this week 8am should be a daterange and a time.",
  //   "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this week",
  //       "Start": 0,
  //       "End": 8,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W28", "type": "daterange", "start": "2019-07-08", "end": "2019-07-15"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "8am",
  //       "Start": 10,
  //       "End": 12,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T08", "type": "time", "value": "08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "this week 8p.m. should be a daterange and a time.",
  //   "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this week",
  //       "Start": 0,
  //       "End": 8,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W28", "type": "daterange", "start": "2019-07-08", "end": "2019-07-15"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "8p.m.",
  //       "Start": 10,
  //       "End": 14,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T20", "type": "time", "value": "20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "week 10 8 p.m. should be a daterange and a time.",
  //   "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "week 10",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W10", "type": "daterange", "start": "2019-03-04", "end": "2019-03-11"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "8 p.m.",
  //       "Start": 8,
  //       "End": 13,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T20", "type": "time", "value": "20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "week 10 8p.m. should be a daterange and a time.",
  //   "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "week 10",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W10", "type": "daterange", "start": "2019-03-04", "end": "2019-03-11"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "8p.m.",
  //       "Start": 8,
  //       "End": 12,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T20", "type": "time", "value": "20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "week 10 10:20 should be a daterange and a time.",
  //   "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "week 10",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W10", "type": "daterange", "start": "2019-03-04", "end": "2019-03-11"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "10:20",
  //       "Start": 8,
  //       "End": 12,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T10:20", "type": "time", "value": "10:20:00"},
  //           {"timex": "T22:20", "type": "time", "value": "22:20:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened in late afternoon.",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "late afternoon",
  //       "Start": 17,
  //       "End": 30,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TAF", "Mod": "end", "type": "timerange", "start": "14:00:00", "end": "16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened later in the afternoon.",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "later in the afternoon",
  //       "Start": 14,
  //       "End": 35,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TAF", "Mod": "end", "type": "timerange", "start": "14:00:00", "end": "16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened in early morning.",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "early morning",
  //       "Start": 17,
  //       "End": 29,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "Mod": "start", "type": "timerange", "start": "08:00:00", "end": "10:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened early in the morning.",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "early in the morning",
  //       "Start": 14,
  //       "End": 33,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "Mod": "start", "type": "timerange", "start": "08:00:00", "end": "10:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee next week later in the afternoon",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next week",
  //       "Start": 20,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W30", "type": "daterange", "start": "2019-07-22", "end": "2019-07-29"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "later in the afternoon",
  //       "Start": 30,
  //       "End": 51,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TAF", "Mod": "end", "type": "timerange", "start": "14:00:00", "end": "16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee next week later in the morning.",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next week",
  //       "Start": 20,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W30", "type": "daterange", "start": "2019-07-22", "end": "2019-07-29"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "later in the morning",
  //       "Start": 30,
  //       "End": 49,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "Mod": "end", "type": "timerange", "start": "10:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee next week later in the evening.",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next week",
  //       "Start": 20,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W30", "type": "daterange", "start": "2019-07-22", "end": "2019-07-29"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "later in the evening",
  //       "Start": 30,
  //       "End": 49,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TEV", "Mod": "end", "type": "timerange", "start": "18:00:00", "end": "20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'm in the pacific timezone",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "Comment": "Not supported as the TimeZone is not enabled for now",
  //   "NotSupported": "javascript, dotnet, java, python",
  //   "Results": [
  //     {
  //       "Text": "pacific timezone",
  //       "Start": 11,
  //       "End": 26,
  //       "TypeName": "datetimeV2.timezone",
  //       "Resolution": {
  //         "values": [
  //           {"type": "timezone", "value": "UTC-08:00", "utcOffsetMins": "-480"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet at 1pm mountain timezone",
  //   "Context": {"ReferenceDateTime": "2018-11-28T12:00:00"},
  //   "Comment": "Not supported as the TimeZone is not enabled for now",
  //   "NotSupported": "javascript, dotnet, java, python",
  //   "Results": [
  //     {
  //       "Text": "1pm mountain timezone",
  //       "Start": 14,
  //       "End": 34,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "T13",
  //             "type": "time",
  //             "timezone": "UTC-06:00",
  //             "timezoneText": "mountain timezone",
  //             "utcOffsetMins": "-360",
  //             "value": "13:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I drank a cup of coffee on mar4 night.",
  //   "Context": {"ReferenceDateTime": "2019-07-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "mar4 night",
  //       "Start": 27,
  //       "End": 36,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-03-04TNI",
  //             "type": "datetimerange",
  //             "start": "2019-03-04 20:00:00",
  //             "end": "2019-03-04 23:59:59"
  //           },
  //           {
  //             "timex": "XXXX-03-04TNI",
  //             "type": "datetimerange",
  //             "start": "2020-03-04 20:00:00",
  //             "end": "2020-03-04 23:59:59"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I drank a cup of coffee on tues the 4th 7pm",
  //   "Context": {"ReferenceDateTime": "2019-06-17T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tues the 4th 7pm",
  //       "Start": 27,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-06-04T19", "type": "datetime", "value": "2019-06-04 19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee on tuesday the eleventh.",
  //   "Context": {"ReferenceDateTime": "2019-06-10T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tuesday the eleventh",
  //       "Start": 23,
  //       "End": 42,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-06-11", "type": "date", "value": "2019-06-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee on wednesday the thirty first.",
  //   "Context": {"ReferenceDateTime": "2019-07-19T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "wednesday the thirty first",
  //       "Start": 23,
  //       "End": 48,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-07-31", "type": "date", "value": "2019-07-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee on building 34 this afternoon",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this afternoon",
  //       "Start": 35,
  //       "End": 48,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-07-30TAF",
  //             "type": "datetimerange",
  //             "start": "2019-07-30 12:00:00",
  //             "end": "2019-07-30 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee on building 4 this afternoon",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this afternoon",
  //       "Start": 34,
  //       "End": 47,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-07-30TAF",
  //             "type": "datetimerange",
  //             "start": "2019-07-30 12:00:00",
  //             "end": "2019-07-30 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "134 this afternoon",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "this afternoon",
  //       "Start": 4,
  //       "End": 17,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-07-30TAF",
  //             "type": "datetimerange",
  //             "start": "2019-07-30 12:00:00",
  //             "end": "2019-07-30 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go for coffee on tuesday of next week",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "on tuesday of next week",
  //       "Start": 20,
  //       "End": 42,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-08-06", "type": "date", "value": "2019-08-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We met on tuesday of last week",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tuesday of last week",
  //       "Start": 10,
  //       "End": 29,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-07-23", "type": "date", "value": "2019-07-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet later this afternoon.",
  //   "Context": {"ReferenceDateTime": "2019-08-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "later this afternoon",
  //       "Start": 11,
  //       "End": 30,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-08-01TAF",
  //             "Mod": "end",
  //             "type": "datetimerange",
  //             "start": "2019-08-01 14:00:00",
  //             "end": "2019-08-01 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet late this morning.",
  //   "Context": {"ReferenceDateTime": "2019-08-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "late this morning",
  //       "Start": 11,
  //       "End": 27,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-08-01TMO",
  //             "Mod": "end",
  //             "type": "datetimerange",
  //             "start": "2019-08-01 10:00:00",
  //             "end": "2019-08-01 12:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet early this evening.",
  //   "Context": {"ReferenceDateTime": "2019-08-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "early this evening",
  //       "Start": 11,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-08-01TEV",
  //             "Mod": "start",
  //             "type": "datetimerange",
  //             "start": "2019-08-01 16:00:00",
  //             "end": "2019-08-01 18:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will leave from next friday to Oct 1st 2020.",
  //   "Context": {"ReferenceDateTime": "2019-07-30T08:00:00"},
  //   "NotSupported": "python, java",
  //   "Results": [
  //     {
  //       "Text": "from next friday to oct 1st 2020",
  //       "Start": 13,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-08-09,2020-10-01,P419D)", "type": "daterange", "start": "2019-08-09", "end": "2020-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Cortana could try to arrange a Skype call this or next week please?",
  //   "Context": {"ReferenceDateTime": "2019-08-01T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "next week",
  //       "Start": 50,
  //       "End": 58,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W32", "type": "daterange", "start": "2019-08-05", "end": "2019-08-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Yes. May I ask why?",
  //   "Context": {"ReferenceDateTime": "2018-01-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "Ok, may I ask Cortana to help?",
  //   "Context": {"ReferenceDateTime": "2018-01-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "ABC-12345-A1B2C3 this is yet to be submitted",
  //   "Context": {"ReferenceDateTime": "2019-08-08T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "mar3 this week or next",
  //   "Context": {"ReferenceDateTime": "2019-08-08T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "mar3",
  //       "Start": 0,
  //       "End": 3,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-03-03", "type": "date", "value": "2019-03-03"},
  //           {"timex": "XXXX-03-03", "type": "date", "value": "2020-03-03"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "this week",
  //       "Start": 5,
  //       "End": 13,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W32", "type": "daterange", "start": "2019-08-05", "end": "2019-08-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I want to loan \$10000 over 3 years",
  //   "Context": {"ReferenceDateTime": "2019-08-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3 years",
  //       "Start": 27,
  //       "End": 33,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3Y", "type": "duration", "value": "94608000"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I want to loan \$10000 in 3 years",
  //   "Context": {"ReferenceDateTime": "2019-08-12T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "in 3 years",
  //       "Start": 22,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-08-12", "type": "date", "value": "2022-08-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Must deliver sixteen (16) units before the thirty-first day of the month.",
  //   "Context": {"ReferenceDateTime": "2019-08-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "before the thirty-first day of the month",
  //       "Start": 32,
  //       "End": 71,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-08-31",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "end": "2019-08-31"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I will have a long vacation from next monday to friday",
  //   "Context": {"ReferenceDateTime": "2019-09-05T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "from next monday to friday",
  //       "Start": 28,
  //       "End": 53,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-09-09,2019-09-13,P4D)", "type": "daterange", "start": "2019-09-09", "end": "2019-09-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "6,107.31 August 2019 should not include the decimal",
  //   "Comment":
  //       "Only August 2019 should be extracted as a DateRange, so no output in Date only. Java disabled due to issue in lookbehind.",
  //   "NotSupported": "dotnet, java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "august 2019",
  //       "Start": 9,
  //       "End": 19,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-08", "type": "daterange", "start": "2019-08-01", "end": "2019-09-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "0.8/15 looks like a formula",
  //   "Comment": "Java disabled due to issue in lookbehind.",
  //   "NotSupported": "dotnet, java, javascript, python",
  //   "Results": []
  // },
  // {
  //   "Input": "8/1.5 looks like a formula",
  //   "Comment": "Java disabled due to issue in lookbehind.",
  //   "NotSupported": "dotnet, java, javascript, python",
  //   "Results": []
  // },
  // {
  //   "Input": "feb 30 2019",
  //   "Context": {"ReferenceDateTime": "2020-07-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 30 2019",
  //       "Start": 0,
  //       "End": 10,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-30", "type": "date", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "feb 30",
  //   "Context": {"ReferenceDateTime": "2019-01-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 30",
  //       "Start": 0,
  //       "End": 5,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-30", "type": "date", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "feb 30",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 30",
  //       "Start": 0,
  //       "End": 5,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-30", "type": "date", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "That's absurd like saying we should meet in feb 30 2019 17:20!",
  //   "Results": [
  //     {
  //       "Text": "feb 30 2019 17:20",
  //       "Start": 44,
  //       "End": 60,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-30T17:20", "type": "datetime", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet once a week",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "once a week",
  //       "Start": 11,
  //       "End": 21,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Have vitamins one a day",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one a day",
  //       "Start": 14,
  //       "End": 22,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I go on vacation once a year",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "once a year",
  //       "Start": 17,
  //       "End": 27,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1Y", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "The request is ABC-12345-A1B2C3 this round. Let's arrange a 30 minutes call this week. Look forward to speaking again this week.",
  //   "Context": {"ReferenceDateTime": "2019-09-09T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "30 minutes",
  //       "Start": 60,
  //       "End": 69,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT30M", "type": "duration", "value": "1800"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "this week",
  //       "Start": 76,
  //       "End": 84,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W37", "type": "daterange", "start": "2019-09-09", "end": "2019-09-16"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "this week",
  //       "Start": 118,
  //       "End": 126,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W37", "type": "daterange", "start": "2019-09-09", "end": "2019-09-16"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We've met last week this time, right?",
  //   "Context": {"ReferenceDateTime": "2019-09-09T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "last week",
  //       "Start": 10,
  //       "End": 18,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W36", "type": "daterange", "start": "2019-09-02", "end": "2019-09-09"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Open ABC-12345-A1B2C3 next",
  //   "Context": {"ReferenceDateTime": "2019-09-09T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Was it last week or this?",
  //   "Context": {"ReferenceDateTime": "2019-09-09T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "last week",
  //       "Start": 7,
  //       "End": 15,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-W36", "type": "daterange", "start": "2019-09-02", "end": "2019-09-09"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please schedule a ½ hour Teams call.",
  //   "Context": {"ReferenceDateTime": "2019-09-09T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "½ hour",
  //       "Start": 18,
  //       "End": 23,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT0.5H", "type": "duration", "value": "1800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's target a second round",
  //   "Context": {"ReferenceDateTime": "2019-09-09T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "It happened due to a one second time difference.",
  //   "Context": {"ReferenceDateTime": "2019-09-09T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "one second",
  //       "Start": 21,
  //       "End": 30,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1S", "type": "duration", "value": "1"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What date is 3 days from today?",
  //   "Context": {"ReferenceDateTime": "2019-08-24T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "3 days from today",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-08-27", "type": "date", "value": "2019-08-27"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "my vacation will start from October",
  //   "Context": {"ReferenceDateTime": "2019-08-24T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "october",
  //       "Start": 28,
  //       "End": 34,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-10", "type": "daterange", "start": "2018-10-01", "end": "2018-11-01"},
  //           {"timex": "XXXX-10", "type": "daterange", "start": "2019-10-01", "end": "2019-11-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet after breakfast",
  //   "Context": {"ReferenceDateTime": "2019-09-12T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "after breakfast",
  //       "Start": 11,
  //       "End": 25,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMEB", "Mod": "after", "type": "timerange", "start": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet before lunch",
  //   "Context": {"ReferenceDateTime": "2019-09-12T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "before lunch",
  //       "Start": 11,
  //       "End": 22,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMEL", "Mod": "before", "type": "timerange", "end": "11:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet around dinner",
  //   "Context": {"ReferenceDateTime": "2019-09-12T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "around dinner",
  //       "Start": 11,
  //       "End": 23,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMED", "Mod": "approx", "type": "timerange", "start": "16:00:00", "end": "20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will have lunch together with Jim",
  //   "Comment": "Disable this for now because of new features in .NET",
  //   "NotSupported": "javascript",
  //   "Context": {"ReferenceDateTime": "2019-09-12T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "We will have that staff dinner seven p . m .",
  //   "NotSupported": "javascript, java",
  //   "Context": {"ReferenceDateTime": "2019-09-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "seven p . m .",
  //       "Start": 31,
  //       "End": 43,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T19", "type": "time", "value": "19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How is the weather in the next two days?",
  //   "Context": {"ReferenceDateTime": "2019-09-19T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next two days",
  //       "Start": 26,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-09-20,2019-09-22,P2D)", "type": "daterange", "start": "2019-09-20", "end": "2019-09-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about 2019/aug/01",
  //   "Context": {"ReferenceDateTime": "2019-09-19T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019/aug/01",
  //       "Start": 10,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-08-01", "type": "date", "value": "2019-08-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about 2019-aug-1",
  //   "Context": {"ReferenceDateTime": "2019-09-19T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019-aug-1",
  //       "Start": 10,
  //       "End": 19,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-08-01", "type": "date", "value": "2019-08-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "He has been China from 2019-aug-01 to today.",
  //   "Context": {"ReferenceDateTime": "2019-10-14T01:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from 2019-aug-01 to today",
  //       "Start": 18,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-08-01,2019-10-14,P74D)", "type": "daterange", "start": "2019-08-01", "end": "2019-10-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "2019/aug/01 to today",
  //   "Context": {"ReferenceDateTime": "2019-10-14T10:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019/aug/01 to today",
  //       "Start": 0,
  //       "End": 19,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-08-01,2019-10-14,P74D)", "type": "daterange", "start": "2019-08-01", "end": "2019-10-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "what about 30 min later?",
  //   "Context": {"ReferenceDateTime": "2019-11-01T15:16:00"},
  //   "Results": [
  //     {
  //       "Text": "30 min later",
  //       "Start": 11,
  //       "End": 22,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-11-01T15:46:00", "type": "datetime", "value": "2019-11-01 15:46:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Every other Friday",
  //   "Context": {"ReferenceDateTime": "2019-11-25T17:00:00"},
  //   "Results": [
  //     {
  //       "Text": "every other friday",
  //       "Start": 0,
  //       "End": 17,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's have a quarterly meeting.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "quarterly",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3M", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "q1 and q2 could be any year",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "q1",
  //       "Start": 0,
  //       "End": 1,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-01-01,XXXX-04-01,P3M)", "type": "daterange", "start": "2019-01-01", "end": "2019-04-01"},
  //           {"timex": "(XXXX-01-01,XXXX-04-01,P3M)", "type": "daterange", "start": "2020-01-01", "end": "2020-04-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "q2",
  //       "Start": 7,
  //       "End": 8,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-01,XXXX-07-01,P3M)", "type": "daterange", "start": "2019-04-01", "end": "2019-07-01"},
  //           {"timex": "(XXXX-04-01,XXXX-07-01,P3M)", "type": "daterange", "start": "2020-04-01", "end": "2020-07-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "any year",
  //       "Start": 19,
  //       "End": 26,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1Y", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about 2019 q1",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019 q1",
  //       "Start": 10,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2019-04-01,P3M)", "type": "daterange", "start": "2019-01-01", "end": "2019-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about 2019-Q1",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019-q1",
  //       "Start": 10,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2019-04-01,P3M)", "type": "daterange", "start": "2019-01-01", "end": "2019-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How about q3 2019",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "q3 2019",
  //       "Start": 10,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-07-01,2019-10-01,P3M)", "type": "daterange", "start": "2019-07-01", "end": "2019-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "q1-2019",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "q1-2019",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2019-04-01,P3M)", "type": "daterange", "start": "2019-01-01", "end": "2019-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "2019 q3 and 2020 q1",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2019 q3",
  //       "Start": 0,
  //       "End": 6,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-07-01,2019-10-01,P3M)", "type": "daterange", "start": "2019-07-01", "end": "2019-10-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2020 q1",
  //       "Start": 12,
  //       "End": 18,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-01-01,2020-04-01,P3M)", "type": "daterange", "start": "2020-01-01", "end": "2020-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "please schedule a meeting for w/c Feb 4.",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "w/c feb 4",
  //       "Start": 30,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2019-02-04", "end": "2019-02-11"},
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2020-02-03", "end": "2020-02-10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "please schedule a meeting for the week beginning February 4",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the week beginning february 4",
  //       "Start": 30,
  //       "End": 58,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2019-02-04", "end": "2019-02-11"},
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2020-02-03", "end": "2020-02-10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "please schedule a meeting for the week starting on February 4",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the week starting on february 4",
  //       "Start": 30,
  //       "End": 60,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2019-02-04", "end": "2019-02-11"},
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2020-02-03", "end": "2020-02-10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "please schedule a meeting for the week commencing February 4",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the week commencing february 4",
  //       "Start": 30,
  //       "End": 59,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2019-02-04", "end": "2019-02-11"},
  //           {"timex": "XXXX-02-04", "type": "daterange", "start": "2020-02-03", "end": "2020-02-10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "This popular family friendly concert returns to the Hall for another lunchtime filled with traditional carols and festive favourites",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "lunchtime",
  //       "Start": 69,
  //       "End": 77,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMEL", "type": "timerange", "start": "11:00:00", "end": "13:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "any available time to run errands at lunchtime today",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "at lunchtime",
  //       "Start": 34,
  //       "End": 45,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMEL", "type": "timerange", "start": "11:00:00", "end": "13:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "today",
  //       "Start": 47,
  //       "End": 51,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-11-07", "type": "date", "value": "2019-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back at 8.30pm today",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "at 8.30pm today",
  //       "Start": 13,
  //       "End": 27,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T20:30", "type": "datetime", "value": "2019-12-26 20:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back today at 8.30pm",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "today at 8.30pm",
  //       "Start": 13,
  //       "End": 27,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T20:30", "type": "datetime", "value": "2019-12-26 20:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 8.30pm today",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "8.30pm today",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T20:30", "type": "datetime", "value": "2019-12-26 20:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back at 8.30 pm today",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "at 8.30 pm today",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T20:30", "type": "datetime", "value": "2019-12-26 20:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The target time is 8.10 pm",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "8.10 pm",
  //       "Start": 19,
  //       "End": 25,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T20:10", "type": "time", "value": "20:10:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Book a trip from 26th june of 2020 to 28th june of 2020",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from 26th june of 2020 to 28th june of 2020",
  //       "Start": 12,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-06-26,2020-06-28,P2D)", "type": "daterange", "start": "2020-06-26", "end": "2020-06-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Book something from 26th of june of 2020 to the 28th of june of 2020",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from 26th of june of 2020 to the 28th of june of 2020",
  //       "Start": 15,
  //       "End": 67,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-06-26,2020-06-28,P2D)", "type": "daterange", "start": "2020-06-26", "end": "2020-06-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What about from june 26th of 2020 to june the 28th 2020?",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "from june 26th of 2020 to june the 28th 2020",
  //       "Start": 11,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-06-26,2020-06-28,P2D)", "type": "daterange", "start": "2020-06-26", "end": "2020-06-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This company was established at the end of 2000",
  //   "Context": {"ReferenceDateTime": "2020-04-24T10:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "end of 2000",
  //       "Start": 36,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2000", "Mod": "end", "type": "daterange", "start": "2000-09-01", "end": "2001-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This company was established at the middle of 2000",
  //   "Context": {"ReferenceDateTime": "2020-04-24T10:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "middle of 2000",
  //       "Start": 36,
  //       "End": 49,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2000", "Mod": "mid", "type": "daterange", "start": "2000-05-01", "end": "2000-09-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This company was established at the beginning of 2000",
  //   "Context": {"ReferenceDateTime": "2020-04-24T10:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "beginning of 2000",
  //       "Start": 36,
  //       "End": 52,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2000", "Mod": "start", "type": "daterange", "start": "2000-01-01", "end": "2000-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We have lived here since the end of 1989",
  //   "Context": {"ReferenceDateTime": "2020-04-27T18:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "since the end of 1989",
  //       "Start": 19,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "1989",
  //             "Mod": "since-end",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "1989-09-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We have lived here from the end of 1989",
  //   "Context": {"ReferenceDateTime": "2020-04-27T18:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "end of 1989",
  //       "Start": 28,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1989", "Mod": "end", "type": "daterange", "start": "1989-09-01", "end": "1990-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We have lived here from mid 1989",
  //   "Context": {"ReferenceDateTime": "2020-04-27T18:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "mid 1989",
  //       "Start": 24,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1989", "Mod": "mid", "type": "daterange", "start": "1989-05-01", "end": "1989-09-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How many clusters docked between Jan 2019 and today",
  //   "Context": {"ReferenceDateTime": "2020-04-26T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between jan 2019 and today",
  //       "Start": 25,
  //       "End": 50,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2020-04-26,P481D)", "type": "daterange", "start": "2019-01-01", "end": "2020-04-26"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How many clusters docked between Jan 2019 and tomorrow",
  //   "Context": {"ReferenceDateTime": "2020-04-26T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between jan 2019 and tomorrow",
  //       "Start": 25,
  //       "End": 53,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2020-04-27,P482D)", "type": "daterange", "start": "2019-01-01", "end": "2020-04-27"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How many clusters docked between Jan 2019 and now",
  //   "Context": {"ReferenceDateTime": "2020-04-26T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between jan 2019 and now",
  //       "Start": 25,
  //       "End": 48,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2020-04-26,P481D)", "type": "daterange", "start": "2019-01-01", "end": "2020-04-26"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This task should be carried out between today and tomorrow",
  //   "Context": {"ReferenceDateTime": "2020-05-06T18:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "between today and tomorrow",
  //       "Start": 32,
  //       "End": 57,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-05-06,2020-05-07,P1D)", "type": "daterange", "start": "2020-05-06", "end": "2020-05-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The allotted time was between 22/Jan/2019 and yesterday",
  //   "Context": {"ReferenceDateTime": "2020-05-06T18:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between 22/jan/2019 and yesterday",
  //       "Start": 22,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-22,2020-05-05,P469D)", "type": "daterange", "start": "2019-01-22", "end": "2020-05-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It should have been completed between Aug 2019 and now",
  //   "Context": {"ReferenceDateTime": "2020-05-06T18:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between aug 2019 and now",
  //       "Start": 30,
  //       "End": 53,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-08-01,2020-05-06,P279D)", "type": "daterange", "start": "2019-08-01", "end": "2020-05-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The ssn is 123-12-1234",
  //   "Context": {"ReferenceDateTime": "2020-05-14T12:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": []
  // },
  // {
  //   "Input": "The COVID-19 was very serious at 02-02-2020 - 03-03-2020",
  //   "Context": {"ReferenceDateTime": "2020-05-14T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "02-02-2020 - 03-03-2020",
  //       "Start": 33,
  //       "End": 55,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-02-02,2020-03-03,P30D)", "type": "daterange", "start": "2020-02-02", "end": "2020-03-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The period is 10/1-11/2/2017",
  //   "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
  //   "NotSupportedByDesign": "javascript,java",
  //   "Results": [
  //     {
  //       "Text": "10/1-11/2/2017",
  //       "Start": 14,
  //       "End": 27,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2017-10-01,2017-11-02,P32D)", "type": "daterange", "start": "2017-10-01", "end": "2017-11-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The code of this object is 133-03-03-2020",
  //   "Context": {"ReferenceDateTime": "2020-05-14T12:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": []
  // },
  // {
  //   "Input": "The file's name is sales_report-2002-10-09.xlsx",
  //   "Context": {"ReferenceDateTime": "2020-05-14T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "2002-10-09",
  //       "Start": 32,
  //       "End": 41,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2002-10-09", "type": "date", "value": "2002-10-09"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "2015-1-32 is a wrong date",
  //   "Context": {"ReferenceDateTime": "2020-05-14T12:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": []
  // },
  // {
  //   "Input": "Call me al (206) 555-1212",
  //   "Context": {"ReferenceDateTime": "2020-05-14T12:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": []
  // },
  // {
  //   "Input": "1st week of Oct. on Friday.",
  //   "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "1st week of oct. on friday",
  //       "Start": 0,
  //       "End": 25,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-10-WXX-5-#1", "type": "date", "value": "2019-10-04"},
  //           {"timex": "XXXX-10-WXX-5-#1", "type": "date", "value": "2020-10-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's celebrate International Workers' Day!",
  //   "Context": {"ReferenceDateTime": "2020-05-14T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "international workers' day",
  //       "Start": 16,
  //       "End": 41,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-01", "type": "date", "value": "2020-05-01"},
  //           {"timex": "XXXX-05-01", "type": "date", "value": "2021-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Book a room for two days?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "two days",
  //       "Start": 16,
  //       "End": 23,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2D", "type": "duration", "value": "172800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Book a room for two nights?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "two nights",
  //       "Start": 16,
  //       "End": 25,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2D", "type": "duration", "value": "172800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Book a room for 1 night?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "1 night",
  //       "Start": 16,
  //       "End": 22,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "duration", "value": "86400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "fourth of july of 1995",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript,python",
  //   "Results": [
  //     {
  //       "Text": "fourth of july of 1995",
  //       "Start": 0,
  //       "End": 21,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1995-07-04", "type": "date", "value": "1995-07-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "june of 1992",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "june of 1992",
  //       "Start": 0,
  //       "End": 11,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1992-06", "type": "daterange", "start": "1992-06-01", "end": "1992-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "july 4th of 1995",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "july 4th of 1995",
  //       "Start": 0,
  //       "End": 15,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1995-07-04", "type": "date", "value": "1995-07-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "4th of july of 1995",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "4th of july of 1995",
  //       "Start": 0,
  //       "End": 18,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1995-07-04", "type": "date", "value": "1995-07-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "fourth of july 1995",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript,python",
  //   "Results": [
  //     {
  //       "Text": "fourth of july 1995",
  //       "Start": 0,
  //       "End": 18,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1995-07-04", "type": "date", "value": "1995-07-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "fourth of july, 1995",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript,python",
  //   "Results": [
  //     {
  //       "Text": "fourth of july, 1995",
  //       "Start": 0,
  //       "End": 19,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1995-07-04", "type": "date", "value": "1995-07-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "9 to 12 of June: another tapa festival",
  //   "Context": {"ReferenceDateTime": "2020-05-31T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "9 to 12 of june",
  //       "Start": 0,
  //       "End": 14,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-06-09,XXXX-06-12,P3D)", "type": "daterange", "start": "2019-06-09", "end": "2019-06-12"},
  //           {"timex": "(XXXX-06-09,XXXX-06-12,P3D)", "type": "daterange", "start": "2020-06-09", "end": "2020-06-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The average temperature for the three month (June-August 1992) summer period in Detroit was 67.0",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "three month",
  //       "Start": 32,
  //       "End": 42,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3M", "type": "duration", "value": "7776000"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "june-august 1992",
  //       "Start": 45,
  //       "End": 60,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(1992-06-01,1992-08-01,P2M)", "type": "daterange", "start": "1992-06-01", "end": "1992-08-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "summer",
  //       "Start": 63,
  //       "End": 68,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "SU", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Thursdays at 17.30 Beijing time",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "thursdays at 17.30",
  //       "Start": 0,
  //       "End": 17,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-4T17:30", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "Juneteenth, which is also known as Freedom Day and Jubilee Day, dates back to 1865, and it is observed on 19 June every year.",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "juneteenth",
  //       "Start": 0,
  //       "End": 9,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2019-06-19"},
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2020-06-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "freedom day",
  //       "Start": 35,
  //       "End": 45,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2019-06-19"},
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2020-06-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "jubilee day",
  //       "Start": 51,
  //       "End": 61,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2019-06-19"},
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2020-06-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "1865",
  //       "Start": 78,
  //       "End": 81,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1865", "type": "daterange", "start": "1865-01-01", "end": "1866-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "19 june",
  //       "Start": 106,
  //       "End": 112,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2019-06-19"},
  //           {"timex": "XXXX-06-19", "type": "date", "value": "2020-06-19"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "every year",
  //       "Start": 114,
  //       "End": 123,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1Y", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "tomorrow on skype for business between 3:00 pm and 5:00 pm eastern",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "tomorrow",
  //       "Start": 0,
  //       "End": 7,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-06-13", "type": "date", "value": "2020-06-13"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "between 3:00 pm and 5:00 pm",
  //       "Start": 31,
  //       "End": 57,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T15:00,T17:00,PT2H)", "type": "timerange", "start": "15:00:00", "end": "17:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Date: Wednesday at 3.30pm",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "wednesday at 3.30pm",
  //       "Start": 6,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-3T15:30", "type": "datetime", "value": "2020-06-10 15:30:00"},
  //           {"timex": "XXXX-WXX-3T15:30", "type": "datetime", "value": "2020-06-17 15:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please schedule a meeting semi-annually",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "semi-annually",
  //       "Start": 26,
  //       "End": 38,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P0.5Y", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please schedule a semiannual meeting",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "semiannual",
  //       "Start": 18,
  //       "End": 27,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P0.5Y", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Please schedule a meeting with everyone next week",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "next week",
  //       "Start": 40,
  //       "End": 48,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-W25", "type": "daterange", "start": "2020-06-15", "end": "2020-06-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's make sure that happens every weekday",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every weekday",
  //       "Start": 29,
  //       "End": 41,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1WD", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "why don't you take the remaining of the week off?",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "remaining of the week",
  //       "Start": 23,
  //       "End": 43,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-06-12,2020-06-14,P2D)", "type": "daterange", "start": "2020-06-12", "end": "2020-06-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "it's almost time for the annual review",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "annual",
  //       "Start": 25,
  //       "End": 30,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1Y", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "laws and regulations require reporting financials each quarter",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "each quarter",
  //       "Start": 50,
  //       "End": 61,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3M", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "4th of july is around the corner",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "4th of july",
  //       "Start": 0,
  //       "End": 10,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-07-04", "type": "date", "value": "2019-07-04"},
  //           {"timex": "XXXX-07-04", "type": "date", "value": "2020-07-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "the bi-monthly drills will happens thoughout the whole summer",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "bi-monthly",
  //       "Start": 4,
  //       "End": 13,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2M", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "summer",
  //       "Start": 55,
  //       "End": 60,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "SU", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "do you do that every weekend?",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "dotnet, javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every weekend",
  //       "Start": 15,
  //       "End": 27,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-WE", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "every two weekends",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every two weekends",
  //       "Start": 0,
  //       "End": 17,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2WE", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "the course lasts three weekends",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "three weekends",
  //       "Start": 17,
  //       "End": 30,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3WE", "type": "duration", "value": "518400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "the first quarter of the year is usually slower",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the first quarter of the year",
  //       "Start": 0,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-01-01,XXXX-04-01,P3M)", "type": "daterange", "start": "2020-01-01", "end": "2020-04-01"},
  //           {"timex": "(XXXX-01-01,XXXX-04-01,P3M)", "type": "daterange", "start": "2021-01-01", "end": "2021-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Winter, and more so the whole 1st quarter of 2013, was very polluted",
  //   "Context": {"ReferenceDateTime": "2020-06-12T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "winter",
  //       "Start": 0,
  //       "End": 5,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "WI", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "1st quarter of 2013",
  //       "Start": 30,
  //       "End": 48,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2013-01-01,2013-04-01,P3M)", "type": "daterange", "start": "2013-01-01", "end": "2013-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "the course will last three weekends",
  //   "Context": {"ReferenceDateTime": "2020-06-15T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "three weekends",
  //       "Start": 21,
  //       "End": 34,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3WE", "type": "duration", "value": "518400"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "this appointment shouldn't last two hours at all",
  //   "Context": {"ReferenceDateTime": "2020-06-15T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "two hours",
  //       "Start": 32,
  //       "End": 40,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT2H", "type": "duration", "value": "7200"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Race - 3pm - this week",
  //   "Context": {"ReferenceDateTime": "2020-06-16T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "3pm",
  //       "Start": 7,
  //       "End": 9,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T15", "type": "time", "value": "15:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "this week",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-W25", "type": "daterange", "start": "2020-06-15", "end": "2020-06-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Stuck in Traffic today - let colleagues know will need to change meeting to 8:30 instead of 8am",
  //   "Context": {"ReferenceDateTime": "2020-06-16T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "today",
  //       "Start": 17,
  //       "End": 21,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-06-16", "type": "date", "value": "2020-06-16"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "8:30",
  //       "Start": 76,
  //       "End": 79,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T08:30", "type": "time", "value": "08:30:00"},
  //           {"timex": "T20:30", "type": "time", "value": "20:30:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "8am",
  //       "Start": 92,
  //       "End": 94,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T08", "type": "time", "value": "08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Jane Johnson - May 25th - Coffee date - Starbucks on 29th - meet at 2pm for 1 hr",
  //   "Context": {"ReferenceDateTime": "2020-06-16T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "may 25th",
  //       "Start": 15,
  //       "End": 22,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-25", "type": "date", "value": "2020-05-25"},
  //           {"timex": "XXXX-05-25", "type": "date", "value": "2021-05-25"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "29th",
  //       "Start": 53,
  //       "End": 56,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-XX-29", "type": "date", "value": "2020-05-29"},
  //           {"timex": "XXXX-XX-29", "type": "date", "value": "2020-06-29"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2pm",
  //       "Start": 68,
  //       "End": 70,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T14", "type": "time", "value": "14:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "1 hr",
  //       "Start": 76,
  //       "End": 79,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1H", "type": "duration", "value": "3600"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Add meeting with boss to my calendar - Tuesdays at 9am",
  //   "Context": {"ReferenceDateTime": "2020-06-16T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "tuesdays at 9am",
  //       "Start": 39,
  //       "End": 53,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2T09", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "see you tonite, honey!",
  //   "Context": {"ReferenceDateTime": "2020-07-01T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tonite",
  //       "Start": 8,
  //       "End": 13,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2020-07-01TNI",
  //             "type": "datetimerange",
  //             "start": "2020-07-01 20:00:00",
  //             "end": "2020-07-01 23:59:59"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "When is the next new year day?",
  //   "Context": {"ReferenceDateTime": "2019-07-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next new year day",
  //       "Start": 12,
  //       "End": 28,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-01-01", "type": "date", "value": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "When was the last easter?",
  //   "Context": {"ReferenceDateTime": "2019-03-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "last easter",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-04-01", "type": "date", "value": "2018-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "tonight at 1am",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tonight at 1am",
  //       "Start": 0,
  //       "End": 13,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T01", "type": "datetime", "value": "2019-12-26 01:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back tonight at 2am",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tonight at 2am",
  //       "Start": 13,
  //       "End": 26,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T02", "type": "datetime", "value": "2019-12-26 02:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back tonight around 7",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tonight around 7",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T19", "type": "datetime", "value": "2019-12-26 19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back tonight around 3",
  //   "Context": {"ReferenceDateTime": "2019-12-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "tonight around 3",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-12-26T03", "type": "datetime", "value": "2019-12-26 03:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "When was the previous easter?",
  //   "Context": {"ReferenceDateTime": "2019-02-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "previous easter",
  //       "Start": 13,
  //       "End": 27,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-04-01", "type": "date", "value": "2018-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "When was the last easter?",
  //   "Context": {"ReferenceDateTime": "2019-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "last easter",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-04-21", "type": "date", "value": "2019-04-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "When was the next easter?",
  //   "Context": {"ReferenceDateTime": "2019-02-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next easter",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-04-21", "type": "date", "value": "2019-04-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "When was the following easter?",
  //   "Context": {"ReferenceDateTime": "2019-06-12T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "following easter",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-04-12", "type": "date", "value": "2020-04-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back by end of this month",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "by end of this month",
  //       "Start": 13,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016-11",
  //             "Mod": "before-end",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2016-12-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back before end of this year",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "before end of this year",
  //       "Start": 13,
  //       "End": 35,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2016",
  //             "Mod": "before-end",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2017-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back end of this year",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "end of this year",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016", "Mod": "end", "type": "daterange", "start": "2016-07-01", "end": "2017-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back after the beginning of March",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "after the beginning of march",
  //       "Start": 13,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-03",
  //             "Mod": "after-start",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "2016-03-01"
  //           },
  //           {
  //             "timex": "XXXX-03",
  //             "Mod": "after-start",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "2017-03-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back before the end of December",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "before the end of december",
  //       "Start": 13,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-12",
  //             "Mod": "before-end",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2016-01-01"
  //           },
  //           {
  //             "timex": "XXXX-12",
  //             "Mod": "before-end",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2017-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will come back before the twenty-sixth day of the month",
  //   "Context": {"ReferenceDateTime": "2020-07-01T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "before the twenty-sixth day of the month",
  //       "Start": 18,
  //       "End": 57,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2020-07-26",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "end": "2020-07-26"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will come back after the 15th day of next month",
  //   "Context": {"ReferenceDateTime": "2020-07-01T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "after the 15th day of next month",
  //       "Start": 18,
  //       "End": 49,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2020-08-15",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2020-08-15"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will come back on the 15th day of next month",
  //   "Context": {"ReferenceDateTime": "2020-07-01T12:00:00"},
  //   "NotSupportedByDesign": "python, java, javascript",
  //   "Results": [
  //     {
  //       "Text": "the 15th day of next month",
  //       "Start": 21,
  //       "End": 46,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-08-15", "type": "date", "value": "2020-08-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will come back after the 15th day of June",
  //   "Context": {"ReferenceDateTime": "2020-07-01T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "after the 15th day of june",
  //       "Start": 18,
  //       "End": 43,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-06-15",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2020-06-15"
  //           },
  //           {
  //             "timex": "XXXX-06-15",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2021-06-15"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will come back on the twenty third day of September",
  //   "Context": {"ReferenceDateTime": "2020-07-01T12:00:00"},
  //   "NotSupportedByDesign": "python, java, javascript",
  //   "Results": [
  //     {
  //       "Text": "twenty third day of september",
  //       "Start": 25,
  //       "End": 53,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-09-23", "type": "date", "value": "2019-09-23"},
  //           {"timex": "XXXX-09-23", "type": "date", "value": "2020-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How many Azure clusters docked till date?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "till date",
  //       "Start": 31,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "daterange", "Mod": "before", "end": "2016-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How many Azure clusters docked to date?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "to date",
  //       "Start": 31,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "daterange", "Mod": "before", "end": "2016-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How many Azure clusters docked from March to date?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from march to date",
  //       "Start": 31,
  //       "End": 48,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-03-01,2016-11-07,P251D)", "type": "daterange", "start": "2016-03-01", "end": "2016-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen on the 17 from 2pm to 4pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the 17 from 2pm to 4pm",
  //       "Start": 18,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-XX-17T14,XXXX-XX-17T16,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-10-17 14:00:00",
  //             "end": "2016-10-17 16:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-XX-17T14,XXXX-XX-17T16,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-17 14:00:00",
  //             "end": "2016-11-17 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen on the 17 between 2 and 4pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the 17 between 2 and 4pm",
  //       "Start": 18,
  //       "End": 41,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-XX-17T14,XXXX-XX-17T16,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-10-17 14:00:00",
  //             "end": "2016-10-17 16:00:00"
  //           },
  //           {
  //             "timex": "(XXXX-XX-17T14,XXXX-XX-17T16,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-17 14:00:00",
  //             "end": "2016-11-17 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out between 7 and 9:30 last night",
  //   "Context": {"ReferenceDateTime": "2018-06-01T16:12:00"},
  //   "NotSupportedByDesign": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between 7 and 9:30 last night",
  //       "Start": 12,
  //       "End": 40,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-05-31T19,2018-05-31T21:30,PT2H30M)",
  //             "type": "datetimerange",
  //             "start": "2018-05-31 19:00:00",
  //             "end": "2018-05-31 21:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen between 10 and 11:30 this morning",
  //   "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
  //   "NotSupportedByDesign": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between 10 and 11:30 this morning",
  //       "Start": 15,
  //       "End": 47,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-05-31T10,2018-05-31T11:30,PT1H30M)",
  //             "type": "datetimerange",
  //             "start": "2018-05-31 10:00:00",
  //             "end": "2018-05-31 11:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen next evening between 10:30 and 11:45",
  //   "Context": {"ReferenceDateTime": "2018-05-30T00:00:00"},
  //   "NotSupportedByDesign": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next evening between 10:30 and 11:45",
  //       "Start": 15,
  //       "End": 50,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-05-31T22:30,2018-05-31T23:45,PT1H15M)",
  //             "type": "datetimerange",
  //             "start": "2018-05-31 22:30:00",
  //             "end": "2018-05-31 23:45:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out between 7 and 9 last night",
  //   "Context": {"ReferenceDateTime": "2018-06-01T16:12:00"},
  //   "NotSupportedByDesign": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between 7 and 9 last night",
  //       "Start": 12,
  //       "End": 37,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-05-31T19,2018-05-31T21,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-31 19:00:00",
  //             "end": "2018-05-31 21:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "dinner with mom weekend.",
  //   "Context": {"ReferenceDateTime": "2016-11-11T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "weekend",
  //       "Start": 16,
  //       "End": 22,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-W45-WE", "type": "daterange", "start": "2016-11-12", "end": "2016-11-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "dinner with mom the weekend.",
  //   "Context": {"ReferenceDateTime": "2016-11-11T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "the weekend",
  //       "Start": 16,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-W45-WE", "type": "daterange", "start": "2016-11-12", "end": "2016-11-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "dinner with mom any weekend.",
  //   "Context": {"ReferenceDateTime": "2016-11-11T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "any weekend",
  //       "Start": 16,
  //       "End": 26,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1WE", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "dinner with mom all weekends.",
  //   "Context": {"ReferenceDateTime": "2016-11-11T00:00:00"},
  //   "NotSupported": "javascript, python, java, dotnet",
  //   "Results": [
  //     {
  //       "Text": "all weekends",
  //       "Start": 16,
  //       "End": 27,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1WE", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out next evening from 7 to 9",
  //   "Context": {"ReferenceDateTime": "2018-06-01T16:12:00"},
  //   "NotSupportedByDesign": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next evening from 7 to 9",
  //       "Start": 12,
  //       "End": 35,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-06-02T19,2018-06-02T21,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-06-02 19:00:00",
  //             "end": "2018-06-02 21:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They were working between 7 and 9 last morning.",
  //   "Context": {"ReferenceDateTime": "2018-06-01T16:12:00"},
  //   "NotSupportedByDesign": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between 7 and 9 last morning",
  //       "Start": 18,
  //       "End": 45,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2018-05-31T07,2018-05-31T09,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2018-05-31 07:00:00",
  //             "end": "2018-05-31 09:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2007 to the end of 2008.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from 2007 to the end of 2008",
  //       "Start": 13,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2007-01-01,2009-01-01,P24M)", "type": "daterange", "start": "2007-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is between 2007 and the end of 2008.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between 2007 and the end of 2008",
  //       "Start": 13,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2007-01-01,2009-01-01,P24M)", "type": "daterange", "start": "2007-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It has been closed from April until the end of June.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from april until the end of june",
  //       "Start": 19,
  //       "End": 50,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-01,XXXX-07-01,P3M)", "type": "daterange", "start": "2016-04-01", "end": "2016-07-01"},
  //           {"timex": "(XXXX-04-01,XXXX-07-01,P3M)", "type": "daterange", "start": "2017-04-01", "end": "2017-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2007 to the start of 2008.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from 2007 to the start of 2008",
  //       "Start": 13,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2007-01-01,2008-01-01,P12M)", "type": "daterange", "start": "2007-01-01", "end": "2008-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is between the end of 2007 and the end of 2008.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between the end of 2007 and the end of 2008",
  //       "Start": 13,
  //       "End": 55,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2008-01-01,2009-01-01,P12M)", "type": "daterange", "start": "2008-01-01", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from the middle of 2007 to the end of 2008.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from the middle of 2007 to the end of 2008",
  //       "Start": 13,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2007-07-02,2009-01-01,P18M)", "type": "daterange", "start": "2007-07-02", "end": "2009-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from the end of March to the middle of September.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from the end of march to the middle of september",
  //       "Start": 13,
  //       "End": 60,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-01,XXXX-09-16,P5M)", "type": "daterange", "start": "2016-04-01", "end": "2016-09-16"},
  //           {"timex": "(XXXX-04-01,XXXX-09-16,P5M)", "type": "daterange", "start": "2017-04-01", "end": "2017-09-16"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is between the middle of March and the end of September.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "between the middle of march and the end of september",
  //       "Start": 13,
  //       "End": 64,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-03-16,XXXX-10-01,P7M)", "type": "daterange", "start": "2016-03-16", "end": "2016-10-01"},
  //           {"timex": "(XXXX-03-16,XXXX-10-01,P7M)", "type": "daterange", "start": "2017-03-16", "end": "2017-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen this working week",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "this working week",
  //       "Start": 15,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W26", "type": "daterange", "start": "2018-06-25", "end": "2018-06-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen on next workweek",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "javascript, java, python",
  //   "Results": [
  //     {
  //       "Text": "next workweek",
  //       "Start": 18,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W27", "type": "daterange", "start": "2018-07-02", "end": "2018-07-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I am feeling sick from around 1pm",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "around 1pm",
  //       "Start": 23,
  //       "End": 32,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T13", "Mod": "approx", "type": "timerange", "value": "13:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I am feeling sick before around 2pm today",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "before around 2pm today",
  //       "Start": 18,
  //       "End": 40,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2018-08-17T14",
  //             "Mod": "before-approx",
  //             "type": "datetimerange",
  //             "end": "2018-08-17 14:00:00",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I am feeling sick after around 3:30pm",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "after around 3:30pm",
  //       "Start": 18,
  //       "End": 36,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "T15:30",
  //             "Mod": "after-approx",
  //             "type": "timerange",
  //             "start": "15:30:00",
  //             "sourceEntity": "datetimepoint"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I am feeling sick around 1pm",
  //   "Context": {"ReferenceDateTime": "2018-08-17T15:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "around 1pm",
  //       "Start": 18,
  //       "End": 27,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T13", "Mod": "approx", "type": "timerange", "value": "13:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2014",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "2014",
  //       "Start": 18,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2014", "type": "daterange", "start": "2014-01-01", "end": "2015-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The range is from 2015 and 2016",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "2015",
  //       "Start": 18,
  //       "End": 21,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015", "type": "daterange", "start": "2015-01-01", "end": "2016-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2016",
  //       "Start": 27,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016", "type": "daterange", "start": "2016-01-01", "end": "2017-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "after January 1, 2007 and no later than January 1, 2010",
  //   "Context": {"ReferenceDateTime": "2019-12-15T01:00:00"},
  //   "Results": [
  //     {
  //       "Text": "after january 1, 2007",
  //       "Start": 0,
  //       "End": 20,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2007-01-01",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2007-01-01"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "no later than january 1, 2010",
  //       "Start": 26,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2010-01-01",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "end": "2010-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Since January 1, 2010 or no later than January 1, 2007",
  //   "Context": {"ReferenceDateTime": "2019-12-15T01:00:00"},
  //   "Results": [
  //     {
  //       "Text": "since january 1, 2010",
  //       "Start": 0,
  //       "End": 20,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2010-01-01",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "start": "2010-01-01"
  //           }
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "no later than january 1, 2007",
  //       "Start": 25,
  //       "End": 53,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2007-01-01",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "end": "2007-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "deliver 2000 pieces of toys.",
  //   "Comment": "Default mode produces a false positive for it and it's a case from TasksMode.",
  //   "Context": {"ReferenceDateTime": "2019-12-15T01:00:00"},
  //   "NotSupported": "dotnet, javascript, python, java",
  //   "Results": []
  // },
  // {
  //   "Input": "Show sales of 2007 and 2009",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2007",
  //       "Start": 14,
  //       "End": 17,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2007", "type": "daterange", "start": "2007-01-01", "end": "2008-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2009",
  //       "Start": 23,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2009", "type": "daterange", "start": "2009-01-01", "end": "2010-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen 3 days from Tuesday.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "3 days from tuesday",
  //       "Start": 15,
  //       "End": 33,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-11", "type": "date", "value": "2016-11-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen 2 weeks from January 15.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "2 weeks from january 15",
  //       "Start": 15,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-01-29", "type": "date", "value": "2017-01-29"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen 4 months from tomorrow.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "4 months from tomorrow",
  //       "Start": 15,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-03-08", "type": "date", "value": "2017-03-08"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen 16 days from 01/02/2018.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "16 days from 01/02/2018",
  //       "Start": 15,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-01-18", "type": "date", "value": "2018-01-18"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will end two months after next Friday.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "two months after next friday",
  //       "Start": 12,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-01-18", "type": "date", "value": "2017-01-18"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It will happen 3 days after January 12th.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "3 days after january 12th",
  //       "Start": 15,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-01-15", "type": "date", "value": "2017-01-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It happened 2 weeks before May 13 1999.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "2 weeks before may 13 1999",
  //       "Start": 12,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1999-04-29", "type": "date", "value": "1999-04-29"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave every day at 7:13 p.m.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every day at 7:13 p.m.",
  //       "Start": 11,
  //       "End": 32,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T19:13", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave every evening at 7:13 p.m.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "every evening at 7:13 p.m.",
  //       "Start": 11,
  //       "End": 36,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T19:13", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What happened on Easter Monday at 10:30 am?",
  //   "Context": {"ReferenceDateTime": "2019-08-05T00:00:00"},
  //   "NotSupported": "python, java, javascript",
  //   "Results": [
  //     {
  //       "Text": "easter monday",
  //       "Start": 17,
  //       "End": 29,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-04-22", "type": "date", "value": "2019-04-22"},
  //           {"timex": "XXXX-04-22", "type": "date", "value": "2020-04-13"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "10:30 am",
  //       "Start": 34,
  //       "End": 41,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T10:30", "type": "time", "value": "10:30:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "which films are shown on christmas eve at 6 p.m.?",
  //   "Context": {"ReferenceDateTime": "2019-08-05T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "christmas eve",
  //       "Start": 25,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-24", "type": "date", "value": "2018-12-24"},
  //           {"timex": "XXXX-12-24", "type": "date", "value": "2019-12-24"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "6 p.m.",
  //       "Start": 42,
  //       "End": 47,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T18", "type": "time", "value": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "dinner with mom weekends.",
  //   "Context": {"ReferenceDateTime": "2016-11-11T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "weekends",
  //       "Start": 16,
  //       "End": 23,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1WE", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out Tuesday from 2:00 to 2:30 pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "tuesday from 2:00 to 2:30 pm",
  //       "Start": 12,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-2T14:00,XXXX-WXX-2T14:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-01 14:00:00",
  //             "end": "2016-11-01 14:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-2T14:00,XXXX-WXX-2T14:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 14:00:00",
  //             "end": "2016-11-08 14:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out Tuesday at 2:00 - 2:30 pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "tuesday at 2:00 - 2:30 pm",
  //       "Start": 12,
  //       "End": 36,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-2T14:00,XXXX-WXX-2T14:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-01 14:00:00",
  //             "end": "2016-11-01 14:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-2T14:00,XXXX-WXX-2T14:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 14:00:00",
  //             "end": "2016-11-08 14:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out on December 12th at 4 - 6:30 pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "december 12th at 4 - 6:30 pm",
  //       "Start": 15,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-12-12T16,XXXX-12-12T18:30,PT2H30M)",
  //             "type": "datetimerange",
  //             "start": "2015-12-12 16:00:00",
  //             "end": "2015-12-12 18:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-12-12T16,XXXX-12-12T18:30,PT2H30M)",
  //             "type": "datetimerange",
  //             "start": "2016-12-12 16:00:00",
  //             "end": "2016-12-12 18:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out at 2:00 - 2:30 pm on Tuesday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "2:00 - 2:30 pm on tuesday",
  //       "Start": 15,
  //       "End": 39,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-2T14:00,XXXX-WXX-2T14:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-01 14:00:00",
  //             "end": "2016-11-01 14:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-2T14:00,XXXX-WXX-2T14:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 14:00:00",
  //             "end": "2016-11-08 14:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out from 2:30 to 2:15 pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "from 2:30 to 2:15 pm",
  //       "Start": 12,
  //       "End": 31,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T02:30,T14:15,PT11H45M)", "type": "timerange", "start": "02:30:00", "end": "14:15:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It happened the year before 2015",
  //   "Context": {"ReferenceDateTime": "2018-11-08T12:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "the year",
  //       "Start": 12,
  //       "End": 19,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018", "type": "daterange", "start": "2018-01-01", "end": "2019-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "before 2015",
  //       "Start": 21,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2015",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2015-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It happened 2 weeks before Christmas.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "2 weeks before christmas",
  //       "Start": 12,
  //       "End": 35,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-12-11", "type": "date", "value": "2016-12-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It happened three months after Easter.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "three months after easter",
  //       "Start": 12,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-07-16", "type": "date", "value": "2017-07-16"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will meet 5 days before new year.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "5 days before new year",
  //       "Start": 13,
  //       "End": 34,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-12-27", "type": "date", "value": "2016-12-27"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in two thousand and twenty",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "two thousand and twenty",
  //       "Start": 14,
  //       "End": 36,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020", "type": "daterange", "start": "2020-01-01", "end": "2021-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They left in nineteen ninety six and came back in two thousand and fifteen",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "nineteen ninety six",
  //       "Start": 13,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1996", "type": "daterange", "start": "1996-01-01", "end": "1997-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "two thousand and fifteen",
  //       "Start": 50,
  //       "End": 73,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015", "type": "daterange", "start": "2015-01-01", "end": "2016-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We've reached the end of today",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "the end of today",
  //       "Start": 14,
  //       "End": 29,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-06-26T23:59:59", "type": "datetime", "value": "2018-06-26 23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We've reached the end of the line",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "We've reached end of the line",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "end of",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "end of the",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Show sales all week",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "all week",
  //       "Start": 11,
  //       "End": 18,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "type": "duration", "value": "604800"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the first week",
  //   "Context": {"ReferenceDateTime": "2011-07-02T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Show sales in the 1st week",
  //   "Context": {"ReferenceDateTime": "2011-07-02T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Feb 29",
  //   "Context": {"ReferenceDateTime": "2017-03-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 29",
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-29", "type": "date", "value": "2016-02-29"},
  //           {"timex": "XXXX-02-29", "type": "date", "value": "2020-02-29"}
  //         ]
  //       },
  //       "Start": 0,
  //       "End": 5
  //     }
  //   ]
  // },
  // {
  //   "Input": "2/29",
  //   "Context": {"ReferenceDateTime": "2019-03-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2/29",
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-29", "type": "date", "value": "2016-02-29"},
  //           {"timex": "XXXX-02-29", "type": "date", "value": "2020-02-29"}
  //         ]
  //       },
  //       "Start": 0,
  //       "End": 3
  //     }
  //   ]
  // },
  // {
  //   "Input": "Feb 29th",
  //   "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 29th",
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-29", "type": "date", "value": "2020-02-29"},
  //           {"timex": "XXXX-02-29", "type": "date", "value": "2024-02-29"}
  //         ]
  //       },
  //       "Start": 0,
  //       "End": 7
  //     }
  //   ]
  // },
  // {
  //   "Input": "Feb 30",
  //   "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 30",
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-30", "type": "date", "value": "not resolved"}
  //         ]
  //       },
  //       "Start": 0,
  //       "End": 5
  //     }
  //   ]
  // },
  // {
  //   "Input": "2/29/2019",
  //   "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2/29/2019",
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2019-02-29", "type": "date", "value": "not resolved"}
  //         ]
  //       },
  //       "Start": 0,
  //       "End": 8
  //     }
  //   ]
  // },
  // {
  //   "Input": "2/29/2020",
  //   "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2/29/2020",
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-02-29", "type": "date", "value": "2020-02-29"}
  //         ]
  //       },
  //       "Start": 0,
  //       "End": 8
  //     }
  //   ]
  // },
  // {
  //   "Input": "Feb 28th to March 1st",
  //   "Context": {"ReferenceDateTime": "2019-09-18T18:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 28th to march 1st",
  //       "Start": 0,
  //       "End": 20,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-02-28,XXXX-03-01,P1D)", "type": "daterange", "start": "2019-02-28", "end": "2019-03-01"},
  //           {"timex": "(XXXX-02-28,XXXX-03-01,P2D)", "type": "daterange", "start": "2020-02-28", "end": "2020-03-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "2/29-3/1",
  //   "Context": {"ReferenceDateTime": "2019-09-18T18:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2/29-3/1",
  //       "Start": 0,
  //       "End": 7,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-02-29,XXXX-03-01,P1D)", "type": "daterange", "start": "2016-02-29", "end": "2016-03-01"},
  //           {"timex": "(XXXX-02-29,XXXX-03-01,P1D)", "type": "daterange", "start": "2020-02-29", "end": "2020-03-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "2/29-3/1/2019",
  //   "Context": {"ReferenceDateTime": "2019-09-18T18:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2/29-3/1/2019",
  //       "Start": 0,
  //       "End": 12,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-02-29,2019-03-01,PXD)", "type": "daterange", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Pierre de Fermat died otd.",
  //   "Context": {"ReferenceDateTime": "2021-01-15T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "otd",
  //       "Start": 22,
  //       "End": 24,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-01-15", "type": "date", "value": "2021-01-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I have a secure enough supply line, at the minute I'm ok.",
  //   "Context": {"ReferenceDateTime": "2021-01-15T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "at the minute",
  //       "Start": 36,
  //       "End": 48,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2021-01-15 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Feb 2th 9:00 am",
  //   "Context": {"ReferenceDateTime": "2021-01-15T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "feb 2th 9:00 am",
  //       "Start": 0,
  //       "End": 14,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-02-02T09:00", "type": "datetime", "value": "2020-02-02 09:00:00"},
  //           {"timex": "XXXX-02-02T09:00", "type": "datetime", "value": "2021-02-02 09:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "it happened last night at 8.",
  //   "Context": {"ReferenceDateTime": "2018-08-16T10:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "last night at 8",
  //       "Start": 12,
  //       "End": 26,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-08-15T20", "type": "datetime", "value": "2018-08-15 20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "My temperature was 37.1 in the morning",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "in the morning",
  //       "Start": 24,
  //       "End": 37,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "timerange", "start": "08:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Labs were notable for a BUN/Cr of 30/4.85, troponin 0.182",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "I'll go back Sep-23-2020.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "sep-23-2020",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-09-23", "type": "date", "value": "2020-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back September-2020-23.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "september-2020-23",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-09-23", "type": "date", "value": "2020-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 2020/23/Sep.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2020/23/sep",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-09-23", "type": "date", "value": "2020-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i'll go back 2020/Sep/23",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2020/sep/23",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-09-23", "type": "date", "value": "2020-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i'll go back 23/Sep/2020",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "23/sep/2020",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-09-23", "type": "date", "value": "2020-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i'll go back 23-2020-September",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "23-2020-september",
  //       "Start": 13,
  //       "End": 29,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-09-23", "type": "date", "value": "2020-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i'll go back friday 23 at 4",
  //   "Context": {"ReferenceDateTime": "2019-08-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "friday 23 at 4",
  //       "Start": 13,
  //       "End": 26,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5T04", "type": "datetime", "value": "2018-11-23 04:00:00"},
  //           {"timex": "XXXX-WXX-5T04", "type": "datetime", "value": "2019-08-23 04:00:00"},
  //           {"timex": "XXXX-WXX-5T16", "type": "datetime", "value": "2018-11-23 16:00:00"},
  //           {"timex": "XXXX-WXX-5T16", "type": "datetime", "value": "2019-08-23 16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet at friday the 26th at 4",
  //   "Context": {"ReferenceDateTime": "2021-03-15T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday the 26th at 4",
  //       "Start": 14,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-03-26T04", "type": "datetime", "value": "2021-03-26 04:00:00"},
  //           {"timex": "2021-03-26T16", "type": "datetime", "value": "2021-03-26 16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet at friday the 26th around 4",
  //   "Context": {"ReferenceDateTime": "2021-03-15T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday the 26th around 4",
  //       "Start": 14,
  //       "End": 37,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-03-26T04", "type": "datetime", "value": "2021-03-26 04:00:00"},
  //           {"timex": "2021-03-26T16", "type": "datetime", "value": "2021-03-26 16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Does friday at 4pm work?",
  //   "Context": {"ReferenceDateTime": "2021-03-15T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "friday at 4pm",
  //       "Start": 5,
  //       "End": 17,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5T16", "type": "datetime", "value": "2021-03-12 16:00:00"},
  //           {"timex": "XXXX-WXX-5T16", "type": "datetime", "value": "2021-03-19 16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "circa 5 in the morning",
  //   "Context": {"ReferenceDateTime": "2021-03-15T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "circa 5 in the morning",
  //       "Start": 0,
  //       "End": 21,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T05", "Mod": "approx", "type": "timerange", "value": "05:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 12/12/30.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "12/12/30",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XX30-12-12", "type": "date", "value": "1930-12-12"},
  //           {"timex": "XX30-12-12", "type": "date", "value": "2030-12-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 11/12/35.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "11/12/35",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XX35-11-12", "type": "date", "value": "1935-11-12"},
  //           {"timex": "XX35-11-12", "type": "date", "value": "2035-11-12"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 23/08/39.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "23/08/39",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XX39-08-23", "type": "date", "value": "1939-08-23"},
  //           {"timex": "XX39-08-23", "type": "date", "value": "2039-08-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 03/18/40.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "03/18/40",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1940-03-18", "type": "date", "value": "1940-03-18"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "\$DEC farming is coming to \$CUB Finance!",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": []
  // },
  // {
  //   "Input": "In dec \$DEC farming is coming to \$CUB Finance!",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "dec",
  //       "Start": 3,
  //       "End": 5,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12", "type": "daterange", "start": "2015-12-01", "end": "2016-01-01"},
  //           {"timex": "XXXX-12", "type": "daterange", "start": "2016-12-01", "end": "2017-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 9am on Tuesday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "9am on tuesday",
  //       "Start": 13,
  //       "End": 26,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2T09", "type": "datetime", "value": "2016-11-01 09:00:00"},
  //           {"timex": "XXXX-WXX-2T09", "type": "datetime", "value": "2016-11-08 09:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Tune in tomorrow, 13/04/21, at 7 PM CET for episode 3 of Decentralized",
  //   "Context": {"ReferenceDateTime": "2018-06-06T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "tomorrow, 13/04/21, at 7 pm",
  //       "Start": 8,
  //       "End": 34,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-04-13T19", "type": "datetime", "value": "2021-04-13 19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sun will set tomorrow at seven twenty-seven",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "tomorrow at seven twenty-seven",
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-08T07:27", "type": "datetime", "value": "2016-11-08 07:27:00"},
  //           {"timex": "2016-11-08T19:27", "type": "datetime", "value": "2016-11-08 19:27:00"}
  //         ]
  //       },
  //       "Start": 17,
  //       "End": 46
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sun will set tomorrow at six forty-three minutes",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "tomorrow at six forty-three minutes",
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-08T06:43", "type": "datetime", "value": "2016-11-08 06:43:00"},
  //           {"timex": "2016-11-08T18:43", "type": "datetime", "value": "2016-11-08 18:43:00"}
  //         ]
  //       },
  //       "Start": 17,
  //       "End": 51
  //     }
  //   ]
  // },
  // {
  //   "Input": "The sun will set tomorrow at thirty-six minutes past eight",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "tomorrow at thirty-six minutes past eight",
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-08T08:36", "type": "datetime", "value": "2016-11-08 08:36:00"},
  //           {"timex": "2016-11-08T20:36", "type": "datetime", "value": "2016-11-08 20:36:00"}
  //         ]
  //       },
  //       "Start": 17,
  //       "End": 57
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "Our 24th retweet competition #WINNER has been randomly selected! Congratulations, @dreaming_70! You have won \$100 in \$ETH. This tweet begins (and counts towards) the next day of the retweet competition. Winners will be selected daily until April 27th",
  //   "Context": {"ReferenceDateTime": "2018-05-22T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "the next day",
  //       "Start": 162,
  //       "End": 173,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-05-23", "type": "date", "value": "2018-05-23"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "daily",
  //       "Start": 228,
  //       "End": 232,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "until april 27th",
  //       "Start": 234,
  //       "End": 249,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-04-27",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "end": "2018-04-27"
  //           },
  //           {
  //             "timex": "XXXX-04-27",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimepoint",
  //             "end": "2019-04-27"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Can we meet now",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "now",
  //       "Start": 12,
  //       "End": 14,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2016-11-07 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go right now",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "right now",
  //       "Start": 9,
  //       "End": 17,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2016-11-07 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Can you meet at the moment?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "at the moment",
  //       "Start": 13,
  //       "End": 25,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2016-11-07 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "He's not here at present.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "at present",
  //       "Start": 14,
  //       "End": 23,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2016-11-07 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We're working on that at the present time.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "at the present time",
  //       "Start": 22,
  //       "End": 40,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2016-11-07 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We're not open at this time.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "at this time",
  //       "Start": 15,
  //       "End": 26,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PRESENT_REF", "type": "datetime", "value": "2016-11-07 00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be offline for the hour",
  //   "Context": {"ReferenceDateTime": "2021-05-20T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "the hour",
  //       "Start": 20,
  //       "End": 27,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "PT1H", "type": "duration", "value": "3600"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "The same story played out in Kolkata, the capital city of the eastern state of West Bengal, a fortnight later.",
  //   "Context": {"ReferenceDateTime": "2021-05-20T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "a fortnight later",
  //       "Start": 92,
  //       "End": 108,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-06-03", "type": "date", "value": "2021-06-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "in a fortnight’s time",
  //   "Context": {"ReferenceDateTime": "2021-05-20T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "in a fortnight",
  //       "Start": 0,
  //       "End": 13,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-06-03", "type": "date", "value": "2021-06-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'm unavailable the fortnight",
  //   "Context": {"ReferenceDateTime": "2021-05-20T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "the fortnight",
  //       "Start": 16,
  //       "End": 28,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2021-05-17,2021-05-31,P2W)", "type": "daterange", "start": "2021-05-17", "end": "2021-05-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Mumbai has seen the highest number of daily infections over the past fortnight",
  //   "Context": {"ReferenceDateTime": "2021-05-20T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "daily",
  //       "Start": 38,
  //       "End": 42,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "past fortnight",
  //       "Start": 64,
  //       "End": 77,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2021-05-03,2021-05-17,P2W)", "type": "daterange", "start": "2021-05-03", "end": "2021-05-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We hope to leave in the next fortnight.",
  //   "Context": {"ReferenceDateTime": "2021-05-20T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next fortnight",
  //       "Start": 24,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2021-05-31,2021-06-14,P2W)", "type": "daterange", "start": "2021-05-31", "end": "2021-06-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Latitude: 40.1693, 1666.90125 BRL",
  //   "Context": {"ReferenceDateTime": "2021-05-20T00:00:00"},
  //   "NotSupported": "python",
  //   "Results": []
  // },
  // {
  //   "Input": "I'll be back within 5 minutes",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "within 5 minutes",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T00:00:00,2016-11-07T00:05:00,PT5M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 00:00:00",
  //             "end": "2016-11-07 00:05:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back in 3 min",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "in 3 min",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-07T00:03:00", "type": "datetime", "value": "2016-11-07 00:03:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back 3 minutes from now",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "3 minutes from now",
  //       "Start": 13,
  //       "End": 30,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-07T00:03:00", "type": "datetime", "value": "2016-11-07 00:03:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back within 3 min",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "within 3 min",
  //       "Start": 13,
  //       "End": 24,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2019-07-30T00:00:00,2019-07-30T00:03:00,PT3M)",
  //             "type": "datetimerange",
  //             "start": "2019-07-30 00:00:00",
  //             "end": "2019-07-30 00:03:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back from now until 3 min later",
  //   "Context": {"ReferenceDateTime": "2019-07-30T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "from now until 3 min later",
  //       "Start": 13,
  //       "End": 38,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(PRESENT_REF,2019-07-30T00:03:00,PT3M)",
  //             "type": "datetimerange",
  //             "start": "2019-07-30 00:00:00",
  //             "end": "2019-07-30 00:03:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back within the next day and 5 hours",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupportedByDesign": "javascript,python,java",
  //   "Results": [
  //     {
  //       "Text": "within the next day and 5 hours",
  //       "Start": 13,
  //       "End": 43,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T16:12:00,2016-11-08T21:12:00,P1DT5H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 16:12:00",
  //             "end": "2016-11-08 21:12:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet in the daytime",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "in the daytime",
  //       "Start": 11,
  //       "End": 24,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TDT", "type": "timerange", "start": "08:00:00", "end": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "they were working in the night-time",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "in the night-time",
  //       "Start": 18,
  //       "End": 34,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TNT", "type": "timerange", "start": "00:00:00", "end": "08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "etfs with negative flows of at least \$1k last month",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "last month",
  //       "Start": 41,
  //       "End": 50,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-10", "type": "daterange", "start": "2016-10-01", "end": "2016-11-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will be only 3 next week.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next week",
  //       "Start": 18,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-W46", "type": "daterange", "start": "2016-11-14", "end": "2016-11-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I counted 13 last minute.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T12:30:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "last minute",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T12:29:00,2016-11-07T12:30:00,PT1M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 12:29:00",
  //             "end": "2016-11-07 12:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We will be gone for only the 3 next weeks.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "3 next weeks",
  //       "Start": 29,
  //       "End": 40,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-11-08,2016-11-29,P3W)", "type": "daterange", "start": "2016-11-08", "end": "2016-11-29"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I counted 3 in the 13 last minutes.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T12:30:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "13 last minutes",
  //       "Start": 19,
  //       "End": 33,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T12:17:00,2016-11-07T12:30:00,PT13M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 12:17:00",
  //             "end": "2016-11-07 12:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out from August to October",
  //   "Context": {"ReferenceDateTime": "2016-07-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from august to october",
  //       "Start": 12,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-08-01,XXXX-10-01,P2M)", "type": "daterange", "start": "2015-08-01", "end": "2015-10-01"},
  //           {"timex": "(XXXX-08-01,XXXX-10-01,P2M)", "type": "daterange", "start": "2016-08-01", "end": "2016-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out from August to October",
  //   "Context": {"ReferenceDateTime": "2016-09-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from august to october",
  //       "Start": 12,
  //       "End": 33,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-08-01,XXXX-10-01,P2M)", "type": "daterange", "start": "2016-08-01", "end": "2016-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The project was submitted last month and 3 weeks later it was approved",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupportedByDesign": "javascript,python,java",
  //   "Results": [
  //     {
  //       "Text": "last month",
  //       "Start": 26,
  //       "End": 35,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-10", "type": "daterange", "start": "2016-10-01", "end": "2016-11-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "3 weeks later",
  //       "Start": 41,
  //       "End": 53,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-28", "type": "date", "value": "2016-11-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They worked on the problem for the last 3 months and 2 days ago they found a solution",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupportedByDesign": "javascript,python,java",
  //   "Results": [
  //     {
  //       "Text": "last 3 months",
  //       "Start": 35,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-08-07,2016-11-07,P3M)", "type": "daterange", "start": "2016-08-07", "end": "2016-11-07"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2 days ago",
  //       "Start": 53,
  //       "End": 62,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-05", "type": "date", "value": "2016-11-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They worked on the problem for the last 3 months and 2 weeks and 2 days ago they found a solution",
  //   "Comment": "The middle entity '2 weeks' is not merged due to ambiguity",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupportedByDesign": "javascript,python,java",
  //   "Results": [
  //     {
  //       "Text": "last 3 months",
  //       "Start": 35,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-08-07,2016-11-07,P3M)", "type": "daterange", "start": "2016-08-07", "end": "2016-11-07"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2 weeks",
  //       "Start": 53,
  //       "End": 59,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2W", "type": "duration", "value": "1209600"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2 days ago",
  //       "Start": 65,
  //       "End": 74,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-05", "type": "date", "value": "2016-11-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "For the last 3 months, they worked on the problem and 2 weeks and 2 days ago they found a solution",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupportedByDesign": "javascript,python,java",
  //   "Results": [
  //     {
  //       "Text": "last 3 months",
  //       "Start": 8,
  //       "End": 20,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-08-07,2016-11-07,P3M)", "type": "daterange", "start": "2016-08-07", "end": "2016-11-07"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2 weeks and 2 days ago",
  //       "Start": 54,
  //       "End": 75,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-10-22", "type": "date", "value": "2016-10-22"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They worked on the problem for the last 3 months and 2 weeks and 2 days.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupportedByDesign": "javascript,python,java",
  //   "Results": [
  //     {
  //       "Text": "last 3 months and 2 weeks and 2 days",
  //       "Start": 35,
  //       "End": 70,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-07-22,2016-11-07,P3M2W2D)",
  //             "type": "daterange",
  //             "start": "2016-07-22",
  //             "end": "2016-11-07"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back Thursday before 5pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "thursday before 5pm",
  //       "Start": 13,
  //       "End": 31,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-4T17", "type": "datetimerange", "Mod": "before", "end": "2016-11-03 17:00:00"},
  //           {"timex": "XXXX-WXX-4T17", "type": "datetimerange", "Mod": "before", "end": "2016-11-10 17:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back tomorrow before 5pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "tomorrow before 5pm",
  //       "Start": 13,
  //       "End": 31,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-08T17", "type": "datetimerange", "Mod": "before", "end": "2016-11-08 17:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back 23/12 before 5pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "23/12 before 5pm",
  //       "Start": 13,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-23T17", "type": "datetimerange", "Mod": "before", "end": "2015-12-23 17:00:00"},
  //           {"timex": "XXXX-12-23T17", "type": "datetimerange", "Mod": "before", "end": "2016-12-23 17:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back within 2h",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "within 2h",
  //       "Start": 13,
  //       "End": 21,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T16:12:00,2016-11-07T18:12:00,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 16:12:00",
  //             "end": "2016-11-07 18:12:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "show statistics from the last week of this month",
  //   "Context": {"ReferenceDateTime": "2021-10-10T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "the last week of this month",
  //       "Start": 21,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-10-W05", "type": "daterange", "start": "2021-10-25", "end": "2021-11-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "show statistics from the last week of last month",
  //   "Context": {"ReferenceDateTime": "2021-10-10T12:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "the last week of last month",
  //       "Start": 21,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-09-W05", "type": "daterange", "start": "2021-09-27", "end": "2021-10-04"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "dates which are greater than or equals to date 1",
  //   "Context": {"ReferenceDateTime": "2021-06-18T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": []
  // },
  // {
  //   "Input": "My dentist uses the most up to date equipment",
  //   "Context": {"ReferenceDateTime": "2021-06-18T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": []
  // },
  // {
  //   "Input": "I've kept it up-to-date.",
  //   "Context": {"ReferenceDateTime": "2021-06-18T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": []
  // },
  // {
  //   "Input": "rows equals to date from 2010-01-01 till current date",
  //   "Context": {"ReferenceDateTime": "2021-06-18T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2010-01-01 till current date",
  //       "Start": 20,
  //       "End": 52,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2010-01-01,2021-06-18,P4186D)", "type": "daterange", "start": "2010-01-01", "end": "2021-06-18"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I want to book a flight for the weekend of halloween",
  //   "Context": {"ReferenceDateTime": "2021-11-09T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the weekend of halloween",
  //       "Start": 28,
  //       "End": 51,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-W43-WE", "type": "daterange", "start": "2021-10-30", "end": "2021-11-01"},
  //           {"timex": "2022-W43-WE", "type": "daterange", "start": "2022-10-29", "end": "2022-11-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I want to book a flight for halloween weekend 2021",
  //   "Context": {"ReferenceDateTime": "2021-11-09T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "halloween weekend 2021",
  //       "Start": 28,
  //       "End": 49,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-W43-WE", "type": "daterange", "start": "2021-10-30", "end": "2021-11-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I need to prepare for labor day weekend",
  //   "Context": {"ReferenceDateTime": "2021-11-09T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "labor day weekend",
  //       "Start": 22,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-W35-WE", "type": "daterange", "start": "2021-09-04", "end": "2021-09-07"},
  //           {"timex": "2022-W35-WE", "type": "daterange", "start": "2022-09-03", "end": "2022-09-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I need to prepare for labor day 2021 weekend",
  //   "Context": {"ReferenceDateTime": "2021-11-09T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "labor day 2021 weekend",
  //       "Start": 22,
  //       "End": 43,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-W35-WE", "type": "daterange", "start": "2021-09-04", "end": "2021-09-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We'll take weekend of thanksgiving 2023 off",
  //   "Context": {"ReferenceDateTime": "2021-11-09T18:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "weekend of thanksgiving 2023",
  //       "Start": 11,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023-W47-WE", "type": "daterange", "start": "2023-11-23", "end": "2023-11-27"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input":
  //       "The Employer operates a policy of job flexibility and the Employer may, at its discretion, require you to perform additional or other duties, whether skilled or unskilled, not within the scope of your normal duties and may at its discretion amend your Job Description at any time.",
  //   "Context": {"ReferenceDateTime": "2021-06-18T18:00:00"},
  //   "NotSupported": "python",
  //   "Results": []
  // },
  // {
  //   "Input":
  //       "What we have witnessed is the dawn of a second wave of digital transformation sweeping every company and every industry.",
  //   "Context": {"ReferenceDateTime": "2021-06-18T18:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "Let's find one morning together",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "morning",
  //       "Start": 15,
  //       "End": 21,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "timerange", "start": "08:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet one in the morning together",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "one in the morning",
  //       "Start": 11,
  //       "End": 28,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T01", "type": "time", "value": "01:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's go out 1 evening",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "evening",
  //       "Start": 15,
  //       "End": 21,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TEV", "type": "timerange", "start": "16:00:00", "end": "20:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Students must attend all four afternoon classes",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "afternoon",
  //       "Start": 30,
  //       "End": 38,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TAF", "type": "timerange", "start": "12:00:00", "end": "16:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I met them at 2 morning sessions",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "morning",
  //       "Start": 16,
  //       "End": 22,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "timerange", "start": "08:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They work at three night markets.",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "night",
  //       "Start": 19,
  //       "End": 23,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TNI", "type": "timerange", "start": "20:00:00", "end": "23:59:59"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We should go back at mid night.",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "mid night",
  //       "Start": 21,
  //       "End": 29,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T00", "type": "time", "value": "00:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I was born in April of 1987",
  //   "Context": {"ReferenceDateTime": "2018-01-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "april of 1987",
  //       "Start": 14,
  //       "End": 26,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1987-04", "type": "daterange", "start": "1987-04-01", "end": "1987-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I was born in April of 87",
  //   "Context": {"ReferenceDateTime": "2018-01-07T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "april of 87",
  //       "Start": 14,
  //       "End": 24,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1987-04", "type": "daterange", "start": "1987-04-01", "end": "1987-05-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I was born on 15 April of 87",
  //   "Context": {"ReferenceDateTime": "2018-01-07T00:00:00"},
  //   "NotSupported": "javascript",
  //   "Results": [
  //     {
  //       "Text": "15 april of 87",
  //       "Start": 14,
  //       "End": 27,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1987-04-15", "type": "date", "value": "1987-04-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The event starts on Christmas early morning at 8:00",
  //   "Context": {"ReferenceDateTime": "2019-08-05T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "christmas",
  //       "Start": 20,
  //       "End": 28,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-25", "type": "date", "value": "2018-12-25"},
  //           {"timex": "XXXX-12-25", "type": "date", "value": "2019-12-25"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "early morning at 8:00",
  //       "Start": 30,
  //       "End": 50,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T08:00", "type": "time", "value": "08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The event starts on Sunday early morning at 8:00",
  //   "Context": {"ReferenceDateTime": "2019-08-05T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "sunday early morning at 8:00",
  //       "Start": 20,
  //       "End": 47,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-7T08:00", "type": "datetime", "value": "2019-08-04 08:00:00"},
  //           {"timex": "XXXX-WXX-7T08:00", "type": "datetime", "value": "2019-08-11 08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The event starts on Christmas at 8:00 early morning",
  //   "Context": {"ReferenceDateTime": "2019-08-05T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "christmas",
  //       "Start": 20,
  //       "End": 28,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12-25", "type": "date", "value": "2018-12-25"},
  //           {"timex": "XXXX-12-25", "type": "date", "value": "2019-12-25"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "8:00 early morning",
  //       "Start": 33,
  //       "End": 50,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T08:00", "type": "time", "value": "08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The event starts on Sunday at 8:00 early morning",
  //   "Context": {"ReferenceDateTime": "2019-08-05T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "sunday at 8:00 early morning",
  //       "Start": 20,
  //       "End": 47,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-7T08:00", "type": "datetime", "value": "2019-08-04 08:00:00"},
  //           {"timex": "XXXX-WXX-7T08:00", "type": "datetime", "value": "2019-08-11 08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The event starts on Sunday late evening at 10:00",
  //   "Context": {"ReferenceDateTime": "2019-08-05T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "sunday late evening at 10:00",
  //       "Start": 20,
  //       "End": 47,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-7T22:00", "type": "datetime", "value": "2019-08-04 22:00:00"},
  //           {"timex": "XXXX-WXX-7T22:00", "type": "datetime", "value": "2019-08-11 22:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "She was born on January twenty five nineteen eighty six",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "january twenty five nineteen eighty six",
  //       "Start": 16,
  //       "End": 54,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1986-01-25", "type": "date", "value": "1986-01-25"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "She was born on twenty five January nineteen eighty six",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "twenty five january nineteen eighty six",
  //       "Start": 16,
  //       "End": 54,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1986-01-25", "type": "date", "value": "1986-01-25"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "On fifteen August nineteen hundred ninety three, the plant started operations.",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "fifteen august nineteen hundred ninety three",
  //       "Start": 3,
  //       "End": 46,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1993-08-15", "type": "date", "value": "1993-08-15"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They arrived 13 Sept nineteen seventy two",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "13 sept nineteen seventy two",
  //       "Start": 13,
  //       "End": 40,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1972-09-13", "type": "date", "value": "1972-09-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The ship set sails on 6 April seventeen hundred thirty three",
  //   "Context": {"ReferenceDateTime": "2019-05-30T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "6 april seventeen hundred thirty three",
  //       "Start": 22,
  //       "End": 59,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "1733-04-06", "type": "date", "value": "1733-04-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out August two thousand and fifteen",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "august two thousand and fifteen",
  //       "Start": 12,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2015-08", "type": "daterange", "start": "2015-08-01", "end": "2015-09-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The conference was in October two thousand and five",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "october two thousand and five",
  //       "Start": 22,
  //       "End": 50,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2005-10", "type": "daterange", "start": "2005-10-01", "end": "2005-11-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They left in October two thousand and returned in December",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "october two thousand",
  //       "Start": 13,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2000-10", "type": "daterange", "start": "2000-10-01", "end": "2000-11-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "december",
  //       "Start": 50,
  //       "End": 57,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-12", "type": "daterange", "start": "2015-12-01", "end": "2016-01-01"},
  //           {"timex": "XXXX-12", "type": "daterange", "start": "2016-12-01", "end": "2017-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 20161016.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "20161016",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-10-16", "type": "date", "value": "2016-10-16"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "On 2016 10 16, the conference started.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "2016 10 16",
  //       "Start": 3,
  //       "End": 12,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-10-16", "type": "date", "value": "2016-10-16"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Created On is in the first week of 2021",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the first week of 2021",
  //       "Start": 17,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-W01", "type": "daterange", "start": "2021-01-04", "end": "2021-01-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Created On is in the second week of 2021",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the second week of 2021",
  //       "Start": 17,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-W02", "type": "daterange", "start": "2021-01-11", "end": "2021-01-18"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They will leave the third month of 2021",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the third month of 2021",
  //       "Start": 16,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-03", "type": "daterange", "start": "2021-03-01", "end": "2021-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The 9th month of next year we will conduct a review of the progress.",
  //   "Context": {"ReferenceDateTime": "2021-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the 9th month of next year",
  //       "Start": 0,
  //       "End": 25,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-09", "type": "daterange", "start": "2022-09-01", "end": "2022-10-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Rooms already fully booked for the first 2 weeks of 2021",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the first 2 weeks of 2021",
  //       "Start": 31,
  //       "End": 55,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2021-01-04,2021-01-18,P2W)", "type": "daterange", "start": "2021-01-04", "end": "2021-01-18"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Maintenance is scheduled for the last 3 weeks of this year",
  //   "Context": {"ReferenceDateTime": "2019-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the last 3 weeks of this year",
  //       "Start": 29,
  //       "End": 57,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-12-09,2019-12-30,P3W)", "type": "daterange", "start": "2019-12-09", "end": "2019-12-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The results for the last four months of 2021 have been listed",
  //   "Context": {"ReferenceDateTime": "2018-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the last four months of 2021",
  //       "Start": 16,
  //       "End": 43,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2021-09-01,2022-01-01,P4M)", "type": "daterange", "start": "2021-09-01", "end": "2022-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "They visited Paris first ten days of last year",
  //   "Context": {"ReferenceDateTime": "2021-11-29T12:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "first ten days of last year",
  //       "Start": 19,
  //       "End": 45,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-01-01,2020-01-11,P10D)", "type": "daterange", "start": "2020-01-01", "end": "2020-01-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Monday two weeks from now.",
  //   "Context": {"ReferenceDateTime": "2016-11-09T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "monday two weeks from now",
  //       "Start": 13,
  //       "End": 37,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-21", "type": "date", "value": "2016-11-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back two months from today on Tuesday.",
  //   "Context": {"ReferenceDateTime": "2016-07-01T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "two months from today on tuesday",
  //       "Start": 13,
  //       "End": 44,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-09-06", "type": "date", "value": "2016-09-06"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Thursday, two year from now.",
  //   "Context": {"ReferenceDateTime": "2021-01-02T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "thursday, two year from now",
  //       "Start": 13,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023-01-05", "type": "date", "value": "2023-01-05"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back in 3 days on Friday.",
  //   "Context": {"ReferenceDateTime": "2016-11-09T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "in 3 days on friday",
  //       "Start": 13,
  //       "End": 31,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2016-11-11", "type": "date", "value": "2016-11-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back 3 weeks after Christmas on Friday.",
  //   "Context": {"ReferenceDateTime": "2021-01-02T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "3 weeks after christmas on friday",
  //       "Start": 13,
  //       "End": 45,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-01-14", "type": "date", "value": "2022-01-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Sunday 3 weeks after January 15th.",
  //   "Context": {"ReferenceDateTime": "2021-01-02T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "sunday 3 weeks after january 15th",
  //       "Start": 13,
  //       "End": 45,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-01-31", "type": "date", "value": "2021-01-31"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Saturday 3 days from now.",
  //   "Context": {"ReferenceDateTime": "2021-01-06T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "saturday 3 days from now",
  //       "Start": 13,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2021-01-09", "type": "date", "value": "2021-01-09"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Schedule a meeting every week starting next week",
  //   "Context": {"ReferenceDateTime": "2022-01-10T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "every week",
  //       "Start": 19,
  //       "End": 28,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "starting next week",
  //       "Start": 30,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2022-W03",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "2022-01-17"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Mon 13th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "mon 13th",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2021-12-13"},
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2022-06-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Tue 13th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "tue 13th",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2021-07-13"},
  //           {"timex": "XXXX-WXX-2", "type": "date", "value": "2022-09-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Wed 13th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "wed 13th",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-3", "type": "date", "value": "2022-04-13"},
  //           {"timex": "XXXX-WXX-3", "type": "date", "value": "2022-07-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Thu 14th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "thu 14th",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2022-04-14"},
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2022-07-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Fri 14th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "fri 14th",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2022-01-14"},
  //           {"timex": "XXXX-WXX-5", "type": "date", "value": "2022-10-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Sat 14th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "sat 14th",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-6", "type": "date", "value": "2021-08-14"},
  //           {"timex": "XXXX-WXX-6", "type": "date", "value": "2022-05-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Sun 14th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "sun 14th",
  //       "Start": 13,
  //       "End": 20,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-7", "type": "date", "value": "2021-11-14"},
  //           {"timex": "XXXX-WXX-7", "type": "date", "value": "2022-08-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It's an everyday routine.",
  //   "Context": {"ReferenceDateTime": "2018-11-30T12:00:00"},
  //   "Results": [
  //     {
  //       "Text": "everyday",
  //       "Start": 8,
  //       "End": 15,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "We meet in half an hour",
  //   "Context": {"ReferenceDateTime": "2022-01-07T18:55:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "in half an hour",
  //       "Start": 8,
  //       "End": 22,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-01-07T19:25:00", "type": "datetime", "value": "2022-01-07 19:25:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What about half an hour from now?",
  //   "Context": {"ReferenceDateTime": "2022-01-07T18:56:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "half an hour from now",
  //       "Start": 11,
  //       "End": 31,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-01-07T19:26:00", "type": "datetime", "value": "2022-01-07 19:26:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back on Mon 13th",
  //   "Context": {"ReferenceDateTime": "2022-05-01T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "mon 13th",
  //       "Start": 16,
  //       "End": 23,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2021-12-13"},
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2022-06-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out tuesday afternoon",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "tuesday afternoon",
  //       "Start": 12,
  //       "End": 28,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "XXXX-WXX-2TAF",
  //             "type": "datetimerange",
  //             "start": "2016-11-01 12:00:00",
  //             "end": "2016-11-01 16:00:00"
  //           },
  //           {
  //             "timex": "XXXX-WXX-2TAF",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 12:00:00",
  //             "end": "2016-11-08 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out tuesday afternoons",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "tuesday afternoons",
  //       "Start": 12,
  //       "End": 29,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-2TAF", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out Friday mornings",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "friday mornings",
  //       "Start": 12,
  //       "End": 26,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-5TMO", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out mornings",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "mornings",
  //       "Start": 12,
  //       "End": 19,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out in the mornings",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "in the mornings",
  //       "Start": 12,
  //       "End": 26,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "timerange", "start": "08:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I wish all my students the best of luck and success for their academic studies starting on Sep 2019",
  //   "Context": {"ReferenceDateTime": "2016-11-07T16:12:00"},
  //   "Results": [
  //     {
  //       "Text": "starting on sep 2019",
  //       "Start": 79,
  //       "End": 98,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2019-09",
  //             "Mod": "since",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "2019-09-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I left here 2 years 1 month 21 days later",
  //   "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "2 years 1 month 21 days later",
  //       "Start": 12,
  //       "End": 40,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-01-13", "type": "date", "value": "2020-01-13"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Rating where year is greater than 2015",
  //   "Context": {"ReferenceDateTime": "2022-01-10T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "greater than 2015",
  //       "Start": 21,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2015",
  //             "Mod": "after",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "start": "2016-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the week 3 of 2027",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "week 3 of 2027",
  //       "Start": 18,
  //       "End": 31,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2027-W03", "type": "daterange", "start": "2027-01-18", "end": "2027-01-25"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Show sales in the week 27 of last year",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "week 27 of last year",
  //       "Start": 18,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-W27", "type": "daterange", "start": "2017-07-03", "end": "2017-07-10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The project should start in the next decade",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the next decade",
  //       "Start": 28,
  //       "End": 42,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-01-01,2030-01-01,P10Y)", "type": "daterange", "start": "2020-01-01", "end": "2030-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "The project should be completed in the next two decades.",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "the next two decades",
  //       "Start": 35,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2020-01-01,2040-01-01,P20Y)", "type": "daterange", "start": "2020-01-01", "end": "2040-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Let's meet on Thursday, week 23",
  //   "Context": {"ReferenceDateTime": "2018-07-02T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "thursday",
  //       "Start": 14,
  //       "End": 21,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2018-06-28"},
  //           {"timex": "XXXX-WXX-4", "type": "date", "value": "2018-07-05"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "week 23",
  //       "Start": 24,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-W23", "type": "daterange", "start": "2018-06-04", "end": "2018-06-11"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "show me sales from 2010 to 2018 or before 2000",
  //   "Context": {"ReferenceDateTime": "2018-06-26T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2010 to 2018",
  //       "Start": 14,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2010-01-01,2018-01-01,P8Y)", "type": "daterange", "start": "2010-01-01", "end": "2018-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "before 2000",
  //       "Start": 35,
  //       "End": 45,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "2000",
  //             "Mod": "before",
  //             "type": "daterange",
  //             "sourceEntity": "datetimerange",
  //             "end": "2000-01-01"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be out November 19-20",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "november 19-20",
  //       "Start": 12,
  //       "End": 25,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-11-19,XXXX-11-20,P1D)", "type": "daterange", "start": "2015-11-19", "end": "2015-11-20"},
  //           {"timex": "(XXXX-11-19,XXXX-11-20,P1D)", "type": "daterange", "start": "2016-11-19", "end": "2016-11-20"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Help me book a meeting tonight from 7 to 7:30",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "tonight from 7 to 7:30",
  //       "Start": 23,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T19,2016-11-07T19:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 19:00:00",
  //             "end": "2016-11-07 19:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Help me book a meeting this evening from 7 to 7:30",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "this evening from 7 to 7:30",
  //       "Start": 23,
  //       "End": 49,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T19,2016-11-07T19:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 19:00:00",
  //             "end": "2016-11-07 19:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Help me book a meeting today from 7 to 7:30",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "today from 7 to 7:30",
  //       "Start": 23,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T07,2016-11-07T07:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 07:00:00",
  //             "end": "2016-11-07 07:30:00"
  //           },
  //           {
  //             "timex": "(2016-11-07T19,2016-11-07T19:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 19:00:00",
  //             "end": "2016-11-07 19:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Help me book a meeting Tuesday from 7 to 7:30",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "tuesday from 7 to 7:30",
  //       "Start": 23,
  //       "End": 44,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(XXXX-WXX-2T07,XXXX-WXX-2T07:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-01 07:00:00",
  //             "end": "2016-11-01 07:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-2T07,XXXX-WXX-2T07:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 07:00:00",
  //             "end": "2016-11-08 07:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-2T19,XXXX-WXX-2T19:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-01 19:00:00",
  //             "end": "2016-11-01 19:30:00"
  //           },
  //           {
  //             "timex": "(XXXX-WXX-2T19,XXXX-WXX-2T19:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 19:00:00",
  //             "end": "2016-11-08 19:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Help me book a meeting tonight from 7 to 7:30pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "tonight from 7 to 7:30pm",
  //       "Start": 23,
  //       "End": 46,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T19,2016-11-07T19:30,PT30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 19:00:00",
  //             "end": "2016-11-07 19:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Help me book a meeting on December 15 2016 from 7:00 to 8:00pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "december 15 2016 from 7:00 to 8:00pm",
  //       "Start": 26,
  //       "End": 61,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-12-15T19:00,2016-12-15T20:00,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2016-12-15 19:00:00",
  //             "end": "2016-12-15 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Help me book a meeting tomorrow from 7:00 to 8:00pm",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "tomorrow from 7:00 to 8:00pm",
  //       "Start": 23,
  //       "End": 50,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-08T19:00,2016-11-08T20:00,PT1H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 19:00:00",
  //             "end": "2016-11-08 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "help me book a meeting between now and eight o'clock",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between now and eight o'clock",
  //       "Start": 23,
  //       "End": 51,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(PRESENT_REF,2016-11-07T20,PT9H40M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 10:20:00",
  //             "end": "2016-11-07 20:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "How many calls between eight o'clock and now?",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between eight o'clock and now",
  //       "Start": 15,
  //       "End": 43,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T08,PRESENT_REF,PT2H20M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 08:00:00",
  //             "end": "2016-11-07 10:20:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be away from 2pm till tomorrow 4:30pm",
  //   "Comment": "It should be resolved as 'from 2pm today till tomorrow 4:30pm'",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupported": "dotnet, java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from 2pm till tomorrow 4:30pm",
  //       "Start": 13,
  //       "End": 41,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-07T14,2016-11-08T16:30,PT26H30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-07 14:00:00",
  //             "end": "2016-11-08 14:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be away between 2 and 4:30pm tomorrow",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "between 2 and 4:30pm tomorrow",
  //       "Start": 13,
  //       "End": 41,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-08T14,2016-11-08T16:30,PT2H30M)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 14:00:00",
  //             "end": "2016-11-08 16:30:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be away between 2:00 tomorrow and 4:00",
  //   "Context": {"ReferenceDateTime": "2016-11-07T10:20:00"},
  //   "NotSupportedByDesign": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "between 2:00 tomorrow and 4:00",
  //       "Start": 13,
  //       "End": 42,
  //       "TypeName": "datetimeV2.datetimerange",
  //       "Resolution": {
  //         "values": [
  //           {
  //             "timex": "(2016-11-08T02:00,2016-11-08T04:00,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 02:00:00",
  //             "end": "2016-11-08 04:00:00"
  //           },
  //           {
  //             "timex": "(2016-11-08T14:00,2016-11-08T16:00,PT2H)",
  //             "type": "datetimerange",
  //             "start": "2016-11-08 14:00:00",
  //             "end": "2016-11-08 16:00:00"
  //           }
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave for 10D",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "10d",
  //       "Start": 15,
  //       "End": 17,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P10D", "type": "duration", "value": "864000"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "the plants were grown for 3Y",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "3y",
  //       "Start": 26,
  //       "End": 27,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3Y", "type": "duration", "value": "94608000"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "the cold lasted 2W",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java",
  //   "Results": [
  //     {
  //       "Text": "2w",
  //       "Start": 16,
  //       "End": 17,
  //       "TypeName": "datetimeV2.duration",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2W", "type": "duration", "value": "1209600"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "-2020-07-01-",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "2020-07-01",
  //       "Start": 1,
  //       "End": 10,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-07-01", "type": "date", "value": "2020-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "-20200701-",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "20200701",
  //       "Start": 1,
  //       "End": 8,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020-07-01", "type": "date", "value": "2020-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "www.example.com/users/12345/archive-2018-09-23-page-01",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "2018-09-23",
  //       "Start": 36,
  //       "End": 45,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2018-09-23", "type": "date", "value": "2018-09-23"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "www.example2.com/data/report-20170302.html",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, java",
  //   "Results": [
  //     {
  //       "Text": "20170302",
  //       "Start": 29,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2017-03-02", "type": "date", "value": "2017-03-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "DateTime search phrase 23.04.2022 14:55",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "23.04.2022 14:55",
  //       "Start": 23,
  //       "End": 38,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-04-23T14:55", "type": "datetime", "value": "2022-04-23 14:55:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "DateTime search phrase\n23.04.2022 14:55\n30.04.2022 12:04",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "23.04.2022 14:55",
  //       "Start": 23,
  //       "End": 38,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-04-23T14:55", "type": "datetime", "value": "2022-04-23 14:55:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "30.04.2022 12:04",
  //       "Start": 40,
  //       "End": 55,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-04-30T12:04", "type": "datetime", "value": "2022-04-30 12:04:00"},
  //           {"timex": "2022-04-30T00:04", "type": "datetime", "value": "2022-04-30 00:04:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "DateTime search phrase\n23.04.2022 14:55\n30.04.2022 12:04 some text 2020",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "23.04.2022 14:55",
  //       "Start": 23,
  //       "End": 38,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-04-23T14:55", "type": "datetime", "value": "2022-04-23 14:55:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "30.04.2022 12:04",
  //       "Start": 40,
  //       "End": 55,
  //       "TypeName": "datetimeV2.datetime",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-04-30T12:04", "type": "datetime", "value": "2022-04-30 12:04:00"},
  //           {"timex": "2022-04-30T00:04", "type": "datetime", "value": "2022-04-30 00:04:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "2020",
  //       "Start": 67,
  //       "End": 70,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2020", "type": "daterange", "start": "2020-01-01", "end": "2021-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off april 9th through 17th",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript",
  //   "Results": [
  //     {
  //       "Text": "april 9th through 17th",
  //       "Start": 9,
  //       "End": 30,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off april ninth through seventeenth",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "april ninth through seventeenth",
  //       "Start": 9,
  //       "End": 39,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off april ninth through 17th",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "april ninth through 17th",
  //       "Start": 9,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off april 9th through seventeenth",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "april 9th through seventeenth",
  //       "Start": 9,
  //       "End": 37,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off from ninth till seventeenth of april",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from ninth till seventeenth of april",
  //       "Start": 9,
  //       "End": 44,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off between ninth and seventeenth of april",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between ninth and seventeenth of april",
  //       "Start": 9,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off between the ninth and the seventeenth of april",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "between the ninth and the seventeenth of april",
  //       "Start": 9,
  //       "End": 54,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off from april the ninth till the seventeenth",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from april the ninth till the seventeenth",
  //       "Start": 9,
  //       "End": 49,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2016-04-09", "end": "2016-04-17"},
  //           {"timex": "(XXXX-04-09,XXXX-04-17,P8D)", "type": "daterange", "start": "2017-04-09", "end": "2017-04-17"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off from april twenty-seventh to the third",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "dotnet, java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from april twenty-seventh to the third",
  //       "Start": 9,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-04-27,XXXX-05-03,P6D)", "type": "daterange", "start": "2016-04-27", "end": "2016-05-03"},
  //           {"timex": "(XXXX-04-27,XXXX-05-03,P6D)", "type": "daterange", "start": "2017-04-27", "end": "2017-05-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "i am off from the twenty-seventh to the third of april",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "dotnet, java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "from the twenty-seventh to the third of april",
  //       "Start": 9,
  //       "End": 53,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-XX-27,XXXX-04-03,P158D)", "type": "daterange", "start": "2016-10-27", "end": "2017-04-03"},
  //           {"timex": "(XXXX-XX-27,XXXX-04-03,P127D)", "type": "daterange", "start": "2016-11-27", "end": "2017-04-03"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a 1:1 on monday",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "monday",
  //       "Start": 21,
  //       "End": 26,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2016-10-31"},
  //           {"timex": "XXXX-WXX-1", "type": "date", "value": "2016-11-07"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "This screen has a 4:3 aspect ratio.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "Results": []
  // },
  // {
  //   "Input": "I'll be back 7:56:30 am",
  //   "Context": {"ReferenceDateTime": "2016-11-07T08:00:00"},
  //   "Results": [
  //     {
  //       "Text": "7:56:30 am",
  //       "Start": 13,
  //       "End": 22,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T07:56:30", "type": "time", "value": "07:56:30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It's 20 min past eight in the evening",
  //   "Context": {"ReferenceDateTime": "2016-11-07T21:00:00"},
  //   "Results": [
  //     {
  //       "Text": "20 min past eight in the evening",
  //       "Start": 5,
  //       "End": 36,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T20:20", "type": "time", "value": "20:20:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back in the afternoon at 7",
  //   "Context": {"ReferenceDateTime": "2016-11-07T20:00:00"},
  //   "Results": [
  //     {
  //       "Text": "in the afternoon at 7",
  //       "Start": 13,
  //       "End": 33,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T19", "type": "time", "value": "19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back noonish",
  //   "Context": {"ReferenceDateTime": "2016-11-07T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "noonish",
  //       "Start": 13,
  //       "End": 19,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T12", "type": "time", "value": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back 11ish",
  //   "Context": {"ReferenceDateTime": "2016-11-07T13:00:00"},
  //   "Results": [
  //     {
  //       "Text": "11ish",
  //       "Start": 13,
  //       "End": 17,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T11", "type": "time", "value": "11:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "they were working in the night-time",
  //   "Context": {"ReferenceDateTime": "2016-11-07T23:12:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "in the night-time",
  //       "Start": 18,
  //       "End": 34,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TNT", "type": "timerange", "start": "00:00:00", "end": "08:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll go back Nov/2",
  //   "Context": {"ReferenceDateTime": "2016-11-02T10:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "nov/2",
  //       "Start": 13,
  //       "End": 17,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11-02", "type": "date", "value": "2016-11-02"},
  //           {"timex": "XXXX-11-02", "type": "date", "value": "2017-11-02"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me from 2 july to 10 july",
  //   "Context": {"ReferenceDateTime": "2022-07-10T10:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "from 2 july to 10 july",
  //       "Start": 8,
  //       "End": 29,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XXXX-07-02,XXXX-07-10,P8D)", "type": "daterange", "start": "2022-07-02", "end": "2022-07-10"},
  //           {"timex": "(XXXX-07-02,XXXX-07-10,P8D)", "type": "daterange", "start": "2023-07-02", "end": "2023-07-10"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the last quarter",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "last quarter",
  //       "Start": 27,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-04-01,2019-07-01,P3M)", "type": "daterange", "start": "2019-04-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the last 2 quarters",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "last 2 quarters",
  //       "Start": 27,
  //       "End": 41,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2019-07-01,P6M)", "type": "daterange", "start": "2019-01-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the past two quarters",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "past two quarters",
  //       "Start": 27,
  //       "End": 43,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-01-01,2019-07-01,P6M)", "type": "daterange", "start": "2019-01-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the previous three quarters",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "previous three quarters",
  //       "Start": 27,
  //       "End": 49,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2018-10-01,2019-07-01,P9M)", "type": "daterange", "start": "2018-10-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the previous eleven quarters",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "previous eleven quarters",
  //       "Start": 27,
  //       "End": 50,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2016-10-01,2019-07-01,P33M)", "type": "daterange", "start": "2016-10-01", "end": "2019-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the next quarter",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "next quarter",
  //       "Start": 27,
  //       "End": 38,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-10-01,2020-01-01,P3M)", "type": "daterange", "start": "2019-10-01", "end": "2020-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the following 2 quarters",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "following 2 quarters",
  //       "Start": 27,
  //       "End": 46,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-10-01,2020-04-01,P6M)", "type": "daterange", "start": "2019-10-01", "end": "2020-04-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the coming three quarters",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "coming three quarters",
  //       "Start": 27,
  //       "End": 47,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-10-01,2020-07-01,P9M)", "type": "daterange", "start": "2019-10-01", "end": "2020-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "What are the sales for the next 7 quarters",
  //   "Context": {"ReferenceDateTime": "2019-07-04T00:00:00"},
  //   "NotSupported": "java, python",
  //   "Results": [
  //     {
  //       "Text": "next 7 quarters",
  //       "Start": 27,
  //       "End": 41,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(2019-10-01,2021-07-01,P21M)", "type": "daterange", "start": "2019-10-01", "end": "2021-07-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Listen to 1990s music",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "1990s",
  //       "Start": 10,
  //       "End": 14,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(1990-01-01,2000-01-01,P10Y)", "type": "daterange", "start": "1990-01-01", "end": "2000-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Who are us presidents in nineties",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "nineties",
  //       "Start": 25,
  //       "End": 32,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(XX90-01-01,XX00-01-01,P10Y)", "type": "daterange", "start": "1990-01-01", "end": "2000-01-01"},
  //           {"timex": "(XX90-01-01,XX00-01-01,P10Y)", "type": "daterange", "start": "2090-01-01", "end": "2100-01-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back at 7ampm",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "7ampm",
  //       "Start": 16,
  //       "End": 20,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T07", "type": "time", "value": "07:00:00"},
  //           {"timex": "T19", "type": "time", "value": "19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll be back at 7p",
  //   "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "7p",
  //       "Start": 16,
  //       "End": 17,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T19", "type": "time", "value": "19:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet on eid al fitr",
  //   "Context": {"ReferenceDateTime": "2022-06-17T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "eid al fitr",
  //       "Start": 8,
  //       "End": 18,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-05-02", "type": "date", "value": "2022-05-02"},
  //           {"timex": "XXXX-05-02", "type": "date", "value": "2023-04-21"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a 1:1 meeting",
  //   "Comment": "Tasksmode supress 1:1 from getting categorised as time.",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": []
  // },
  // {
  //   "Input": "schedule me a 1:1 meeting on 14 nov",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "14 nov",
  //       "Start": 29,
  //       "End": 34,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-11-14", "type": "date", "value": "2015-11-14"},
  //           {"timex": "XXXX-11-14", "type": "date", "value": "2016-11-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a 1:1 on saturday",
  //   "Context": {"ReferenceDateTime": "2022-04-27T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "saturday",
  //       "Start": 21,
  //       "End": 28,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-6", "type": "date", "value": "2022-04-23"},
  //           {"timex": "XXXX-WXX-6", "type": "date", "value": "2022-04-30"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "schedule me a 1:1 meeting 14 nov 2023",
  //   "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "14 nov 2023",
  //       "Start": 26,
  //       "End": 36,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023-11-14", "type": "date", "value": "2023-11-14"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Take medicines after dinner tomorrow",
  //   "Context": {"ReferenceDateTime": "2022-07-27T10:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "after dinner",
  //       "Start": 15,
  //       "End": 26,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMED", "Mod": "after", "type": "timerange", "start": "20:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tomorrow",
  //       "Start": 28,
  //       "End": 35,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-07-28", "type": "date", "value": "2022-07-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "Take medicines after dinnertime tomorrow",
  //   "Context": {"ReferenceDateTime": "2022-07-27T10:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "after dinnertime",
  //       "Start": 15,
  //       "End": 30,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMED", "Mod": "after", "type": "timerange", "start": "20:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tomorrow",
  //       "Start": 32,
  //       "End": 39,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-07-28", "type": "date", "value": "2022-07-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "let's meet at lunch tomorrow.",
  //   "Context": {"ReferenceDateTime": "2022-07-27T10:00:00"},
  //   "NotSupported": "java, javascript, python",
  //   "Results": [
  //     {
  //       "Text": "at lunch",
  //       "Start": 11,
  //       "End": 18,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMEL", "type": "timerange", "start": "11:00:00", "end": "13:00:00"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "tomorrow",
  //       "Start": 20,
  //       "End": 27,
  //       "TypeName": "datetimeV2.date",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-07-28", "type": "date", "value": "2022-07-28"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next month",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next month",
  //       "Start": 8,
  //       "End": 17,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-05", "type": "daterange", "start": "2022-05-01", "end": "2022-06-01"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next month in morning",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next month",
  //       "Start": 8,
  //       "End": 17,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-05", "type": "daterange", "start": "2022-05-01", "end": "2022-06-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "in morning",
  //       "Start": 19,
  //       "End": 28,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "timerange", "start": "08:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next month at 6pm",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next month",
  //       "Start": 8,
  //       "End": 17,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-05", "type": "daterange", "start": "2022-05-01", "end": "2022-06-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "6pm",
  //       "Start": 22,
  //       "End": 24,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T18", "type": "time", "value": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet next month between 2:20 to 3pm",
  //   "Context": {"ReferenceDateTime": "2022-04-29T13:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next month",
  //       "Start": 5,
  //       "End": 14,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-05", "type": "daterange", "start": "2022-05-01", "end": "2022-06-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "between 2:20 to 3pm",
  //       "Start": 16,
  //       "End": 34,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T14:20,T15,PT40M)", "type": "timerange", "start": "14:20:00", "end": "15:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet next month after 3pm",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next month",
  //       "Start": 5,
  //       "End": 14,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-05", "type": "daterange", "start": "2022-05-01", "end": "2022-06-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "after 3pm",
  //       "Start": 16,
  //       "End": 24,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T15", "Mod": "after", "type": "timerange", "sourceEntity": "datetimepoint", "start": "15:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next year at 6pm",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next year",
  //       "Start": 8,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023", "type": "daterange", "start": "2023-01-01", "end": "2024-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "6pm",
  //       "Start": 21,
  //       "End": 23,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T18", "type": "time", "value": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next year at 6.",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next year",
  //       "Start": 8,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023", "type": "daterange", "start": "2023-01-01", "end": "2024-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "6",
  //       "Start": 21,
  //       "End": 21,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T06", "type": "time", "value": "06:00:00"},
  //           {"timex": "T18", "type": "time", "value": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next year between 2:20 to 3pm",
  //   "Context": {"ReferenceDateTime": "2022-04-29T13:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "next year",
  //       "Start": 8,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023", "type": "daterange", "start": "2023-01-01", "end": "2024-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "between 2:20 to 3pm",
  //       "Start": 18,
  //       "End": 36,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "(T14:20,T15,PT40M)", "type": "timerange", "start": "14:20:00", "end": "15:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next year after 3pm",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next year",
  //       "Start": 8,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023", "type": "daterange", "start": "2023-01-01", "end": "2024-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "after 3pm",
  //       "Start": 18,
  //       "End": 26,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T15", "Mod": "after", "type": "timerange", "sourceEntity": "datetimepoint", "start": "15:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next month at 6.",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next month",
  //       "Start": 8,
  //       "End": 17,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2022-05", "type": "daterange", "start": "2022-05-01", "end": "2022-06-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "6",
  //       "Start": 22,
  //       "End": 22,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T06", "type": "time", "value": "06:00:00"},
  //           {"timex": "T18", "type": "time", "value": "18:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "meet me next year in morning",
  //   "Context": {"ReferenceDateTime": "2022-04-29T00:00:00"},
  //   "NotSupported": "javascript, python",
  //   "Results": [
  //     {
  //       "Text": "next year",
  //       "Start": 8,
  //       "End": 16,
  //       "TypeName": "datetimeV2.daterange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "2023", "type": "daterange", "start": "2023-01-01", "end": "2024-01-01"}
  //         ]
  //       }
  //     },
  //     {
  //       "Text": "in morning",
  //       "Start": 18,
  //       "End": 27,
  //       "TypeName": "datetimeV2.timerange",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "timerange", "start": "08:00:00", "end": "12:00:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave everyday 6am",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "everyday 6am",
  //       "Start": 11,
  //       "End": 22,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T06", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave 6am everyday",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "6am everyday",
  //       "Start": 11,
  //       "End": 22,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T06", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "remind me to pay bill on 19th of every month.",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "19th of every month",
  //       "Start": 25,
  //       "End": 43,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-XX-19", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "plan trip quarterly",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "quarterly",
  //       "Start": 10,
  //       "End": 18,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P3M", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave every Sunday.",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every sunday",
  //       "Start": 11,
  //       "End": 22,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "XXXX-WXX-7", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "dinner on me every night.",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every night",
  //       "Start": 13,
  //       "End": 23,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TNI", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "we will run every morning",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every morning",
  //       "Start": 12,
  //       "End": 24,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "TMO", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll leave early every other day",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every other day",
  //       "Start": 17,
  //       "End": 31,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P2D", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I'll take a run weekly",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "weekly",
  //       "Start": 16,
  //       "End": 21,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1W", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "we will meet after school every weekend.",
  //   "Context": {"ReferenceDateTime": "2022-08-22T01:00:00"},
  //   "NotSupported": "javascript, python, java",
  //   "Results": [
  //     {
  //       "Text": "every weekend",
  //       "Start": 26,
  //       "End": 38,
  //       "TypeName": "datetimeV2.set",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "P1WE", "type": "set", "value": "not resolved"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I made this purchase at 10 past 9",
  //   "Context": {"ReferenceDateTime": "2023-03-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "10 past 9",
  //       "Start": 24,
  //       "End": 32,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T09:10", "type": "time", "value": "09:10:00"},
  //           {"timex": "T21:10", "type": "time", "value": "21:10:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It's 15 past seven o'clock",
  //   "Context": {"ReferenceDateTime": "2023-03-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "15 past seven o'clock",
  //       "Start": 5,
  //       "End": 25,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T07:15", "type": "time", "value": "07:15:00"},
  //           {"timex": "T19:15", "type": "time", "value": "19:15:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "I made this purchase at ten past 9 in the evening",
  //   "Context": {"ReferenceDateTime": "2023-03-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "ten past 9 in the evening",
  //       "Start": 24,
  //       "End": 48,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T21:10", "type": "time", "value": "21:10:00"}
  //         ]
  //       }
  //     }
  //   ]
  // },
  // {
  //   "Input": "It's fifteen past eight in the morning",
  //   "Context": {"ReferenceDateTime": "2023-03-01T00:00:00"},
  //   "Results": [
  //     {
  //       "Text": "fifteen past eight in the morning",
  //       "Start": 5,
  //       "End": 37,
  //       "TypeName": "datetimeV2.time",
  //       "Resolution": {
  //         "values": [
  //           {"timex": "T08:15", "type": "time", "value": "08:15:00"}
  //         ]
  //       }
  //     }
  //   ]
  // }
];
