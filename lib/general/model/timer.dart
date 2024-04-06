class Timer {
  final bool isRunning;
  final DateTime startedAt;
  final int passedSecondsWhenStopped;

  Timer({
    required this.isRunning,
    required this.startedAt,
    required this.passedSecondsWhenStopped,
  });

  factory Timer.fromJson(Map<String, dynamic> json) {
    return Timer(
      isRunning: json['isRunning'],
      startedAt: DateTime.parse(json['startedAt']),
      passedSecondsWhenStopped: json['passedSecondsWhenStopped'],
    );
  }
}
