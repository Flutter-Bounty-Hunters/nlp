const datePeriodExtractorTestCases = [
  {
    "Input": "I'll be out in jan",
    "Results": [
      {"Text": "jan", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this jan",
    "Results": [
      {"Text": "this jan", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of jan",
    "Results": [
      {"Text": "month of jan", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of jan",
    "Results": [
      {"Text": "the month of jan", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing jan 2001",
    "Results": [
      {"Text": "jan 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing jan, 2001",
    "Results": [
      {"Text": "jan, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in feb",
    "Results": [
      {"Text": "feb", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this feb",
    "Results": [
      {"Text": "this feb", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of feb",
    "Results": [
      {"Text": "month of feb", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of feb",
    "Results": [
      {"Text": "the month of feb", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing feb 2001",
    "Results": [
      {"Text": "feb 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing feb, 2001",
    "Results": [
      {"Text": "feb, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in mar",
    "Results": [
      {"Text": "mar", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this mar",
    "Results": [
      {"Text": "this mar", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of mar",
    "Results": [
      {"Text": "month of mar", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of mar",
    "Results": [
      {"Text": "the month of mar", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing mar 2001",
    "Results": [
      {"Text": "mar 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing mar, 2001",
    "Results": [
      {"Text": "mar, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in apr",
    "Results": [
      {"Text": "apr", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this apr",
    "Results": [
      {"Text": "this apr", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of apr",
    "Results": [
      {"Text": "month of apr", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of apr",
    "Results": [
      {"Text": "the month of apr", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing apr 2001",
    "Results": [
      {"Text": "apr 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing apr, 2001",
    "Results": [
      {"Text": "apr, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in may",
    "Results": [
      {"Text": "may", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this may",
    "Results": [
      {"Text": "this may", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of may",
    "Results": [
      {"Text": "month of may", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of may",
    "Results": [
      {"Text": "the month of may", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing may 2001",
    "Results": [
      {"Text": "may 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing may, 2001",
    "Results": [
      {"Text": "may, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in jun",
    "Results": [
      {"Text": "jun", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this jun",
    "Results": [
      {"Text": "this jun", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of jun",
    "Results": [
      {"Text": "month of jun", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of jun",
    "Results": [
      {"Text": "the month of jun", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing jun 2001",
    "Results": [
      {"Text": "jun 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing jun, 2001",
    "Results": [
      {"Text": "jun, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in jul",
    "Results": [
      {"Text": "jul", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this jul",
    "Results": [
      {"Text": "this jul", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of jul",
    "Results": [
      {"Text": "month of jul", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of jul",
    "Results": [
      {"Text": "the month of jul", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing jul 2001",
    "Results": [
      {"Text": "jul 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing jul, 2001",
    "Results": [
      {"Text": "jul, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in aug",
    "Results": [
      {"Text": "aug", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this aug",
    "Results": [
      {"Text": "this aug", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of aug",
    "Results": [
      {"Text": "month of aug", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of aug",
    "Results": [
      {"Text": "the month of aug", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing aug 2001",
    "Results": [
      {"Text": "aug 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing aug, 2001",
    "Results": [
      {"Text": "aug, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in sep",
    "Results": [
      {"Text": "sep", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this sep",
    "Results": [
      {"Text": "this sep", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of sep",
    "Results": [
      {"Text": "month of sep", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of sep",
    "Results": [
      {"Text": "the month of sep", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing sep 2001",
    "Results": [
      {"Text": "sep 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing sep, 2001",
    "Results": [
      {"Text": "sep, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in sept",
    "Results": [
      {"Text": "sept", "Type": "daterange", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll be out this sept",
    "Results": [
      {"Text": "this sept", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out month of sept",
    "Results": [
      {"Text": "month of sept", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out the month of sept",
    "Results": [
      {"Text": "the month of sept", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I was missing sept 2001",
    "Results": [
      {"Text": "sept 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I was missing sept, 2001",
    "Results": [
      {"Text": "sept, 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out in oct",
    "Results": [
      {"Text": "oct", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this oct",
    "Results": [
      {"Text": "this oct", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of oct",
    "Results": [
      {"Text": "month of oct", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of oct",
    "Results": [
      {"Text": "the month of oct", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing oct 2001",
    "Results": [
      {"Text": "oct 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing oct, 2001",
    "Results": [
      {"Text": "oct, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in nov",
    "Results": [
      {"Text": "nov", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this nov",
    "Results": [
      {"Text": "this nov", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of nov",
    "Results": [
      {"Text": "month of nov", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of nov",
    "Results": [
      {"Text": "the month of nov", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing nov 2001",
    "Results": [
      {"Text": "nov 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing nov, 2001",
    "Results": [
      {"Text": "nov, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in dec",
    "Results": [
      {"Text": "dec", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this dec",
    "Results": [
      {"Text": "this dec", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of dec",
    "Results": [
      {"Text": "month of dec", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of dec",
    "Results": [
      {"Text": "the month of dec", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing dec 2001",
    "Results": [
      {"Text": "dec 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing dec, 2001",
    "Results": [
      {"Text": "dec, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in january",
    "Results": [
      {"Text": "january", "Type": "daterange", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out this january",
    "Results": [
      {"Text": "this january", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out month of january",
    "Results": [
      {"Text": "month of january", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I'll be out the month of january",
    "Results": [
      {"Text": "the month of january", "Type": "daterange", "Start": 12, "Length": 20}
    ]
  },
  {
    "Input": "I was missing january 2001",
    "Results": [
      {"Text": "january 2001", "Type": "daterange", "Start": 14, "Length": 12}
    ]
  },
  {
    "Input": "I was missing january, 2001",
    "Results": [
      {"Text": "january, 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out in february",
    "Results": [
      {"Text": "february", "Type": "daterange", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out this february",
    "Results": [
      {"Text": "this february", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out month of february",
    "Results": [
      {"Text": "month of february", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out the month of february",
    "Results": [
      {"Text": "the month of february", "Type": "daterange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "I was missing february 2001",
    "Results": [
      {"Text": "february 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I was missing february, 2001",
    "Results": [
      {"Text": "february, 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out in march",
    "Results": [
      {"Text": "march", "Type": "daterange", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll be out this march",
    "Results": [
      {"Text": "this march", "Type": "daterange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out month of march",
    "Results": [
      {"Text": "month of march", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out the month of march",
    "Results": [
      {"Text": "the month of march", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I was missing march 2001",
    "Results": [
      {"Text": "march 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I was missing march, 2001",
    "Results": [
      {"Text": "march, 2001", "Type": "daterange", "Start": 14, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out in april",
    "Results": [
      {"Text": "april", "Type": "daterange", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll be out this april",
    "Results": [
      {"Text": "this april", "Type": "daterange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out month of april",
    "Results": [
      {"Text": "month of april", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out the month of april",
    "Results": [
      {"Text": "the month of april", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I was missing april 2001",
    "Results": [
      {"Text": "april 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I was missing april, 2001",
    "Results": [
      {"Text": "april, 2001", "Type": "daterange", "Start": 14, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out in june",
    "Results": [
      {"Text": "june", "Type": "daterange", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll be out this june",
    "Results": [
      {"Text": "this june", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out month of june",
    "Results": [
      {"Text": "month of june", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out the month of june",
    "Results": [
      {"Text": "the month of june", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I was missing june 2001",
    "Results": [
      {"Text": "june 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I was missing june, 2001",
    "Results": [
      {"Text": "june, 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out in july",
    "Results": [
      {"Text": "july", "Type": "daterange", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll be out this july",
    "Results": [
      {"Text": "this july", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out month of july",
    "Results": [
      {"Text": "month of july", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out the month of july",
    "Results": [
      {"Text": "the month of july", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I was missing july 2001",
    "Results": [
      {"Text": "july 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I was missing july, 2001",
    "Results": [
      {"Text": "july, 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out in august",
    "Results": [
      {"Text": "august", "Type": "daterange", "Start": 15, "Length": 6}
    ]
  },
  {
    "Input": "I'll be out this august",
    "Results": [
      {"Text": "this august", "Type": "daterange", "Start": 12, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out month of august",
    "Results": [
      {"Text": "month of august", "Type": "daterange", "Start": 12, "Length": 15}
    ]
  },
  {
    "Input": "I'll be out the month of august",
    "Results": [
      {"Text": "the month of august", "Type": "daterange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I was missing august 2001",
    "Results": [
      {"Text": "august 2001", "Type": "daterange", "Start": 14, "Length": 11}
    ]
  },
  {
    "Input": "I was missing august, 2001",
    "Results": [
      {"Text": "august, 2001", "Type": "daterange", "Start": 14, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out in september",
    "Results": [
      {"Text": "september", "Type": "daterange", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out this september",
    "Results": [
      {"Text": "this september", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out month of september",
    "Results": [
      {"Text": "month of september", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I'll be out the month of september",
    "Results": [
      {"Text": "the month of september", "Type": "daterange", "Start": 12, "Length": 22}
    ]
  },
  {
    "Input": "I was missing september 2001",
    "Results": [
      {"Text": "september 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "I was missing september, 2001",
    "Results": [
      {"Text": "september, 2001", "Type": "daterange", "Start": 14, "Length": 15}
    ]
  },
  {
    "Input": "I'll be out in october",
    "Results": [
      {"Text": "october", "Type": "daterange", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out this october",
    "Results": [
      {"Text": "this october", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out month of october",
    "Results": [
      {"Text": "month of october", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I'll be out the month of october",
    "Results": [
      {"Text": "the month of october", "Type": "daterange", "Start": 12, "Length": 20}
    ]
  },
  {
    "Input": "I was missing october 2001",
    "Results": [
      {"Text": "october 2001", "Type": "daterange", "Start": 14, "Length": 12}
    ]
  },
  {
    "Input": "I was missing october, 2001",
    "Results": [
      {"Text": "october, 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out in november",
    "Results": [
      {"Text": "november", "Type": "daterange", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out this november",
    "Results": [
      {"Text": "this november", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out month of november",
    "Results": [
      {"Text": "month of november", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out the month of november",
    "Results": [
      {"Text": "the month of november", "Type": "daterange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "I was missing november 2001",
    "Results": [
      {"Text": "november 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I was missing november, 2001",
    "Results": [
      {"Text": "november, 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out in december",
    "Results": [
      {"Text": "december", "Type": "daterange", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out this december",
    "Results": [
      {"Text": "this december", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out month of december",
    "Results": [
      {"Text": "month of december", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out the month of december",
    "Results": [
      {"Text": "the month of december", "Type": "daterange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "I was missing december 2001",
    "Results": [
      {"Text": "december 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I was missing december, 2001",
    "Results": [
      {"Text": "december, 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "Calendar for the month of september.",
    "Results": [
      {"Text": "the month of september", "Type": "daterange", "Start": 13, "Length": 22}
    ]
  },
  {
    "Input": "I'll be out from 4 to 22 this month",
    "Results": [
      {"Text": "from 4 to 22 this month", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out from 4-23 in next month",
    "Results": [
      {"Text": "from 4-23 in next month", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out from 3 until 12 of sept hahaha",
    "Results": [
      {"Text": "from 3 until 12 of sept", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out 4 to 23 next month",
    "Results": [
      {"Text": "4 to 23 next month", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I'll be out 4 till 23 of this month",
    "Results": [
      {"Text": "4 till 23 of this month", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out between 4 and 22 this month",
    "Results": [
      {"Text": "between 4 and 22 this month", "Type": "daterange", "Start": 12, "Length": 27}
    ]
  },
  {
    "Input": "I'll be out between 3 and 12 of sept hahaha",
    "Results": [
      {"Text": "between 3 and 12 of sept", "Type": "daterange", "Start": 12, "Length": 24}
    ]
  },
  {
    "Input": "I'll be out between september 4th through september 8th",
    "Results": [
      {"Text": "between september 4th through september 8th", "Type": "daterange", "Start": 12, "Length": 43}
    ]
  },
  {
    "Input": "I'll be out between november 15th through 19th",
    "Results": [
      {"Text": "between november 15th through 19th", "Type": "daterange", "Start": 12, "Length": 34}
    ]
  },
  {
    "Input": "I'll be out between november 15th through the 19th",
    "Results": [
      {"Text": "between november 15th through the 19th", "Type": "daterange", "Start": 12, "Length": 38}
    ]
  },
  {
    "Input": "I'll be out between november the 15th through 19th",
    "Results": [
      {"Text": "between november the 15th through 19th", "Type": "daterange", "Start": 12, "Length": 38}
    ]
  },
  {
    "Input": "I'll be out from 4 to 22 january, 2017",
    "Results": [
      {"Text": "from 4 to 22 january, 2017", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out between 4-22 january, 2017",
    "Results": [
      {"Text": "between 4-22 january, 2017", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out on this week",
    "Results": [
      {"Text": "this week", "Type": "daterange", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out the coming week",
    "Results": [
      {"Text": "coming week", "Type": "daterange", "Start": 16, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out september",
    "Results": [
      {"Text": "september", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out last sept",
    "Results": [
      {"Text": "last sept", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out next june",
    "Results": [
      {"Text": "next june", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out june 2016",
    "Results": [
      {"Text": "june 2016", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out june next year",
    "Results": [
      {"Text": "june next year", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out this weekend",
    "Results": [
      {"Text": "this weekend", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the third week of this month",
    "Results": [
      {"Text": "the third week of this month", "Type": "daterange", "Start": 12, "Length": 28}
    ]
  },
  {
    "Input": "I'll be out the last week of july",
    "Results": [
      {"Text": "the last week of july", "Type": "daterange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "schedule camping for friday through sunday",
    "Results": [
      {"Text": "friday through sunday", "Type": "daterange", "Start": 21, "Length": 21}
    ]
  },
  {
    "Input": "I'll be out next 3 days",
    "Results": [
      {"Text": "next 3 days", "Type": "daterange", "Start": 12, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out next 3 months",
    "Results": [
      {"Text": "next 3 months", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {"Input": "I'll be out in 3 years", "NotSupported": "javascript, python", "Results": []},
  {"Input": "I'll be out in 3 weeks", "NotSupported": "javascript, python", "Results": []},
  {"Input": "I'll be out in 3 months", "NotSupported": "javascript, python", "Results": []},
  {
    "Input": "I'll be out past 3 weeks",
    "Results": [
      {"Text": "past 3 weeks", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out last 3year",
    "Results": [
      {"Text": "last 3year", "Type": "daterange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out last year",
    "Results": [
      {"Text": "last year", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out past month",
    "Results": [
      {"Text": "past month", "Type": "daterange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out previous 3 weeks",
    "Results": [
      {"Text": "previous 3 weeks", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "past few weeks",
    "Results": [
      {"Text": "past few weeks", "Type": "daterange", "Start": 0, "Length": 14}
    ]
  },
  {
    "Input": "past several days",
    "Results": [
      {"Text": "past several days", "Type": "daterange", "Start": 0, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out oct. 2 to october 22",
    "Results": [
      {"Text": "oct. 2 to october 22", "Type": "daterange", "Start": 12, "Length": 20}
    ]
  },
  {
    "Input": "I'll be out january 12, 2016 - 02/22/2016",
    "Results": [
      {"Text": "january 12, 2016 - 02/22/2016", "Type": "daterange", "Start": 12, "Length": 29}
    ]
  },
  {
    "Input": "I'll be out 1st jan until wed, 22 of jan",
    "Results": [
      {"Text": "1st jan until wed, 22 of jan", "Type": "daterange", "Start": 12, "Length": 28}
    ]
  },
  {
    "Input": "I'll be out today till tomorrow",
    "Results": [
      {"Text": "today till tomorrow", "Type": "daterange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I'll be out today to october 22",
    "Results": [
      {"Text": "today to october 22", "Type": "daterange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I'll be out oct. 2 until the day after tomorrow",
    "Results": [
      {"Text": "oct. 2 until the day after tomorrow", "Type": "daterange", "Start": 12, "Length": 35}
    ]
  },
  {
    "Input": "I'll be out today until next sunday",
    "Results": [
      {"Text": "today until next sunday", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out this friday until next sunday",
    "Results": [
      {"Text": "this friday until next sunday", "Type": "daterange", "Start": 12, "Length": 29}
    ]
  },
  {
    "Input": "I'll be out from oct. 2 to october 22",
    "Results": [
      {"Text": "from oct. 2 to october 22", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out from 2015/08/12 until october 22",
    "Results": [
      {"Text": "from 2015/08/12 until october 22", "Type": "daterange", "Start": 12, "Length": 32}
    ]
  },
  {
    "Input": "I'll be out from friday the 2nd until tuesday the 6th",
    "Context": {"ReferenceDateTime": "2018-03-01T00:00:00"},
    "Results": [
      {"Text": "from friday the 2nd until tuesday the 6th", "Type": "daterange", "Start": 12, "Length": 41}
    ]
  },
  {
    "Input": "I'll be out from today till tomorrow",
    "Results": [
      {"Text": "from today till tomorrow", "Type": "daterange", "Start": 12, "Length": 24}
    ]
  },
  {
    "Input": "I'll be out from this friday until next sunday",
    "Results": [
      {"Text": "from this friday until next sunday", "Type": "daterange", "Start": 12, "Length": 34}
    ]
  },
  {
    "Input": "I'll be out between oct. 2 and october 22",
    "Results": [
      {"Text": "between oct. 2 and october 22", "Type": "daterange", "Start": 12, "Length": 29}
    ]
  },
  {
    "Input": "I'll be out november 19-20",
    "Results": [
      {"Text": "november 19-20", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out november 19 to 20",
    "Results": [
      {"Text": "november 19 to 20", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out november between 19 and 20",
    "Results": [
      {"Text": "november between 19 and 20", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out the third quarter of 2016",
    "Results": [
      {"Text": "the third quarter of 2016", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out the third quarter this year",
    "Results": [
      {"Text": "the third quarter this year", "Type": "daterange", "Start": 12, "Length": 27}
    ]
  },
  {
    "Input": "I'll be out 2016 the third quarter",
    "Results": [
      {"Text": "2016 the third quarter", "Type": "daterange", "Start": 12, "Length": 22}
    ]
  },
  {
    "Input": "I'll be back during q1",
    "Results": [
      {"Text": "q1", "Type": "daterange", "Start": 20, "Length": 2}
    ]
  },
  {
    "Input": "I'll be out this q3",
    "Results": [
      {"Text": "q3", "Type": "daterange", "Start": 17, "Length": 2}
    ]
  },
  {
    "Input": "I'll be out 2015.3",
    "Results": [
      {"Text": "2015.3", "Type": "daterange", "Start": 12, "Length": 6}
    ]
  },
  {
    "Input": "I'll be out 2015-3",
    "Results": [
      {"Text": "2015-3", "Type": "daterange", "Start": 12, "Length": 6}
    ]
  },
  {
    "Input": "I'll be out 2015/3",
    "Results": [
      {"Text": "2015/3", "Type": "daterange", "Start": 12, "Length": 6}
    ]
  },
  {
    "Input": "I'll be out 3/2015",
    "Results": [
      {"Text": "3/2015", "Type": "daterange", "Start": 12, "Length": 6}
    ]
  },
  {
    "Input": "I'll be out the third week of 2027",
    "Results": [
      {"Text": "the third week of 2027", "Type": "daterange", "Start": 12, "Length": 22}
    ]
  },
  {
    "Input": "I'll be out the third week next year",
    "Results": [
      {"Text": "the third week next year", "Type": "daterange", "Start": 12, "Length": 24}
    ]
  },
  {
    "Input": "I'll leave this summer",
    "Results": [
      {"Text": "this summer", "Type": "daterange", "Start": 11, "Length": 11}
    ]
  },
  {
    "Input": "I'll leave next spring",
    "Results": [
      {"Text": "next spring", "Type": "daterange", "Start": 11, "Length": 11}
    ]
  },
  {
    "Input": "I'll leave the summer",
    "Results": [
      {"Text": "the summer", "Type": "daterange", "Start": 11, "Length": 10}
    ]
  },
  {
    "Input": "I'll leave summer",
    "Results": [
      {"Text": "summer", "Type": "daterange", "Start": 11, "Length": 6}
    ]
  },
  {
    "Input": "I'll leave summer 2016",
    "Results": [
      {"Text": "summer 2016", "Type": "daterange", "Start": 11, "Length": 11}
    ]
  },
  {
    "Input": "I'll leave summer of 2016",
    "Results": [
      {"Text": "summer of 2016", "Type": "daterange", "Start": 11, "Length": 14}
    ]
  },
  {
    "Input": "upcoming month holidays",
    "Results": [
      {"Text": "upcoming month", "Type": "daterange", "Start": 0, "Length": 14}
    ]
  },
  {
    "Input": "next month holidays",
    "Results": [
      {"Text": "next month", "Type": "daterange", "Start": 0, "Length": 10}
    ]
  },
  {
    "Input": "What do I have the week of november 30th",
    "Results": [
      {"Text": "the week of november 30th", "Type": "daterange", "Start": 15, "Length": 25}
    ]
  },
  {
    "Input": "the week of september.15th",
    "Results": [
      {"Text": "the week of september.15th", "Type": "daterange", "Start": 0, "Length": 26}
    ]
  },
  {
    "Input": "week of september.15th",
    "Results": [
      {"Text": "week of september.15th", "Type": "daterange", "Start": 0, "Length": 22}
    ]
  },
  {
    "Input": "month of september.15th",
    "Results": [
      {"Text": "month of september.15th", "Type": "daterange", "Start": 0, "Length": 23}
    ]
  },
  {
    "Input": "I'll leave over the weekend",
    "Results": [
      {"Text": "the weekend", "Type": "daterange", "Start": 16, "Length": 11}
    ]
  },
  {
    "Input": "I'll leave rest of the week",
    "Results": [
      {"Text": "rest of the week", "Type": "daterange", "Start": 11, "Length": 16}
    ]
  },
  {
    "Input": "I'll leave rest of my week",
    "Results": [
      {"Text": "rest of my week", "Type": "daterange", "Start": 11, "Length": 15}
    ]
  },
  {
    "Input": "I'll leave rest of week",
    "Results": [
      {"Text": "rest of week", "Type": "daterange", "Start": 11, "Length": 12}
    ]
  },
  {
    "Input": "I'll leave rest the week",
    "Results": [
      {"Text": "rest the week", "Type": "daterange", "Start": 11, "Length": 13}
    ]
  },
  {
    "Input": "I'll leave rest of this week",
    "Results": [
      {"Text": "rest of this week", "Type": "daterange", "Start": 11, "Length": 17}
    ]
  },
  {
    "Input": "I'll leave rest current week",
    "Results": [
      {"Text": "rest current week", "Type": "daterange", "Start": 11, "Length": 17}
    ]
  },
  {
    "Input": "I'll leave rest of the month",
    "Results": [
      {"Text": "rest of the month", "Type": "daterange", "Start": 11, "Length": 17}
    ]
  },
  {
    "Input": "I'll leave rest of the year",
    "Results": [
      {"Text": "rest of the year", "Type": "daterange", "Start": 11, "Length": 16}
    ]
  },
  {
    "Input": "Please find us a time to meet later this month",
    "Results": [
      {"Text": "later this month", "Type": "daterange", "Start": 30, "Length": 16}
    ]
  },
  {
    "Input": "Please find us a time to meet later this week",
    "Results": [
      {"Text": "later this week", "Type": "daterange", "Start": 30, "Length": 15}
    ]
  },
  {
    "Input": "Please find us a time to meet late next week",
    "Results": [
      {"Text": "late next week", "Type": "daterange", "Start": 30, "Length": 14}
    ]
  },
  {
    "Input": "Please find us a time to meet late next year",
    "Results": [
      {"Text": "late next year", "Type": "daterange", "Start": 30, "Length": 14}
    ]
  },
  {
    "Input": "We met late last week",
    "Results": [
      {"Text": "late last week", "Type": "daterange", "Start": 7, "Length": 14}
    ]
  },
  {
    "Input": "Please find us a time to meet early this month",
    "Results": [
      {"Text": "early this month", "Type": "daterange", "Start": 30, "Length": 16}
    ]
  },
  {
    "Input": "Please find us a time to meet early this week",
    "Results": [
      {"Text": "early this week", "Type": "daterange", "Start": 30, "Length": 15}
    ]
  },
  {
    "Input": "Please find us a time to meet early next week",
    "Results": [
      {"Text": "early next week", "Type": "daterange", "Start": 30, "Length": 15}
    ]
  },
  {
    "Input": "Please find us a time to meet early next year",
    "Results": [
      {"Text": "early next year", "Type": "daterange", "Start": 30, "Length": 15}
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio next week between wednesday and friday.",
    "Results": [
      {"Text": "next week between wednesday and friday", "Type": "daterange", "Start": 61, "Length": 38}
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio next week from wednesday to friday.",
    "Results": [
      {"Text": "next week from wednesday to friday", "Type": "daterange", "Start": 61, "Length": 34}
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio last week from wednesday to friday.",
    "Results": [
      {"Text": "last week from wednesday to friday", "Type": "daterange", "Start": 61, "Length": 34}
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio this week between wednesday and friday.",
    "Results": [
      {"Text": "this week between wednesday and friday", "Type": "daterange", "Start": 61, "Length": 38}
    ]
  },
  {
    "Input": "I'll be out year 247",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "year 247", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "In the 1970s",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the 1970s", "Type": "daterange", "Start": 3, "Length": 9}
    ]
  },
  {
    "Input": "In the 2000s, he was born.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the 2000s", "Type": "daterange", "Start": 3, "Length": 9}
    ]
  },
  {
    "Input": "In the 1970's",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the 1970's", "Type": "daterange", "Start": 3, "Length": 10}
    ]
  },
  {
    "Input": "In the 70s",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the 70s", "Type": "daterange", "Start": 3, "Length": 7}
    ]
  },
  {
    "Input": "In the 70's",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the 70's", "Type": "daterange", "Start": 3, "Length": 8}
    ]
  },
  {
    "Input": "In the '40s",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the '40s", "Type": "daterange", "Start": 3, "Length": 8}
    ]
  },
  {
    "Input": "In the seventies",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the seventies", "Type": "daterange", "Start": 3, "Length": 13}
    ]
  },
  {
    "Input": "In the nineteen seventies",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the nineteen seventies", "Type": "daterange", "Start": 3, "Length": 22}
    ]
  },
  {
    "Input": "In the two thousand and tens",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the two thousand and tens", "Type": "daterange", "Start": 3, "Length": 25}
    ]
  },
  {
    "Input": "In the twenty-tens",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the twenty-tens", "Type": "daterange", "Start": 3, "Length": 15}
    ]
  },
  {
    "Input": "In the two thousands",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the two thousands", "Type": "daterange", "Start": 3, "Length": 17}
    ]
  },
  {
    "Input": "In the noughties",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the noughties", "Type": "daterange", "Start": 3, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out from 2 to 7 feb, two thousand and eighteen",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "from 2 to 7 feb, two thousand and eighteen", "Type": "daterange", "Start": 12, "Length": 42}
    ]
  },
  {
    "Input": "I'll be out between 2 and 7 feb two thousand and eighteen",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "between 2 and 7 feb two thousand and eighteen", "Type": "daterange", "Start": 12, "Length": 45}
    ]
  },
  {
    "Input": "I'll be out feb between 2-7 two thousand and eighteen",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "feb between 2-7 two thousand and eighteen", "Type": "daterange", "Start": 12, "Length": 41}
    ]
  },
  {
    "Input": "It happened in june of nineteen ninety nine",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "june of nineteen ninety nine", "Type": "daterange", "Start": 15, "Length": 28}
    ]
  },
  {
    "Input": "In nineteen twenty eight",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "nineteen twenty eight", "Type": "daterange", "Start": 3, "Length": 21}
    ]
  },
  {
    "Input": "I'll be out the first week of two thousand and twenty seven",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "the first week of two thousand and twenty seven", "Type": "daterange", "Start": 12, "Length": 47}
    ]
  },
  {
    "Input": "I'll be out the first quarter of two thousand and twenty",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "the first quarter of two thousand and twenty", "Type": "daterange", "Start": 12, "Length": 44}
    ]
  },
  {
    "Input": "In the spring of nineteen seventy eight",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "the spring of nineteen seventy eight", "Type": "daterange", "Start": 3, "Length": 36}
    ]
  },
  {
    "Input": "year two hundred and sixty seven,",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "year two hundred and sixty seven", "Type": "daterange", "Start": 0, "Length": 32}
    ]
  },
  {
    "Input": "I'll be out the week after next",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "the week after next", "Type": "daterange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "It happened in the past 2 decades",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the past 2 decades", "Type": "daterange", "Start": 15, "Length": 18}
    ]
  },
  {
    "Input": "It happened in the last two decades",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the last two decades", "Type": "daterange", "Start": 15, "Length": 20}
    ]
  },
  {
    "Input": "It happened in the next decade",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the next decade", "Type": "daterange", "Start": 15, "Length": 15}
    ]
  },
  {
    "Input": "It will happen 4 weeks in the future",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "4 weeks in the future", "Type": "daterange", "Start": 15, "Length": 21}
    ]
  },
  {
    "Input": "It will happen 2 days hence",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "2 days hence", "Type": "daterange", "Start": 15, "Length": 12}
    ]
  },
  {
    "Input": "Cortana can find us a time beginning of next week",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "beginning of next week", "Type": "daterange", "Start": 27, "Length": 22}
    ]
  },
  {
    "Input": "Sure, let's get a Skype end of next week",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "end of next week", "Type": "daterange", "Start": 24, "Length": 16}
    ]
  },
  {
    "Input": "Sure, let's get a Skype start of next week",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "start of next week", "Type": "daterange", "Start": 24, "Length": 18}
    ]
  },
  {
    "Input": "Cortana, find us a time end of march",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "end of march", "Type": "daterange", "Start": 24, "Length": 12}
    ]
  },
  {
    "Input": "Cortana, please find us a time mid next week",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "mid next week", "Type": "daterange", "Start": 31, "Length": 13}
    ]
  },
  {
    "Input": "cortana can arrange us to meet mid march",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "mid march", "Type": "daterange", "Start": 31, "Length": 9}
    ]
  },
  {
    "Input": "what about by mid summer?",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "mid summer", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I can find us a time beginning of next week",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "beginning of next week", "Type": "daterange", "Start": 21, "Length": 22}
    ]
  },
  {
    "Input": "I'll be out 11 -2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "11 -2016", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out 11- 2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "11- 2016", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out 11 / 2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "11 / 2016", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out 11/2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "11/2016", "Type": "daterange", "Start": 12, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out 11 - 2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "11 - 2016", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out 11-2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "11-2016", "Type": "daterange", "Start": 12, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out 2016 /11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016 /11", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out 2016/ 11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016/ 11", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out 2016 / 11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016 / 11", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out 2016/11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016/11", "Type": "daterange", "Start": 12, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out 2016 -11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016 -11", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out 2016- 11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016- 11", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out 2016 - 11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016 - 11", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out 2016-11",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016-11", "Type": "daterange", "Start": 12, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out 2016 november",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016 november", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out november , 2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "november , 2016", "Type": "daterange", "Start": 12, "Length": 15}
    ]
  },
  {
    "Input": "I'll be out 2016 , nov",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016 , nov", "Type": "daterange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out 2016, nov",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016, nov", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out between january 1st and april 5th",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "between january 1st and april 5th", "Type": "daterange", "Start": 12, "Length": 33}
    ]
  },
  {
    "Input": "I'll be out between january 1st 2015 and feb 5th 2018",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "between january 1st 2015 and feb 5th 2018", "Type": "daterange", "Start": 12, "Length": 41}
    ]
  },
  {
    "Input": "I'll be out between january 1st 2015 and feb 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between january 1st 2015 and feb 2018", "Type": "daterange", "Start": 12, "Length": 37}
    ]
  },
  {
    "Input": "I'll be out between 2015 and feb 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 and feb 2018", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out from feb 1st to march 2019",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from feb 1st to march 2019", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out between feb 1st and march 2019",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between feb 1st and march 2019", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out between 2015 june and 2018 may",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 june and 2018 may", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out between 2015 may and 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 may and 2018", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out between may 2015 and 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between may 2015 and 2018", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out between may 2015 and 2018 june",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between may 2015 and 2018 june", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out between 2015 and january 5th 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 and january 5th 2018", "Type": "daterange", "Start": 12, "Length": 33}
    ]
  },
  {
    "Input": "I'll be out from 2015 to may 5th, 2017",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from 2015 to may 5th, 2017", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out from last monday april to 2019",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from last monday april to 2019", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out from week 31 to week 35",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from week 31 to week 35", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out between week 31 and week 35",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between week 31 and week 35", "Type": "daterange", "Start": 12, "Length": 27}
    ]
  },
  {"Input": "week 0 and week 00 aren't valid weeks", "Results": []},
  {
    "Input": "I'll stay here from today to two and half days later",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "from today to two and half days later", "Type": "daterange", "Start": 15, "Length": 37}
    ]
  },
  {
    "Input": "What is my april 2017 bonus?",
    "Results": [
      {"Text": "april 2017", "Type": "daterange", "Start": 11, "Length": 10}
    ]
  },
  {
    "Input": "I was not there the same month that it happened.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "same month", "Type": "daterange", "Start": 20, "Length": 10}
    ]
  },
  {
    "Input": "I was not there the same week that it happened.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "same week", "Type": "daterange", "Start": 20, "Length": 9}
    ]
  },
  {
    "Input": "I weren't there that year.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "that year", "Type": "daterange", "Start": 16, "Length": 9}
    ]
  },
  {
    "Input": "I have already finished all my work more than 2 weeks before today",
    "NotSupported": "python, javascript",
    "Results": [
      {"Text": "more than 2 weeks before today", "Type": "daterange", "Start": 36, "Length": 30}
    ]
  },
  {
    "Input": "I will come back within 2 weeks from today",
    "NotSupported": "python, javascript",
    "Results": [
      {"Text": "within 2 weeks from today", "Type": "daterange", "Start": 17, "Length": 25}
    ]
  },
  {
    "Input": "I will come back less than 2 weeks from today",
    "NotSupported": "python, javascript",
    "Results": [
      {"Text": "less than 2 weeks from today", "Type": "daterange", "Start": 17, "Length": 28}
    ]
  },
  {
    "Input": "This task should have been done more than 2 days before yesterday",
    "NotSupported": "python, javascript",
    "Results": [
      {"Text": "more than 2 days before yesterday", "Type": "daterange", "Start": 32, "Length": 33}
    ]
  },
  {
    "Input": "This task will be done less than 3 days after tomorrow",
    "NotSupported": "python, javascript",
    "Results": [
      {"Text": "less than 3 days after tomorrow", "Type": "daterange", "Start": 23, "Length": 31}
    ]
  },
  {"Input": "4832 North Kedvale Avenue https://t.co/Jzruq4pTxp", "Results": []},
  {
    "Input": "I was missing oct. 2001",
    "Results": [
      {"Text": "oct. 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "Cortana, can you please set something up for the week of the 18th.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "the week of the 18th", "Type": "daterange", "Start": 45, "Length": 20}
    ]
  },
  {
    "Input": "sales where date is this decade.",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "this decade", "Type": "daterange", "Start": 20, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out the third- quarter of 2016",
    "Results": [
      {"Text": "the third- quarter of 2016", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out the third- quarter",
    "Results": [
      {"Text": "the third- quarter", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I'll be out next year's third-quarter",
    "Results": [
      {"Text": "next year's third-quarter", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out next year's fourth-quarter",
    "Results": [
      {"Text": "next year's fourth-quarter", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {"Input": "Please convert \$2000 to gbp.", "Comment": "2000 shouldn't recognized as year here", "Results": []},
  {
    "Input": "This bank stock is down 20% in the year to date.",
    "Results": [
      {"Text": "year to date", "Type": "daterange", "Start": 35, "Length": 12}
    ]
  },
  {
    "Input": "from 10/1 to 11/7",
    "Results": [
      {"Text": "from 10/1 to 11/7", "Type": "daterange", "Start": 0, "Length": 17}
    ]
  },
  {
    "Input": "I will do my work between now and november 15th",
    "Results": [
      {"Text": "between now and november 15th", "Type": "daterange", "Start": 18, "Length": 29}
    ]
  },
  {
    "Input": "I have finished my work between jan 22 and now",
    "Results": [
      {"Text": "between jan 22 and now", "Type": "daterange", "Start": 24, "Length": 22}
    ]
  },
  {
    "Input": "3pm : I'll be out on this week",
    "Results": [
      {"Text": "this week", "Type": "daterange", "Start": 21, "Length": 9}
    ]
  },
  {
    "Input": "this week 8am should be a daterange and a time.",
    "Results": [
      {"Text": "this week", "Type": "daterange", "Start": 0, "Length": 9}
    ]
  },
  {
    "Input": "this week 8p.m. should be a daterange and a time.",
    "Results": [
      {"Text": "this week", "Type": "daterange", "Start": 0, "Length": 9}
    ]
  },
  {
    "Input": "week 10 8 p.m. should be a daterange and a time.",
    "Results": [
      {"Text": "week 10", "Type": "daterange", "Start": 0, "Length": 7}
    ]
  },
  {
    "Input": "week 10 8p.m. should be a daterange and a time.",
    "Results": [
      {"Text": "week 10", "Type": "daterange", "Start": 0, "Length": 7}
    ]
  },
  {
    "Input": "week 10 10:20 should be a daterange and a time.",
    "Results": [
      {"Text": "week 10", "Type": "daterange", "Start": 0, "Length": 7}
    ]
  },
  {
    "Input": "6,107.31 august 2019 should not include the decimal",
    "Results": [
      {"Text": "august 2019", "Type": "daterange", "Start": 9, "Length": 11}
    ]
  },
  {
    "Input": "I was not there from 2019/aug/01 to today",
    "Results": [
      {"Text": "from 2019/aug/01 to today", "Type": "daterange", "Start": 16, "Length": 25}
    ]
  },
  {
    "Input": "I was not there from 2019-aug-1 to today",
    "Results": [
      {"Text": "from 2019-aug-1 to today", "Type": "daterange", "Start": 16, "Length": 24}
    ]
  },
  {
    "Input": "please schedule a meeting for the week commencing february 4",
    "Results": [
      {"Text": "the week commencing february 4", "Type": "daterange", "Start": 30, "Length": 30}
    ]
  },
  {
    "Input": "please schedule a meeting for the week starting february 4",
    "Results": [
      {"Text": "the week starting february 4", "Type": "daterange", "Start": 30, "Length": 28}
    ]
  },
  {
    "Input": "please schedule a meeting for the week starting on february 4",
    "Results": [
      {"Text": "the week starting on february 4", "Type": "daterange", "Start": 30, "Length": 31}
    ]
  },
  {
    "Input": "please schedule a meeting for the week beginning on february 4",
    "Results": [
      {"Text": "the week beginning on february 4", "Type": "daterange", "Start": 30, "Length": 32}
    ]
  },
  {
    "Input": "please schedule a meeting for the week beginning february 4",
    "Results": [
      {"Text": "the week beginning february 4", "Type": "daterange", "Start": 30, "Length": 29}
    ]
  },
  {
    "Input": "please schedule a meeting for w/c feb 4.",
    "Results": [
      {"Text": "w/c feb 4", "Type": "daterange", "Start": 30, "Length": 9}
    ]
  },
  {
    "Input": "Book a trip from 26th june of 2020 to 28th june of 2020",
    "Results": [
      {"Text": "from 26th june of 2020 to 28th june of 2020", "Type": "daterange", "Start": 12, "Length": 43}
    ]
  },
  {
    "Input": "Show me the records for august 99",
    "NotSupportedByDesign": "javascript,java",
    "Results": [
      {"Text": "august 99", "Type": "daterange", "Start": 24, "Length": 9}
    ]
  }
];
