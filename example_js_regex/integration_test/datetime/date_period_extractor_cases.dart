const datePeriodExtractorTestCases = [
  {
    "Input": "I'll be out in Jan",
    "Results": [
      {"Text": "Jan", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Jan",
    "Results": [
      {"Text": "this Jan", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Jan",
    "Results": [
      {"Text": "month of Jan", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Jan",
    "Results": [
      {"Text": "the month of Jan", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Jan 2001",
    "Results": [
      {"Text": "Jan 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Jan, 2001",
    "Results": [
      {"Text": "Jan, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Feb",
    "Results": [
      {"Text": "Feb", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Feb",
    "Results": [
      {"Text": "this Feb", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Feb",
    "Results": [
      {"Text": "month of Feb", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Feb",
    "Results": [
      {"Text": "the month of Feb", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Feb 2001",
    "Results": [
      {"Text": "Feb 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Feb, 2001",
    "Results": [
      {"Text": "Feb, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Mar",
    "Results": [
      {"Text": "Mar", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Mar",
    "Results": [
      {"Text": "this Mar", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Mar",
    "Results": [
      {"Text": "month of Mar", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Mar",
    "Results": [
      {"Text": "the month of Mar", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Mar 2001",
    "Results": [
      {"Text": "Mar 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Mar, 2001",
    "Results": [
      {"Text": "Mar, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Apr",
    "Results": [
      {"Text": "Apr", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Apr",
    "Results": [
      {"Text": "this Apr", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Apr",
    "Results": [
      {"Text": "month of Apr", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Apr",
    "Results": [
      {"Text": "the month of Apr", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Apr 2001",
    "Results": [
      {"Text": "Apr 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Apr, 2001",
    "Results": [
      {"Text": "Apr, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in May",
    "Results": [
      {"Text": "May", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this May",
    "Results": [
      {"Text": "this May", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of May",
    "Results": [
      {"Text": "month of May", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of May",
    "Results": [
      {"Text": "the month of May", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing May 2001",
    "Results": [
      {"Text": "May 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing May, 2001",
    "Results": [
      {"Text": "May, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Jun",
    "Results": [
      {"Text": "Jun", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Jun",
    "Results": [
      {"Text": "this Jun", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Jun",
    "Results": [
      {"Text": "month of Jun", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Jun",
    "Results": [
      {"Text": "the month of Jun", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Jun 2001",
    "Results": [
      {"Text": "Jun 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Jun, 2001",
    "Results": [
      {"Text": "Jun, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Jul",
    "Results": [
      {"Text": "Jul", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Jul",
    "Results": [
      {"Text": "this Jul", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Jul",
    "Results": [
      {"Text": "month of Jul", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Jul",
    "Results": [
      {"Text": "the month of Jul", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Jul 2001",
    "Results": [
      {"Text": "Jul 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Jul, 2001",
    "Results": [
      {"Text": "Jul, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Aug",
    "Results": [
      {"Text": "Aug", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Aug",
    "Results": [
      {"Text": "this Aug", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Aug",
    "Results": [
      {"Text": "month of Aug", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Aug",
    "Results": [
      {"Text": "the month of Aug", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Aug 2001",
    "Results": [
      {"Text": "Aug 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Aug, 2001",
    "Results": [
      {"Text": "Aug, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Sep",
    "Results": [
      {"Text": "Sep", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Sep",
    "Results": [
      {"Text": "this Sep", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Sep",
    "Results": [
      {"Text": "month of Sep", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Sep",
    "Results": [
      {"Text": "the month of Sep", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Sep 2001",
    "Results": [
      {"Text": "Sep 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Sep, 2001",
    "Results": [
      {"Text": "Sep, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Sept",
    "Results": [
      {"Text": "Sept", "Type": "daterange", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll be out this Sept",
    "Results": [
      {"Text": "this Sept", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out month of Sept",
    "Results": [
      {"Text": "month of Sept", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out the month of Sept",
    "Results": [
      {"Text": "the month of Sept", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I was missing Sept 2001",
    "Results": [
      {"Text": "Sept 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I was missing Sept, 2001",
    "Results": [
      {"Text": "Sept, 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out in Oct",
    "Results": [
      {"Text": "Oct", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Oct",
    "Results": [
      {"Text": "this Oct", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Oct",
    "Results": [
      {"Text": "month of Oct", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Oct",
    "Results": [
      {"Text": "the month of Oct", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Oct 2001",
    "Results": [
      {"Text": "Oct 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Oct, 2001",
    "Results": [
      {"Text": "Oct, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Nov",
    "Results": [
      {"Text": "Nov", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Nov",
    "Results": [
      {"Text": "this Nov", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Nov",
    "Results": [
      {"Text": "month of Nov", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Nov",
    "Results": [
      {"Text": "the month of Nov", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Nov 2001",
    "Results": [
      {"Text": "Nov 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Nov, 2001",
    "Results": [
      {"Text": "Nov, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in Dec",
    "Results": [
      {"Text": "Dec", "Type": "daterange", "Start": 15, "Length": 3}
    ]
  },
  {
    "Input": "I'll be out this Dec",
    "Results": [
      {"Text": "this Dec", "Type": "daterange", "Start": 12, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out month of Dec",
    "Results": [
      {"Text": "month of Dec", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out the month of Dec",
    "Results": [
      {"Text": "the month of Dec", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I was missing Dec 2001",
    "Results": [
      {"Text": "Dec 2001", "Type": "daterange", "Start": 14, "Length": 8}
    ]
  },
  {
    "Input": "I was missing Dec, 2001",
    "Results": [
      {"Text": "Dec, 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out in January",
    "Results": [
      {"Text": "January", "Type": "daterange", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out this January",
    "Results": [
      {"Text": "this January", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out month of January",
    "Results": [
      {"Text": "month of January", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I'll be out the month of January",
    "Results": [
      {"Text": "the month of January", "Type": "daterange", "Start": 12, "Length": 20}
    ]
  },
  {
    "Input": "I was missing January 2001",
    "Results": [
      {"Text": "January 2001", "Type": "daterange", "Start": 14, "Length": 12}
    ]
  },
  {
    "Input": "I was missing January, 2001",
    "Results": [
      {"Text": "January, 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out in February",
    "Results": [
      {"Text": "February", "Type": "daterange", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out this February",
    "Results": [
      {"Text": "this February", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out month of February",
    "Results": [
      {"Text": "month of February", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out the month of February",
    "Results": [
      {"Text": "the month of February", "Type": "daterange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "I was missing February 2001",
    "Results": [
      {"Text": "February 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I was missing February, 2001",
    "Results": [
      {"Text": "February, 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out in March",
    "Results": [
      {"Text": "March", "Type": "daterange", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll be out this March",
    "Results": [
      {"Text": "this March", "Type": "daterange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out month of March",
    "Results": [
      {"Text": "month of March", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out the month of March",
    "Results": [
      {"Text": "the month of March", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I was missing March 2001",
    "Results": [
      {"Text": "March 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I was missing March, 2001",
    "Results": [
      {"Text": "March, 2001", "Type": "daterange", "Start": 14, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out in April",
    "Results": [
      {"Text": "April", "Type": "daterange", "Start": 15, "Length": 5}
    ]
  },
  {
    "Input": "I'll be out this April",
    "Results": [
      {"Text": "this April", "Type": "daterange", "Start": 12, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out month of April",
    "Results": [
      {"Text": "month of April", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out the month of April",
    "Results": [
      {"Text": "the month of April", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I was missing April 2001",
    "Results": [
      {"Text": "April 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I was missing April, 2001",
    "Results": [
      {"Text": "April, 2001", "Type": "daterange", "Start": 14, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out in June",
    "Results": [
      {"Text": "June", "Type": "daterange", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll be out this June",
    "Results": [
      {"Text": "this June", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out month of June",
    "Results": [
      {"Text": "month of June", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out the month of June",
    "Results": [
      {"Text": "the month of June", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I was missing June 2001",
    "Results": [
      {"Text": "June 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I was missing June, 2001",
    "Results": [
      {"Text": "June, 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out in July",
    "Results": [
      {"Text": "July", "Type": "daterange", "Start": 15, "Length": 4}
    ]
  },
  {
    "Input": "I'll be out this July",
    "Results": [
      {"Text": "this July", "Type": "daterange", "Start": 12, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out month of July",
    "Results": [
      {"Text": "month of July", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out the month of July",
    "Results": [
      {"Text": "the month of July", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I was missing July 2001",
    "Results": [
      {"Text": "July 2001", "Type": "daterange", "Start": 14, "Length": 9}
    ]
  },
  {
    "Input": "I was missing July, 2001",
    "Results": [
      {"Text": "July, 2001", "Type": "daterange", "Start": 14, "Length": 10}
    ]
  },
  {
    "Input": "I'll be out in August",
    "Results": [
      {"Text": "August", "Type": "daterange", "Start": 15, "Length": 6}
    ]
  },
  {
    "Input": "I'll be out this August",
    "Results": [
      {"Text": "this August", "Type": "daterange", "Start": 12, "Length": 11}
    ]
  },
  {
    "Input": "I'll be out month of August",
    "Results": [
      {"Text": "month of August", "Type": "daterange", "Start": 12, "Length": 15}
    ]
  },
  {
    "Input": "I'll be out the month of August",
    "Results": [
      {"Text": "the month of August", "Type": "daterange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I was missing August 2001",
    "Results": [
      {"Text": "August 2001", "Type": "daterange", "Start": 14, "Length": 11}
    ]
  },
  {
    "Input": "I was missing August, 2001",
    "Results": [
      {"Text": "August, 2001", "Type": "daterange", "Start": 14, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out in September",
    "Results": [
      {"Text": "September", "Type": "daterange", "Start": 15, "Length": 9}
    ]
  },
  {
    "Input": "I'll be out this September",
    "Results": [
      {"Text": "this September", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out month of September",
    "Results": [
      {"Text": "month of September", "Type": "daterange", "Start": 12, "Length": 18}
    ]
  },
  {
    "Input": "I'll be out the month of September",
    "Results": [
      {"Text": "the month of September", "Type": "daterange", "Start": 12, "Length": 22}
    ]
  },
  {
    "Input": "I was missing September 2001",
    "Results": [
      {"Text": "September 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "I was missing September, 2001",
    "Results": [
      {"Text": "September, 2001", "Type": "daterange", "Start": 14, "Length": 15}
    ]
  },
  {
    "Input": "I'll be out in October",
    "Results": [
      {"Text": "October", "Type": "daterange", "Start": 15, "Length": 7}
    ]
  },
  {
    "Input": "I'll be out this October",
    "Results": [
      {"Text": "this October", "Type": "daterange", "Start": 12, "Length": 12}
    ]
  },
  {
    "Input": "I'll be out month of October",
    "Results": [
      {"Text": "month of October", "Type": "daterange", "Start": 12, "Length": 16}
    ]
  },
  {
    "Input": "I'll be out the month of October",
    "Results": [
      {"Text": "the month of October", "Type": "daterange", "Start": 12, "Length": 20}
    ]
  },
  {
    "Input": "I was missing October 2001",
    "Results": [
      {"Text": "October 2001", "Type": "daterange", "Start": 14, "Length": 12}
    ]
  },
  {
    "Input": "I was missing October, 2001",
    "Results": [
      {"Text": "October, 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out in November",
    "Results": [
      {"Text": "November", "Type": "daterange", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out this November",
    "Results": [
      {"Text": "this November", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out month of November",
    "Results": [
      {"Text": "month of November", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out the month of November",
    "Results": [
      {"Text": "the month of November", "Type": "daterange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "I was missing November 2001",
    "Results": [
      {"Text": "November 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I was missing November, 2001",
    "Results": [
      {"Text": "November, 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out in December",
    "Results": [
      {"Text": "December", "Type": "daterange", "Start": 15, "Length": 8}
    ]
  },
  {
    "Input": "I'll be out this December",
    "Results": [
      {"Text": "this December", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out month of December",
    "Results": [
      {"Text": "month of December", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out the month of December",
    "Results": [
      {"Text": "the month of December", "Type": "daterange", "Start": 12, "Length": 21}
    ]
  },
  {
    "Input": "I was missing December 2001",
    "Results": [
      {"Text": "December 2001", "Type": "daterange", "Start": 14, "Length": 13}
    ]
  },
  {
    "Input": "I was missing December, 2001",
    "Results": [
      {"Text": "December, 2001", "Type": "daterange", "Start": 14, "Length": 14}
    ]
  },
  {
    "Input": "Calendar for the month of September.",
    "Results": [
      {"Text": "the month of September", "Type": "daterange", "Start": 13, "Length": 22}
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
    "Input": "I'll be out from 3 until 12 of Sept hahaha",
    "Results": [
      {"Text": "from 3 until 12 of Sept", "Type": "daterange", "Start": 12, "Length": 23}
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
    "Input": "I'll be out between 3 and 12 of Sept hahaha",
    "Results": [
      {"Text": "between 3 and 12 of Sept", "Type": "daterange", "Start": 12, "Length": 24}
    ]
  },
  {
    "Input": "I'll be out between september 4th through september 8th",
    "Results": [
      {"Text": "between september 4th through september 8th", "Type": "daterange", "Start": 12, "Length": 43}
    ]
  },
  {
    "Input": "I'll be out between November 15th through 19th",
    "Results": [
      {"Text": "between November 15th through 19th", "Type": "daterange", "Start": 12, "Length": 34}
    ]
  },
  {
    "Input": "I'll be out between November 15th through the 19th",
    "Results": [
      {"Text": "between November 15th through the 19th", "Type": "daterange", "Start": 12, "Length": 38}
    ]
  },
  {
    "Input": "I'll be out between November the 15th through 19th",
    "Results": [
      {"Text": "between November the 15th through 19th", "Type": "daterange", "Start": 12, "Length": 38}
    ]
  },
  {
    "Input": "I'll be out from 4 to 22 January, 2017",
    "Results": [
      {"Text": "from 4 to 22 January, 2017", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out between 4-22 January, 2017",
    "Results": [
      {"Text": "between 4-22 January, 2017", "Type": "daterange", "Start": 12, "Length": 26}
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
    "Input": "I'll be out September",
    "Results": [
      {"Text": "September", "Type": "daterange", "Start": 12, "Length": 9}
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
    "Input": "schedule camping for Friday through Sunday",
    "Results": [
      {"Text": "Friday through Sunday", "Type": "daterange", "Start": 21, "Length": 21}
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
    "Input": "I'll be out Oct. 2 to October 22",
    "Results": [
      {"Text": "Oct. 2 to October 22", "Type": "daterange", "Start": 12, "Length": 20}
    ]
  },
  {
    "Input": "I'll be out January 12, 2016 - 02/22/2016",
    "Results": [
      {"Text": "January 12, 2016 - 02/22/2016", "Type": "daterange", "Start": 12, "Length": 29}
    ]
  },
  {
    "Input": "I'll be out 1st Jan until Wed, 22 of Jan",
    "Results": [
      {"Text": "1st Jan until Wed, 22 of Jan", "Type": "daterange", "Start": 12, "Length": 28}
    ]
  },
  {
    "Input": "I'll be out today till tomorrow",
    "Results": [
      {"Text": "today till tomorrow", "Type": "daterange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I'll be out today to October 22",
    "Results": [
      {"Text": "today to October 22", "Type": "daterange", "Start": 12, "Length": 19}
    ]
  },
  {
    "Input": "I'll be out Oct. 2 until the day after tomorrow",
    "Results": [
      {"Text": "Oct. 2 until the day after tomorrow", "Type": "daterange", "Start": 12, "Length": 35}
    ]
  },
  {
    "Input": "I'll be out today until next Sunday",
    "Results": [
      {"Text": "today until next Sunday", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out this Friday until next Sunday",
    "Results": [
      {"Text": "this Friday until next Sunday", "Type": "daterange", "Start": 12, "Length": 29}
    ]
  },
  {
    "Input": "I'll be out from Oct. 2 to October 22",
    "Results": [
      {"Text": "from Oct. 2 to October 22", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out from 2015/08/12 until October 22",
    "Results": [
      {"Text": "from 2015/08/12 until October 22", "Type": "daterange", "Start": 12, "Length": 32}
    ]
  },
  {
    "Input": "I'll be out from Friday the 2nd until Tuesday the 6th",
    "Context": {"ReferenceDateTime": "2018-03-01T00:00:00"},
    "Results": [
      {"Text": "from Friday the 2nd until Tuesday the 6th", "Type": "daterange", "Start": 12, "Length": 41}
    ]
  },
  {
    "Input": "I'll be out from today till tomorrow",
    "Results": [
      {"Text": "from today till tomorrow", "Type": "daterange", "Start": 12, "Length": 24}
    ]
  },
  {
    "Input": "I'll be out from this Friday until next Sunday",
    "Results": [
      {"Text": "from this Friday until next Sunday", "Type": "daterange", "Start": 12, "Length": 34}
    ]
  },
  {
    "Input": "I'll be out between Oct. 2 and October 22",
    "Results": [
      {"Text": "between Oct. 2 and October 22", "Type": "daterange", "Start": 12, "Length": 29}
    ]
  },
  {
    "Input": "I'll be out November 19-20",
    "Results": [
      {"Text": "November 19-20", "Type": "daterange", "Start": 12, "Length": 14}
    ]
  },
  {
    "Input": "I'll be out November 19 to 20",
    "Results": [
      {"Text": "November 19 to 20", "Type": "daterange", "Start": 12, "Length": 17}
    ]
  },
  {
    "Input": "I'll be out November between 19 and 20",
    "Results": [
      {"Text": "November between 19 and 20", "Type": "daterange", "Start": 12, "Length": 26}
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
    "Input": "I'll be back during Q1",
    "Results": [
      {"Text": "Q1", "Type": "daterange", "Start": 20, "Length": 2}
    ]
  },
  {
    "Input": "I'll be out this Q3",
    "Results": [
      {"Text": "Q3", "Type": "daterange", "Start": 17, "Length": 2}
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
    "Input": "What do I have the week of November 30th",
    "Results": [
      {"Text": "the week of November 30th", "Type": "daterange", "Start": 15, "Length": 25}
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
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio next week between Wednesday and Friday.",
    "Results": [
      {"Text": "next week between Wednesday and Friday", "Type": "daterange", "Start": 61, "Length": 38}
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio next week from Wednesday to Friday.",
    "Results": [
      {"Text": "next week from Wednesday to Friday", "Type": "daterange", "Start": 61, "Length": 34}
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio last week from Wednesday to Friday.",
    "Results": [
      {"Text": "last week from Wednesday to Friday", "Type": "daterange", "Start": 61, "Length": 34}
    ]
  },
  {
    "Input": "Cortana, please coordinate a 25 minutes meeting with antonio this week between Wednesday and Friday.",
    "Results": [
      {"Text": "this week between Wednesday and Friday", "Type": "daterange", "Start": 61, "Length": 38}
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
    "Input": "I'll be out from 2 to 7 Feb, two thousand and eighteen",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "from 2 to 7 Feb, two thousand and eighteen", "Type": "daterange", "Start": 12, "Length": 42}
    ]
  },
  {
    "Input": "I'll be out between 2 and 7 Feb two thousand and eighteen",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "between 2 and 7 Feb two thousand and eighteen", "Type": "daterange", "Start": 12, "Length": 45}
    ]
  },
  {
    "Input": "I'll be out Feb between 2-7 two thousand and eighteen",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "Feb between 2-7 two thousand and eighteen", "Type": "daterange", "Start": 12, "Length": 41}
    ]
  },
  {
    "Input": "It happened in June of nineteen ninety nine",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "June of nineteen ninety nine", "Type": "daterange", "Start": 15, "Length": 28}
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
    "Input": "Year two hundred and sixty seven,",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "Year two hundred and sixty seven", "Type": "daterange", "Start": 0, "Length": 32}
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
    "Input": "Cortana, find us a time end of March",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "end of March", "Type": "daterange", "Start": 24, "Length": 12}
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
    "Input": "cortana can arrange us to meet mid March",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "mid March", "Type": "daterange", "Start": 31, "Length": 9}
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
    "Input": "I'll be out 2016 November",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "2016 November", "Type": "daterange", "Start": 12, "Length": 13}
    ]
  },
  {
    "Input": "I'll be out November , 2016",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "November , 2016", "Type": "daterange", "Start": 12, "Length": 15}
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
    "Input": "I'll be out between January 1st and April 5th",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "between January 1st and April 5th", "Type": "daterange", "Start": 12, "Length": 33}
    ]
  },
  {
    "Input": "I'll be out between January 1st 2015 and Feb 5th 2018",
    "NotSupported": "javascript",
    "Results": [
      {"Text": "between January 1st 2015 and Feb 5th 2018", "Type": "daterange", "Start": 12, "Length": 41}
    ]
  },
  {
    "Input": "I'll be out between January 1st 2015 and Feb 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between January 1st 2015 and Feb 2018", "Type": "daterange", "Start": 12, "Length": 37}
    ]
  },
  {
    "Input": "I'll be out between 2015 and Feb 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 and Feb 2018", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out from Feb 1st to March 2019",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from Feb 1st to March 2019", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out between Feb 1st and March 2019",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between Feb 1st and March 2019", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out between 2015 June and 2018 May",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 June and 2018 May", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out between 2015 May and 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 May and 2018", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out between May 2015 and 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between May 2015 and 2018", "Type": "daterange", "Start": 12, "Length": 25}
    ]
  },
  {
    "Input": "I'll be out between May 2015 and 2018 June",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between May 2015 and 2018 June", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out between 2015 and January 5th 2018",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between 2015 and January 5th 2018", "Type": "daterange", "Start": 12, "Length": 33}
    ]
  },
  {
    "Input": "I'll be out from 2015 to May 5th, 2017",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from 2015 to May 5th, 2017", "Type": "daterange", "Start": 12, "Length": 26}
    ]
  },
  {
    "Input": "I'll be out from last Monday April to 2019",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from last Monday April to 2019", "Type": "daterange", "Start": 12, "Length": 30}
    ]
  },
  {
    "Input": "I'll be out from Week 31 to Week 35",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "from Week 31 to Week 35", "Type": "daterange", "Start": 12, "Length": 23}
    ]
  },
  {
    "Input": "I'll be out between Week 31 and Week 35",
    "NotSupported": "javascript, python",
    "Results": [
      {"Text": "between Week 31 and Week 35", "Type": "daterange", "Start": 12, "Length": 27}
    ]
  },
  {"Input": "Week 0 and Week 00 aren't valid weeks", "Results": []},
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
    "Input": "I was missing Oct. 2001",
    "Results": [
      {"Text": "Oct. 2001", "Type": "daterange", "Start": 14, "Length": 9}
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
    "Input": "I will do my work between now and November 15th",
    "Results": [
      {"Text": "between now and November 15th", "Type": "daterange", "Start": 18, "Length": 29}
    ]
  },
  {
    "Input": "I have finished my work between Jan 22 and now",
    "Results": [
      {"Text": "between Jan 22 and now", "Type": "daterange", "Start": 24, "Length": 22}
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
    "Input": "6,107.31 August 2019 should not include the decimal",
    "Results": [
      {"Text": "August 2019", "Type": "daterange", "Start": 9, "Length": 11}
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
    "Input": "Show me the records for August 99",
    "NotSupportedByDesign": "javascript,java",
    "Results": [
      {"Text": "August 99", "Type": "daterange", "Start": 24, "Length": 9}
    ]
  }
];
