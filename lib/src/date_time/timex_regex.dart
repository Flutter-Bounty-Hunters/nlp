import 'package:nlp/nlp.dart';

class TimexRegex {
  static const String DateTimeCollectionName = "datetime";
  static const String DateCollectionName = "date";
  static const String TimeCollectionName = "time";
  static const String PeriodCollectionName = "period";

  static Map<String, List<RegExp>> timexRegex = <String, List<RegExp>>{
    DateCollectionName: <RegExp>[
      // date
      RegExp(r"^(XXXX|(?<year>\d\d\d\d))-(?<month>\d\d)(-(?<dayOfMonth>\d\d))?"),
      RegExp(r"^XXXX-WXX-(?<dayOfWeek>\d)"),
      RegExp(r"^XXXX-XX-(?<dayOfMonth>\d\d)"),

      // daterange
      RegExp(r"^(?<year>\d\d\d\d)"),
      RegExp(r"^(XXXX|(?<year>\d\d\d\d))-(?<month>\d\d)-W(?<weekOfMonth>\d\d)"),
      RegExp(r"^(XXXX|(?<year>\d\d\d\d))-(?<month>\d\d)-WXX-(?<weekOfMonth>\d{1,2})(-(?<dayOfWeek>\d))?"),
      RegExp(r"^(?<season>SP|SU|FA|WI)"),
      RegExp(r"^(XXXX|(?<year>\d\d\d\d))-(?<season>SP|SU|FA|WI)"),
      RegExp(r"^(XXXX|(?<year>\d\d\d\d))-W(?<weekOfYear>\d\d)(-(?<dayOfWeek>\d)|-(?<weekend>WE))?"),
    ],
    TimeCollectionName: <RegExp>[
      // time
      RegExp(r"T(?<hour>\d\d)Z?$"),
      RegExp(r"T(?<hour>\d\d):(?<minute>\d\d)Z?$"),
      RegExp(r"T(?<hour>\d\d):(?<minute>\d\d):(?<second>\d\d)Z?$"),

      // timerange
      RegExp(r"^T(?<partOfDay>DT|NI|MO|AF|EV)$"),
    ],
    PeriodCollectionName: <RegExp>[
      RegExp(r"P(?<amount>\d*\.?\d+)(?<dateUnit>Y|M|W|D|WE|WD)$"),
      RegExp(r"^PT(?<hourAmount>\d*\.?\d+)H(\d*\.?\d+(M|S)){0,2}$"),
      RegExp(r"^PT(\d*\.?\d+H)?(?<minuteAmount>\d*\.?\d+)M(\d*\.?\d+S)?$"),
      RegExp(r"^PT(\d*\.?\d+(H|M)){0,2}(?<secondAmount>\d*\.?\d+)S$"),
    ],
  };

  static bool Extract(String name, String timex, Map<String, String> result) {
    var lowerName = name.toLowerCase();
    var nameGroup = '';

    if (lowerName == DateTimeCollectionName) {
      nameGroup += DateCollectionName;
      nameGroup += TimeCollectionName;
    } else {
      nameGroup += lowerName;
    }

    var anyTrue = false;
    //for (var nameItem in nameGroup)
    for (int i = 0; i < nameGroup.length; i++) {
      var nameItem = nameGroup[i];
      for (var entry in timexRegex[nameItem]!) {
        if (TryExtract(entry, timex, result)) {
          anyTrue = true;
        }
      }
    }

    return anyTrue;
  }

  static bool TryExtract(RegExp regex, String timex, Map<String, String> result) {
    var regexResult = RegExpComposer.firstMatch(regex, timex);
    if (regexResult == null) {
      return false;
    }

    for (var groupName in regexResult.innerGroups.keys) {
      result[groupName] = regexResult.getGroup(groupName).value;
    }

    return true;
  }
}
