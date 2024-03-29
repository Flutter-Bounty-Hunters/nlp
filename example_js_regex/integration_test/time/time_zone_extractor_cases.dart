final timeZoneExtractorTestCases = [
  {
    "Input": "Book me a room at beijing time",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "beijing time", "Type": "timezone", "Start": 18, "Length": 12}
    ]
  },
  {
    "Input": "Book me a room at utc4:30",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "utc4:30", "Type": "timezone", "Start": 18, "Length": 7}
    ]
  },
  {
    "Input": "Book me a room at gmt-3",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "gmt-3", "Type": "timezone", "Start": 18, "Length": 5}
    ]
  },
  {
    "Input": "Book me a room at afghanistan standard time",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "afghanistan standard time", "Type": "timezone", "Start": 18, "Length": 25}
    ]
  },
  {
    "Input": "Book me a room at aft",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "aft", "Type": "timezone", "Start": 18, "Length": 3}
    ]
  },
  {
    "Input": "Book me a room at beijing-time",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "beijing-time", "Type": "timezone", "Start": 18, "Length": 12}
    ]
  },
  {
    "Input": "Book me a room at St. Louis-time",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "St. Louis-time", "Type": "timezone", "Start": 18, "Length": 14}
    ]
  },
  {
    "Input": "Book me a room at San José Time",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "San José Time", "Type": "timezone", "Start": 18, "Length": 13}
    ]
  },
  {
    "Input": "For me, Christchurch Time, Colchester-time or Edinburgh time is OK.",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "Christchurch Time", "Type": "timezone", "Start": 8, "Length": 17},
      {"Text": "Colchester-time", "Type": "timezone", "Start": 27, "Length": 15},
      {"Text": "Edinburgh time", "Type": "timezone", "Start": 46, "Length": 14}
    ]
  },
  {
    "Input": "Cortana will email you to find a time which works in the Sydney timezone.",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "Sydney timezone", "Type": "timezone", "Start": 57, "Length": 15}
    ]
  },
  {
    "Input": "Cortana will email you to find a time which works in the Montréal time.",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "Montréal time", "Type": "timezone", "Start": 57, "Length": 13}
    ]
  },
  {
    "Input": "Cortana will email you to find a time which works in the Montreal time.",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "Montreal time", "Type": "timezone", "Start": 57, "Length": 13}
    ]
  },
  {
    "Input": "Book me a room at pt",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "pt", "Type": "timezone", "Start": 18, "Length": 2}
    ]
  },
  {
    "Input": "Book me a room at et",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "et", "Type": "timezone", "Start": 18, "Length": 2}
    ]
  },
  {
    "Input": "let's meet Saint Barthélemy time",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "Saint Barthélemy time", "Type": "timezone", "Start": 11, "Length": 21}
    ]
  },
  {
    "Input": "let's meet saint barthelemy timezone",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "saint barthelemy timezone", "Type": "timezone", "Start": 11, "Length": 25}
    ]
  },
  {
    "Input": "It is the outcome of the vote that counts.",
    "Comment": "This case is to verify that the utc substring won't be extracted from the word outcome.",
    "NotSupported": "javascript",
    "Results": []
  },
  {
    "Input": "Show me times at Lincoln Square",
    "Comment": "This case is to verify that the 'me time' substring won't be extracted from the 'me times'.",
    "NotSupported": "javascript",
    "Results": []
  },
  {
    "Input": "I said New York time, not York time",
    "Comment": "Extract longest item when there are some overlap items",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "New York time", "Type": "timezone", "Start": 7, "Length": 13},
      {"Text": "York time", "Type": "timezone", "Start": 26, "Length": 9}
    ]
  },
  {
    "Input": "I'm in the pacific timezone",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "pacific timezone", "Type": "timezone", "Start": 11, "Length": 16}
    ]
  },
  {
    "Input": "Let's meet at 1pm mountain timezone",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "mountain timezone", "Type": "timezone", "Start": 18, "Length": 17}
    ]
  },
  {
    "Input": "It's 1pm Eastern Daylight Time",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "eastern daylight time", "Type": "timezone", "Start": 9, "Length": 21}
    ]
  },
  {
    "Input": "It's about 1pm ACDT",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "acdt", "Type": "timezone", "Start": 15, "Length": 4}
    ]
  },
  {"Input": "Once upon a time...", "NotSupported": "javascript", "Results": []}
];
