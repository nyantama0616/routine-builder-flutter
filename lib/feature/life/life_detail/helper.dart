import 'package:routine_builder/feature/life/enum/daysOfWeek.dart';
import 'package:routine_builder/general/model/life.dart';
import 'package:routine_builder/general/util/time.dart';

String date(Life life) {
  final month = life.wakedUpAt.month;
  final day = life.wakedUpAt.day;
  final dayOfWeek = DaysOfWeek.values[life.wakedUpAt.weekday - 1].rawValue;

  return "$month/$day($dayOfWeek)";
}

String wakedUpAt(Life life) {
  return _strFromDateTime(life.wakedUpAt);
}

String wentToBedAt(Life life) {
  if (life.wentToBedAt == null) {
    return "";
  }

  return _strFromDateTime(life.wentToBedAt!);
}

String sleepTime(Life life) {
  final seconds = life.sleepSeconds;
  final hour = hoursFromSeconds(seconds);
  final minute = minutesFromSeconds(seconds);

  return "$hour時間$minute分";
}

String water(Life life) {
  return "${life.water.toString()}ml";
}

String hiit(Life life) {
  return _trainTime(life.trainSeconds.hiit);
}

String hanon(Life life) {
  return _trainTime(life.trainSeconds.hanon);
}

String caterpillar(Life life) {
  return _trainTime(life.trainSeconds.caterpillar);
}

String _trainTime(int seconds) {
  final hour = hoursFromSeconds(seconds);
  final minute = minutesFromSeconds(seconds);
  final second = secondsFromSeconds(seconds);

  return "$hour時間$minute分$second秒";
}

String _strFromDateTime(DateTime dateTime) {
  final month = dateTime.month;
  final day = dateTime.day;
  final hour = dateTime.hour;
  final minute = dateTime.minute;

  return "$month/$day $hour:$minute";
}
