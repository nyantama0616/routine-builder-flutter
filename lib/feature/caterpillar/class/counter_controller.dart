import 'package:flutter/foundation.dart';

class CounterController {
  late final ValueNotifier<int> _passedSeconds;
  Function(DateTime startedAt) start;
  Function() stop;
  Function() reset;

  CounterController(
    this._passedSeconds, {
    required this.start,
    required this.stop,
    required this.reset,
  });

  int get passedSeconds => _passedSeconds.value;
}
