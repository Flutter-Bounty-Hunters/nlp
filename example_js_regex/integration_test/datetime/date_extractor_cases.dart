const dateExtractorTestCases = [
  {
    "Input": "i'll go back on 15",
    "Results": [
      {"Text": "15", "Type": "date", "Start": 16, "Length": 2}
    ]
  },
  {
    "Input": "i'll go back april 22",
    "Results": [
      {"Text": "april 22", "Type": "date", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "i'll go back april22",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "april22", "Type": "date", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "i'll go back 22april",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "22april", "Type": "date", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "i'll go back jan-1",
    "Results": [
      {"Text": "jan-1", "Type": "date", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "i'll go back jan/1",
    "Results": [
      {"Text": "jan/1", "Type": "date", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "i'll go back october. 2",
    "Results": [
      {"Text": "october. 2", "Type": "date", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "i'll go back january 12, 2016",
    "Results": [
      {"Text": "january 12, 2016", "Type": "date", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "i'll go back january12,2016",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "january12,2016", "Type": "date", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "i'll go back january 12 of 2016",
    "Results": [
      {"Text": "january 12 of 2016", "Type": "date", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "i'll go back monday january 12th, 2016",
    "Results": [
      {"Text": "monday january 12th, 2016", "Type": "date", "Start": 13, "Length": 25}
    ]
  },
  {
    "Input": "i'll go back 02/22/2016",
    "Results": [
      {"Text": "02/22/2016", "Type": "date", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "i'll go back 21/04/2016",
    "Results": [
      {"Text": "21/04/2016", "Type": "date", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "i'll go back 21/04/16",
    "Results": [
      {"Text": "21/04/16", "Type": "date", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "i'll go back 9-18-15",
    "Results": [
      {"Text": "9-18-15", "Type": "date", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "i'll go back on 4.22",
    "Results": [
      {"Text": "4.22", "Type": "date", "Start": 16, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back on 4-22",
    "Results": [
      {"Text": "4-22", "Type": "date", "Start": 16, "Length": 4}
    ]
  },
  {"Input": "i'll go back at 4.22", "Results": []},
  {
    "Input": "i'll go back in 4-22",
    "Results": [
      {"Text": "4-22", "Type": "date", "Start": 16, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back on    4/22",
    "Results": [
      {"Text": "4/22", "Type": "date", "Start": 19, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back on 22/04",
    "Results": [
      {"Text": "22/04", "Type": "date", "Start": 16, "Length": 5}
    ]
  },
  {
    "Input": "i'll go back       4/22",
    "Results": [
      {"Text": "4/22", "Type": "date", "Start": 19, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back 22/04",
    "Results": [
      {"Text": "22/04", "Type": "date", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "i'll go back 2015/08/12",
    "Results": [
      {"Text": "2015/08/12", "Type": "date", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "i'll go back 11/12,2016",
    "Results": [
      {"Text": "11/12,2016", "Type": "date", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "i'll go back 11/12,16",
    "Results": [
      {"Text": "11/12,16", "Type": "date", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "i'll go back 1st jan",
    "Results": [
      {"Text": "1st jan", "Type": "date", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "i'll go back 1-jan",
    "Results": [
      {"Text": "1-jan", "Type": "date", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "i'll go back 28-nov",
    "Results": [
      {"Text": "28-nov", "Type": "date", "Start": 13, "Length": 6}
    ]
  },
  {
    "Input": "i'll go back wed, 22 of jan",
    "Results": [
      {"Text": "wed, 22 of jan", "Type": "date", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "i'll go back the first friday of july",
    "Results": [
      {"Text": "the first friday of july", "Type": "date", "Start": 13, "Length": 24}
    ]
  },
  {
    "Input": "i'll go back the first friday in this month",
    "Results": [
      {"Text": "the first friday in this month", "Type": "date", "Start": 13, "Length": 30}
    ]
  },
  {
    "Input": "i'll go back two weeks from now",
    "Results": [
      {"Text": "two weeks from now", "Type": "date", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "i'll go back next week on friday",
    "Results": [
      {"Text": "next week on friday", "Type": "date", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "i'll go back on friday next week",
    "Results": [
      {"Text": "on friday next week", "Type": "date", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "past monday",
    "Results": [
      {"Text": "past monday", "Type": "date", "Start": 0, "Length": 11}
    ]
  },
  {
    "Input": "i'll go back on tues.",
    "Results": [
      {"Text": "tues", "Type": "date", "Start": 16, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back on tues. good news.",
    "Results": [
      {"Text": "tues", "Type": "date", "Start": 16, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back on tues",
    "Results": [
      {"Text": "tues", "Type": "date", "Start": 16, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back on friday",
    "Results": [
      {"Text": "friday", "Type": "date", "Start": 16, "Length": 6}
    ]
  },
  {
    "Input": "i'll go back friday",
    "Results": [
      {"Text": "friday", "Type": "date", "Start": 13, "Length": 6}
    ]
  },
  {
    "Input": "i'll go back today",
    "Results": [
      {"Text": "today", "Type": "date", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "i'll go back tomorrow",
    "Results": [
      {"Text": "tomorrow", "Type": "date", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "i'll go back tmrw",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "tmrw", "Type": "date", "Start": 13, "Length": 4}
    ]
  },
  {
    "Input": "i'll go back yesterday",
    "Results": [
      {"Text": "yesterday", "Type": "date", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "i'll go back the day before yesterday",
    "Results": [
      {"Text": "the day before yesterday", "Type": "date", "Start": 13, "Length": 24}
    ]
  },
  {
    "Input": "i'll go back the day after tomorrow",
    "Results": [
      {"Text": "the day after tomorrow", "Type": "date", "Start": 13, "Length": 22}
    ]
  },
  {
    "Input": "i'll go back the day after tmrw",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "the day after tmrw", "Type": "date", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "i'll go back the next day",
    "Results": [
      {"Text": "the next day", "Type": "date", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "i'll go back next day",
    "Results": [
      {"Text": "next day", "Type": "date", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "i'll go back this friday",
    "Results": [
      {"Text": "this friday", "Type": "date", "Start": 13, "Length": 11}
    ]
  },
  {
    "Input": "i'll go back next sunday",
    "Results": [
      {"Text": "next sunday", "Type": "date", "Start": 13, "Length": 11}
    ]
  },
  {
    "Input": "i'll go back last sunday",
    "Results": [
      {"Text": "last sunday", "Type": "date", "Start": 13, "Length": 11}
    ]
  },
  {
    "Input": "i'll go back last day",
    "Results": [
      {"Text": "last day", "Type": "date", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "i'll go back the last day",
    "Results": [
      {"Text": "the last day", "Type": "date", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "i'll go back the day",
    "Results": [
      {"Text": "the day", "Type": "date", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "i'll go back this week friday",
    "Results": [
      {"Text": "this week friday", "Type": "date", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "i'll go back next week sunday",
    "Results": [
      {"Text": "next week sunday", "Type": "date", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "i'll go back last week sunday",
    "Results": [
      {"Text": "last week sunday", "Type": "date", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "i'll go back 15 june 2016",
    "Results": [
      {"Text": "15 june 2016", "Type": "date", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "a baseball on may the eleventh",
    "Results": [
      {"Text": "may the eleventh", "Type": "date", "Start": 14, "Length": 16}
    ]
  },
  {
    "Input": "i'll go back fourth of may",
    "Results": [
      {"Text": "fourth of may", "Type": "date", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "i'll go back 4th of march",
    "Results": [
      {"Text": "4th of march", "Type": "date", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "i'll go back jan first",
    "Results": [
      {"Text": "jan first", "Type": "date", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "i'll go back may twenty-first",
    "Results": [
      {"Text": "may twenty-first", "Type": "date", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "i'll go back may twenty one",
    "Results": [
      {"Text": "may twenty one", "Type": "date", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "i'll go back second of aug",
    "Results": [
      {"Text": "second of aug", "Type": "date", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "i'll go back twenty second of june",
    "Results": [
      {"Text": "twenty second of june", "Type": "date", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "i went back two months ago",
    "Results": [
      {"Text": "two months ago", "Type": "date", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "i'll go back two days later",
    "Results": [
      {"Text": "two days later", "Type": "date", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "who did i email a month ago",
    "Results": [
      {"Text": "a month ago", "Type": "date", "Start": 16, "Length": 11}
    ]
  },
  {
    "Input": "i went back for the 27",
    "Results": [
      {"Text": "the 27", "Type": "date", "Start": 16, "Length": 6}
    ]
  },
  {
    "Input": "i went back for the 27th",
    "Results": [
      {"Text": "the 27th", "Type": "date", "Start": 16, "Length": 8}
    ]
  },
  {
    "Input": "i went back for the 27.",
    "Results": [
      {"Text": "the 27", "Type": "date", "Start": 16, "Length": 6}
    ]
  },
  {
    "Input": "i went back for the 27!",
    "Results": [
      {"Text": "the 27", "Type": "date", "Start": 16, "Length": 6}
    ]
  },
  {
    "Input": "i went back for the 27 .",
    "Results": [
      {"Text": "the 27", "Type": "date", "Start": 16, "Length": 6}
    ]
  },
  {
    "Input": "i went back for the 21st",
    "Results": [
      {"Text": "the 21st", "Type": "date", "Start": 16, "Length": 8}
    ]
  },
  {
    "Input": "i went back for the 22nd",
    "Results": [
      {"Text": "the 22nd", "Type": "date", "Start": 16, "Length": 8}
    ]
  },
  {
    "Input": "i went back for the second",
    "Results": [
      {"Text": "the second", "Type": "date", "Start": 16, "Length": 10}
    ]
  },
  {
    "Input": "i went back for the twenty second",
    "Results": [
      {"Text": "the twenty second", "Type": "date", "Start": 16, "Length": 17}
    ]
  },
  {
    "Input": "i went back for the thirty first",
    "Results": [
      {"Text": "the thirty first", "Type": "date", "Start": 16, "Length": 16}
    ]
  },
  {
    "Input": "i went back on the 27th",
    "Results": [
      {"Text": "the 27th", "Type": "date", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "i went back on the 21st",
    "Results": [
      {"Text": "the 21st", "Type": "date", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "i went back on 22nd",
    "Results": [
      {"Text": "22nd", "Type": "date", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "i went back on the second!",
    "Results": [
      {"Text": "the second", "Type": "date", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "i went back on twenty second?",
    "Results": [
      {"Text": "twenty second", "Type": "date", "Start": 15, "Length": 13}
    ]
  },
  {"Input": "the first prize", "Results": []},
  {"Input": "i'll go to the 27th floor", "Results": []},
  {
    "Input": "Commemorative Events for the 25th Anniversary of Diplomatic Relations between Singapore and China",
    "Results": []
  },
  {"Input": "Get tickets for the 17th Door Haunted Experience", "Results": []},
  {
    "Input": "What do I have on saturday the second",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "saturday the second", "Type": "date", "Start": 18, "Length": 19}
    ]
  },
  {
    "Input": "A meeting for wednesday the 27th with Joe Smith",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "wednesday the 27th", "Type": "date", "Start": 14, "Length": 18}
    ]
  },
  {
    "Input": "i'll go back thursday the 21st",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "thursday the 21st", "Type": "date", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "i'll go back friday the 22nd",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "friday the 22nd", "Type": "date", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "i'll go back saturday the 23rd",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "saturday the 23rd", "Type": "date", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "i'll go back friday the 15th",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "friday the 15th", "Type": "date", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "i'll go back thursday the twenty first",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "thursday the twenty first", "Type": "date", "Start": 13, "Length": 25}
    ]
  },
  {
    "Input": "i'll go back friday the twenty second",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "friday the twenty second", "Type": "date", "Start": 13, "Length": 24}
    ]
  },
  {
    "Input": "i'll go back friday the fifteen",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "friday the fifteen", "Type": "date", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "i'll go back thursday the seventh",
    "Context": {"ReferenceDateTime": "2017-09-01T00:00:00"},
    "Results": [
      {"Text": "thursday the seventh", "Type": "date", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "i'll go back second sunday",
    "Results": [
      {"Text": "second sunday", "Type": "date", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "i'll go back first sunday",
    "Results": [
      {"Text": "first sunday", "Type": "date", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "i'll go back third tuesday",
    "Results": [
      {"Text": "third tuesday", "Type": "date", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "i'll go back fifth sunday",
    "Results": [
      {"Text": "fifth sunday", "Type": "date", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "i'll go back sixth sunday",
    "Results": [
      {"Text": "sunday", "Type": "date", "Start": 19, "Length": 6}
    ]
  },
  {
    "Input": "i'll go back tenth monday",
    "Results": [
      {"Text": "monday", "Type": "date", "Start": 19, "Length": 6}
    ]
  },
  {
    "Input": "i'll go back 20th of next month",
    "Results": [
      {"Text": "20th of next month", "Type": "date", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "i'll go back 31st of this month",
    "Results": [
      {"Text": "31st of this month", "Type": "date", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "Cortana could try to arrange a Skype call either friday this week or tuesday of next week",
    "Results": [
      {"Text": "friday this week", "Type": "date", "Start": 49, "Length": 16},
      {"Text": "tuesday of next week", "Type": "date", "Start": 69, "Length": 20}
    ]
  },
  {
    "Input": "Cortana could try to arrange a Skype call either friday of this week or this week on saturday",
    "Results": [
      {"Text": "friday of this week", "Type": "date", "Start": 49, "Length": 19},
      {"Text": "this week on saturday", "Type": "date", "Start": 72, "Length": 21}
    ]
  },
  {
    "Input": "16. nov. 2016",
    "Results": [
      {"Text": "16. nov. 2016", "Type": "date", "Start": 0, "Length": 13}
    ]
  },
  {
    "Input": "We had a meeting 1 month 21 days ago",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "1 month 21 days ago", "Type": "date", "Start": 17, "Length": 19}
    ]
  },
  {
    "Input": "i left here 2 years 1 month 21 days ago",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2 years 1 month 21 days ago", "Type": "date", "Start": 12, "Length": 27}
    ]
  },
  {
    "Input": "i will leve here 2 years 21 days later",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2 years 21 days later", "Type": "date", "Start": 17, "Length": 21}
    ]
  },
  {
    "Input": "i left here 1 month 2 years 21 days ago",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "1 month 2 years 21 days ago", "Type": "date", "Start": 12, "Length": 27}
    ]
  },
  {
    "Input": "i left here the 20th next month",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the 20th next month", "Type": "date", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "i left here 5 december 1391",
    "Results": [
      {"Text": "5 december 1391", "Type": "date", "Start": 12, "Length": 15}
    ]
  },
  {
    "Input": "monday, jan twenty two, 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "monday, jan twenty two, 2018", "Type": "date", "Start": 0, "Length": 28}
    ]
  },
  {
    "Input": "on sunday jan twenty one two thousand and eighteen",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "sunday jan twenty one two thousand and eighteen", "Type": "date", "Start": 3, "Length": 47}
    ]
  },
  {
    "Input": "on september the twenty-first nineteen seventy eight",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "september the twenty-first nineteen seventy eight", "Type": "date", "Start": 3, "Length": 49}
    ]
  },
  {
    "Input": "on september 10, nineteen zero one",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "september 10, nineteen zero one", "Type": "date", "Start": 3, "Length": 31}
    ]
  },
  {
    "Input": "on the tenth of september, two thousand",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "tenth of september, two thousand", "Type": "date", "Start": 7, "Length": 32}
    ]
  },
  {
    "Input": "Are you free on 13.5.2015?",
    "Results": [
      {"Text": "13.5.2015", "Type": "date", "Start": 16, "Length": 9}
    ]
  },
  {
    "Input": "Are you available on 2015.5.13?",
    "Results": [
      {"Text": "2015.5.13", "Type": "date", "Start": 21, "Length": 9}
    ]
  },
  {
    "Input": "Are you available two sundays from now?",
    "Results": [
      {"Text": "two sundays from now", "Type": "date", "Start": 18, "Length": 20}
    ]
  },
  {
    "Input": "Are you available two monday later?",
    "Results": [
      {"Text": "two monday later", "Type": "date", "Start": 18, "Length": 16}
    ]
  },
  {
    "Input": "Are you available two days after today?",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "two days after today", "Type": "date", "Start": 18, "Length": 20}
    ]
  },
  {
    "Input": "Are you available three weeks from tomorrow?",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "three weeks from tomorrow", "Type": "date", "Start": 18, "Length": 25}
    ]
  },
  {
    "Input": "Where were you two days before yesterday?",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "two days before yesterday", "Type": "date", "Start": 15, "Length": 25}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime this friday-jun-15 with Jim",
    "Context": {"ReferenceDateTime": "2018-06-14T00:00:00"},
    "Results": [
      {"Text": "this friday-jun-15", "Type": "date", "Start": 45, "Length": 18}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime this friday(jun-15) with Jim",
    "Context": {"ReferenceDateTime": "2018-06-14T00:00:00"},
    "Results": [
      {"Text": "this friday(jun-15)", "Type": "date", "Start": 45, "Length": 19}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime this friday (jun-15) with Jim",
    "Context": {"ReferenceDateTime": "2018-06-14T00:00:00"},
    "Results": [
      {"Text": "this friday (jun-15)", "Type": "date", "Start": 45, "Length": 20}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime this friday june twenty two with Jim",
    "Context": {"ReferenceDateTime": "2018-06-20T00:00:00"},
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "this friday june twenty two", "Type": "date", "Start": 45, "Length": 27}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime this friday june twenty three with Jim",
    "Context": {"ReferenceDateTime": "2018-06-20T00:00:00"},
    "Results": [
      {"Text": "this friday", "Type": "date", "Start": 45, "Length": 11},
      {"Text": "june twenty three", "Type": "date", "Start": 57, "Length": 17}
    ]
  },
  {
    "Input": "i will leave in 3 weeks",
    "Context": {"ReferenceDateTime": "2018-06-20T00:00:00"},
    "NotSupported": "javascript",
    "Results": [
      {"Text": "in 3 weeks", "Type": "date", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime on friday 7.6 with Jim.",
    "Context": {"ReferenceDateTime": "2018-07-06T00:00:00"},
    "Results": [
      {"Text": "friday 7.6", "Type": "date", "Start": 48, "Length": 10}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime friday 7/6 with Jim.",
    "Context": {"ReferenceDateTime": "2018-07-06T00:00:00"},
    "Results": [
      {"Text": "friday 7/6", "Type": "date", "Start": 45, "Length": 10}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime on friday 7-6 with Jim.",
    "Context": {"ReferenceDateTime": "2018-07-06T00:00:00"},
    "Results": [
      {"Text": "friday 7-6", "Type": "date", "Start": 48, "Length": 10}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime friday 2018-7-6 with Jim.",
    "Context": {"ReferenceDateTime": "2018-07-06T00:00:00"},
    "Results": [
      {"Text": "friday 2018-7-6", "Type": "date", "Start": 45, "Length": 15}
    ]
  },
  {
    "Input": "Cortana, please set up a Skype call sometime in two business days.",
    "Results": [
      {"Text": "in two business days", "Type": "date", "Start": 45, "Length": 20}
    ]
  },
  {
    "Input": "Cortana, can you please set something up for october, 1st.",
    "Results": [
      {"Text": "october, 1st", "Type": "date", "Start": 45, "Length": 12}
    ]
  },
  {
    "Input": "the face amount of its 6 1/4% convertible...",
    "Comment": "1/4 shouldn't recognized as date here",
    "Results": []
  },
  {
    "Input": "i'll go back twenty second of june 2017",
    "NotSupported": "python,javascript",
    "Results": [
      {"Text": "twenty second of june 2017", "Type": "date", "Start": 13, "Length": 26}
    ]
  },
  {
    "Input": "i'll go back twenty-second of june 2017",
    "NotSupported": "python,javascript",
    "Results": [
      {"Text": "twenty-second of june 2017", "Type": "date", "Start": 13, "Length": 26}
    ]
  },
  {
    "Input": "i'll go back 2019-sep-1",
    "Results": [
      {"Text": "2019-sep-1", "Type": "date", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "i'll go back 2019/sep/01",
    "Results": [
      {"Text": "2019/sep/01", "Type": "date", "Start": 13, "Length": 11}
    ]
  },
  {
    "Input": "Book me a trip on 26th june of 2020",
    "Results": [
      {"Text": "26th june of 2020", "Type": "date", "Start": 18, "Length": 17}
    ]
  }
];
