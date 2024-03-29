import 'package:flutter/foundation.dart';

class CounterController {
  late final ValueNotifier<int> _passedSeconds;
  Function(DateTime startedAt, int passedSecondsWhenStopped) start;
  Function(int passedSecondsWhenStopped) stop;
  Function() reset;
  final int goalSeconds;

  CounterController(
    this._passedSeconds, {
    required this.start,
    required this.stop,
    required this.reset,
    required this.goalSeconds,
  });

  int get passedSeconds => _passedSeconds.value;
}
