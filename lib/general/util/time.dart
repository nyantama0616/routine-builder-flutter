import 'package:timezone/timezone.dart' as tz;

int hoursFromSeconds(int seconds) {
  return seconds ~/ 3600;
}

int minutesFromSeconds(int seconds) {
  return (seconds % 3600) ~/ 60;
}

int secondsFromSeconds(int seconds) {
  return seconds % 60;
}

DateTime convertFromUTCToJST(DateTime utc) {
  final jst = tz.getLocation('Asia/Tokyo');
  return tz.TZDateTime.from(utc, jst);
}
