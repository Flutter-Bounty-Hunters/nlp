const dateParserTestCases = [
  {
    "Input": "I'll go back on 15",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "15",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-15",
          "FutureResolution": {"date": "2016-11-15"},
          "PastResolution": {"date": "2016-10-15"}
        },
        "Start": 16,
        "Length": 2
      }
    ]
  },
  {
    "Input": "I'll go back Oct. 2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Oct. 2",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2016-10-02"}
        },
        "Start": 13,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll go back Oct-2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Oct-2",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2016-10-02"}
        },
        "Start": 13,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll go back Oct2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "Oct2",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2016-10-02"}
        },
        "Start": 13,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll go back Oct/2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Oct/2",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2016-10-02"}
        },
        "Start": 13,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll go back October. 2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "October. 2",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2016-10-02"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back October2",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "October2",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2016-10-02"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back January 12, 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "January 12, 2016",
        "Type": "date",
        "Value": {
          "Timex": "2016-01-12",
          "FutureResolution": {"date": "2016-01-12"},
          "PastResolution": {"date": "2016-01-12"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "i'll go back monday january 12th, 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "monday january 12th, 2016",
        "Type": "date",
        "Value": {
          "Timex": "2016-01-12",
          "FutureResolution": {"date": "2016-01-12"},
          "PastResolution": {"date": "2016-01-12"}
        },
        "Start": 13,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I'll go back 02/22/2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "02/22/2016",
        "Type": "date",
        "Value": {
          "Timex": "2016-02-22",
          "FutureResolution": {"date": "2016-02-22"},
          "PastResolution": {"date": "2016-02-22"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back 21/04/2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "21/04/2016",
        "Type": "date",
        "Value": {
          "Timex": "2016-04-21",
          "FutureResolution": {"date": "2016-04-21"},
          "PastResolution": {"date": "2016-04-21"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back 21/04/16",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "21/04/16",
        "Type": "date",
        "Value": {
          "Timex": "2016-04-21",
          "FutureResolution": {"date": "2016-04-21"},
          "PastResolution": {"date": "2016-04-21"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back 21-04-2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "21-04-2016",
        "Type": "date",
        "Value": {
          "Timex": "2016-04-21",
          "FutureResolution": {"date": "2016-04-21"},
          "PastResolution": {"date": "2016-04-21"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back on 4.22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "4.22",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-22",
          "FutureResolution": {"date": "2017-04-22"},
          "PastResolution": {"date": "2016-04-22"}
        },
        "Start": 16,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll go back on 4-22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "4-22",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-22",
          "FutureResolution": {"date": "2017-04-22"},
          "PastResolution": {"date": "2016-04-22"}
        },
        "Start": 16,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll go back in 4.22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "4.22",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-22",
          "FutureResolution": {"date": "2017-04-22"},
          "PastResolution": {"date": "2016-04-22"}
        },
        "Start": 16,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll go back at 4-22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": []
  },
  {
    "Input": "I'll go back at 4.22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": []
  },
  {
    "Input": "I'll go back on    4/22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "4/22",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-22",
          "FutureResolution": {"date": "2017-04-22"},
          "PastResolution": {"date": "2016-04-22"}
        },
        "Start": 19,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll go back on 22/04",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "22/04",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-22",
          "FutureResolution": {"date": "2017-04-22"},
          "PastResolution": {"date": "2016-04-22"}
        },
        "Start": 16,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll go back     4/22",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "4/22",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-22",
          "FutureResolution": {"date": "2017-04-22"},
          "PastResolution": {"date": "2016-04-22"}
        },
        "Start": 17,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll go back 22/04",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "22/04",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-22",
          "FutureResolution": {"date": "2017-04-22"},
          "PastResolution": {"date": "2016-04-22"}
        },
        "Start": 13,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll go back 2015/08/12",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "2015/08/12",
        "Type": "date",
        "Value": {
          "Timex": "2015-08-12",
          "FutureResolution": {"date": "2015-08-12"},
          "PastResolution": {"date": "2015-08-12"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back 08/12,2015",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "08/12,2015",
        "Type": "date",
        "Value": {
          "Timex": "2015-08-12",
          "FutureResolution": {"date": "2015-08-12"},
          "PastResolution": {"date": "2015-08-12"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I'll go back 08/12,15",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "08/12,15",
        "Type": "date",
        "Value": {
          "Timex": "2015-08-12",
          "FutureResolution": {"date": "2015-08-12"},
          "PastResolution": {"date": "2015-08-12"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back 1st Jan",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "1st Jan",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-01-01",
          "FutureResolution": {"date": "2017-01-01"},
          "PastResolution": {"date": "2016-01-01"}
        },
        "Start": 13,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll go back Jan-1",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Jan-1",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-01-01",
          "FutureResolution": {"date": "2017-01-01"},
          "PastResolution": {"date": "2016-01-01"}
        },
        "Start": 13,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll go back Wed, 22 of Jan",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Wed, 22 of Jan",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-01-22",
          "FutureResolution": {"date": "2017-01-22"},
          "PastResolution": {"date": "2016-01-22"}
        },
        "Start": 13,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll go back Jan first",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Jan first",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-01-01",
          "FutureResolution": {"date": "2017-01-01"},
          "PastResolution": {"date": "2016-01-01"}
        },
        "Start": 13,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll go back May twenty-first",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "May twenty-first",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-05-21",
          "FutureResolution": {"date": "2017-05-21"},
          "PastResolution": {"date": "2016-05-21"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back May twenty one",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "May twenty one",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-05-21",
          "FutureResolution": {"date": "2017-05-21"},
          "PastResolution": {"date": "2016-05-21"}
        },
        "Start": 13,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I'll go back second of Aug.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "second of Aug",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-08-02",
          "FutureResolution": {"date": "2017-08-02"},
          "PastResolution": {"date": "2016-08-02"}
        },
        "Start": 13,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back twenty second of June",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "twenty second of June",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-06-22",
          "FutureResolution": {"date": "2017-06-22"},
          "PastResolution": {"date": "2016-06-22"}
        },
        "Start": 13,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back on Friday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Friday",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-WXX-5",
          "FutureResolution": {"date": "2016-11-11"},
          "PastResolution": {"date": "2016-11-04"}
        },
        "Start": 16,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll go back |Friday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "Friday",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-WXX-5",
          "FutureResolution": {"date": "2016-11-11"},
          "PastResolution": {"date": "2016-11-04"}
        },
        "Start": 14,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll go back today",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "today",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-07",
          "FutureResolution": {"date": "2016-11-07"},
          "PastResolution": {"date": "2016-11-07"}
        },
        "Start": 13,
        "Length": 5
      }
    ]
  },
  {
    "Input": "I'll go back tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "tomorrow",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-08",
          "FutureResolution": {"date": "2016-11-08"},
          "PastResolution": {"date": "2016-11-08"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back tmrw",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "tmrw",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-08",
          "FutureResolution": {"date": "2016-11-08"},
          "PastResolution": {"date": "2016-11-08"}
        },
        "Start": 13,
        "Length": 4
      }
    ]
  },
  {
    "Input": "I'll go back yesterday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "yesterday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-06",
          "FutureResolution": {"date": "2016-11-06"},
          "PastResolution": {"date": "2016-11-06"}
        },
        "Start": 13,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll go back the day before yesterday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the day before yesterday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-05",
          "FutureResolution": {"date": "2016-11-05"},
          "PastResolution": {"date": "2016-11-05"}
        },
        "Start": 13,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll go back the day after tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the day after tomorrow",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-09",
          "FutureResolution": {"date": "2016-11-09"},
          "PastResolution": {"date": "2016-11-09"}
        },
        "Start": 13,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll go back the day after tmrw",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python, java",
    "Results": [
      {
        "Text": "the day after tmrw",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-09",
          "FutureResolution": {"date": "2016-11-09"},
          "PastResolution": {"date": "2016-11-09"}
        },
        "Start": 13,
        "Length": 18
      }
    ]
  },
  {
    "Input": "The day after tomorrow",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "The day after tomorrow",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-09",
          "FutureResolution": {"date": "2016-11-09"},
          "PastResolution": {"date": "2016-11-09"}
        },
        "Start": 0,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll go back the next day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the next day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-08",
          "FutureResolution": {"date": "2016-11-08"},
          "PastResolution": {"date": "2016-11-08"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back next day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-08",
          "FutureResolution": {"date": "2016-11-08"},
          "PastResolution": {"date": "2016-11-08"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back this Friday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this Friday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-11",
          "FutureResolution": {"date": "2016-11-11"},
          "PastResolution": {"date": "2016-11-11"}
        },
        "Start": 13,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll go back next Sunday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next Sunday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-20",
          "FutureResolution": {"date": "2016-11-20"},
          "PastResolution": {"date": "2016-11-20"}
        },
        "Start": 13,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll go back last Sunday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "last Sunday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-06",
          "FutureResolution": {"date": "2016-11-06"},
          "PastResolution": {"date": "2016-11-06"}
        },
        "Start": 13,
        "Length": 11
      }
    ]
  },
  {
    "Input": "I'll go back this week Friday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this week Friday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-11",
          "FutureResolution": {"date": "2016-11-11"},
          "PastResolution": {"date": "2016-11-11"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back next week Sunday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next week Sunday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-20",
          "FutureResolution": {"date": "2016-11-20"},
          "PastResolution": {"date": "2016-11-20"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back last week Sunday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "last week Sunday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-06",
          "FutureResolution": {"date": "2016-11-06"},
          "PastResolution": {"date": "2016-11-06"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back last day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "last day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-06",
          "FutureResolution": {"date": "2016-11-06"},
          "PastResolution": {"date": "2016-11-06"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back the last day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the last day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-06",
          "FutureResolution": {"date": "2016-11-06"},
          "PastResolution": {"date": "2016-11-06"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back the day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-07",
          "FutureResolution": {"date": "2016-11-07"},
          "PastResolution": {"date": "2016-11-07"}
        },
        "Start": 13,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I'll go back 15 June 2016",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "15 June 2016",
        "Type": "date",
        "Value": {
          "Timex": "2016-06-15",
          "FutureResolution": {"date": "2016-06-15"},
          "PastResolution": {"date": "2016-06-15"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back the first friday of july",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the first friday of july",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-07-WXX-5-#1",
          "FutureResolution": {"date": "2017-07-07"},
          "PastResolution": {"date": "2016-07-01"}
        },
        "Start": 13,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I'll go back the first friday in this month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the first friday in this month",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-11-WXX-5-#1",
          "FutureResolution": {"date": "2016-11-04"},
          "PastResolution": {"date": "2016-11-04"}
        },
        "Start": 13,
        "Length": 30
      }
    ]
  },
  {
    "Input": "I'll go back next week on Friday",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "next week on Friday",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-18",
          "FutureResolution": {"date": "2016-11-18"},
          "PastResolution": {"date": "2016-11-18"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I'll go back on Friday next week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "on Friday next week",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-18",
          "FutureResolution": {"date": "2016-11-18"},
          "PastResolution": {"date": "2016-11-18"}
        },
        "Start": 13,
        "Length": 19
      }
    ]
  },
  {
    "Input": "What does my day look like?",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "my day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-07",
          "FutureResolution": {"date": "2016-11-07"},
          "PastResolution": {"date": "2016-11-07"}
        },
        "Start": 10,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll go back this day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "this day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-07",
          "FutureResolution": {"date": "2016-11-07"},
          "PastResolution": {"date": "2016-11-07"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back past day",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "past day",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-06",
          "FutureResolution": {"date": "2016-11-06"},
          "PastResolution": {"date": "2016-11-06"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back two weeks from now",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "two weeks from now",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-21",
          "FutureResolution": {"date": "2016-11-21"},
          "PastResolution": {"date": "2016-11-21"}
        },
        "Start": 13,
        "Length": 18
      }
    ]
  },
  {
    "Input": "who did I email a month ago",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "a month ago",
        "Type": "date",
        "Value": {
          "Timex": "2016-10-07",
          "FutureResolution": {"date": "2016-10-07"},
          "PastResolution": {"date": "2016-10-07"}
        },
        "Start": 16,
        "Length": 11
      }
    ]
  },
  {
    "Input": "who did I email few months ago?",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "few months ago",
        "Type": "date",
        "Value": {
          "Timex": "2016-08-07",
          "FutureResolution": {"date": "2016-08-07"},
          "PastResolution": {"date": "2016-08-07"}
        },
        "Start": 16,
        "Length": 14
      }
    ]
  },
  {
    "Input": "who did I email a few days ago?",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "a few days ago",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-04",
          "FutureResolution": {"date": "2016-11-04"},
          "PastResolution": {"date": "2016-11-04"}
        },
        "Start": 16,
        "Length": 14
      }
    ]
  },
  {
    "Input": "I went back for the 27",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the 27",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-27",
          "FutureResolution": {"date": "2016-11-27"},
          "PastResolution": {"date": "2016-10-27"}
        },
        "Start": 16,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I went back for the 27th",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the 27th",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-27",
          "FutureResolution": {"date": "2016-11-27"},
          "PastResolution": {"date": "2016-10-27"}
        },
        "Start": 16,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I went back for the 27.",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the 27",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-27",
          "FutureResolution": {"date": "2016-11-27"},
          "PastResolution": {"date": "2016-10-27"}
        },
        "Start": 16,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I went back for the 27!",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the 27",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-27",
          "FutureResolution": {"date": "2016-11-27"},
          "PastResolution": {"date": "2016-10-27"}
        },
        "Start": 16,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I went back for the 27 .",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the 27",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-27",
          "FutureResolution": {"date": "2016-11-27"},
          "PastResolution": {"date": "2016-10-27"}
        },
        "Start": 16,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I went back for the 21st",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the 21st",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-21",
          "FutureResolution": {"date": "2016-11-21"},
          "PastResolution": {"date": "2016-10-21"}
        },
        "Start": 16,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I went back for the 22nd",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the 22nd",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-22",
          "FutureResolution": {"date": "2016-11-22"},
          "PastResolution": {"date": "2016-10-22"}
        },
        "Start": 16,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I went back for the second",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the second",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-02",
          "FutureResolution": {"date": "2016-12-02"},
          "PastResolution": {"date": "2016-11-02"}
        },
        "Start": 16,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I went back for the twenty second",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the twenty second",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-22",
          "FutureResolution": {"date": "2016-11-22"},
          "PastResolution": {"date": "2016-10-22"}
        },
        "Start": 16,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I went back for the thirty",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "the thirty",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-XX-30",
          "FutureResolution": {"date": "2016-11-30"},
          "PastResolution": {"date": "2016-10-30"}
        },
        "Start": 16,
        "Length": 10
      }
    ]
  },
  {
    "Input": "I went back Thursday the 21st",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "Thursday the 21st",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-21",
          "FutureResolution": {"date": "2017-09-21"},
          "PastResolution": {"date": "2017-09-21"}
        },
        "Start": 12,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I went back Friday the 22nd",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "Friday the 22nd",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-22",
          "FutureResolution": {"date": "2017-09-22"},
          "PastResolution": {"date": "2017-09-22"}
        },
        "Start": 12,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I went back Saturday the 23rd",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "Saturday the 23rd",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-23",
          "FutureResolution": {"date": "2017-09-23"},
          "PastResolution": {"date": "2017-09-23"}
        },
        "Start": 12,
        "Length": 17
      }
    ]
  },
  {
    "Input": "I went back Friday the 15th",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "Friday the 15th",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-15",
          "FutureResolution": {"date": "2017-09-15"},
          "PastResolution": {"date": "2017-09-15"}
        },
        "Start": 12,
        "Length": 15
      }
    ]
  },
  {
    "Input": "I went back Thursday the twenty first",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "Thursday the twenty first",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-21",
          "FutureResolution": {"date": "2017-09-21"},
          "PastResolution": {"date": "2017-09-21"}
        },
        "Start": 12,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I went back Friday the twenty second",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "Friday the twenty second",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-22",
          "FutureResolution": {"date": "2017-09-22"},
          "PastResolution": {"date": "2017-09-22"}
        },
        "Start": 12,
        "Length": 24
      }
    ]
  },
  {
    "Input": "I went back Friday the fifteen",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "Friday the fifteen",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-15",
          "FutureResolution": {"date": "2017-09-15"},
          "PastResolution": {"date": "2017-09-15"}
        },
        "Start": 12,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll go back second Sunday",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "second Sunday",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-10",
          "FutureResolution": {"date": "2017-09-10"},
          "PastResolution": {"date": "2017-09-10"}
        },
        "Start": 13,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back first Sunday",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "first Sunday",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-03",
          "FutureResolution": {"date": "2017-09-03"},
          "PastResolution": {"date": "2017-09-03"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I'll go back third Tuesday",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "third Tuesday",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-19",
          "FutureResolution": {"date": "2017-09-19"},
          "PastResolution": {"date": "2017-09-19"}
        },
        "Start": 13,
        "Length": 13
      }
    ]
  },
  {
    "Input": "I'll go back fifth Sunday",
    "Context": {"ReferenceDateTime": "2017-09-27T00:00:00"},
    "Results": [
      {
        "Text": "fifth Sunday",
        "Type": "date",
        "Value": {
          "Timex": "2017-09-31",
          "FutureResolution": {"date": "0001-01-01"},
          "PastResolution": {"date": "0001-01-01"}
        },
        "Start": 13,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I went back 20th of next month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "20th of next month",
        "Type": "date",
        "Value": {
          "Timex": "2016-12-20",
          "FutureResolution": {"date": "2016-12-20"},
          "PastResolution": {"date": "2016-12-20"}
        },
        "Start": 12,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I went back 31st of this month",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "31st of this month",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-31",
          "FutureResolution": {"date": "0001-01-01"},
          "PastResolution": {"date": "0001-01-01"}
        },
        "Start": 12,
        "Length": 18
      }
    ]
  },
  {
    "Input": "I'll go back January 12, 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "January 12, 2018",
        "Type": "date",
        "Value": {
          "Timex": "2018-01-12",
          "FutureResolution": {"date": "2018-01-12"},
          "PastResolution": {"date": "2018-01-12"}
        },
        "Start": 13,
        "Length": 16
      }
    ]
  },
  {
    "Input": "I'll go back 9-18-15",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "9-18-15",
        "Type": "date",
        "Value": {
          "Timex": "2015-09-18",
          "FutureResolution": {"date": "2015-09-18"},
          "PastResolution": {"date": "2015-09-18"}
        },
        "Start": 13,
        "Length": 7
      }
    ]
  },
  {
    "Input": "I went back two days ago",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "two days ago",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-05",
          "FutureResolution": {"date": "2016-11-05"},
          "PastResolution": {"date": "2016-11-05"}
        },
        "Start": 12,
        "Length": 12
      }
    ]
  },
  {
    "Input": "I went back two years ago",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "two years ago",
        "Type": "date",
        "Value": {
          "Timex": "2014-11-07",
          "FutureResolution": {"date": "2014-11-07"},
          "PastResolution": {"date": "2014-11-07"}
        },
        "Start": 12,
        "Length": 13
      }
    ]
  },
  {
    "Input": "16. Nov. 2016",
    "Context": {"ReferenceDateTime": "2016-11-14T00:00:00"},
    "Results": [
      {
        "Text": "16. Nov. 2016",
        "Type": "date",
        "Value": {
          "Timex": "2016-11-16",
          "FutureResolution": {"date": "2016-11-16"},
          "PastResolution": {"date": "2016-11-16"}
        },
        "Start": 0,
        "Length": 13
      }
    ]
  },
  {
    "Input": "We had a meeting 1 month 21 days ago",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1 month 21 days ago",
        "Type": "date",
        "Value": {
          "Timex": "2017-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2017-10-02"}
        },
        "Start": 17,
        "Length": 19
      }
    ]
  },
  {
    "Input": "I left here 2 years 1 month 21 days ago",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "2 years 1 month 21 days ago",
        "Type": "date",
        "Value": {
          "Timex": "2015-10-02",
          "FutureResolution": {"date": "2015-10-02"},
          "PastResolution": {"date": "2015-10-02"}
        },
        "Start": 12,
        "Length": 27
      }
    ]
  },
  {
    "Input": "I will leve here 2 years 21 days later",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "2 years 21 days later",
        "Type": "date",
        "Value": {
          "Timex": "2019-12-14",
          "FutureResolution": {"date": "2019-12-14"},
          "PastResolution": {"date": "2019-12-14"}
        },
        "Start": 17,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I left here 1 month 2 years 21 days ago",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1 month 2 years 21 days ago",
        "Type": "date",
        "Value": {
          "Timex": "2015-10-02",
          "FutureResolution": {"date": "2015-10-02"},
          "PastResolution": {"date": "2015-10-02"}
        },
        "Start": 12,
        "Length": 27
      }
    ]
  },
  {
    "Input": "We had a meeting 1 month and 21 days ago",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1 month and 21 days ago",
        "Type": "date",
        "Value": {
          "Timex": "2017-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2017-10-02"}
        },
        "Start": 17,
        "Length": 23
      }
    ]
  },
  {
    "Input": "We had a meeting 1 month, 21 days ago",
    "Context": {"ReferenceDateTime": "2017-11-23T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "1 month, 21 days ago",
        "Type": "date",
        "Value": {
          "Timex": "2017-10-02",
          "FutureResolution": {"date": "2017-10-02"},
          "PastResolution": {"date": "2017-10-02"}
        },
        "Start": 17,
        "Length": 20
      }
    ]
  },
  {
    "Input": "We had a meeting the 20th of next month",
    "Context": {"ReferenceDateTime": "2017-12-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "the 20th of next month",
        "Type": "date",
        "Value": {
          "Timex": "2018-01-20",
          "FutureResolution": {"date": "2018-01-20"},
          "PastResolution": {"date": "2018-01-20"}
        },
        "Start": 17,
        "Length": 22
      }
    ]
  },
  {
    "Input": "We had a meeting 5 December 1391",
    "Context": {"ReferenceDateTime": "2017-12-18T00:00:00"},
    "Results": [
      {
        "Text": "5 December 1391",
        "Type": "date",
        "Value": {
          "Timex": "1391-12-05",
          "FutureResolution": {"date": "1391-12-05"},
          "PastResolution": {"date": "1391-12-05"}
        },
        "Start": 17,
        "Length": 15
      }
    ]
  },
  {
    "Input": "monday, jan twenty two, 2018",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "monday, jan twenty two, 2018",
        "Type": "date",
        "Value": {
          "Timex": "2018-01-22",
          "FutureResolution": {"date": "2018-01-22"},
          "PastResolution": {"date": "2018-01-22"}
        },
        "Start": 0,
        "Length": 28
      }
    ]
  },
  {
    "Input": "on sunday jan twenty one two thousand and eighteen",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "sunday jan twenty one two thousand and eighteen",
        "Type": "date",
        "Value": {
          "Timex": "2018-01-21",
          "FutureResolution": {"date": "2018-01-21"},
          "PastResolution": {"date": "2018-01-21"}
        },
        "Start": 3,
        "Length": 47
      }
    ]
  },
  {
    "Input": "on September the twenty-first nineteen seventy eight",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "September the twenty-first nineteen seventy eight",
        "Type": "date",
        "Value": {
          "Timex": "1978-09-21",
          "FutureResolution": {"date": "1978-09-21"},
          "PastResolution": {"date": "1978-09-21"}
        },
        "Start": 3,
        "Length": 49
      }
    ]
  },
  {
    "Input": "on September 10, nineteen zero one",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "September 10, nineteen zero one",
        "Type": "date",
        "Value": {
          "Timex": "1901-09-10",
          "FutureResolution": {"date": "1901-09-10"},
          "PastResolution": {"date": "1901-09-10"}
        },
        "Start": 3,
        "Length": 31
      }
    ]
  },
  {
    "Input": "on the tenth of September, two thousand",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "tenth of September, two thousand",
        "Type": "date",
        "Value": {
          "Timex": "2000-09-10",
          "FutureResolution": {"date": "2000-09-10"},
          "PastResolution": {"date": "2000-09-10"}
        },
        "Start": 7,
        "Length": 32
      }
    ]
  },
  {
    "Input": "I'll see you the first Friday of next month",
    "Context": {"ReferenceDateTime": "2018-03-20T09:58:00"},
    "Results": [
      {
        "Text": "the first Friday of next month",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-WXX-5-#1",
          "FutureResolution": {"date": "2018-04-06"},
          "PastResolution": {"date": "2018-04-06"}
        },
        "Start": 13,
        "Length": 30
      }
    ]
  },
  {
    "Input": "So, make it the second Monday of next month?",
    "Context": {"ReferenceDateTime": "2018-03-20T10:45:00"},
    "Results": [
      {
        "Text": "the second Monday of next month",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-04-WXX-1-#2",
          "FutureResolution": {"date": "2018-04-09"},
          "PastResolution": {"date": "2018-04-09"}
        },
        "Start": 12,
        "Length": 31
      }
    ]
  },
  {
    "Input": "I came back the third Wednesday of previous month",
    "Context": {"ReferenceDateTime": "2018-03-20T10:45:00"},
    "Results": [
      {
        "Text": "the third Wednesday of previous month",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-02-WXX-3-#3",
          "FutureResolution": {"date": "2018-02-21"},
          "PastResolution": {"date": "2018-02-21"}
        },
        "Start": 12,
        "Length": 37
      }
    ]
  },
  {
    "Input": "I'll go travelling Tuesday next week",
    "Context": {"ReferenceDateTime": "2018-03-20T22:16:00"},
    "Results": [
      {
        "Text": "Tuesday next week",
        "Type": "date",
        "Value": {
          "Timex": "2018-03-27",
          "FutureResolution": {"date": "2018-03-27"},
          "PastResolution": {"date": "2018-03-27"}
        },
        "Start": 19,
        "Length": 17
      }
    ]
  },
  {
    "Input": "Handle homework on Sunday of next week",
    "Context": {"ReferenceDateTime": "2018-03-20T22:16:00"},
    "Results": [
      {
        "Text": "on Sunday of next week",
        "Type": "date",
        "Value": {
          "Timex": "2018-04-01",
          "FutureResolution": {"date": "2018-04-01"},
          "PastResolution": {"date": "2018-04-01"}
        },
        "Start": 16,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll go back two days from tomorrow.",
    "Context": {"ReferenceDateTime": "2018-04-20T00:00:00"},
    "Results": [
      {
        "Text": "two days from tomorrow",
        "Type": "date",
        "Value": {
          "Timex": "2018-04-23",
          "FutureResolution": {"date": "2018-04-23"},
          "PastResolution": {"date": "2018-04-23"}
        },
        "Start": 13,
        "Length": 22
      }
    ]
  },
  {
    "Input": "I'll go back four days from yesterday.",
    "Context": {"ReferenceDateTime": "2018-04-20T00:00:00"},
    "Results": [
      {
        "Text": "four days from yesterday",
        "Type": "date",
        "Value": {
          "Timex": "2018-04-23",
          "FutureResolution": {"date": "2018-04-23"},
          "PastResolution": {"date": "2018-04-23"}
        },
        "Start": 13,
        "Length": 24
      }
    ]
  },
  {
    "Input": "Are you free on 13.5.2015?",
    "Context": {"ReferenceDateTime": "2017-03-22T00:00:00"},
    "Results": [
      {
        "Text": "13.5.2015",
        "Type": "date",
        "Value": {
          "Timex": "2015-05-13",
          "FutureResolution": {"date": "2015-05-13"},
          "PastResolution": {"date": "2015-05-13"}
        },
        "Start": 16,
        "Length": 9
      }
    ]
  },
  {
    "Input": "Are you available on 2015.5.13?",
    "Context": {"ReferenceDateTime": "2017-03-22T00:00:00"},
    "Results": [
      {
        "Text": "2015.5.13",
        "Type": "date",
        "Value": {
          "Timex": "2015-05-13",
          "FutureResolution": {"date": "2015-05-13"},
          "PastResolution": {"date": "2015-05-13"}
        },
        "Start": 21,
        "Length": 9
      }
    ]
  },
  {
    "Input": "I'll go back 3-7-2017",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3-7-2017",
        "Type": "date",
        "Value": {
          "Timex": "2017-03-07",
          "FutureResolution": {"date": "2017-03-07"},
          "PastResolution": {"date": "2017-03-07"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back 3-7-07",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3-7-07",
        "Type": "date",
        "Value": {
          "Timex": "2007-03-07",
          "FutureResolution": {"date": "2007-03-07"},
          "PastResolution": {"date": "2007-03-07"}
        },
        "Start": 13,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll go back 3-7-27",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "3-7-27",
        "Type": "date",
        "Value": {
          "Timex": "2027-03-07",
          "FutureResolution": {"date": "2027-03-07"},
          "PastResolution": {"date": "2027-03-07"}
        },
        "Start": 13,
        "Length": 6
      }
    ]
  },
  {
    "Input": "I'll go back 05/05/89",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "05/05/89",
        "Type": "date",
        "Value": {
          "Timex": "1989-05-05",
          "FutureResolution": {"date": "1989-05-05"},
          "PastResolution": {"date": "1989-05-05"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "I'll go back 05/05/71",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {
        "Text": "05/05/71",
        "Type": "date",
        "Value": {
          "Timex": "1971-05-05",
          "FutureResolution": {"date": "1971-05-05"},
          "PastResolution": {"date": "1971-05-05"}
        },
        "Start": 13,
        "Length": 8
      }
    ]
  },
  {
    "Input": "Are you available two sundays from now?",
    "Context": {"ReferenceDateTime": "2018-05-07T00:00:00"},
    "Results": [
      {
        "Text": "two sundays from now",
        "Type": "date",
        "Value": {
          "Timex": "2018-05-20",
          "FutureResolution": {"date": "2018-05-20"},
          "PastResolution": {"date": "2018-05-20"}
        },
        "Start": 18,
        "Length": 20
      }
    ]
  },
  {
    "Input": "Are you available two monday later?",
    "Context": {"ReferenceDateTime": "2018-05-07T00:00:00"},
    "NotSupported": "python",
    "Results": [
      {
        "Text": "two monday later",
        "Type": "date",
        "Value": {
          "Timex": "2018-05-21",
          "FutureResolution": {"date": "2018-05-21"},
          "PastResolution": {"date": "2018-05-21"}
        },
        "Start": 18,
        "Length": 16
      }
    ]
  },
  {
    "Input": "Are you available two days after today?",
    "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "two days after today",
        "Type": "date",
        "Value": {
          "Timex": "2018-06-02",
          "FutureResolution": {"date": "2018-06-02"},
          "PastResolution": {"date": "2018-06-02"}
        },
        "Start": 18,
        "Length": 20
      }
    ]
  },
  {
    "Input": "Are you available three weeks from tomorrow?",
    "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "three weeks from tomorrow",
        "Type": "date",
        "Value": {
          "Timex": "2018-06-22",
          "FutureResolution": {"date": "2018-06-22"},
          "PastResolution": {"date": "2018-06-22"}
        },
        "Start": 18,
        "Length": 25
      }
    ]
  },
  {
    "Input": "Where were you two days before yesterday?",
    "Context": {"ReferenceDateTime": "2018-05-31T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "two days before yesterday",
        "Type": "date",
        "Value": {
          "Timex": "2018-05-28",
          "FutureResolution": {"date": "2018-05-28"},
          "PastResolution": {"date": "2018-05-28"}
        },
        "Start": 15,
        "Length": 25
      }
    ]
  },
  {
    "Input": "I will leave in 3 weeks",
    "Context": {"ReferenceDateTime": "2018-07-05T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {
        "Text": "in 3 weeks",
        "Type": "date",
        "Value": {
          "Timex": "2018-07-26",
          "FutureResolution": {"date": "2018-07-26"},
          "PastResolution": {"date": "2018-07-26"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime in four business days.",
    "Context": {"ReferenceDateTime": "2018-08-21T08:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "in four business days",
        "Type": "date",
        "Value": {
          "Timex": "2018-08-27",
          "FutureResolution": {"date": "2018-08-27"},
          "PastResolution": {"date": "2018-08-27"}
        },
        "Start": 45,
        "Length": 21
      }
    ]
  },
  {
    "Input": "I'll go back twenty second of june 2017",
    "Context": {"ReferenceDateTime": "2018-08-21T08:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {
        "Text": "twenty second of june 2017",
        "Type": "date",
        "Value": {
          "Timex": "2017-06-22",
          "FutureResolution": {"date": "2017-06-22"},
          "PastResolution": {"date": "2017-06-22"}
        },
        "Start": 13,
        "Length": 26
      }
    ]
  },
  {
    "Input": "i'll go back 2019-sep-1.",
    "Context": {"ReferenceDateTime": "2018-08-21T08:00:00"},
    "Results": [
      {
        "Text": "2019-sep-1",
        "Type": "date",
        "Value": {
          "Timex": "2019-09-01",
          "FutureResolution": {"date": "2019-09-01"},
          "PastResolution": {"date": "2019-09-01"}
        },
        "Start": 13,
        "Length": 10
      }
    ]
  },
  {
    "Input": "i'll go back 2019/sep/01.",
    "Context": {"ReferenceDateTime": "2018-08-21T08:00:00"},
    "Results": [
      {
        "Text": "2019/sep/01",
        "Type": "date",
        "Value": {
          "Timex": "2019-09-01",
          "FutureResolution": {"date": "2019-09-01"},
          "PastResolution": {"date": "2019-09-01"}
        },
        "Start": 13,
        "Length": 11
      }
    ]
  },
  {
    "Input": "Feb 29",
    "Context": {"ReferenceDateTime": "2017-03-22T00:00:00"},
    "NotSupported": "java, javascript",
    "Results": [
      {
        "Text": "Feb 29",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-02-29",
          "FutureResolution": {"date": "2020-02-29"},
          "PastResolution": {"date": "2016-02-29"}
        },
        "Start": 0,
        "Length": 6
      }
    ]
  },
  {
    "Input": "2/29",
    "Context": {"ReferenceDateTime": "2019-03-22T00:00:00"},
    "NotSupported": "java, javascript",
    "Results": [
      {
        "Text": "2/29",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-02-29",
          "FutureResolution": {"date": "2020-02-29"},
          "PastResolution": {"date": "2016-02-29"}
        },
        "Start": 0,
        "Length": 4
      }
    ]
  },
  {
    "Input": "Feb 29th",
    "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
    "NotSupported": "java, javascript",
    "Results": [
      {
        "Text": "Feb 29th",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-02-29",
          "FutureResolution": {"date": "2024-02-29"},
          "PastResolution": {"date": "2020-02-29"}
        },
        "Start": 0,
        "Length": 8
      }
    ]
  },
  {
    "Input": "Feb 30",
    "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
    "Results": [
      {
        "Text": "Feb 30",
        "Type": "date",
        "Value": {
          "Timex": "XXXX-02-30",
          "FutureResolution": {"date": "0001-01-01"},
          "PastResolution": {"date": "0001-01-01"}
        },
        "Start": 0,
        "Length": 6
      }
    ]
  },
  {
    "Input": "2/29/2019",
    "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
    "Results": [
      {
        "Text": "2/29/2019",
        "Type": "date",
        "Value": {
          "Timex": "2019-02-29",
          "FutureResolution": {"date": "0001-01-01"},
          "PastResolution": {"date": "0001-01-01"}
        },
        "Start": 0,
        "Length": 9
      }
    ]
  },
  {
    "Input": "2/29/2020",
    "Context": {"ReferenceDateTime": "2020-03-22T00:00:00"},
    "Results": [
      {
        "Text": "2/29/2020",
        "Type": "date",
        "Value": {
          "Timex": "2020-02-29",
          "FutureResolution": {"date": "2020-02-29"},
          "PastResolution": {"date": "2020-02-29"}
        },
        "Start": 0,
        "Length": 9
      }
    ]
  }
];
