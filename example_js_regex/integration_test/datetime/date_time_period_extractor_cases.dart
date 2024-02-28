const dateTimePeriodExtractorTestCases = [
  {
    "Input": "I'll be out five to seven today",
    "Results": [
      {"Text": "five to seven today", "Type": "datetimerange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I'll be out five to seven of tomorrow",
    "Results": [
      {"Text": "five to seven of tomorrow", "Type": "datetimerange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out from 5 to 6 next sunday",
    "Results": [
      {"Text": "from 5 to 6 next sunday", "Type": "datetimerange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out from 5 to 6pm next sunday",
    "Results": [
      {"Text": "from 5 to 6pm next sunday", "Type": "datetimerange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out from 4pm to 5pm today",
    "Results": [
      {"Text": "from 4pm to 5pm today", "Type": "datetimerange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "I'll be out from 4pm today to 5pm tomorrow",
    "Results": [
      {"Text": "from 4pm today to 5pm tomorrow", "Type": "datetimerange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out from 4pm to 5pm of tomorrow",
    "Results": [
      {"Text": "from 4pm to 5pm of tomorrow", "Type": "datetimerange", "Start": 12, "Length": 27}
    ]
  },
  {
    "Input": "I'll be out from 4pm to 5pm of 2017-6-6",
    "Results": [
      {"Text": "from 4pm to 5pm of 2017-6-6", "Type": "datetimerange", "Start": 12, "Length": 27}
    ]
  },
  {
    "Input": "I'll be out from 4pm to 5pm May 5, 2018",
    "Results": [
      {"Text": "from 4pm to 5pm may 5, 2018", "Type": "datetimerange", "Start": 12, "Length": 27}
    ]
  },
  {
    "Input": "I'll be out from 4:00 to 5pm may 5, 2018",
    "Results": [
      {"Text": "from 4:00 to 5pm may 5, 2018", "Type": "datetimerange", "Start": 12, "Length": 28}
    ]
  },
  {
    "Input": "I'll be out from 4pm on Jan 1, 2016 to 5pm today",
    "Results": [
      {"Text": "from 4pm on jan 1, 2016 to 5pm today", "Type": "datetimerange", "Start": 12, "Length": 36}
    ]
  },
  {
    "Input": "I'll be out from 2:00pm, 2016-2-21 to 3:32, 04/23/2016",
    "Comment": "Java does not correctly handle lookbehinds.",
    "NotSupported": "java",
    "Results": [
      {"Text": "from 2:00pm, 2016-2-21 to 3:32, 04/23/2016", "Type": "datetimerange", "Start": 12, "Length": 42}
    ]
  },
  {
    "Input": "I'll be out from today at 4 to next Wedn at 5",
    "Results": [
      {"Text": "from today at 4 to next wedn at 5", "Type": "datetimerange", "Start": 12, "Length": 33}
    ]
  },
  {
    "Input": "I'll be out between 4pm and 5pm today",
    "Results": [
      {"Text": "between 4pm and 5pm today", "Type": "datetimerange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out between 4pm on Jan 1, 2016 and 5pm today",
    "Results": [
      {"Text": "between 4pm on jan 1, 2016 and 5pm today", "Type": "datetimerange", "Start": 12, "Length": 40}
    ]
  },
  {
    "Input": "I'll go back tonight",
    "Results": [
      {"Text": "tonight", "Type": "datetimerange", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "I'll go back this night",
    "Results": [
      {"Text": "this night", "Type": "datetimerange", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I'll go back this evening",
    "Results": [
      {"Text": "this evening", "Type": "datetimerange", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "I'll go back this morning",
    "Results": [
      {"Text": "this morning", "Type": "datetimerange", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "I'll go back this afternoon",
    "Results": [
      {"Text": "this afternoon", "Type": "datetimerange", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "I'll go back next night",
    "Results": [
      {"Text": "next night", "Type": "datetimerange", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I'll go back last night",
    "Results": [
      {"Text": "last night", "Type": "datetimerange", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I'll go back tomorrow night",
    "Results": [
      {"Text": "tomorrow night", "Type": "datetimerange", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "I'll go back next monday afternoon",
    "Results": [
      {"Text": "next monday afternoon", "Type": "datetimerange", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll go back May 5th night",
    "Results": [
      {"Text": "may 5th night", "Type": "datetimerange", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "I'll go back last 3 minute",
    "Results": [
      {"Text": "last 3 minute", "Type": "datetimerange", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "I'll go back past 3 minute",
    "Results": [
      {"Text": "past 3 minute", "Type": "datetimerange", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "I'll go back previous 3 minute",
    "Results": [
      {"Text": "previous 3 minute", "Type": "datetimerange", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll go back previous 3mins",
    "Results": [
      {"Text": "previous 3mins", "Type": "datetimerange", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "I'll go back next 5 hrs",
    "Results": [
      {"Text": "next 5 hrs", "Type": "datetimerange", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I'll go back last minute",
    "Results": [
      {"Text": "last minute", "Type": "datetimerange", "Start": 13, "Length": 11}
    ]
  },
  {
    "Input": "I'll go back next hour",
    "Results": [
      {"Text": "next hour", "Type": "datetimerange", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "I'll go back last few minutes",
    "Results": [
      {"Text": "last few minutes", "Type": "datetimerange", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back past several minutes",
    "Results": [
      {"Text": "past several minutes", "Type": "datetimerange", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "I'll go back tuesday in the morning",
    "Results": [
      {"Text": "tuesday in the morning", "Type": "datetimerange", "Start": 13, "Length": 22}
    ]
  },
  {
    "Input": "I'll go back tuesday in the afternoon",
    "Results": [
      {"Text": "tuesday in the afternoon", "Type": "datetimerange", "Start": 13, "Length": 24}
    ]
  },
  {
    "Input": "I'll go back tuesday in the evening",
    "Results": [
      {"Text": "tuesday in the evening", "Type": "datetimerange", "Start": 13, "Length": 22}
    ]
  },
  {
    "Input": "let's meet in the early-morning Tuesday",
    "Results": [
      {"Text": "in the early-morning tuesday", "Type": "datetimerange", "Start": 11, "Length": 28}
    ]
  },
  {
    "Input": "let's meet in the late-morning Tuesday",
    "Results": [
      {"Text": "in the late-morning tuesday", "Type": "datetimerange", "Start": 11, "Length": 27}
    ]
  },
  {
    "Input": "let's meet in the early-afternoon Tuesday",
    "Results": [
      {"Text": "in the early-afternoon tuesday", "Type": "datetimerange", "Start": 11, "Length": 30}
    ]
  },
  {
    "Input": "let's meet in the late-afternoon Tuesday",
    "Results": [
      {"Text": "in the late-afternoon tuesday", "Type": "datetimerange", "Start": 11, "Length": 29}
    ]
  },
  {
    "Input": "let's meet in the early-evening Tuesday",
    "Results": [
      {"Text": "in the early-evening tuesday", "Type": "datetimerange", "Start": 11, "Length": 28}
    ]
  },
  {
    "Input": "let's meet in the late-evening Tuesday",
    "Results": [
      {"Text": "in the late-evening tuesday", "Type": "datetimerange", "Start": 11, "Length": 27}
    ]
  },
  {
    "Input": "let's meet in the early-night Tuesday",
    "Results": [
      {"Text": "in the early-night tuesday", "Type": "datetimerange", "Start": 11, "Length": 26}
    ]
  },
  {
    "Input": "let's meet in the late-night Tuesday",
    "Results": [
      {"Text": "in the late-night tuesday", "Type": "datetimerange", "Start": 11, "Length": 25}
    ]
  },
  {
    "Input": "let's meet in the early night Tuesday",
    "Results": [
      {"Text": "in the early night tuesday", "Type": "datetimerange", "Start": 11, "Length": 26}
    ]
  },
  {
    "Input": "let's meet in the late night Tuesday",
    "Results": [
      {"Text": "in the late night tuesday", "Type": "datetimerange", "Start": 11, "Length": 25}
    ]
  },
  {
    "Input": "let's meet in the early-morning on Tuesday",
    "Results": [
      {"Text": "in the early-morning on tuesday", "Type": "datetimerange", "Start": 11, "Length": 31}
    ]
  },
  {
    "Input": "let's meet in the late-morning on Tuesday",
    "Results": [
      {"Text": "in the late-morning on tuesday", "Type": "datetimerange", "Start": 11, "Length": 30}
    ]
  },
  {
    "Input": "let's meet in the early-afternoon on Tuesday",
    "Results": [
      {"Text": "in the early-afternoon on tuesday", "Type": "datetimerange", "Start": 11, "Length": 33}
    ]
  },
  {
    "Input": "let's meet in the late-afternoon on Tuesday",
    "Results": [
      {"Text": "in the late-afternoon on tuesday", "Type": "datetimerange", "Start": 11, "Length": 32}
    ]
  },
  {
    "Input": "let's meet in the early-evening on Tuesday",
    "Results": [
      {"Text": "in the early-evening on tuesday", "Type": "datetimerange", "Start": 11, "Length": 31}
    ]
  },
  {
    "Input": "let's meet in the late-evening on Tuesday",
    "Results": [
      {"Text": "in the late-evening on tuesday", "Type": "datetimerange", "Start": 11, "Length": 30}
    ]
  },
  {
    "Input": "let's meet in the early-night on Tuesday",
    "Results": [
      {"Text": "in the early-night on tuesday", "Type": "datetimerange", "Start": 11, "Length": 29}
    ]
  },
  {
    "Input": "let's meet in the late-night on Tuesday",
    "Results": [
      {"Text": "in the late-night on tuesday", "Type": "datetimerange", "Start": 11, "Length": 28}
    ]
  },
  {
    "Input": "let's meet in the early night on Tuesday",
    "Results": [
      {"Text": "in the early night on tuesday", "Type": "datetimerange", "Start": 11, "Length": 29}
    ]
  },
  {
    "Input": "let's meet in the late night on Tuesday",
    "Results": [
      {"Text": "in the late night on tuesday", "Type": "datetimerange", "Start": 11, "Length": 28}
    ]
  },
  {
    "Input": "let's meet on Tuesday early-morning",
    "Results": [
      {"Text": "tuesday early-morning", "Type": "datetimerange", "Start": 14, "Length": 21}
    ]
  },
  {
    "Input": "let's meet on Tuesday late-morning",
    "Results": [
      {"Text": "tuesday late-morning", "Type": "datetimerange", "Start": 14, "Length": 20}
    ]
  },
  {
    "Input": "let's meet on Tuesday early-afternoon",
    "Results": [
      {"Text": "tuesday early-afternoon", "Type": "datetimerange", "Start": 14, "Length": 23}
    ]
  },
  {
    "Input": "let's meet on Tuesday late-afternoon",
    "Results": [
      {"Text": "tuesday late-afternoon", "Type": "datetimerange", "Start": 14, "Length": 22}
    ]
  },
  {
    "Input": "let's meet on Tuesday early-evening",
    "Results": [
      {"Text": "tuesday early-evening", "Type": "datetimerange", "Start": 14, "Length": 21}
    ]
  },
  {
    "Input": "let's meet on Tuesday late-evening",
    "Results": [
      {"Text": "tuesday late-evening", "Type": "datetimerange", "Start": 14, "Length": 20}
    ]
  },
  {
    "Input": "let's meet on Tuesday early-night",
    "Results": [
      {"Text": "tuesday early-night", "Type": "datetimerange", "Start": 14, "Length": 19}
    ]
  },
  {
    "Input": "let's meet on Tuesday late-night",
    "Results": [
      {"Text": "tuesday late-night", "Type": "datetimerange", "Start": 14, "Length": 18}
    ]
  },
  {
    "Input": "let's meet on Tuesday early night",
    "Results": [
      {"Text": "tuesday early night", "Type": "datetimerange", "Start": 14, "Length": 19}
    ]
  },
  {
    "Input": "let's meet on Tuesday late night",
    "Results": [
      {"Text": "tuesday late night", "Type": "datetimerange", "Start": 14, "Length": 18}
    ]
  },
  {
    "Input": "I'll be out rest of the day",
    "Results": [
      {"Text": "rest of the day", "Type": "datetimerange", "Start": 12, "Length": 15}
    ]
  },
  {
    "Input": "I'll be out rest of this day",
    "Results": [
      {"Text": "rest of this day", "Type": "datetimerange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I'll be out rest of current day",
    "Results": [
      {"Text": "rest of current day", "Type": "datetimerange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I'll be out rest the day",
    "Results": [
      {"Text": "rest the day", "Type": "datetimerange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "Cortana, please schedule a skype for business meeting with Wayne, on Friday between 1PM and 4 PM. ",
    "Results": [
      {"Text": "friday between 1pm and 4 pm", "Type": "datetimerange", "Start": 69, "Length": 27}
    ]
  },
  {
    "Input": "Can you schedule us tomorrow between 8am and 2pm?",
    "Results": [
      {"Text": "tomorrow between 8am and 2pm", "Type": "datetimerange", "Start": 20, "Length": 28}
    ]
  },
  {
    "Input": "Can you schedule us Dec 9th between 8am and 2pm?",
    "Results": [
      {"Text": "dec 9th between 8am and 2pm", "Type": "datetimerange", "Start": 20, "Length": 27}
    ]
  },
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting this Friday, in the afternoon.",
    "Results": [
      {"Text": "this friday, in the afternoon", "Type": "datetimerange", "Start": 84, "Length": 29}
    ]
  },
  {
    "Input":
        "Hi Cortana- Please schedule a skype meeting with Jennifer.  I need a 30 min meeting in the afternoon, this Friday",
    "Results": [
      {"Text": "in the afternoon, this friday", "Type": "datetimerange", "Start": 84, "Length": 29}
    ]
  },
  {
    "Input":
        "Cortana, please schedule a skype for business meeting with Wayne, on Friday afternoon between 1PM and 4 PM.",
    "Results": [
      {"Text": "friday afternoon between 1pm and 4 pm", "Type": "datetimerange", "Start": 69, "Length": 37}
    ]
  },
  {
    "Input":
        "Cortana, please schedule a skype for business meeting with Wayne, in the afternoon on Friday between 1PM and 4 PM.",
    "Results": [
      {"Text": "in the afternoon on friday between 1pm and 4 pm", "Type": "datetimerange", "Start": 66, "Length": 47}
    ]
  },
  {
    "Input": "Can you schedule us 2015-09-23 1p.m. to 4",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2015-09-23 1p.m. to 4", "Type": "datetimerange", "Start": 20, "Length": 21}
    ]
  },
  {
    "Input": "Can you schedule us 2015-09-23 1:30p.m. to 4.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "2015-09-23 1:30p.m. to 4", "Type": "datetimerange", "Start": 20, "Length": 24}
    ]
  },
  {
    "Input": "I'll go back tuesday AM",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "tuesday am", "Type": "datetimerange", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I'll go back tuesday PM",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "tuesday pm", "Type": "datetimerange", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "It will happen 2 hours in the future",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "2 hours in the future", "Type": "datetimerange", "Start": 15, "Length": 21}
    ]
  },
  {
    "Input": "It will happen between 10 and 11:30 on 1/1/2015",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 10 and 11:30 on 1/1/2015", "Type": "datetimerange", "Start": 15, "Length": 32}
    ]
  },
  {
    "Input": "It will happen 1/1/2015 between 10 and 11:30",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "1/1/2015 between 10 and 11:30", "Type": "datetimerange", "Start": 15, "Length": 29}
    ]
  },
  {
    "Input": "It will happen from 10:30 to 3 on 1/1/2015",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from 10:30 to 3 on 1/1/2015", "Type": "datetimerange", "Start": 15, "Length": 27}
    ]
  },
  {
    "Input": "It will happen between 3 and 5 on 1/1/2015",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 3 and 5 on 1/1/2015", "Type": "datetimerange", "Start": 15, "Length": 27}
    ]
  },
  {
    "Input": "It will happen from 3:30 to 5:55 on 1/1/2015",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from 3:30 to 5:55 on 1/1/2015", "Type": "datetimerange", "Start": 15, "Length": 29}
    ]
  },
  {
    "Input": "It will happen 1/1/2015 after 2:00",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "1/1/2015 after 2:00", "Type": "datetimerange", "Start": 15, "Length": 19}
    ]
  },
  {
    "Input": "It will happen today before 4pm",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "today before 4pm", "Type": "datetimerange", "Start": 15, "Length": 16}
    ]
  },
  {
    "Input": "It will happen next Wednesday later than 10 in the morning",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "next wednesday later than 10 in the morning", "Type": "datetimerange", "Start": 15, "Length": 43}
    ]
  },
  {
    "Input": "It happened on previous Tuesday by 2 in the afternoon",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "previous tuesday by 2 in the afternoon", "Type": "datetimerange", "Start": 15, "Length": 38}
    ]
  },
  {
    "Input": "Let's go on Feb 1st no later than 6:00",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "feb 1st no later than 6:00", "Type": "datetimerange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "Make me unavailable from 12-04-2019 6:00am until 12-05-2019 8:00pm",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from 12-04-2019 6:00am until 12-05-2019 8:00pm", "Type": "datetimerange", "Start": 20, "Length": 46}
    ]
  },
  {"Input": "It happened on next week after 2:00", "NotSupported": "javascript, python", "Results": []}
];
