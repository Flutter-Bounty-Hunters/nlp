final timeExtractorTestCases = [
  {
    "Input": "I'll be back at 7",
    "Results": [
      {"Text": "7", "Type": "time", "Start": 16, "Length": 1}
    ]
  },
  {
    "Input": "I'll be back at seven",
    "Results": [
      {"Text": "seven", "Type": "time", "Start": 16, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back 7pm",
    "Results": [
      {"Text": "7pm", "Type": "time", "Start": 13, "Length": 3}
    ]
  },
  {
    "Input": "I'll be back 7p.m.",
    "Results": [
      {"Text": "7p.m.", "Type": "time", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back 7:56pm",
    "Results": [
      {"Text": "7:56pm", "Type": "time", "Start": 13, "Length": 6}
    ]
  },
  {
    "Input": "I'll be back 7:56:35pm",
    "Results": [
      {"Text": "7:56:35pm", "Type": "time", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "I'll be back 7:56:35 pm",
    "Results": [
      {"Text": "7:56:35 pm", "Type": "time", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I'll be back 12:34",
    "Results": [
      {"Text": "12:34", "Type": "time", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back 12:34:20",
    "Results": [
      {"Text": "12:34:20", "Type": "time", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "I'll be back T12:34:20",
    "Results": [
      {"Text": "T12:34:20", "Type": "time", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "I'll be back 00:00",
    "Results": [
      {"Text": "00:00", "Type": "time", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back 00:00:30",
    "Results": [
      {"Text": "00:00:30", "Type": "time", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "It's 7 o'clock",
    "Results": [
      {"Text": "7 o'clock", "Type": "time", "Start": 5, "Length": 9}
    ]
  },
  {
    "Input": "It's seven o'clock",
    "Results": [
      {"Text": "seven o'clock", "Type": "time", "Start": 5, "Length": 13}
    ]
  },
  {
    "Input": "It's 8 in the morning",
    "Results": [
      {"Text": "8 in the morning", "Type": "time", "Start": 5, "Length": 16}
    ]
  },
  {
    "Input": "It's 8 in the night",
    "Results": [
      {"Text": "8 in the night", "Type": "time", "Start": 5, "Length": 14}
    ]
  },
  {
    "Input": "It's half past eight",
    "Results": [
      {"Text": "half past eight", "Type": "time", "Start": 5, "Length": 15}
    ]
  },
  {
    "Input": "It's half past 8pm",
    "Results": [
      {"Text": "half past 8pm", "Type": "time", "Start": 5, "Length": 13}
    ]
  },
  {
    "Input": "It's 30 mins past eight",
    "Results": [
      {"Text": "30 mins past eight", "Type": "time", "Start": 5, "Length": 18}
    ]
  },
  {
    "Input": "It's a quarter past eight",
    "Results": [
      {"Text": "a quarter past eight", "Type": "time", "Start": 5, "Length": 20}
    ]
  },
  {
    "Input": "It's quarter past eight",
    "Results": [
      {"Text": "quarter past eight", "Type": "time", "Start": 5, "Length": 18}
    ]
  },
  {
    "Input": "It's three quarters past 9pm",
    "Results": [
      {"Text": "three quarters past 9pm", "Type": "time", "Start": 5, "Length": 23}
    ]
  },
  {
    "Input": "It's three minutes to eight",
    "Results": [
      {"Text": "three minutes to eight", "Type": "time", "Start": 5, "Length": 22}
    ]
  },
  {
    "Input": "It's half past seven o'clock",
    "Results": [
      {"Text": "half past seven o'clock", "Type": "time", "Start": 5, "Length": 23}
    ]
  },
  {
    "Input": "It's half past seven afternoon",
    "Results": [
      {"Text": "half past seven afternoon", "Type": "time", "Start": 5, "Length": 25}
    ]
  },
  {
    "Input": "It's half past seven in the morning",
    "Results": [
      {"Text": "half past seven in the morning", "Type": "time", "Start": 5, "Length": 30}
    ]
  },
  {
    "Input": "It's a quarter to 8 in the morning",
    "Results": [
      {"Text": "a quarter to 8 in the morning", "Type": "time", "Start": 5, "Length": 29}
    ]
  },
  {
    "Input": "It's 20 min past eight in the evening",
    "Results": [
      {"Text": "20 min past eight in the evening", "Type": "time", "Start": 5, "Length": 32}
    ]
  },
  {
    "Input": "I made this purchase at 10 past 9",
    "Results": [
      {"Text": "10 past 9", "Type": "time", "Start": 24, "Length": 9}
    ]
  },
  {
    "Input": "It's 15 past seven o'clock",
    "Results": [
      {"Text": "15 past seven o'clock", "Type": "time", "Start": 5, "Length": 21}
    ]
  },
  {
    "Input": "I made this purchase at ten past 9 in the evening",
    "Results": [
      {"Text": "ten past 9 in the evening", "Type": "time", "Start": 24, "Length": 25}
    ]
  },
  {
    "Input": "It's fifteen past eight in the morning",
    "Results": [
      {"Text": "fifteen past eight in the morning", "Type": "time", "Start": 5, "Length": 33}
    ]
  },
  {
    "Input": "I'll be back in the afternoon at 7",
    "Results": [
      {"Text": "in the afternoon at 7", "Type": "time", "Start": 13, "Length": 21}
    ]
  },
  {
    "Input": "I'll be back afternoon at 7",
    "Results": [
      {"Text": "afternoon at 7", "Type": "time", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "I'll be back afternoon 7:00",
    "Results": [
      {"Text": "afternoon 7:00", "Type": "time", "Start": 13, "Length": 14}
    ]
  },
  {
    "Input": "I'll be back afternoon 7:00:14",
    "Results": [
      {"Text": "afternoon 7:00:14", "Type": "time", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll be back afternoon seven pm",
    "Results": [
      {"Text": "afternoon seven pm", "Type": "time", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "I'll go back seven thirty pm",
    "Results": [
      {"Text": "seven thirty pm", "Type": "time", "Start": 13, "Length": 15}
    ]
  },
  {
    "Input": "I'll go back seven thirty five pm",
    "Results": [
      {"Text": "seven thirty five pm", "Type": "time", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "I'll go back at eleven five",
    "Results": [
      {"Text": "eleven five", "Type": "time", "Start": 16, "Length": 11}
    ]
  },
  {
    "Input": "I'll go back three mins to five thirty ",
    "Results": [
      {"Text": "three mins to five thirty", "Type": "time", "Start": 13, "Length": 25}
    ]
  },
  {
    "Input": "I'll go back five thirty in the night",
    "Results": [
      {"Text": "five thirty in the night", "Type": "time", "Start": 13, "Length": 24}
    ]
  },
  {
    "Input": "I'll go back in the night five thirty",
    "Results": [
      {"Text": "in the night five thirty", "Type": "time", "Start": 13, "Length": 24}
    ]
  },
  {
    "Input": "I'll be back noonish",
    "Results": [
      {"Text": "noonish", "Type": "time", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "I'll be back noon",
    "Results": [
      {"Text": "noon", "Type": "time", "Start": 13, "Length": 4}
    ]
  },
  {
    "Input": "I'll be back 12 noon",
    "Results": [
      {"Text": "12 noon", "Type": "time", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "I'll be back 11ish",
    "Results": [
      {"Text": "11ish", "Type": "time", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back 11-ish",
    "Results": [
      {"Text": "11-ish", "Type": "time", "Start": 13, "Length": 6}
    ]
  },
  {
    "Input": "I'll be back 340pm",
    "Results": [
      {"Text": "340pm", "Type": "time", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back 1140 a.m.",
    "Results": [
      {"Text": "1140 a.m.", "Type": "time", "Start": 13, "Length": 9}
    ]
  },
  {
    "Input": "midnight",
    "Results": [
      {"Text": "midnight", "Type": "time", "Start": 0, "Length": 8}
    ]
  },
  {
    "Input": "mid-night",
    "Results": [
      {"Text": "mid-night", "Type": "time", "Start": 0, "Length": 9}
    ]
  },
  {
    "Input": "mid night",
    "Results": [
      {"Text": "mid night", "Type": "time", "Start": 0, "Length": 9}
    ]
  },
  {
    "Input": "midmorning",
    "Results": [
      {"Text": "midmorning", "Type": "time", "Start": 0, "Length": 10}
    ]
  },
  {
    "Input": "mid-morning",
    "Results": [
      {"Text": "mid-morning", "Type": "time", "Start": 0, "Length": 11}
    ]
  },
  {
    "Input": "mid morning",
    "Results": [
      {"Text": "mid morning", "Type": "time", "Start": 0, "Length": 11}
    ]
  },
  {
    "Input": "midafternoon",
    "Results": [
      {"Text": "midafternoon", "Type": "time", "Start": 0, "Length": 12}
    ]
  },
  {
    "Input": "mid-afternoon",
    "Results": [
      {"Text": "mid-afternoon", "Type": "time", "Start": 0, "Length": 13}
    ]
  },
  {
    "Input": "mid afternoon",
    "Results": [
      {"Text": "mid afternoon", "Type": "time", "Start": 0, "Length": 13}
    ]
  },
  {
    "Input": "midday",
    "Results": [
      {"Text": "midday", "Type": "time", "Start": 0, "Length": 6}
    ]
  },
  {
    "Input": "mid-day",
    "Results": [
      {"Text": "mid-day", "Type": "time", "Start": 0, "Length": 7}
    ]
  },
  {
    "Input": "mid day",
    "Results": [
      {"Text": "mid day", "Type": "time", "Start": 0, "Length": 7}
    ]
  },
  {
    "Input": "noon",
    "Results": [
      {"Text": "noon", "Type": "time", "Start": 0, "Length": 4}
    ]
  },
  {
    "Input": "I'll be back 7 p m",
    "Results": [
      {"Text": "7 p m", "Type": "time", "Start": 13, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back 7 p. m",
    "Results": [
      {"Text": "7 p. m", "Type": "time", "Start": 13, "Length": 6}
    ]
  },
  {
    "Input": "I'll be back 7 p. m.",
    "Results": [
      {"Text": "7 p. m.", "Type": "time", "Start": 13, "Length": 7}
    ]
  },
  {
    "Input": "I'll be back 7 p.m.",
    "Results": [
      {"Text": "7 p.m.", "Type": "time", "Start": 13, "Length": 6}
    ]
  },
  {
    "Input": "I'll be back 7:56 a m",
    "Results": [
      {"Text": "7:56 a m", "Type": "time", "Start": 13, "Length": 8}
    ]
  },
  {
    "Input": "I'll be back 7:56:35 a. m",
    "Results": [
      {"Text": "7:56:35 a. m", "Type": "time", "Start": 13, "Length": 12}
    ]
  },
  {
    "Input": "I'll be back 7:56:35 am",
    "Results": [
      {"Text": "7:56:35 am", "Type": "time", "Start": 13, "Length": 10}
    ]
  },
  {
    "Input": "I'll be back 7:56:35 a. m.",
    "Results": [
      {"Text": "7:56:35 a. m.", "Type": "time", "Start": 13, "Length": 13}
    ]
  },
  {
    "Input": "I'll go back seven thirty p.m.",
    "Results": [
      {"Text": "seven thirty p.m.", "Type": "time", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll go back seven thirty p m",
    "Results": [
      {"Text": "seven thirty p m", "Type": "time", "Start": 13, "Length": 16}
    ]
  },
  {
    "Input": "I'll go back seven thirty p. m",
    "Results": [
      {"Text": "seven thirty p. m", "Type": "time", "Start": 13, "Length": 17}
    ]
  },
  {
    "Input": "I'll go back seven thirty p. m.",
    "Results": [
      {"Text": "seven thirty p. m.", "Type": "time", "Start": 13, "Length": 18}
    ]
  },
  {
    "Input": "I'll be back 340 pm",
    "Results": [
      {"Text": "340 pm", "Type": "time", "Start": 13, "Length": 6}
    ]
  },
  {
    "Input": "I'll be back 1140 a m",
    "Results": [
      {"Text": "1140 a m", "Type": "time", "Start": 13, "Length": 8}
    ]
  },
  {"Input": "which emails have gotten p as subject", "Results": []},
  {"Input": "which emails have gotten a reply", "Results": []},
  {
    "Input": "I'll be back 12 o'clock lunchtime",
    "Results": [
      {"Text": "12 o'clock lunchtime", "Type": "time", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "I'll be back lunchtime 12 o'clock",
    "Results": [
      {"Text": "lunchtime 12 o'clock", "Type": "time", "Start": 13, "Length": 20}
    ]
  },
  {
    "Input": "I'll be back at lunchtime 12 o'clock",
    "Results": [
      {"Text": "at lunchtime 12 o'clock", "Type": "time", "Start": 13, "Length": 23}
    ]
  },
  {"Input": "Cortana, schedule a meeting for next week.\nBentonville, AR 72716 P: 479.277", "Results": []},
  {
    "Input": "9p is suitable for me.",
    "Results": [
      {"Text": "9p", "Type": "time", "Start": 0, "Length": 2}
    ]
  },
  {"Input": "9a is suitable for me.", "Results": []},
  {
    "Input": "I'll be back at 9p.",
    "Results": [
      {"Text": "9p", "Type": "time", "Start": 16, "Length": 2}
    ]
  },
  {
    "Input": "I'll be back at 9a.",
    "Results": [
      {"Text": "9a", "Type": "time", "Start": 16, "Length": 2}
    ]
  },
  {
    "Input": "I'll be back at 9:00a.",
    "Results": [
      {"Text": "9:00a", "Type": "time", "Start": 16, "Length": 5}
    ]
  },
  {
    "Input": "I'll be back at 9.am.",
    "Results": [
      {"Text": "9.am", "Type": "time", "Start": 16, "Length": 4}
    ]
  },
  {"Input": "This item priced at 1.6714.", "Comment": "1 shouldn't recognized as time here", "Results": []},
  {
    "Input": "3pm : I'll be out on this week",
    "Results": [
      {"Text": "3pm", "Type": "time", "Start": 0, "Length": 3}
    ]
  },
  {
    "Input": "this week 8am should be a daterange and a time.",
    "Results": [
      {"Text": "8am", "Type": "time", "Start": 10, "Length": 3}
    ]
  },
  {
    "Input": "this week 8p.m. should be a daterange and a time.",
    "Results": [
      {"Text": "8p.m.", "Type": "time", "Start": 10, "Length": 5}
    ]
  },
  {
    "Input": "week 10 8 p.m. should be a daterange and a time.",
    "Results": [
      {"Text": "8 p.m.", "Type": "time", "Start": 8, "Length": 6}
    ]
  },
  {
    "Input": "week 10 8p.m. should be a daterange and a time.",
    "Results": [
      {"Text": "8p.m.", "Type": "time", "Start": 8, "Length": 5}
    ]
  },
  {
    "Input": "week 10 10:20 should be a daterange and a time.",
    "Results": [
      {"Text": "10:20", "Type": "time", "Start": 8, "Length": 5}
    ]
  },
  {
    "Input": "The target time is 8.10 pm",
    "Results": [
      {"Text": "8.10 pm", "Type": "time", "Start": 19, "Length": 7}
    ]
  }
];
