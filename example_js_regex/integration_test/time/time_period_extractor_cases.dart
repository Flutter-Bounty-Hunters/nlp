final timePeriodExtractorTestCases = [
  {
    "Input": "I'll be out 5 to 6pm",
    "Results": [
      {"Text": "5 to 6pm", "Type": "timerange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out 5 to 6 p.m.",
    "Results": [
      {"Text": "5 to 6 p.m.", "Type": "timerange", "Start": 12, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out 5 to 6 in the afternoon",
    "Results": [
      {"Text": "5 to 6 in the afternoon", "Type": "timerange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out 5 to seven in the morning",
    "Results": [
      {"Text": "5 to seven in the morning", "Type": "timerange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out from 5 to 6pm",
    "Results": [
      {"Text": "from 5 to 6pm", "Type": "timerange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out between 5 and 6pm",
    "Results": [
      {"Text": "between 5 and 6pm", "Type": "timerange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out between 5pm and 6pm",
    "Results": [
      {"Text": "between 5pm and 6pm", "Type": "timerange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I'll be out between 5 and 6 in the afternoon",
    "Results": [
      {"Text": "between 5 and 6 in the afternoon", "Type": "timerange", "Start": 12, "Length": 32}
    ]
  },
  {
    "Input": "I'll be out 4pm till 5pm",
    "Results": [
      {"Text": "4pm till 5pm", "Type": "timerange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out 4 til 5pm",
    "Results": [
      {"Text": "4 til 5pm", "Type": "timerange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out 4:00 till 5pm",
    "Results": [
      {"Text": "4:00 till 5pm", "Type": "timerange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out 4:00 til 5pm",
    "Results": [
      {"Text": "4:00 til 5pm", "Type": "timerange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out 4:00 to 7 oclock",
    "Results": [
      {"Text": "4:00 to 7 oclock", "Type": "timerange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I'll be out 3pm to half past seven",
    "Results": [
      {"Text": "3pm to half past seven", "Type": "timerange", "Start": 12, "Length": 22}
    ]
  },
  {
    "Input": "I'll be out 4pm-5pm",
    "Results": [
      {"Text": "4pm-5pm", "Type": "timerange", "Start": 12, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out 4pm - 5pm",
    "Results": [
      {"Text": "4pm - 5pm", "Type": "timerange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out 20 minutes to three to eight in the evening",
    "Results": [
      {"Text": "20 minutes to three to eight in the evening", "Type": "timerange", "Start": 12, "Length": 43}
    ]
  },
  {
    "Input": "I'll be out from 4pm to 5pm",
    "Results": [
      {"Text": "from 4pm to 5pm", "Type": "timerange", "Start": 12, "Length": 15}
    ]
  },
  {
    "Input": "I'll be out from 4pm to half past five",
    "Results": [
      {"Text": "from 4pm to half past five", "Type": "timerange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out from 3 in the morning until 5pm",
    "Results": [
      {"Text": "from 3 in the morning until 5pm", "Type": "timerange", "Start": 12, "Length": 31}
    ]
  },
  {
    "Input": "I'll be out from 3 in the morning until five in the afternoon",
    "Results": [
      {"Text": "from 3 in the morning until five in the afternoon", "Type": "timerange", "Start": 12, "Length": 49}
    ]
  },
  {
    "Input": "I'll be out between 4pm and half past five",
    "Results": [
      {"Text": "between 4pm and half past five", "Type": "timerange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out between 3 in the morning and 5pm",
    "Results": [
      {"Text": "between 3 in the morning and 5pm", "Type": "timerange", "Start": 12, "Length": 32}
    ]
  },
  {
    "Input": "let's meet in the morning",
    "Results": [
      {"Text": "in the morning", "Type": "timerange", "Start": 11, "Length": 14}
    ]
  },
  {
    "Input": "let's meet in the afternoon",
    "Results": [
      {"Text": "in the afternoon", "Type": "timerange", "Start": 11, "Length": 16}
    ]
  },
  {
    "Input": "let's meet in the night",
    "Results": [
      {"Text": "in the night", "Type": "timerange", "Start": 11, "Length": 12}
    ]
  },
  {
    "Input": "let's meet in the evening",
    "Results": [
      {"Text": "in the evening", "Type": "timerange", "Start": 11, "Length": 14}
    ]
  },
  {
    "Input": "let's meet in the evenings",
    "Results": [
      {"Text": "in the evenings", "Type": "timerange", "Start": 11, "Length": 15}
    ]
  },
  {
    "Input": "let's meet in the early-mornings",
    "Results": [
      {"Text": "in the early-mornings", "Type": "timerange", "Start": 11, "Length": 21}
    ]
  },
  {
    "Input": "let's meet in the late-mornings",
    "Results": [
      {"Text": "in the late-mornings", "Type": "timerange", "Start": 11, "Length": 20}
    ]
  },
  {
    "Input": "let's meet in the early-morning",
    "Results": [
      {"Text": "in the early-morning", "Type": "timerange", "Start": 11, "Length": 20}
    ]
  },
  {
    "Input": "let's meet in the late-morning",
    "Results": [
      {"Text": "in the late-morning", "Type": "timerange", "Start": 11, "Length": 19}
    ]
  },
  {
    "Input": "let's meet in the early-afternoon",
    "Results": [
      {"Text": "in the early-afternoon", "Type": "timerange", "Start": 11, "Length": 22}
    ]
  },
  {
    "Input": "let's meet in the late-afternoon",
    "Results": [
      {"Text": "in the late-afternoon", "Type": "timerange", "Start": 11, "Length": 21}
    ]
  },
  {
    "Input": "let's meet in the early-evening",
    "Results": [
      {"Text": "in the early-evening", "Type": "timerange", "Start": 11, "Length": 20}
    ]
  },
  {
    "Input": "let's meet in the late-evening",
    "Results": [
      {"Text": "in the late-evening", "Type": "timerange", "Start": 11, "Length": 19}
    ]
  },
  {
    "Input": "let's meet in the early-night",
    "Results": [
      {"Text": "in the early-night", "Type": "timerange", "Start": 11, "Length": 18}
    ]
  },
  {
    "Input": "let's meet in the late-night",
    "Results": [
      {"Text": "in the late-night", "Type": "timerange", "Start": 11, "Length": 17}
    ]
  },
  {
    "Input": "let's meet in the early night",
    "Results": [
      {"Text": "in the early night", "Type": "timerange", "Start": 11, "Length": 18}
    ]
  },
  {
    "Input": "let's meet in the late night",
    "Results": [
      {"Text": "in the late night", "Type": "timerange", "Start": 11, "Length": 17}
    ]
  },
  {
    "Input": "set up meeting from two to five pm",
    "Results": [
      {"Text": "from two to five pm", "Type": "timerange", "Start": 15, "Length": 19}
    ]
  },
  {
    "Input": "Party at Jean’s from 6 to 11 pm",
    "Results": [
      {"Text": "from 6 to 11 pm", "Type": "timerange", "Start": 16, "Length": 15}
    ]
  },
  {
    "Input": "set up meeting from 14:00 to 16:30",
    "Results": [
      {"Text": "from 14:00 to 16:30", "Type": "timerange", "Start": 15, "Length": 19}
    ]
  },
  {
    "Input": "set up meeting from two to five p m",
    "Results": [
      {"Text": "from two to five p m", "Type": "timerange", "Start": 15, "Length": 20}
    ]
  },
  {
    "Input": "set up meeting 1p.m. to 4",
    "Results": [
      {"Text": "1p.m. to 4", "Type": "timerange", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "set up meeting 1p.m. to 4.",
    "Results": [
      {"Text": "1p.m. to 4", "Type": "timerange", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "set up meeting 1:30p.m. to 4!",
    "Results": [
      {"Text": "1:30p.m. to 4", "Type": "timerange", "Start": 15, "Length": 13}
    ]
  },
  {"Input": "set up meeting 1:30p.m. to 4 people", "Results": []},
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting in the afternoon, this Friday I will leave.",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "in the afternoon", "Type": "timerange", "Start": 84, "Length": 16}
    ]
  },
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting this Friday, in the afternoon I will leave.",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "in the afternoon", "Type": "timerange", "Start": 97, "Length": 16}
    ]
  },
  {
    "Input": "set up meeting from 1:30 to 3:30",
    "Results": [
      {"Text": "from 1:30 to 3:30", "Type": "timerange", "Start": 15, "Length": 17}
    ]
  },
  {
    "Input": "set up meeting from 1:30 pm to 3:30",
    "Results": [
      {"Text": "from 1:30 pm to 3:30", "Type": "timerange", "Start": 15, "Length": 20}
    ]
  },
  {
    "Input": "set up meeting from 1:30 pm to 3:30 pm",
    "Results": [
      {"Text": "from 1:30 pm to 3:30 pm", "Type": "timerange", "Start": 15, "Length": 23}
    ]
  },
  {
    "Input": "set up meeting from 1 to 3:30",
    "Results": [
      {"Text": "from 1 to 3:30", "Type": "timerange", "Start": 15, "Length": 14}
    ]
  },
  {
    "Input": "set up meeting from 1:30 to 3",
    "Results": [
      {"Text": "from 1:30 to 3", "Type": "timerange", "Start": 15, "Length": 14}
    ]
  },
  {
    "Input": "set up meeting between 10 and 11:30",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 10 and 11:30", "Type": "timerange", "Start": 15, "Length": 20}
    ]
  },
  {
    "Input": "set up meeting between 10:10am and 12:50",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 10:10am and 12:50", "Type": "timerange", "Start": 15, "Length": 25}
    ]
  },
  {
    "Input": "set up meeting between 10:10pm and 3",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 10:10pm and 3", "Type": "timerange", "Start": 15, "Length": 21}
    ]
  },
  {
    "Input": "set up meeting from 10:10pm to 10",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from 10:10pm to 10", "Type": "timerange", "Start": 15, "Length": 18}
    ]
  },
  {
    "Input": "set up meeting from 10:30am to 23",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from 10:30am to 23", "Type": "timerange", "Start": 15, "Length": 18}
    ]
  },
  {
    "Input": "Don't call me in the business hours",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "in the business hours", "Type": "timerange", "Start": 14, "Length": 21}
    ]
  },
  {
    "Input": "I'll be out lunch time",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "lunch time", "Type": "timerange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "He is at lunch",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "at lunch", "Type": "timerange", "Start": 6, "Length": 8}
    ]
  },
  {
    "Input":
        "This popular family friendly concert returns to the Hall for another lunchtime filled with traditional carols and festive favourites",
    "NotSupported": "javascript, python, java",
    "Results": [
      {"Text": "lunchtime", "Type": "timerange", "Start": 69, "Length": 9}
    ]
  }
];
