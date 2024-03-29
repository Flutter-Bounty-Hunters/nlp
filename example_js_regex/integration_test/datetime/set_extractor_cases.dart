const setExtractorTestCases = [
  {
    "Input": "I'll leave weekly",
    "Results": [
      {"Text": "weekly", "Type": "set", "Start": 11, "Length": 6}
    ]
  },
  {
    "Input": "I'll leave daily",
    "Results": [
      {"Text": "daily", "Type": "set", "Start": 11, "Length": 5}
    ]
  },
  {
    "Input": "I'll leave every day",
    "Results": [
      {"Text": "every day", "Type": "set", "Start": 11, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave each month",
    "Results": [
      {"Text": "each month", "Type": "set", "Start": 11, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave annually",
    "Results": [
      {"Text": "annually", "Type": "set", "Start": 11, "Length": 8}
    ]
  },
  {
    "Input": "I'll leave annual",
    "Results": [
      {"Text": "annual", "Type": "set", "Start": 11, "Length": 6}
    ]
  },
  {
    "Input": "I'll leave each two days",
    "Results": [
      {"Text": "each two days", "Type": "set", "Start": 11, "Length": 13}
    ]
  },
  {
    "Input": "I'll leave every three week",
    "Results": [
      {"Text": "every three week", "Type": "set", "Start": 11, "Length": 16}
    ]
  },
  {
    "Input": "I'll leave 3pm every day",
    "Results": [
      {"Text": "3pm every day", "Type": "set", "Start": 11, "Length": 13}
    ]
  },
  {
    "Input": "I'll leave 3pm each day",
    "Results": [
      {"Text": "3pm each day", "Type": "set", "Start": 11, "Length": 12}
    ]
  },
  {
    "Input": "I'll leave each 4/15",
    "Results": [
      {"Text": "each 4/15", "Type": "set", "Start": 11, "Length": 9}
    ]
  },
  {
    "Input": "I'll leave every monday",
    "Results": [
      {"Text": "every monday", "Type": "set", "Start": 11, "Length": 12}
    ]
  },
  {
    "Input": "I'll leave each monday 4pm",
    "Results": [
      {"Text": "each monday 4pm", "Type": "set", "Start": 11, "Length": 15}
    ]
  },
  {
    "Input": "I'll leave every morning",
    "Results": [
      {"Text": "every morning", "Type": "set", "Start": 11, "Length": 13}
    ]
  },
  {
    "Input": "I'll leave every morning at 9am",
    "Results": [
      {"Text": "every morning at 9am", "Type": "set", "Start": 11, "Length": 20}
    ]
  },
  {
    "Input": "I'll leave every afternoon at 4pm",
    "Results": [
      {"Text": "every afternoon at 4pm", "Type": "set", "Start": 11, "Length": 22}
    ]
  },
  {
    "Input": "I'll leave every night at 9pm",
    "Results": [
      {"Text": "every night at 9pm", "Type": "set", "Start": 11, "Length": 18}
    ]
  },
  {
    "Input": "I'll leave every night at 9",
    "Results": [
      {"Text": "every night at 9", "Type": "set", "Start": 11, "Length": 16}
    ]
  },
  {
    "Input": "I'll leave mornings at 9am",
    "Results": [
      {"Text": "mornings at 9am", "Type": "set", "Start": 11, "Length": 15}
    ]
  },
  {
    "Input": "I'll leave on mornings at 9",
    "Results": [
      {"Text": "on mornings at 9", "Type": "set", "Start": 11, "Length": 16}
    ]
  },
  {
    "Input": "I'll leave at 9am every Sunday",
    "Results": [
      {"Text": "9am every sunday", "Type": "set", "Start": 14, "Length": 16}
    ]
  },
  {
    "Input": "I'll leave at 9am on mondays",
    "Results": [
      {"Text": "9am on mondays", "Type": "set", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "I'll leave at 9am mondays",
    "Results": [
      {"Text": "9am mondays", "Type": "set", "Start": 14, "Length": 11}
    ]
  },
  {
    "Input": "I'll leave on mondays",
    "Results": [
      {"Text": "on mondays", "Type": "set", "Start": 11, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave on sundays",
    "Results": [
      {"Text": "on sundays", "Type": "set", "Start": 11, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave sundays",
    "Results": [
      {"Text": "sundays", "Type": "set", "Start": 11, "Length": 7}
    ]
  },
  {
    "Input": "Can I do a booking for the 09th of May for 2 nights?",
    "Results": [
      {"Text": "nights", "Type": "set", "Start": 45, "Length": 6}
    ]
  },
  {
    "Input": "Let's meet once a week",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {"Text": "once a week", "Type": "set", "Start": 11, "Length": 11}
    ]
  },
  {
    "Input": "I go on vacation once a year",
    "Context": {"ReferenceDateTime": "2016-11-07T00:00:00"},
    "Results": [
      {"Text": "once a year", "Type": "set", "Start": 17, "Length": 11}
    ]
  },
  {
    "Input": "Every other friday",
    "Results": [
      {"Text": "every other friday", "Type": "set", "Start": 0, "Length": 18}
    ]
  },
  {
    "Input": "Let's have a quarterly meeting.",
    "Results": [
      {"Text": "quarterly", "Type": "set", "Start": 13, "Length": 9}
    ]
  }
];
