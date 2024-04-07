int hoursFromSeconds(int seconds) {
  return seconds ~/ 3600;
}

int minutesFromSeconds(int seconds) {
  return (seconds % 3600) ~/ 60;
}

int secondsFromSeconds(int seconds) {
  return seconds % 60;
}
