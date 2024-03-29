const dateTimeExtractorTestCases = [
  {
    "Input": "I'll go back now",
    "Results": [
      {"Text": "now", "Type": "datetime", "Start": 13, "Length": 3}
    ]
  },
  {
    "Input": "I'll go back as soon as possible",
    "Results": [
      {"Text": "as soon as possible", "Type": "datetime", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "I'll go back right now",
    "Results": [
      {"Text": "right now", "Type": "datetime", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "I'll go back on 15 at 8:00",
    "Results": [
      {"Text": "15 at 8:00", "Type": "datetime", "Start": 16, "Length": 10}
    ]
  },
  {
    "Input": "I'll go back on 15 at 8:00:30",
    "Results": [
      {"Text": "15 at 8:00:30", "Type": "datetime", "Start": 16, "Length": 13}
    ]
  },
  {
    "Input": "I'll go back on 15, 8pm",
    "Results": [
      {"Text": "15, 8pm", "Type": "datetime", "Start": 16, "Length": 7}
    ]
  },
  {
    "Input": "I'll go back 04/21/2016, 8:00pm",
    "Results": [
      {"Text": "04/21/2016, 8:00pm", "Type": "datetime", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "I'll go back 04/21/2016, 8:00:13pm",
    "Results": [
      {"Text": "04/21/2016, 8:00:13pm", "Type": "datetime", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll go back Oct. 23 at seven",
    "Results": [
      {"Text": "Oct. 23 at seven", "Type": "datetime", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back October 14 8:00am",
    "Results": [
      {"Text": "October 14 8:00am", "Type": "datetime", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll go back October 14 8:00:00am",
    "Results": [
      {"Text": "October 14 8:00:00am", "Type": "datetime", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "I'll go back October 14, 8:00am",
    "Results": [
      {"Text": "October 14, 8:00am", "Type": "datetime", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "I'll go back October 14, 8:00:01am",
    "Results": [
      {"Text": "October 14, 8:00:01am", "Type": "datetime", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll go back tomorrow 8:00am",
    "Results": [
      {"Text": "tomorrow 8:00am", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back tomorrow around 8:00am",
    "Results": [
      {"Text": "tomorrow around 8:00am", "Type": "datetime", "Start": 13, "Length": 22}
    ]
  },
  {
    "Input": "I'll go back tomorrow for 8:00am",
    "Results": [
      {"Text": "tomorrow for 8:00am", "Type": "datetime", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "I'll go back tomorrow 8:00:05am",
    "Results": [
      {"Text": "tomorrow 8:00:05am", "Type": "datetime", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "I'll go back next friday at half past 3 ",
    "Results": [
      {"Text": "next friday at half past 3", "Type": "datetime", "Start": 13, "Length": 26}
    ]
  },
  {
    "Input": "I'll go back May 5, 2016, 20 min past eight in the evening",
    "Results": [
      {"Text": "May 5, 2016, 20 min past eight in the evening", "Type": "datetime", "Start": 13, "Length": 45}
    ]
  },
  {
    "Input": "I'll go back 8pm on 15",
    "Results": [
      {"Text": "8pm on 15", "Type": "datetime", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "I'll go back at seven on 15",
    "Results": [
      {"Text": "seven on 15", "Type": "datetime", "Start": 16, "Length": 11}
    ]
  },
  {
    "Input": "I'll go back 8pm next sunday",
    "Results": [
      {"Text": "8pm next sunday", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back 8pm today",
    "Results": [
      {"Text": "8pm today", "Type": "datetime", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "I'll go back a quarter to seven tomorrow",
    "Results": [
      {"Text": "a quarter to seven tomorrow", "Type": "datetime", "Start": 13, "Length": 27}
    ]
  },
  {
    "Input": "I'll go back 19:00, 2016-12-22",
    "Results": [
      {"Text": "19:00, 2016-12-22", "Type": "datetime", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll go back seven o'clock tomorrow",
    "Results": [
      {"Text": "seven o'clock tomorrow", "Type": "datetime", "Start": 13, "Length": 22}
    ]
  },
  {
    "Input": "I'll go back tomorrow morning at 7",
    "Results": [
      {"Text": "tomorrow morning at 7", "Type": "datetime", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll go back 7:00 on Sunday afternoon",
    "Results": [
      {"Text": "7:00 on Sunday afternoon", "Type": "datetime", "Start": 13, "Length": 24}
    ]
  },
  {
    "Input": "I'll go back twenty minutes past five tomorrow morning",
    "Results": [
      {"Text": "twenty minutes past five tomorrow morning", "Type": "datetime", "Start": 13, "Length": 41}
    ]
  },
  {
    "Input": "I'll go back October 14 8:00, October 14",
    "Results": [
      {"Text": "October 14 8:00", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back 7, this morning",
    "Results": [
      {"Text": "7, this morning", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back 8pm in the evening, Monday",
    "Results": [
      {"Text": "8pm in the evening, Monday", "Type": "datetime", "Start": 13, "Length": 26}
    ]
  },
  {
    "Input": "I'll go back 8pm in the evening, 1st Jan",
    "Results": [
      {"Text": "8pm in the evening, 1st Jan", "Type": "datetime", "Start": 13, "Length": 27}
    ]
  },
  {
    "Input": "I'll go back 8pm in the evening, 1 Jan",
    "Results": [
      {"Text": "8pm in the evening, 1 Jan", "Type": "datetime", "Start": 13, "Length": 25}
    ]
  },
  {
    "Input": "I'll go back 10pm tonight",
    "Results": [
      {"Text": "10pm tonight", "Type": "datetime", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "I'll go back 8am this morning",
    "Results": [
      {"Text": "8am this morning", "Type": "datetime", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back 8pm this evening",
    "Results": [
      {"Text": "8pm this evening", "Type": "datetime", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back tonight around 7",
    "Results": [
      {"Text": "tonight around 7", "Type": "datetime", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back this morning at 7",
    "Results": [
      {"Text": "this morning at 7", "Type": "datetime", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll go back this morning at 7pm",
    "Results": [
      {"Text": "this morning at 7pm", "Type": "datetime", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "I'll go back this morning at seven",
    "Results": [
      {"Text": "this morning at seven", "Type": "datetime", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll go back this morning at 7:00",
    "Results": [
      {"Text": "this morning at 7:00", "Type": "datetime", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "I'll go back this night at 7",
    "Results": [
      {"Text": "this night at 7", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back tonight at 7",
    "Results": [
      {"Text": "tonight at 7", "Type": "datetime", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "for 2 people tonight at 9:30 pm",
    "Results": [
      {"Text": "tonight at 9:30 pm", "Type": "datetime", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "for 2 people tonight at 9:30:31 pm",
    "Results": [
      {"Text": "tonight at 9:30:31 pm", "Type": "datetime", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll go back the end of the day",
    "Results": [
      {"Text": "the end of the day", "Type": "datetime", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "I'll go back end of tomorrow",
    "Results": [
      {"Text": "end of tomorrow", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back end of the sunday",
    "Results": [
      {"Text": "end of the sunday", "Type": "datetime", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll go back at 5th at 4 a.m.",
    "Results": [
      {"Text": "5th at 4 a.m.", "Type": "datetime", "Start": 16, "Length": 13}
    ]
  },
  {
    "Input": "I'll go back 2016-12-16T12:23:59",
    "Results": [
      {"Text": "2016-12-16T12:23:59", "Type": "datetime", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "I'll go back in 5 hours",
    "Results": [
      {"Text": "in 5 hours", "Type": "datetime", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "see if I am available for 3pm on Sun",
    "Results": [
      {"Text": "3pm on Sun", "Type": "datetime", "Start": 26, "Length": 10}
    ]
  },
  {
    "Input": "Set appointment for tomorrow morning at 9 o'clock.",
    "Results": [
      {"Text": "tomorrow morning at 9 o'clock", "Type": "datetime", "Start": 20, "Length": 29}
    ]
  },
  {
    "Input": "I'll go back tomorrow morning at 9 o'clock",
    "Results": [
      {"Text": "tomorrow morning at 9 o'clock", "Type": "datetime", "Start": 13, "Length": 29}
    ]
  },
  {
    "Input": "I'll go back tomorrow morning at 9 oclock",
    "Results": [
      {"Text": "tomorrow morning at 9 oclock", "Type": "datetime", "Start": 13, "Length": 28}
    ]
  },
  {
    "Input": "I'll go back tomorrow at 9 o'clock",
    "Results": [
      {"Text": "tomorrow at 9 o'clock", "Type": "datetime", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll go back tomorrow at 9 oclock",
    "Results": [
      {"Text": "tomorrow at 9 oclock", "Type": "datetime", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "this friday at one o'clock pm",
    "Results": [
      {"Text": "this friday at one o'clock pm", "Type": "datetime", "Start": 0, "Length": 29}
    ]
  },
  {
    "Input": "ADD LUNCH AT 12:30 PM ON FRI",
    "NotSupported": "javascript, Java",
    "Results": [
      {"Text": "12:30 PM ON FRI", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "Add 649 midnight tonight",
    "Results": [
      {"Text": "midnight tonight", "Type": "datetime", "Start": 8, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back August 1st 11 AM",
    "Results": [
      {"Text": "August 1st 11 AM", "Type": "datetime", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back August 1st 11 pm",
    "Results": [
      {"Text": "August 1st 11 pm", "Type": "datetime", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back August 1st 11 p.m.",
    "Results": [
      {"Text": "August 1st 11 p.m.", "Type": "datetime", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "I'll go back 25/02 11 am",
    "Results": [
      {"Text": "25/02 11 am", "Type": "datetime", "Start": 13, "Length": 11}
    ]
  },
  {
    "Input": "I'll go back 6 Jan 2017 - 6:37am",
    "Results": [
      {"Text": "6 Jan 2017 - 6:37am", "Type": "datetime", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "16. Nov. 2016 10:38",
    "Results": [
      {"Text": "16. Nov. 2016 10:38", "Type": "datetime", "Start": 0, "Length": 19}
    ]
  },
  {
    "Input": "I will leave 1 day 2 hours later",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "1 day 2 hours later", "Type": "datetime", "Start": 13, "Length": 19}
    ]
  },
  {
    "Input": "I will be busy in an hour, so call me later",
    "Results": [
      {"Text": "in an hour", "Type": "datetime", "Start": 15, "Length": 10}
    ]
  },
  {
    "Input": "I met him 2 months 1 day 2 hours ago",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2 months 1 day 2 hours ago", "Type": "datetime", "Start": 10, "Length": 26}
    ]
  },
  {
    "Input": "I will leave 1 day 30 minutes later",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "1 day 30 minutes later", "Type": "datetime", "Start": 13, "Length": 22}
    ]
  },
  {
    "Input": "I will leave in 2 minutes",
    "Results": [
      {"Text": "in 2 minutes", "Type": "datetime", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "Please book Skype call today at 9a.",
    "Results": [
      {"Text": "today at 9a", "Type": "datetime", "Start": 23, "Length": 11}
    ]
  },
  {
    "Input": "Please book Skype call today at 9p.",
    "Results": [
      {"Text": "today at 9p", "Type": "datetime", "Start": 23, "Length": 11}
    ]
  },
  {
    "Input": "I will leave in 2 hours",
    "Results": [
      {"Text": "in 2 hours", "Type": "datetime", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I will go back on wed Oct 26 15:50:06 2016.",
    "NotSupported": "java,javascript",
    "Results": [
      {"Text": "wed Oct 26 15:50:06 2016", "Type": "datetime", "Start": 18, "Length": 24}
    ]
  },
  {
    "Input": "Wed Oct 26 15:50:06 2016 is not a day in 2019.",
    "NotSupported": "java,javascript",
    "Results": [
      {"Text": "Wed Oct 26 15:50:06 2016", "Type": "datetime", "Start": 0, "Length": 24}
    ]
  },
  {
    "Input": "I'll go back at 8.30pm today",
    "Results": [
      {"Text": "at 8.30pm today", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back today at 8.30pm",
    "Results": [
      {"Text": "today at 8.30pm", "Type": "datetime", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back 8.30pm today",
    "Results": [
      {"Text": "8.30pm today", "Type": "datetime", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "I'll go back 8.30 pm today",
    "Results": [
      {"Text": "8.30 pm today", "Type": "datetime", "Start": 13, "Length": 13}
    ]
  }
];
