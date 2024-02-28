import 'package:nlp/src/date_time/constants.dart';
import 'package:nlp/src/date_time/time_of_day_resolution_result.dart';

class TasksModeProcessing {
  static TimeOfDayResolutionResult TasksModeResolveTimeOfDay(String tod) {
    var result = TimeOfDayResolutionResult();
    switch (tod) {
      case DateTimeConstants.EarlyMorning:
        result.Timex = DateTimeConstants.EarlyMorning;
        result.BeginHour = TasksModeConstants.EarlyMorningBeginHour;
        result.EndHour = TasksModeConstants.EarlyMorningEndHour;
        break;
      case DateTimeConstants.Morning:
        result.Timex = DateTimeConstants.Morning;
        result.BeginHour = TasksModeConstants.MorningBeginHour;
        result.EndHour = TasksModeConstants.MorningEndHour;
        break;
      case DateTimeConstants.MidDay:
        result.Timex = DateTimeConstants.MidDay;
        result.BeginHour = TasksModeConstants.MidDayBeginHour;
        result.EndHour = TasksModeConstants.MidDayEndHour;
        break;
      case DateTimeConstants.Afternoon:
        result.Timex = DateTimeConstants.Afternoon;
        result.BeginHour = TasksModeConstants.AfternoonBeginHour;
        result.EndHour = TasksModeConstants.AfternoonEndHour;
        break;
      case DateTimeConstants.Evening:
        result.Timex = DateTimeConstants.Evening;
        result.BeginHour = TasksModeConstants.EveningBeginHour;
        result.EndHour = TasksModeConstants.EveningEndHour;
        break;
      case DateTimeConstants.Daytime:
        result.Timex = DateTimeConstants.Daytime;
        result.BeginHour = TasksModeConstants.DaytimeBeginHour;
        result.EndHour = TasksModeConstants.DaytimeEndHour;
        break;
      case DateTimeConstants.Nighttime:
        result.Timex = DateTimeConstants.Nighttime;
        result.BeginHour = TasksModeConstants.NighttimeBeginHour;
        result.EndHour = TasksModeConstants.NighttimeEndHour;
        break;
      case DateTimeConstants.BusinessHour:
        result.Timex = DateTimeConstants.BusinessHour;
        result.BeginHour = TasksModeConstants.BusinessBeginHour;
        result.EndHour = TasksModeConstants.BusinessEndHour;
        break;
      case DateTimeConstants.Night:
        result.Timex = DateTimeConstants.Night;
        result.BeginHour = TasksModeConstants.NightBeginHour;
        result.EndHour = TasksModeConstants.NightEndHour;
        result.EndMin = TasksModeConstants.NightEndMin;
        break;
      case DateTimeConstants.MealtimeBreakfast:
        result.Timex = DateTimeConstants.MealtimeBreakfast;
        result.BeginHour = TasksModeConstants.MealtimeBreakfastBeginHour;
        result.EndHour = TasksModeConstants.MealtimeBreakfastEndHour;
        break;
      case DateTimeConstants.MealtimeBrunch:
        result.Timex = DateTimeConstants.MealtimeBrunch;
        result.BeginHour = TasksModeConstants.MealtimeBrunchBeginHour;
        result.EndHour = TasksModeConstants.MealtimeBrunchEndHour;
        break;
      case DateTimeConstants.MealtimeLunch:
        result.Timex = DateTimeConstants.MealtimeLunch;
        result.BeginHour = TasksModeConstants.MealtimeLunchBeginHour;
        result.EndHour = TasksModeConstants.MealtimeLunchEndHour;
        break;
      case DateTimeConstants.MealtimeDinner:
        result.Timex = DateTimeConstants.MealtimeDinner;
        result.BeginHour = TasksModeConstants.MealtimeDinnerBeginHour;
        result.EndHour = TasksModeConstants.MealtimeDinnerEndHour;
        break;
      default:
        break;
    }

    return result;
  }

  /*
          Change beginHour and endHour for subjective time refereneces under TasksMode.
          morning get's mapped to 6:00 am
        */
  static (int beginHour, int endHour, int endMin) GetMatchedTimeRangeForTasksMode(String text, String todSymbol) {
    var trimmedText = text.trim();
    int beginHour = 0;
    int endHour = 0;
    int endMin = 0;
    if (todSymbol == DateTimeConstants.Morning) {
      beginHour = TasksModeConstants.MorningBeginHour;
      endHour = TasksModeConstants.EarlyMorningEndHour;
    } else if (todSymbol == DateTimeConstants.Afternoon) {
      beginHour = DateTimeConstants.AfternoonBeginHour;
      endHour = DateTimeConstants.AfternoonEndHour;
    } else if (todSymbol == DateTimeConstants.Evening) {
      beginHour = DateTimeConstants.EveningBeginHour;
      endHour = DateTimeConstants.EveningEndHour;
    } else if (todSymbol == DateTimeConstants.Night) {
      beginHour = TasksModeConstants.NightBeginHour;
      endHour = TasksModeConstants.NightEndHour;
    } else if (todSymbol == DateTimeConstants.MealtimeBreakfast) {
      beginHour = TasksModeConstants.MealtimeBreakfastBeginHour;
      endHour = TasksModeConstants.MealtimeBreakfastEndHour;
    } else if (todSymbol == DateTimeConstants.MealtimeBrunch) {
      beginHour = TasksModeConstants.MealtimeBrunchBeginHour;
      endHour = TasksModeConstants.MealtimeBrunchEndHour;
    } else if (todSymbol == DateTimeConstants.MealtimeDinner) {
      beginHour = TasksModeConstants.MealtimeDinnerBeginHour;
      endHour = TasksModeConstants.MealtimeDinnerEndHour;
    } else if (todSymbol == DateTimeConstants.MealtimeLunch) {
      beginHour = TasksModeConstants.MealtimeLunchBeginHour;
      endHour = TasksModeConstants.MealtimeLunchEndHour;
    } else {
      return (beginHour, endHour, endMin);
    }

    return (beginHour, endHour, endMin);
  }
}
