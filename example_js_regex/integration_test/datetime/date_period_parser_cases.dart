const datePeriodParserTestCases = [
  {
    "Input": "I'll be out from 4 to 22 this month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "from 4 to 22 this month",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-04,2016-11-22,P18D)",
          "FutureResolution": {"startDate": "2016-11-04", "endDate": "2016-11-22"},
          "PastResolution": {"startDate": "2016-11-04", "endDate": "2016-11-22"}
        },
        "Start": 12,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll be out from 4-23 in next month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "from 4-23 in next month",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-12-04,2016-12-23,P19D)",
          "FutureResolution": {"startDate": "2016-12-04", "endDate": "2016-12-23"},
          "PastResolution": {"startDate": "2016-12-04", "endDate": "2016-12-23"}
        },
        "Start": 12,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll be out from 3 until 12 of sept hahaha",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "from 3 until 12 of sept",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-09-03,XXXX-09-12,P9D)",
          "FutureResolution": {"startDate": "2017-09-03", "endDate": "2017-09-12"},
          "PastResolution": {"startDate": "2016-09-03", "endDate": "2016-09-12"}
        },
        "Start": 12,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll be out from friday the 11th until tuesday the 15th",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "from friday the 11th until tuesday the 15th",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-11,2016-11-15,P4D)",
          "FutureResolution": {"startDate": "2016-11-11", "endDate": "2016-11-15"},
          "PastResolution": {"startDate": "2016-11-11", "endDate": "2016-11-15"}
        },
        "Start": 12,
        "Length": 43
      }
    ]
  },
  {
    "Input": "I'll be out 4 to 23 next month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "4 to 23 next month",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-12-04,2016-12-23,P19D)",
          "FutureResolution": {"startDate": "2016-12-04", "endDate": "2016-12-23"},
          "PastResolution": {"startDate": "2016-12-04", "endDate": "2016-12-23"}
        },
        "Start": 12,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll be out 4 till 23 of this month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "4 till 23 of this month",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-04,2016-11-23,P19D)",
          "FutureResolution": {"startDate": "2016-11-04", "endDate": "2016-11-23"},
          "PastResolution": {"startDate": "2016-11-04", "endDate": "2016-11-23"}
        },
        "Start": 12,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll be out between 4 and 22 this month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "between 4 and 22 this month",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-04,2016-11-22,P18D)",
          "FutureResolution": {"startDate": "2016-11-04", "endDate": "2016-11-22"},
          "PastResolution": {"startDate": "2016-11-04", "endDate": "2016-11-22"}
        },
        "Start": 12,
        "Length": 27
      }
    ]
  },
  {
    "Input": "I'll be out between 3 and 12 of sept hahaha",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "between 3 and 12 of sept",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-09-03,XXXX-09-12,P9D)",
          "FutureResolution": {"startDate": "2017-09-03", "endDate": "2017-09-12"},
          "PastResolution": {"startDate": "2016-09-03", "endDate": "2016-09-12"}
        },
        "Start": 12,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll be out from 4 to 22 january, 1995",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "from 4 to 22 january, 1995",
        "Type": "daterange",
        "Value": {
          "Timex": "(1995-01-04,1995-01-22,P18D)",
          "FutureResolution": {"startDate": "1995-01-04", "endDate": "1995-01-22"},
          "PastResolution": {"startDate": "1995-01-04", "endDate": "1995-01-22"}
        },
        "Start": 12,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I'll be out between 4-22 january, 1995",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "between 4-22 january, 1995",
        "Type": "daterange",
        "Value": {
          "Timex": "(1995-01-04,1995-01-22,P18D)",
          "FutureResolution": {"startDate": "1995-01-04", "endDate": "1995-01-22"},
          "PastResolution": {"startDate": "1995-01-04", "endDate": "1995-01-22"}
        },
        "Start": 12,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I'll be out between september 4th through september 8th",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "between september 4th through september 8th",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-09-04,XXXX-09-08,P4D)",
          "FutureResolution": {"startDate": "2017-09-04", "endDate": "2017-09-08"},
          "PastResolution": {"startDate": "2016-09-04", "endDate": "2016-09-08"}
        },
        "Start": 12,
        "Length": 43
      }
    ]
  },
  {
    "Input": "I'll be out on this week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"}
        },
        "Start": 15,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out on the coming week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "coming week",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W46",
          "FutureResolution": {"startDate": "2016-11-14", "endDate": "2016-11-21"},
          "PastResolution": {"startDate": "2016-11-14", "endDate": "2016-11-21"}
        },
        "Start": 19,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll be out on current week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "current week",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"}
        },
        "Start": 15,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll be out february",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "february",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-02",
          "FutureResolution": {"startDate": "2017-02-01", "endDate": "2017-03-01"},
          "PastResolution": {"startDate": "2016-02-01", "endDate": "2016-03-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out this september",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this september",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-09",
          "FutureResolution": {"startDate": "2016-09-01", "endDate": "2016-10-01"},
          "PastResolution": {"startDate": "2016-09-01", "endDate": "2016-10-01"}
        },
        "Start": 12,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll be out last sept",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "last sept",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-09",
          "FutureResolution": {"startDate": "2015-09-01", "endDate": "2015-10-01"},
          "PastResolution": {"startDate": "2015-09-01", "endDate": "2015-10-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out next june",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next june",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-06",
          "FutureResolution": {"startDate": "2017-06-01", "endDate": "2017-07-01"},
          "PastResolution": {"startDate": "2017-06-01", "endDate": "2017-07-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out the third week of this month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the third week of this month",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11-W03",
          "FutureResolution": {"startDate": "2016-11-14", "endDate": "2016-11-21"},
          "PastResolution": {"startDate": "2016-11-14", "endDate": "2016-11-21"}
        },
        "Start": 12,
        "Length": 28
      }
    ]
  },
  {
    "Input": "I'll be out the last week of july",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the last week of july",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-07-W05",
          "FutureResolution": {"startDate": "2017-07-24", "endDate": "2017-07-31"},
          "PastResolution": {"startDate": "2016-07-25", "endDate": "2016-08-01"}
        },
        "Start": 12,
        "Length": 21
      }
    ]
  },
  {
    "Input": "week of september.16th",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "week of september.16th",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-09-16",
          "FutureResolution": {"startDate": "2017-09-11", "endDate": "2017-09-18"},
          "PastResolution": {"startDate": "2016-09-12", "endDate": "2016-09-19"}
        },
        "Start": 0,
        "Length": 22
      }
    ]
  },
  {
    "Input": "month of september.16th",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "month of september.16th",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-09-16",
          "FutureResolution": {"startDate": "2017-09-01", "endDate": "2017-10-01"},
          "PastResolution": {"startDate": "2016-09-01", "endDate": "2016-10-01"}
        },
        "Start": 0,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll be out 2015.3",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2015.3",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-03",
          "FutureResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"},
          "PastResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"}
        },
        "Start": 12,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll be out 2015-3",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2015-3",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-03",
          "FutureResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"},
          "PastResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"}
        },
        "Start": 12,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll be out 2015/3",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2015/3",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-03",
          "FutureResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"},
          "PastResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"}
        },
        "Start": 12,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll be out 3/2015",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3/2015",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-03",
          "FutureResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"},
          "PastResolution": {"startDate": "2015-03-01", "endDate": "2015-04-01"}
        },
        "Start": 12,
        "Length": 6
      }
    ]
  },
  {
    "Input": "schedule a meeting in two weeks",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": []
  },
  {
    "Input": "next 2 days",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next 2 days",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-08,2016-11-10,P2D)",
          "FutureResolution": {"startDate": "2016-11-08", "endDate": "2016-11-10"},
          "PastResolution": {"startDate": "2016-11-08", "endDate": "2016-11-10"}
        },
        "Start": 0,
        "Length": 11
      }
    ]
  },
  {
    "Input": "past few days",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "past few days",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-04,2016-11-07,P3D)",
          "FutureResolution": {"startDate": "2016-11-04", "endDate": "2016-11-07"},
          "PastResolution": {"startDate": "2016-11-04", "endDate": "2016-11-07"}
        },
        "Start": 0,
        "Length": 13
      }
    ]
  },
  {
    "Input": "the week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the week",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"}
        },
        "Start": 0,
        "Length": 8
      }
    ]
  },
  {
    "Input": "The union suspended strike action this week.",
    "Context": {"ReferenceDateTime": "2026-01-01T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2026-W01",
          "FutureResolution": {"startDate": "2025-12-29", "endDate": "2026-01-05"},
          "PastResolution": {"startDate": "2025-12-29", "endDate": "2026-01-05"}
        },
        "Start": 34,
        "Length": 9
      }
    ]
  },
  {
    "Input": "my week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "my week",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-14"}
        },
        "Start": 0,
        "Length": 7
      }
    ]
  },
  {
    "Input": "the weekend",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the weekend",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45-WE",
          "FutureResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"}
        },
        "Start": 0,
        "Length": 11
      }
    ]
  },
  {
    "Input": "this weekend",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this weekend",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45-WE",
          "FutureResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"}
        },
        "Start": 0,
        "Length": 12
      }
    ]
  },
  {
    "Input": "my weekend",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "my weekend",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45-WE",
          "FutureResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"}
        },
        "Start": 0,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll be out oct. 2 to october 22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "oct. 2 to october 22",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-10-02,XXXX-10-22,P20D)",
          "FutureResolution": {"startDate": "2017-10-02", "endDate": "2017-10-22"},
          "PastResolution": {"startDate": "2016-10-02", "endDate": "2016-10-22"}
        },
        "Start": 12,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll be out january 12, 2016 - 01/22/2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "january 12, 2016 - 01/22/2016",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-01-12,2016-01-22,P10D)",
          "FutureResolution": {"startDate": "2016-01-12", "endDate": "2016-01-22"},
          "PastResolution": {"startDate": "2016-01-12", "endDate": "2016-01-22"}
        },
        "Start": 12,
        "Length": 29
      }
    ]
  },
  {
    "Input": "I'll be out 1st jan until wed, 22 of jan",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "1st jan until wed, 22 of jan",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-01-01,XXXX-01-22,P21D)",
          "FutureResolution": {"startDate": "2017-01-01", "endDate": "2017-01-22"},
          "PastResolution": {"startDate": "2016-01-01", "endDate": "2016-01-22"}
        },
        "Start": 12,
        "Length": 28
      }
    ]
  },
  {
    "Input": "I'll be out today till tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "today till tomorrow",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-08,P1D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-08"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-08"}
        },
        "Start": 12,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll be out from oct. 2 to october 22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "from oct. 2 to october 22",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-10-02,XXXX-10-22,P20D)",
          "FutureResolution": {"startDate": "2017-10-02", "endDate": "2017-10-22"},
          "PastResolution": {"startDate": "2016-10-02", "endDate": "2016-10-22"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out between oct. 2 and october 22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "between oct. 2 and october 22",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-10-02,XXXX-10-22,P20D)",
          "FutureResolution": {"startDate": "2017-10-02", "endDate": "2017-10-22"},
          "PastResolution": {"startDate": "2016-10-02", "endDate": "2016-10-22"}
        },
        "Start": 12,
        "Length": 29
      }
    ]
  },
  {
    "Input": "I'll be out november 19-20",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "november 19-20",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-11-19,XXXX-11-20,P1D)",
          "FutureResolution": {"startDate": "2016-11-19", "endDate": "2016-11-20"},
          "PastResolution": {"startDate": "2015-11-19", "endDate": "2015-11-20"}
        },
        "Start": 12,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll be out november 19 to 20",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "november 19 to 20",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-11-19,XXXX-11-20,P1D)",
          "FutureResolution": {"startDate": "2016-11-19", "endDate": "2016-11-20"},
          "PastResolution": {"startDate": "2015-11-19", "endDate": "2015-11-20"}
        },
        "Start": 12,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll be out november between 19 and 20",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "november between 19 and 20",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-11-19,XXXX-11-20,P1D)",
          "FutureResolution": {"startDate": "2016-11-19", "endDate": "2016-11-20"},
          "PastResolution": {"startDate": "2015-11-19", "endDate": "2015-11-20"}
        },
        "Start": 12,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I'll be out rest of the week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest of the week",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-13,P6D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"}
        },
        "Start": 12,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll be out rest of week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest of week",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-13,P6D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"}
        },
        "Start": 12,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll be out rest the week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest the week",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-13,P6D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"}
        },
        "Start": 12,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll be out rest this week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest this week",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-13,P6D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"}
        },
        "Start": 12,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll be out rest of my week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest of my week",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-13,P6D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"}
        },
        "Start": 12,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll be out rest of current week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest of current week",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-13,P6D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-13"}
        },
        "Start": 12,
        "Length": 20
      }
    ]
  },
  {
    "Input": "I'll be out rest of the month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest of the month",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-11-30,P24D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-11-30"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-11-30"}
        },
        "Start": 12,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll be out rest of the year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "rest of the year",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-07,2016-12-31,P55D)",
          "FutureResolution": {"startDate": "2016-11-07", "endDate": "2016-12-31"},
          "PastResolution": {"startDate": "2016-11-07", "endDate": "2016-12-31"}
        },
        "Start": 12,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll be out rest of my week",
    "Context": {"ReferenceDateTime": "2016-11-13T00:00:00"},
    "Results": [
      {
        "Text": "rest of my week",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-13,2016-11-13,P0D)",
          "FutureResolution": {"startDate": "2016-11-13", "endDate": "2016-11-13"},
          "PastResolution": {"startDate": "2016-11-13", "endDate": "2016-11-13"}
        },
        "Start": 12,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll be out on weekend",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "weekend",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45-WE",
          "FutureResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"}
        },
        "Start": 15,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out on this weekend",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this weekend",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W45-WE",
          "FutureResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"}
        },
        "Start": 15,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll be out june 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "june 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-06",
          "FutureResolution": {"startDate": "2016-06-01", "endDate": "2016-07-01"},
          "PastResolution": {"startDate": "2016-06-01", "endDate": "2016-07-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out june next year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "june next year",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-06",
          "FutureResolution": {"startDate": "2017-06-01", "endDate": "2017-07-01"},
          "PastResolution": {"startDate": "2017-06-01", "endDate": "2017-07-01"}
        },
        "Start": 12,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll be out next year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next year",
        "Type": "daterange",
        "Value": {
          "Timex": "2017",
          "FutureResolution": {"startDate": "2017-01-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2017-01-01", "endDate": "2018-01-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out next 3 days",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next 3 days",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-08,2016-11-11,P3D)",
          "FutureResolution": {"startDate": "2016-11-08", "endDate": "2016-11-11"},
          "PastResolution": {"startDate": "2016-11-08", "endDate": "2016-11-11"}
        },
        "Start": 12,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll be out next 3 months",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next 3 months",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-08,2017-02-08,P3M)",
          "FutureResolution": {"startDate": "2016-11-08", "endDate": "2017-02-08"},
          "PastResolution": {"startDate": "2016-11-08", "endDate": "2017-02-08"}
        },
        "Start": 12,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll be out in 3 years",
    "NotSupported": "javascript, python",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": []
  },
  {
    "Input": "I'll be out past 3 weeks",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "past 3 weeks",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-10-17,2016-11-07,P3W)",
          "FutureResolution": {"startDate": "2016-10-17", "endDate": "2016-11-07"},
          "PastResolution": {"startDate": "2016-10-17", "endDate": "2016-11-07"}
        },
        "Start": 12,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll be out last 3year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "last 3year",
        "Type": "daterange",
        "Value": {
          "Timex": "(2013-11-07,2016-11-07,P3Y)",
          "FutureResolution": {"startDate": "2013-11-07", "endDate": "2016-11-07"},
          "PastResolution": {"startDate": "2013-11-07", "endDate": "2016-11-07"}
        },
        "Start": 12,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll be out previous 3 weeks",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "previous 3 weeks",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-10-17,2016-11-07,P3W)",
          "FutureResolution": {"startDate": "2016-10-17", "endDate": "2016-11-07"},
          "PastResolution": {"startDate": "2016-10-17", "endDate": "2016-11-07"}
        },
        "Start": 12,
        "Length": 16
      }
    ]
  },
  {
    "Input": "the first week of oct",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the first week of oct",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-10-W01",
          "FutureResolution": {"startDate": "2017-10-02", "endDate": "2017-10-09"},
          "PastResolution": {"startDate": "2016-10-03", "endDate": "2016-10-10"}
        },
        "Start": 0,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll be out the third week of 2027",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the third week of 2027",
        "Type": "daterange",
        "Value": {
          "Timex": "2027-W03",
          "FutureResolution": {"startDate": "2027-01-18", "endDate": "2027-01-25"},
          "PastResolution": {"startDate": "2027-01-18", "endDate": "2027-01-25"}
        },
        "Start": 12,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll be out the third week next year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the third week next year",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W03",
          "FutureResolution": {"startDate": "2017-01-16", "endDate": "2017-01-23"},
          "PastResolution": {"startDate": "2017-01-16", "endDate": "2017-01-23"}
        },
        "Start": 12,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll be out the third quarter of 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the third quarter of 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2016-10-01,P3M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out the third quarter this year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the third quarter this year",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2016-10-01,P3M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"}
        },
        "Start": 12,
        "Length": 27
      }
    ]
  },
  {
    "Input": "I'll be out 2016 the third quarter",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 the third quarter",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2016-10-01,P3M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"}
        },
        "Start": 12,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll be out during q3 this year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "q3 this year",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2016-10-01,P3M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"}
        },
        "Start": 19,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll be out 2016 q3",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 q3",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2016-10-01,P3M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"}
        },
        "Start": 12,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be back during q3",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "q3",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-07-01,XXXX-10-01,P3M)",
          "FutureResolution": {"startDate": "2017-07-01", "endDate": "2017-10-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2016-10-01"}
        },
        "Start": 20,
        "Length": 2
      }
    ]
  },
  {
    "Input": "I'll be back during q2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "q2",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-04-01,XXXX-07-01,P3M)",
          "FutureResolution": {"startDate": "2017-04-01", "endDate": "2017-07-01"},
          "PastResolution": {"startDate": "2016-04-01", "endDate": "2016-07-01"}
        },
        "Start": 20,
        "Length": 2
      }
    ]
  },
  {
    "Input": "I'll be back q1 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "q1 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-01-01,2016-04-01,P3M)",
          "FutureResolution": {"startDate": "2016-01-01", "endDate": "2016-04-01"},
          "PastResolution": {"startDate": "2016-01-01", "endDate": "2016-04-01"}
        },
        "Start": 13,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out during q4 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "q4 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-10-01,2017-01-01,P3M)",
          "FutureResolution": {"startDate": "2016-10-01", "endDate": "2017-01-01"},
          "PastResolution": {"startDate": "2016-10-01", "endDate": "2017-01-01"}
        },
        "Start": 19,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out during h1 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "h1 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-01-01,2016-07-01,P6M)",
          "FutureResolution": {"startDate": "2016-01-01", "endDate": "2016-07-01"},
          "PastResolution": {"startDate": "2016-01-01", "endDate": "2016-07-01"}
        },
        "Start": 19,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out during h2 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "h2 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2017-01-01,P6M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"}
        },
        "Start": 19,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out during 2016 h2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 h2",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2017-01-01,P6M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"}
        },
        "Start": 19,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out during 2016h2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016h2",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-07-01,2017-01-01,P6M)",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"}
        },
        "Start": 19,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll be out during h2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": []
  },
  {
    "Input": "I'll leave this summer",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this summer",
        "Type": "daterange",
        "Value": {"Timex": "2016-SU", "FutureResolution": {}, "PastResolution": {}},
        "Start": 11,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll leave next spring",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next spring",
        "Type": "daterange",
        "Value": {"Timex": "2017-SP", "FutureResolution": {}, "PastResolution": {}},
        "Start": 11,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll leave the summer",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the summer",
        "Type": "daterange",
        "Value": {"Timex": "SU", "FutureResolution": {}, "PastResolution": {}},
        "Start": 11,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll leave summer",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "summer",
        "Type": "daterange",
        "Value": {"Timex": "SU", "FutureResolution": {}, "PastResolution": {}},
        "Start": 11,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll leave summer 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "summer 2016",
        "Type": "daterange",
        "Value": {"Timex": "2016-SU", "FutureResolution": {}, "PastResolution": {}},
        "Start": 11,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll leave summer of 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "summer of 2016",
        "Type": "daterange",
        "Value": {"Timex": "2016-SU", "FutureResolution": {}, "PastResolution": {}},
        "Start": 11,
        "Length": 14
      }
    ]
  },
  {
    "Input": "upcoming month holidays",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "upcoming month",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-12",
          "FutureResolution": {"startDate": "2016-12-01", "endDate": "2017-01-01"},
          "PastResolution": {"startDate": "2016-12-01", "endDate": "2017-01-01"}
        },
        "Start": 0,
        "Length": 14
      }
    ]
  },
  {
    "Input": "next month holidays",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next month",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-12",
          "FutureResolution": {"startDate": "2016-12-01", "endDate": "2017-01-01"},
          "PastResolution": {"startDate": "2016-12-01", "endDate": "2017-01-01"}
        },
        "Start": 0,
        "Length": 10
      }
    ]
  },
  {
    "Input": "Please find us a time to meet late this month",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "late this month",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-11",
          "Mod": "end",
          "FutureResolution": {"startDate": "2017-11-16", "endDate": "2017-12-01"},
          "PastResolution": {"startDate": "2017-11-16", "endDate": "2017-12-01"}
        },
        "Start": 30,
        "Length": 15
      }
    ]
  },
  {
    "Input": "Please find us a time to meet late this week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "late this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W45",
          "Mod": "end",
          "FutureResolution": {"startDate": "2017-11-09", "endDate": "2017-11-13"},
          "PastResolution": {"startDate": "2017-11-09", "endDate": "2017-11-13"}
        },
        "Start": 30,
        "Length": 14
      }
    ]
  },
  {
    "Input": "Please find us a time to meet late this year",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "late this year",
        "Type": "daterange",
        "Value": {
          "Timex": "2017",
          "Mod": "end",
          "FutureResolution": {"startDate": "2017-07-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2017-07-01", "endDate": "2018-01-01"}
        },
        "Start": 30,
        "Length": 14
      }
    ]
  },
  {
    "Input": "Please find us a time to meet early next year",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "early next year",
        "Type": "daterange",
        "Value": {
          "Timex": "2018",
          "Mod": "start",
          "FutureResolution": {"startDate": "2018-01-01", "endDate": "2018-07-01"},
          "PastResolution": {"startDate": "2018-01-01", "endDate": "2018-07-01"}
        },
        "Start": 30,
        "Length": 15
      }
    ]
  },
  {
    "Input": "Please find us a time to meet early next week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "early next week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W46",
          "Mod": "start",
          "FutureResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"},
          "PastResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"}
        },
        "Start": 30,
        "Length": 15
      }
    ]
  },
  {
    "Input": "Please find us a time to meet early next month",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "early next month",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-12",
          "Mod": "start",
          "FutureResolution": {"startDate": "2017-12-01", "endDate": "2017-12-16"},
          "PastResolution": {"startDate": "2017-12-01", "endDate": "2017-12-16"}
        },
        "Start": 30,
        "Length": 16
      }
    ]
  },
  {
    "Input": "We had a meeting late last year",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "late last year",
        "Type": "daterange",
        "Value": {
          "Timex": "2016",
          "Mod": "end",
          "FutureResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"},
          "PastResolution": {"startDate": "2016-07-01", "endDate": "2017-01-01"}
        },
        "Start": 17,
        "Length": 14
      }
    ]
  },
  {
    "Input": "We had a meeting late last week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "late last week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W44",
          "Mod": "end",
          "FutureResolution": {"startDate": "2017-11-02", "endDate": "2017-11-06"},
          "PastResolution": {"startDate": "2017-11-02", "endDate": "2017-11-06"}
        },
        "Start": 17,
        "Length": 14
      }
    ]
  },
  {
    "Input": "We had a meeting late last month",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "Results": [
      {
        "Text": "late last month",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-10",
          "Mod": "end",
          "FutureResolution": {"startDate": "2017-10-16", "endDate": "2017-11-01"},
          "PastResolution": {"startDate": "2017-10-16", "endDate": "2017-11-01"}
        },
        "Start": 17,
        "Length": 15
      }
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio next week between wednesday and friday.",
    "Context": {"ReferenceDateTime": "2017-11-14T00:00:00"},
    "Results": [
      {
        "Text": "next week between wednesday and friday",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-22,2017-11-24,P2D)",
          "FutureResolution": {"startDate": "2017-11-22", "endDate": "2017-11-24"},
          "PastResolution": {"startDate": "2017-11-22", "endDate": "2017-11-24"}
        },
        "Start": 61,
        "Length": 38
      }
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio last week between friday and sunday.",
    "Context": {"ReferenceDateTime": "2017-11-14T00:00:00"},
    "Results": [
      {
        "Text": "last week between friday and sunday",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-10,2017-11-12,P2D)",
          "FutureResolution": {"startDate": "2017-11-10", "endDate": "2017-11-12"},
          "PastResolution": {"startDate": "2017-11-10", "endDate": "2017-11-12"}
        },
        "Start": 61,
        "Length": 35
      }
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio this week from tue to thur.",
    "Context": {"ReferenceDateTime": "2017-11-14T00:00:00"},
    "Results": [
      {
        "Text": "this week from tue to thur",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-14,2017-11-16,P2D)",
          "FutureResolution": {"startDate": "2017-11-14", "endDate": "2017-11-16"},
          "PastResolution": {"startDate": "2017-11-14", "endDate": "2017-11-16"}
        },
        "Start": 61,
        "Length": 26
      }
    ]
  },
  {
    "Input": "We had a meeting this week",
    "Context": {"ReferenceDateTime": "2017-11-17T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W46",
          "FutureResolution": {"startDate": "2017-11-13", "endDate": "2017-11-20"},
          "PastResolution": {"startDate": "2017-11-13", "endDate": "2017-11-20"}
        },
        "Start": 17,
        "Length": 9
      }
    ]
  },
  {
    "Input": "We had a meeting first week of this year",
    "Context": {"ReferenceDateTime": "2017-11-17T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "first week of this year",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W01",
          "FutureResolution": {"startDate": "2017-01-02", "endDate": "2017-01-09"},
          "PastResolution": {"startDate": "2017-01-02", "endDate": "2017-01-09"}
        },
        "Start": 17,
        "Length": 23
      }
    ]
  },
  {
    "Input": "first week of 2015",
    "Context": {"ReferenceDateTime": "2017-11-20T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "first week of 2015",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-W01",
          "FutureResolution": {"startDate": "2014-12-29", "endDate": "2015-01-05"},
          "PastResolution": {"startDate": "2014-12-29", "endDate": "2015-01-05"}
        },
        "Start": 0,
        "Length": 18
      }
    ]
  },
  {
    "Input": "second week of 2015",
    "Context": {"ReferenceDateTime": "2017-11-20T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "second week of 2015",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-W02",
          "FutureResolution": {"startDate": "2015-01-05", "endDate": "2015-01-12"},
          "PastResolution": {"startDate": "2015-01-05", "endDate": "2015-01-12"}
        },
        "Start": 0,
        "Length": 19
      }
    ]
  },
  {
    "Input": "this weekend",
    "Context": {"ReferenceDateTime": "2017-11-20T00:00:00"},
    "Results": [
      {
        "Text": "this weekend",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W47-WE",
          "FutureResolution": {"startDate": "2017-11-25", "endDate": "2017-11-27"},
          "PastResolution": {"startDate": "2017-11-25", "endDate": "2017-11-27"}
        },
        "Start": 0,
        "Length": 12
      }
    ]
  },
  {
    "Input": "last week of 2015",
    "Context": {"ReferenceDateTime": "2017-11-20T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "last week of 2015",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-W53",
          "FutureResolution": {"startDate": "2015-12-28", "endDate": "2016-01-04"},
          "PastResolution": {"startDate": "2015-12-28", "endDate": "2016-01-04"}
        },
        "Start": 0,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I'll be out year 247",
    "Context": {"ReferenceDateTime": "2017-12-18T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "year 247",
        "Type": "daterange",
        "Value": {
          "Timex": "0247",
          "FutureResolution": {"startDate": "0247-01-01", "endDate": "0248-01-01"},
          "PastResolution": {"startDate": "0247-01-01", "endDate": "0248-01-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "In the 1970s",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the 1970s",
        "Type": "daterange",
        "Value": {
          "Timex": "(1970-01-01,1980-01-01,P10Y)",
          "FutureResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"},
          "PastResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"}
        },
        "Start": 3,
        "Length": 9
      }
    ]
  },
  {
    "Input": "In the 2000s, he was born.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the 2000s",
        "Type": "daterange",
        "Value": {
          "Timex": "(2000-01-01,2010-01-01,P10Y)",
          "FutureResolution": {"startDate": "2000-01-01", "endDate": "2010-01-01"},
          "PastResolution": {"startDate": "2000-01-01", "endDate": "2010-01-01"}
        },
        "Start": 3,
        "Length": 9
      }
    ]
  },
  {
    "Input": "In the 1970's",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the 1970's",
        "Type": "daterange",
        "Value": {
          "Timex": "(1970-01-01,1980-01-01,P10Y)",
          "FutureResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"},
          "PastResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"}
        },
        "Start": 3,
        "Length": 10
      }
    ]
  },
  {
    "Input": "In the 70s",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the 70s",
        "Type": "daterange",
        "Value": {
          "Timex": "(XX70-01-01,XX80-01-01,P10Y)",
          "FutureResolution": {"startDate": "2070-01-01", "endDate": "2080-01-01"},
          "PastResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"}
        },
        "Start": 3,
        "Length": 7
      }
    ]
  },
  {
    "Input": "In the 70's",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the 70's",
        "Type": "daterange",
        "Value": {
          "Timex": "(XX70-01-01,XX80-01-01,P10Y)",
          "FutureResolution": {"startDate": "2070-01-01", "endDate": "2080-01-01"},
          "PastResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"}
        },
        "Start": 3,
        "Length": 8
      }
    ]
  },
  {
    "Input": "In 70's",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "70's",
        "Type": "daterange",
        "Value": {
          "Timex": "(XX70-01-01,XX80-01-01,P10Y)",
          "FutureResolution": {"startDate": "2070-01-01", "endDate": "2080-01-01"},
          "PastResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"}
        },
        "Start": 3,
        "Length": 4
      }
    ]
  },
  {
    "Input": "In the '40s",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the '40s",
        "Type": "daterange",
        "Value": {
          "Timex": "(XX40-01-01,XX50-01-01,P10Y)",
          "FutureResolution": {"startDate": "2040-01-01", "endDate": "2050-01-01"},
          "PastResolution": {"startDate": "1940-01-01", "endDate": "1950-01-01"}
        },
        "Start": 3,
        "Length": 8
      }
    ]
  },
  {
    "Input": "In the seventies",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the seventies",
        "Type": "daterange",
        "Value": {
          "Timex": "(XX70-01-01,XX80-01-01,P10Y)",
          "FutureResolution": {"startDate": "2070-01-01", "endDate": "2080-01-01"},
          "PastResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"}
        },
        "Start": 3,
        "Length": 13
      }
    ]
  },
  {
    "Input": "In the nineteen seventies",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the nineteen seventies",
        "Type": "daterange",
        "Value": {
          "Timex": "(1970-01-01,1980-01-01,P10Y)",
          "FutureResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"},
          "PastResolution": {"startDate": "1970-01-01", "endDate": "1980-01-01"}
        },
        "Start": 3,
        "Length": 22
      }
    ]
  },
  {
    "Input": "In the two thousand and tens",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the two thousand and tens",
        "Type": "daterange",
        "Value": {
          "Timex": "(2010-01-01,2020-01-01,P10Y)",
          "FutureResolution": {"startDate": "2010-01-01", "endDate": "2020-01-01"},
          "PastResolution": {"startDate": "2010-01-01", "endDate": "2020-01-01"}
        },
        "Start": 3,
        "Length": 25
      }
    ]
  },
  {
    "Input": "In the twenty-tens",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the twenty-tens",
        "Type": "daterange",
        "Value": {
          "Timex": "(2010-01-01,2020-01-01,P10Y)",
          "FutureResolution": {"startDate": "2010-01-01", "endDate": "2020-01-01"},
          "PastResolution": {"startDate": "2010-01-01", "endDate": "2020-01-01"}
        },
        "Start": 3,
        "Length": 15
      }
    ]
  },
  {
    "Input": "In the two thousands",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the two thousands",
        "Type": "daterange",
        "Value": {
          "Timex": "(2000-01-01,2010-01-01,P10Y)",
          "FutureResolution": {"startDate": "2000-01-01", "endDate": "2010-01-01"},
          "PastResolution": {"startDate": "2000-01-01", "endDate": "2010-01-01"}
        },
        "Start": 3,
        "Length": 17
      }
    ]
  },
  {
    "Input": "In the noughties",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the noughties",
        "Type": "daterange",
        "Value": {
          "Timex": "(2000-01-01,2010-01-01,P10Y)",
          "FutureResolution": {"startDate": "2000-01-01", "endDate": "2010-01-01"},
          "PastResolution": {"startDate": "2000-01-01", "endDate": "2010-01-01"}
        },
        "Start": 3,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll be out from 2 to 7 feb, two thousand and eighteen",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 2 to 7 feb, two thousand and eighteen",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-02-02,2018-02-07,P5D)",
          "FutureResolution": {"startDate": "2018-02-02", "endDate": "2018-02-07"},
          "PastResolution": {"startDate": "2018-02-02", "endDate": "2018-02-07"}
        },
        "Start": 12,
        "Length": 42
      }
    ]
  },
  {
    "Input": "I'll be out between 2 and 7 feb two thousand and eighteen",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 2 and 7 feb two thousand and eighteen",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-02-02,2018-02-07,P5D)",
          "FutureResolution": {"startDate": "2018-02-02", "endDate": "2018-02-07"},
          "PastResolution": {"startDate": "2018-02-02", "endDate": "2018-02-07"}
        },
        "Start": 12,
        "Length": 45
      }
    ]
  },
  {
    "Input": "I'll be out feb between 2-7 two thousand and eighteen",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "feb between 2-7 two thousand and eighteen",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-02-02,2018-02-07,P5D)",
          "FutureResolution": {"startDate": "2018-02-02", "endDate": "2018-02-07"},
          "PastResolution": {"startDate": "2018-02-02", "endDate": "2018-02-07"}
        },
        "Start": 12,
        "Length": 41
      }
    ]
  },
  {
    "Input": "It happened in june of nineteen ninety nine",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "june of nineteen ninety nine",
        "Type": "daterange",
        "Value": {
          "Timex": "1999-06",
          "FutureResolution": {"startDate": "1999-06-01", "endDate": "1999-07-01"},
          "PastResolution": {"startDate": "1999-06-01", "endDate": "1999-07-01"}
        },
        "Start": 15,
        "Length": 28
      }
    ]
  },
  {
    "Input": "In nineteen twenty eight",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "nineteen twenty eight",
        "Type": "daterange",
        "Value": {
          "Timex": "1928",
          "FutureResolution": {"startDate": "1928-01-01", "endDate": "1929-01-01"},
          "PastResolution": {"startDate": "1928-01-01", "endDate": "1929-01-01"}
        },
        "Start": 3,
        "Length": 21
      }
    ]
  },
  {
    "Input": "In one thousand seven hundred and eighty nine",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "one thousand seven hundred and eighty nine",
        "Type": "daterange",
        "Value": {
          "Timex": "1789",
          "FutureResolution": {"startDate": "1789-01-01", "endDate": "1790-01-01"},
          "PastResolution": {"startDate": "1789-01-01", "endDate": "1790-01-01"}
        },
        "Start": 3,
        "Length": 42
      }
    ]
  },
  {
    "Input": "I'll be out the third week of two thousand and twenty seven",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the third week of two thousand and twenty seven",
        "Type": "daterange",
        "Value": {
          "Timex": "2027-W03",
          "FutureResolution": {"startDate": "2027-01-18", "endDate": "2027-01-25"},
          "PastResolution": {"startDate": "2027-01-18", "endDate": "2027-01-25"}
        },
        "Start": 12,
        "Length": 47
      }
    ]
  },
  {
    "Input": "I'll be out the third quarter of two thousand and twenty",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the third quarter of two thousand and twenty",
        "Type": "daterange",
        "Value": {
          "Timex": "(2020-07-01,2020-10-01,P3M)",
          "FutureResolution": {"startDate": "2020-07-01", "endDate": "2020-10-01"},
          "PastResolution": {"startDate": "2020-07-01", "endDate": "2020-10-01"}
        },
        "Start": 12,
        "Length": 44
      }
    ]
  },
  {
    "Input": "In the spring of nineteen seventy eight",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the spring of nineteen seventy eight",
        "Type": "daterange",
        "Value": {"Timex": "1978-SP", "FutureResolution": {}, "PastResolution": {}},
        "Start": 3,
        "Length": 36
      }
    ]
  },
  {
    "Input": "year two hundred and sixty seven",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "year two hundred and sixty seven",
        "Type": "daterange",
        "Value": {
          "Timex": "0267",
          "FutureResolution": {"startDate": "0267-01-01", "endDate": "0268-01-01"},
          "PastResolution": {"startDate": "0267-01-01", "endDate": "0268-01-01"}
        },
        "Start": 0,
        "Length": 32
      }
    ]
  },
  {
    "Input": "I'll be out the week after next",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the week after next",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W47",
          "FutureResolution": {"startDate": "2016-11-21", "endDate": "2016-11-28"},
          "PastResolution": {"startDate": "2016-11-21", "endDate": "2016-11-28"}
        },
        "Start": 12,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll be out the month after the next",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the month after the next",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-01",
          "FutureResolution": {"startDate": "2017-01-01", "endDate": "2017-02-01"},
          "PastResolution": {"startDate": "2017-01-01", "endDate": "2017-02-01"}
        },
        "Start": 12,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll be out the year after next",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the year after next",
        "Type": "daterange",
        "Value": {
          "Timex": "2018",
          "FutureResolution": {"startDate": "2018-01-01", "endDate": "2019-01-01"},
          "PastResolution": {"startDate": "2018-01-01", "endDate": "2019-01-01"}
        },
        "Start": 12,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll be out the weekend after the next",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the weekend after the next",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W47-WE",
          "FutureResolution": {"startDate": "2016-11-26", "endDate": "2016-11-28"},
          "PastResolution": {"startDate": "2016-11-26", "endDate": "2016-11-28"}
        },
        "Start": 12,
        "Length": 26
      }
    ]
  },
  {
    "Input": "The range is 2014-2018.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "2014-2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2014-01-01,2018-01-01,P4Y)",
          "FutureResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"}
        },
        "Start": 13,
        "Length": 9
      }
    ]
  },
  {
    "Input": "The range is between 2014-2018.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 2014-2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2014-01-01,2018-01-01,P4Y)",
          "FutureResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"}
        },
        "Start": 13,
        "Length": 17
      }
    ]
  },
  {
    "Input": "The range is from 2014 to 2018.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 2014 to 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2014-01-01,2018-01-01,P4Y)",
          "FutureResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"}
        },
        "Start": 13,
        "Length": 17
      }
    ]
  },
  {
    "Input": "The range is in 2014 through 2018.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "in 2014 through 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2014-01-01,2018-01-01,P4Y)",
          "FutureResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2014-01-01", "endDate": "2018-01-01"}
        },
        "Start": 13,
        "Length": 20
      }
    ]
  },
  {
    "Input": "The range is from two thousand until two thousand and fourteen.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from two thousand until two thousand and fourteen",
        "Type": "daterange",
        "Value": {
          "Timex": "(2000-01-01,2014-01-01,P14Y)",
          "FutureResolution": {"startDate": "2000-01-01", "endDate": "2014-01-01"},
          "PastResolution": {"startDate": "2000-01-01", "endDate": "2014-01-01"}
        },
        "Start": 13,
        "Length": 49
      }
    ]
  },
  {
    "Input": "It happened in the past 2 decades.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the past 2 decades",
        "Type": "daterange",
        "Value": {
          "Timex": "(1990-01-01,2010-01-01,P20Y)",
          "FutureResolution": {"startDate": "1990-01-01", "endDate": "2010-01-01"},
          "PastResolution": {"startDate": "1990-01-01", "endDate": "2010-01-01"}
        },
        "Start": 15,
        "Length": 18
      }
    ]
  },
  {
    "Input": "It happened in the last two decades.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the last two decades",
        "Type": "daterange",
        "Value": {
          "Timex": "(1990-01-01,2010-01-01,P20Y)",
          "FutureResolution": {"startDate": "1990-01-01", "endDate": "2010-01-01"},
          "PastResolution": {"startDate": "1990-01-01", "endDate": "2010-01-01"}
        },
        "Start": 15,
        "Length": 20
      }
    ]
  },
  {
    "Input": "It happened in the next decade.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the next decade",
        "Type": "daterange",
        "Value": {
          "Timex": "(2020-01-01,2030-01-01,P10Y)",
          "FutureResolution": {"startDate": "2020-01-01", "endDate": "2030-01-01"},
          "PastResolution": {"startDate": "2020-01-01", "endDate": "2030-01-01"}
        },
        "Start": 15,
        "Length": 15
      }
    ]
  },
  {
    "Input": "It happened in the next 3 decades.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the next 3 decades",
        "Type": "daterange",
        "Value": {
          "Timex": "(2020-01-01,2050-01-01,P30Y)",
          "FutureResolution": {"startDate": "2020-01-01", "endDate": "2050-01-01"},
          "PastResolution": {"startDate": "2020-01-01", "endDate": "2050-01-01"}
        },
        "Start": 15,
        "Length": 18
      }
    ]
  },
  {
    "Input": "It will happen 4 weeks in the future.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "4 weeks in the future",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-08,2016-12-06,P4W)",
          "FutureResolution": {"startDate": "2016-11-08", "endDate": "2016-12-06"},
          "PastResolution": {"startDate": "2016-11-08", "endDate": "2016-12-06"}
        },
        "Start": 15,
        "Length": 21
      }
    ]
  },
  {
    "Input": "It will happen 2 days hence.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "2 days hence",
        "Type": "daterange",
        "Value": {
          "Timex": "(2016-11-08,2016-11-10,P2D)",
          "FutureResolution": {"startDate": "2016-11-08", "endDate": "2016-11-10"},
          "PastResolution": {"startDate": "2016-11-08", "endDate": "2016-11-10"}
        },
        "Start": 15,
        "Length": 12
      }
    ]
  },
  {
    "Input": "Cortana can find us a time beginning of next week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "beginning of next week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W46",
          "Mod": "start",
          "FutureResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"},
          "PastResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"}
        },
        "Start": 27,
        "Length": 22
      }
    ]
  },
  {
    "Input": "Sure, let's get a Skype end of next week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "end of next week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W46",
          "Mod": "end",
          "FutureResolution": {"startDate": "2017-11-16", "endDate": "2017-11-20"},
          "PastResolution": {"startDate": "2017-11-16", "endDate": "2017-11-20"}
        },
        "Start": 24,
        "Length": 16
      }
    ]
  },
  {
    "Input": "Sure, let's get a Skype start of next week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "start of next week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W46",
          "Mod": "start",
          "FutureResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"},
          "PastResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"}
        },
        "Start": 24,
        "Length": 18
      }
    ]
  },
  {
    "Input": "Cortana, find us a time end of march",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "end of march",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-03",
          "Mod": "end",
          "FutureResolution": {"startDate": "2018-03-16", "endDate": "2018-04-01"},
          "PastResolution": {"startDate": "2017-03-16", "endDate": "2017-04-01"}
        },
        "Start": 24,
        "Length": 12
      }
    ]
  },
  {
    "Input": "Cortana, please find us a time mid next week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "mid next week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W46",
          "Mod": "mid",
          "FutureResolution": {"startDate": "2017-11-14", "endDate": "2017-11-18"},
          "PastResolution": {"startDate": "2017-11-14", "endDate": "2017-11-18"}
        },
        "Start": 31,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I can find us a time beginning of next week",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "beginning of next week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W46",
          "Mod": "start",
          "FutureResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"},
          "PastResolution": {"startDate": "2017-11-13", "endDate": "2017-11-16"}
        },
        "Start": 21,
        "Length": 22
      }
    ]
  },
  {
    "Input": "what about by mid summer?",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "mid summer",
        "Type": "daterange",
        "Value": {"Timex": "SU", "Mod": "mid", "FutureResolution": {}, "PastResolution": {}},
        "Start": 14,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I will be back within 5 days",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 5 days",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-08,2017-11-13,P5D)",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2017-11-13"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2017-11-13"}
        },
        "Start": 15,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I will be back within 10 months",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 10 months",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-08,2018-09-08,P10M)",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2018-09-08"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2018-09-08"}
        },
        "Start": 15,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I will be back within 3 years",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 3 years",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-08,2020-11-08,P3Y)",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2020-11-08"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2020-11-08"}
        },
        "Start": 15,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I will be back within 5 years 1 month 12 days",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within 5 years 1 month 12 days",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-08,2022-12-20,P5Y1M12D)",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2022-12-20"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2022-12-20"}
        },
        "Start": 15,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I will be back within the next 3 years",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within the next 3 years",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-08,2020-11-08,P3Y)",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2020-11-08"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2020-11-08"}
        },
        "Start": 15,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I will be back within the upcoming 5 years 1 month 12 days",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "within the upcoming 5 years 1 month 12 days",
        "Type": "daterange",
        "Value": {
          "Timex": "(2017-11-08,2022-12-20,P5Y1M12D)",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2022-12-20"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2022-12-20"}
        },
        "Start": 15,
        "Length": 43
      }
    ]
  },
  {
    "Input": "I'll be out from 4 to january 22, 1995",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "from 4 to january 22, 1995",
        "Type": "daterange",
        "Value": {
          "Timex": "(1995-01-04,1995-01-22,P18D)",
          "FutureResolution": {"startDate": "1995-01-04", "endDate": "1995-01-22"},
          "PastResolution": {"startDate": "1995-01-04", "endDate": "1995-01-22"}
        },
        "Start": 12,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I want a room from 02 to april 07",
    "Context": {"ReferenceDateTime": "2018-04-02T00:00:00"},
    "Results": [
      {
        "Text": "from 02 to april 07",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-04-02,XXXX-04-07,P5D)",
          "FutureResolution": {"startDate": "2018-04-02", "endDate": "2018-04-07"},
          "PastResolution": {"startDate": "2017-04-02", "endDate": "2017-04-07"}
        },
        "Start": 14,
        "Length": 19
      }
    ]
  },
  {
    "Input": "schedule a meeting in couple of weeks",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": []
  },
  {
    "Input": "I'll be out 2016 june",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 june",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-06",
          "FutureResolution": {"startDate": "2016-06-01", "endDate": "2016-07-01"},
          "PastResolution": {"startDate": "2016-06-01", "endDate": "2016-07-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out 2016, nov",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016, nov",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out 2016 , nov",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 , nov",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll be out november , 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "november , 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I'll be out 2016 november",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 november",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll be out 2016-11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016-11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out 2016 - 11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 - 11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out 2016- 11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016- 11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out 2016 -11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 -11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out 2016/11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016/11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out 2016 / 11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 / 11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out 2016/ 11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016/ 11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out 2016 /11",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2016 /11",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out 11-2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "11-2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out 11 - 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "11 - 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out 11- 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "11- 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out 11 -2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "11 -2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll be out 11/2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "11/2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll be out 11 / 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "11 / 2016",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-11",
          "FutureResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"},
          "PastResolution": {"startDate": "2016-11-01", "endDate": "2016-12-01"}
        },
        "Start": 12,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll be out between january 1st and april 5th",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Comment": "Compound timex represent value dependency and will be split at the model level",
    "NotSupported": "javascript,python,java",
    "Results": [
      {
        "Text": "between january 1st and april 5th",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-01-01,XXXX-04-05,P94D)|(XXXX-01-01,XXXX-04-05,P95D)",
          "FutureResolution": {"startDate": "2017-01-01", "endDate": "2017-04-05"},
          "PastResolution": {"startDate": "2016-01-01", "endDate": "2016-04-05"}
        },
        "Start": 12,
        "Length": 33
      }
    ]
  },
  {
    "Input": "I'll be out between january 1st 2015 and feb 5th 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "between january 1st 2015 and feb 5th 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-01-01,2018-02-05,P1131D)",
          "FutureResolution": {"startDate": "2015-01-01", "endDate": "2018-02-05"},
          "PastResolution": {"startDate": "2015-01-01", "endDate": "2018-02-05"}
        },
        "Start": 12,
        "Length": 41
      }
    ]
  },
  {
    "Input": "I'll be out between january 1st 2015 and feb 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between january 1st 2015 and feb 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-01-01,2018-02-01,P1127D)",
          "FutureResolution": {"startDate": "2015-01-01", "endDate": "2018-02-01"},
          "PastResolution": {"startDate": "2015-01-01", "endDate": "2018-02-01"}
        },
        "Start": 12,
        "Length": 37
      }
    ]
  },
  {
    "Input": "I'll be out between 2015 and feb 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 2015 and feb 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-01-01,2018-02-01,P37M)",
          "FutureResolution": {"startDate": "2015-01-01", "endDate": "2018-02-01"},
          "PastResolution": {"startDate": "2015-01-01", "endDate": "2018-02-01"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out from feb 1st to march 2019",
    "Context": {"ReferenceDateTime": "2018-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from feb 1st to march 2019",
        "Type": "daterange",
        "Value": {
          "Timex": "(2019-02-01,2019-03-01,P28D)",
          "FutureResolution": {"startDate": "2019-02-01", "endDate": "2019-03-01"},
          "PastResolution": {"startDate": "2019-02-01", "endDate": "2019-03-01"}
        },
        "Start": 12,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I'll be out between feb 1st and march 2019",
    "Context": {"ReferenceDateTime": "2018-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between feb 1st and march 2019",
        "Type": "daterange",
        "Value": {
          "Timex": "(2019-02-01,2019-03-01,P28D)",
          "FutureResolution": {"startDate": "2019-02-01", "endDate": "2019-03-01"},
          "PastResolution": {"startDate": "2019-02-01", "endDate": "2019-03-01"}
        },
        "Start": 12,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I'll be out between 2015 june and 2018 may",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 2015 june and 2018 may",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-06-01,2018-05-01,P35M)",
          "FutureResolution": {"startDate": "2015-06-01", "endDate": "2018-05-01"},
          "PastResolution": {"startDate": "2015-06-01", "endDate": "2018-05-01"}
        },
        "Start": 12,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I'll be out between 2015 may and 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 2015 may and 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-05-01,2018-01-01,P32M)",
          "FutureResolution": {"startDate": "2015-05-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2015-05-01", "endDate": "2018-01-01"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out between may 2015 and 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between may 2015 and 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-05-01,2018-01-01,P32M)",
          "FutureResolution": {"startDate": "2015-05-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2015-05-01", "endDate": "2018-01-01"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll be out between may 2015 and 2018 june",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between may 2015 and 2018 june",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-05-01,2018-06-01,P37M)",
          "FutureResolution": {"startDate": "2015-05-01", "endDate": "2018-06-01"},
          "PastResolution": {"startDate": "2015-05-01", "endDate": "2018-06-01"}
        },
        "Start": 12,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I'll be out between 2015 and january 5th 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between 2015 and january 5th 2018",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-01-01,2018-01-05,P1100D)",
          "FutureResolution": {"startDate": "2015-01-01", "endDate": "2018-01-05"},
          "PastResolution": {"startDate": "2015-01-01", "endDate": "2018-01-05"}
        },
        "Start": 12,
        "Length": 33
      }
    ]
  },
  {
    "Input": "I'll be out from 2015 to may 5th, 2017",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from 2015 to may 5th, 2017",
        "Type": "daterange",
        "Value": {
          "Timex": "(2015-01-01,2017-05-05,P855D)",
          "FutureResolution": {"startDate": "2015-01-01", "endDate": "2017-05-05"},
          "PastResolution": {"startDate": "2015-01-01", "endDate": "2017-05-05"}
        },
        "Start": 12,
        "Length": 26
      }
    ]
  },
  {
    "Input": "I'll be out from last monday april to 2019",
    "Context": {"ReferenceDateTime": "2018-05-04T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from last monday april to 2019",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-04-30,2019-01-01,P246D)",
          "FutureResolution": {"startDate": "2018-04-30", "endDate": "2019-01-01"},
          "PastResolution": {"startDate": "2018-04-30", "endDate": "2019-01-01"}
        },
        "Start": 12,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I'll be out from week 31 to week 35",
    "Context": {"ReferenceDateTime": "2018-05-04T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from week 31 to week 35",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-07-30,2018-08-27,P4W)",
          "FutureResolution": {"startDate": "2018-07-30", "endDate": "2018-08-27"},
          "PastResolution": {"startDate": "2018-07-30", "endDate": "2018-08-27"}
        },
        "Start": 12,
        "Length": 23
      }
    ]
  },
  {
    "Input": "I'll be out between week 31 and week 35",
    "Context": {"ReferenceDateTime": "2018-05-04T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "between week 31 and week 35",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-07-30,2018-08-27,P4W)",
          "FutureResolution": {"startDate": "2018-07-30", "endDate": "2018-08-27"},
          "PastResolution": {"startDate": "2018-07-30", "endDate": "2018-08-27"}
        },
        "Start": 12,
        "Length": 27
      }
    ]
  },
  {
    "Input": "I'll stay here from today to two and half days later",
    "Context": {"ReferenceDateTime": "2018-05-04T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "from today to two and half days later",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-05-04,2018-05-06,P2.5D)",
          "FutureResolution": {"startDate": "2018-05-04", "endDate": "2018-05-06"},
          "PastResolution": {"startDate": "2018-05-04", "endDate": "2018-05-06"}
        },
        "Start": 15,
        "Length": 37
      }
    ]
  },
  {
    "Input": "I was not there the same week that it happened.",
    "Context": {"ReferenceDateTime": "2017-11-17T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "same week",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-WXX",
          "Mod": "ref_undef",
          "FutureResolution": {"startDate": "2017-11-13", "endDate": "2017-11-20"},
          "PastResolution": {"startDate": "2017-11-13", "endDate": "2017-11-20"}
        },
        "Start": 20,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I was not there the same month that it happened.",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "same month",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-XX",
          "Mod": "ref_undef",
          "FutureResolution": {"startDate": "2017-11-01", "endDate": "2017-12-01"},
          "PastResolution": {"startDate": "2017-11-01", "endDate": "2017-12-01"}
        },
        "Start": 20,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I was not there that weekend.",
    "Context": {"ReferenceDateTime": "2016-11-11T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "that weekend",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-WXX-WE",
          "Mod": "ref_undef",
          "FutureResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"},
          "PastResolution": {"startDate": "2016-11-12", "endDate": "2016-11-14"}
        },
        "Start": 16,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I was not there the same year that it happened. ",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "same year",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX",
          "Mod": "ref_undef",
          "FutureResolution": {"startDate": "2017-01-01", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2017-01-01", "endDate": "2018-01-01"}
        },
        "Start": 20,
        "Length": 9
      }
    ]
  },
  {
    "Input": "We could have scheduled a time to meet earlier in the week.",
    "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
    "Results": [
      {
        "Text": "earlier in the week",
        "Type": "daterange",
        "Value": {
          "Timex": "2018-W22",
          "FutureResolution": {"startDate": "2018-05-28", "endDate": "2018-05-31"},
          "PastResolution": {"startDate": "2018-05-28", "endDate": "2018-05-31"}
        },
        "Start": 39,
        "Length": 19
      }
    ]
  },
  {
    "Input": "We could have scheduled a time to meet earlier this month.",
    "Context": {"ReferenceDateTime": "2018-05-13T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "earlier this month",
        "Type": "daterange",
        "Value": {
          "Timex": "2018-05",
          "FutureResolution": {"startDate": "2018-05-01", "endDate": "2018-05-13"},
          "PastResolution": {"startDate": "2018-05-01", "endDate": "2018-05-13"}
        },
        "Start": 39,
        "Length": 18
      }
    ]
  },
  {
    "Input": "We could have scheduled a time to meet earlier this year.",
    "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "earlier this year",
        "Type": "daterange",
        "Value": {
          "Timex": "2018",
          "FutureResolution": {"startDate": "2018-01-01", "endDate": "2018-05-28"},
          "PastResolution": {"startDate": "2018-01-01", "endDate": "2018-05-28"}
        },
        "Start": 39,
        "Length": 17
      }
    ]
  },
  {
    "Input": "Please find us a time to meet later this week",
    "Context": {"ReferenceDateTime": "2017-11-10T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "later this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2017-W45",
          "FutureResolution": {"startDate": "2017-11-10", "endDate": "2017-11-13"},
          "PastResolution": {"startDate": "2017-11-10", "endDate": "2017-11-13"}
        },
        "Start": 30,
        "Length": 15
      }
    ]
  },
  {
    "Input": "Please find us a time to meet later this month",
    "Context": {"ReferenceDateTime": "2018-05-28T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "later this month",
        "Type": "daterange",
        "Value": {
          "Timex": "2018-05",
          "FutureResolution": {"startDate": "2018-05-28", "endDate": "2018-06-01"},
          "PastResolution": {"startDate": "2018-05-28", "endDate": "2018-06-01"}
        },
        "Start": 30,
        "Length": 16
      }
    ]
  },
  {
    "Input": "Please find us a time to meet later this year",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "later this year",
        "Type": "daterange",
        "Value": {
          "Timex": "2017",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2018-01-01"}
        },
        "Start": 30,
        "Length": 15
      }
    ]
  },
  {
    "Input": "Please find us a time to meet later in the year",
    "Context": {"ReferenceDateTime": "2017-11-08T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "later in the year",
        "Type": "daterange",
        "Value": {
          "Timex": "2017",
          "FutureResolution": {"startDate": "2017-11-08", "endDate": "2018-01-01"},
          "PastResolution": {"startDate": "2017-11-08", "endDate": "2018-01-01"}
        },
        "Start": 30,
        "Length": 17
      }
    ]
  },
  {
    "Input": "This task will start more than 2 weeks after today",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "python, javascript",
    "Results": [
      {
        "Text": "more than 2 weeks after today",
        "Type": "daterange",
        "Value": {
          "Timex": "2018-06-12",
          "Mod": "after",
          "FutureResolution": {"startDate": "2018-06-12"},
          "PastResolution": {"startDate": "2018-06-12"}
        },
        "Start": 21,
        "Length": 29
      }
    ]
  },
  {
    "Input": "I will come back less than 2 weeks from today",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "python, javascript",
    "Results": [
      {
        "Text": "less than 2 weeks from today",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-05-29,2018-06-12,P2W)",
          "FutureResolution": {"startDate": "2018-05-29", "endDate": "2018-06-12"},
          "PastResolution": {"startDate": "2018-05-29", "endDate": "2018-06-12"}
        },
        "Start": 17,
        "Length": 28
      }
    ]
  },
  {
    "Input": "I will come back within 2 weeks from today",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "python, javascript",
    "Results": [
      {
        "Text": "within 2 weeks from today",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-05-29,2018-06-12,P2W)",
          "FutureResolution": {"startDate": "2018-05-29", "endDate": "2018-06-12"},
          "PastResolution": {"startDate": "2018-05-29", "endDate": "2018-06-12"}
        },
        "Start": 17,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I have already finished all my work more than 2 weeks before today",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "python, javascript",
    "Results": [
      {
        "Text": "more than 2 weeks before today",
        "Type": "daterange",
        "Value": {
          "Timex": "2018-05-15",
          "Mod": "before",
          "FutureResolution": {"endDate": "2018-05-15"},
          "PastResolution": {"endDate": "2018-05-15"}
        },
        "Start": 36,
        "Length": 30
      }
    ]
  },
  {
    "Input": "This task should have been done more than 2 days before yesterday",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "python, javascript",
    "Results": [
      {
        "Text": "more than 2 days before yesterday",
        "Type": "daterange",
        "Value": {
          "Timex": "2018-05-26",
          "Mod": "before",
          "FutureResolution": {"endDate": "2018-05-26"},
          "PastResolution": {"endDate": "2018-05-26"}
        },
        "Start": 32,
        "Length": 33
      }
    ]
  },
  {
    "Input": "This task will be done less than 3 days after tomorrow",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "python, javascript",
    "Results": [
      {
        "Text": "less than 3 days after tomorrow",
        "Type": "daterange",
        "Value": {
          "Timex": "(2018-05-30,2018-06-02,P3D)",
          "FutureResolution": {"startDate": "2018-05-30", "endDate": "2018-06-02"},
          "PastResolution": {"startDate": "2018-05-30", "endDate": "2018-06-02"}
        },
        "Start": 23,
        "Length": 31
      }
    ]
  },
  {
    "Input": "It happens in 15th  century",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "15th  century",
        "Type": "daterange",
        "Value": {
          "Timex": "(1400-01-01,1500-01-01,P100Y)",
          "FutureResolution": {"startDate": "1400-01-01", "endDate": "1500-01-01"},
          "PastResolution": {"startDate": "1400-01-01", "endDate": "1500-01-01"}
        },
        "Start": 14,
        "Length": 13
      }
    ]
  },
  {
    "Input": "Show me the records in 21st century",
    "Context": {"ReferenceDateTime": "2018-05-29T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "21st century",
        "Type": "daterange",
        "Value": {
          "Timex": "(2000-01-01,2100-01-01,P100Y)",
          "FutureResolution": {"startDate": "2000-01-01", "endDate": "2100-01-01"},
          "PastResolution": {"startDate": "2000-01-01", "endDate": "2100-01-01"}
        },
        "Start": 23,
        "Length": 12
      }
    ]
  },
  {
    "Input": "Cortana, can you please set something up for the week of the 18th.",
    "Context": {"ReferenceDateTime": "2018-08-08T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the week of the 18th",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-XX-18",
          "FutureResolution": {"startDate": "2018-08-13", "endDate": "2018-08-20"},
          "PastResolution": {"startDate": "2018-07-16", "endDate": "2018-07-23"}
        },
        "Start": 45,
        "Length": 20
      }
    ]
  },
  {
    "Input": "Cortana, can you please set something up for the week of the 18th.",
    "Context": {"ReferenceDateTime": "2018-08-28T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the week of the 18th",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-XX-18",
          "FutureResolution": {"startDate": "2018-09-17", "endDate": "2018-09-24"},
          "PastResolution": {"startDate": "2018-08-13", "endDate": "2018-08-20"}
        },
        "Start": 45,
        "Length": 20
      }
    ]
  },
  {
    "Input": "sales where date is this decade.",
    "Context": {"ReferenceDateTime": "2018-08-31T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "this decade",
        "Type": "daterange",
        "Value": {
          "Timex": "(2010-01-01,2020-01-01,P10Y)",
          "FutureResolution": {"startDate": "2010-01-01", "endDate": "2020-01-01"},
          "PastResolution": {"startDate": "2010-01-01", "endDate": "2020-01-01"}
        },
        "Start": 20,
        "Length": 11
      }
    ]
  },
  {
    "Input": "from 10/1 to 11/7",
    "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
    "Results": [
      {
        "Text": "from 10/1 to 11/7",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-10-01,XXXX-11-07,P37D)",
          "FutureResolution": {"startDate": "2018-10-01", "endDate": "2018-11-07"},
          "PastResolution": {"startDate": "2018-10-01", "endDate": "2018-11-07"}
        },
        "Start": 0,
        "Length": 17
      }
    ]
  },
  {
    "Input": "from 10/25 to 01/25",
    "Context": {"ReferenceDateTime": "2018-10-24T12:00:00"},
    "Results": [
      {
        "Text": "from 10/25 to 01/25",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-10-25,XXXX-01-25,P92D)",
          "FutureResolution": {"startDate": "2018-10-25", "endDate": "2019-01-25"},
          "PastResolution": {"startDate": "2017-10-25", "endDate": "2018-01-25"}
        },
        "Start": 0,
        "Length": 19
      }
    ]
  },
  {
    "Input": "The U.S. government is still in suspension this week.",
    "Context": {"ReferenceDateTime": "2019-01-01T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-W01",
          "FutureResolution": {"startDate": "2018-12-31", "endDate": "2019-01-07"},
          "PastResolution": {"startDate": "2018-12-31", "endDate": "2019-01-07"}
        },
        "Start": 43,
        "Length": 9
      }
    ]
  },
  {
    "Input": "Mr Werner unveiled his new strategy this week.",
    "Context": {"ReferenceDateTime": "2017-01-01T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2016-W52",
          "FutureResolution": {"startDate": "2016-12-26", "endDate": "2017-01-02"},
          "PastResolution": {"startDate": "2016-12-26", "endDate": "2017-01-02"}
        },
        "Start": 36,
        "Length": 9
      }
    ]
  },
  {
    "Input": "There is no big news this week.",
    "Context": {"ReferenceDateTime": "2016-01-01T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2015-W53",
          "FutureResolution": {"startDate": "2015-12-28", "endDate": "2016-01-04"},
          "PastResolution": {"startDate": "2015-12-28", "endDate": "2016-01-04"}
        },
        "Start": 21,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I will do my work between now and november 15th",
    "Context": {"ReferenceDateTime": "2019-04-23T12:00:00"},
    "Results": [
      {
        "Text": "between now and november 15th",
        "Type": "daterange",
        "Value": {
          "Timex": "(2019-04-23,XXXX-11-15,P206D)",
          "FutureResolution": {"startDate": "2019-04-23", "endDate": "2019-11-15"},
          "PastResolution": {"startDate": "2019-04-23", "endDate": "2019-11-15"}
        },
        "Start": 18,
        "Length": 29
      }
    ]
  },
  {
    "Input": "I have finished my work between jan 22 and now",
    "Context": {"ReferenceDateTime": "2019-04-25T12:00:00"},
    "Results": [
      {
        "Text": "between jan 22 and now",
        "Type": "daterange",
        "Value": {
          "Timex": "(XXXX-01-22,2019-04-25,P93D)",
          "FutureResolution": {"startDate": "2019-01-22", "endDate": "2019-04-25"},
          "PastResolution": {"startDate": "2019-01-22", "endDate": "2019-04-25"}
        },
        "Start": 24,
        "Length": 22
      }
    ]
  },
  {
    "Input": "3pm : I'll be out on this week",
    "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-W28",
          "FutureResolution": {"startDate": "2019-07-08", "endDate": "2019-07-15"},
          "PastResolution": {"startDate": "2019-07-08", "endDate": "2019-07-15"}
        },
        "Start": 21,
        "Length": 9
      }
    ]
  },
  {
    "Input": "this week 8am should be a daterange and a datetime.",
    "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-W28",
          "FutureResolution": {"startDate": "2019-07-08", "endDate": "2019-07-15"},
          "PastResolution": {"startDate": "2019-07-08", "endDate": "2019-07-15"}
        },
        "Start": 0,
        "Length": 9
      }
    ]
  },
  {
    "Input": "this week 8p.m. should be a daterange and a time.",
    "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
    "Results": [
      {
        "Text": "this week",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-W28",
          "FutureResolution": {"startDate": "2019-07-08", "endDate": "2019-07-15"},
          "PastResolution": {"startDate": "2019-07-08", "endDate": "2019-07-15"}
        },
        "Start": 0,
        "Length": 9
      }
    ]
  },
  {
    "Input": "week 10 8 p.m. should be a daterange and a time.",
    "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
    "Results": [
      {
        "Text": "week 10",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-W10",
          "FutureResolution": {"startDate": "2019-03-04", "endDate": "2019-03-11"},
          "PastResolution": {"startDate": "2019-03-04", "endDate": "2019-03-11"}
        },
        "Start": 0,
        "Length": 7
      }
    ]
  },
  {
    "Input": "week 10 8p.m. should be a daterange and a time.",
    "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
    "Results": [
      {
        "Text": "week 10",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-W10",
          "FutureResolution": {"startDate": "2019-03-04", "endDate": "2019-03-11"},
          "PastResolution": {"startDate": "2019-03-04", "endDate": "2019-03-11"}
        },
        "Start": 0,
        "Length": 7
      }
    ]
  },
  {
    "Input": "week 10 10:20 should be a daterange and a time.",
    "Context": {"ReferenceDateTime": "2019-07-11T00:00:00"},
    "Results": [
      {
        "Text": "week 10",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-W10",
          "FutureResolution": {"startDate": "2019-03-04", "endDate": "2019-03-11"},
          "PastResolution": {"startDate": "2019-03-04", "endDate": "2019-03-11"}
        },
        "Start": 0,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I will leave from next friday to oct 1st 2020",
    "Context": {"ReferenceDateTime": "2019-07-30T15:00:00"},
    "NotSupported": "python, java, javascript",
    "Results": [
      {
        "Text": "from next friday to oct 1st 2020",
        "Type": "daterange",
        "Value": {
          "Timex": "(2019-08-09,2020-10-01,P419D)",
          "FutureResolution": {"startDate": "2019-08-09", "endDate": "2020-10-01"},
          "PastResolution": {"startDate": "2019-08-09", "endDate": "2020-10-01"}
        },
        "Start": 13,
        "Length": 32
      }
    ]
  },
  {
    "Input": "6,107.31 august 2019 should not include the decimal",
    "Results": [
      {
        "Text": "august 2019",
        "Type": "daterange",
        "Value": {
          "Timex": "2019-08",
          "FutureResolution": {"startDate": "2019-08-01", "endDate": "2019-09-01"},
          "PastResolution": {"startDate": "2019-08-01", "endDate": "2019-09-01"}
        },
        "Start": 9,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I was not there from 2019-aug-1 to today",
    "Context": {"ReferenceDateTime": "2019-10-14T15:00:00"},
    "Results": [
      {
        "Text": "from 2019-aug-1 to today",
        "Type": "daterange",
        "Value": {
          "Timex": "(2019-08-01,2019-10-14,P74D)",
          "FutureResolution": {"startDate": "2019-08-01", "endDate": "2019-10-14"},
          "PastResolution": {"startDate": "2019-08-01", "endDate": "2019-10-14"}
        },
        "Start": 16,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I was not there from 2019/aug/01 to today",
    "Context": {"ReferenceDateTime": "2019-09-30T15:00:00"},
    "Results": [
      {
        "Text": "from 2019/aug/01 to today",
        "Type": "daterange",
        "Value": {
          "Timex": "(2019-08-01,2019-09-30,P60D)",
          "FutureResolution": {"startDate": "2019-08-01", "endDate": "2019-09-30"},
          "PastResolution": {"startDate": "2019-08-01", "endDate": "2019-09-30"}
        },
        "Start": 16,
        "Length": 25
      }
    ]
  },
  {
    "Input": "please schedule a meeting for the week commencing february 4",
    "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the week commencing february 4",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-02-04",
          "FutureResolution": {"startDate": "2020-02-03", "endDate": "2020-02-10"},
          "PastResolution": {"startDate": "2019-02-04", "endDate": "2019-02-11"}
        },
        "Start": 30,
        "Length": 30
      }
    ]
  },
  {
    "Input": "please schedule a meeting for the week starting february 4",
    "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the week starting february 4",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-02-04",
          "FutureResolution": {"startDate": "2020-02-03", "endDate": "2020-02-10"},
          "PastResolution": {"startDate": "2019-02-04", "endDate": "2019-02-11"}
        },
        "Start": 30,
        "Length": 28
      }
    ]
  },
  {
    "Input": "please schedule a meeting for the week starting on february 4",
    "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the week starting on february 4",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-02-04",
          "FutureResolution": {"startDate": "2020-02-03", "endDate": "2020-02-10"},
          "PastResolution": {"startDate": "2019-02-04", "endDate": "2019-02-11"}
        },
        "Start": 30,
        "Length": 31
      }
    ]
  },
  {
    "Input": "please schedule a meeting for the week beginning on february 4",
    "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the week beginning on february 4",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-02-04",
          "FutureResolution": {"startDate": "2020-02-03", "endDate": "2020-02-10"},
          "PastResolution": {"startDate": "2019-02-04", "endDate": "2019-02-11"}
        },
        "Start": 30,
        "Length": 32
      }
    ]
  },
  {
    "Input": "please schedule a meeting for the week beginning february 4",
    "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "the week beginning february 4",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-02-04",
          "FutureResolution": {"startDate": "2020-02-03", "endDate": "2020-02-10"},
          "PastResolution": {"startDate": "2019-02-04", "endDate": "2019-02-11"}
        },
        "Start": 30,
        "Length": 29
      }
    ]
  },
  {
    "Input": "please schedule a meeting for w/c feb 4.",
    "Context": {"ReferenceDateTime": "2019-11-07T00:00:00"},
    "Results": [
      {
        "Text": "w/c feb 4",
        "Type": "daterange",
        "Value": {
          "Timex": "XXXX-02-04",
          "FutureResolution": {"startDate": "2020-02-03", "endDate": "2020-02-10"},
          "PastResolution": {"startDate": "2019-02-04", "endDate": "2019-02-11"}
        },
        "Start": 30,
        "Length": 9
      }
    ]
  },
  {
    "Input": "This company was established at the end of 2000",
    "Context": {"ReferenceDateTime": "2020-04-23T18:00:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "end of 2000",
        "Type": "daterange",
        "Value": {
          "Timex": "2000",
          "Mod": "end",
          "FutureResolution": {"startDate": "2000-09-01", "endDate": "2001-01-01"},
          "PastResolution": {"startDate": "2000-09-01", "endDate": "2001-01-01"}
        },
        "Start": 36,
        "Length": 11
      }
    ]
  },
  {
    "Input": "This company was established at the beginning of 2000",
    "Context": {"ReferenceDateTime": "2020-04-23T18:00:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "beginning of 2000",
        "Type": "daterange",
        "Value": {
          "Timex": "2000",
          "Mod": "start",
          "FutureResolution": {"startDate": "2000-01-01", "endDate": "2000-05-01"},
          "PastResolution": {"startDate": "2000-01-01", "endDate": "2000-05-01"}
        },
        "Start": 36,
        "Length": 17
      }
    ]
  },
  {
    "Input": "This company was established at the middle of 2000",
    "Context": {"ReferenceDateTime": "2020-04-23T18:00:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "middle of 2000",
        "Type": "daterange",
        "Value": {
          "Timex": "2000",
          "Mod": "mid",
          "FutureResolution": {"startDate": "2000-05-01", "endDate": "2000-09-01"},
          "PastResolution": {"startDate": "2000-05-01", "endDate": "2000-09-01"}
        },
        "Start": 36,
        "Length": 14
      }
    ]
  },
  {
    "Input": "Show me the records for august 99",
    "NotSupportedByDesign": "javascript,java",
    "Results": [
      {
        "Text": "august 99",
        "Type": "daterange",
        "Value": {
          "Timex": "1999-08",
          "FutureResolution": {"startDate": "1999-08-01", "endDate": "1999-09-01"},
          "PastResolution": {"startDate": "1999-08-01", "endDate": "1999-09-01"}
        },
        "Start": 24,
        "Length": 9
      }
    ]
  }
];
