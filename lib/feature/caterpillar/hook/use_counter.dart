import 'dart:async';
import "package:routine_builder/feature/caterpillar/class/counter_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import 'package:flutter/foundation.dart';
import 'dart:math';

CounterController useCounter(
    {int goalSeconds = 9223372036854775807, VoidCallback? onFinished}) {
  final passedSeconds = useState<int>(0);
  final calledOnFinished = useState<bool>(false);
  final timer = useRef<Timer?>(null);

  void finish() {
    onFinished?.call();
    calledOnFinished.value = true;
    timer.value?.cancel();
    timer.value = null;
  }

  void start(DateTime startedAt, int passedSecondsWhenStopped) {
    if (timer.value != null) {
      throw Exception("Timer is already running");
    }

    if (calledOnFinished.value) {
      throw Exception("Timer is already finished");
    }

    passedSeconds.value = passedSecondsWhenStopped;
    
    timer.value = Timer.periodic(Duration(seconds: 1), (Timer t) {
      final now = DateTime.now();
      final difference = now.difference(startedAt);
      passedSeconds.value = difference.inSeconds + passedSecondsWhenStopped;

      if (passedSeconds.value >= goalSeconds) {
        finish();
      }
    });
  }

  void stop(int passedSecondsWhenStopped) {
    timer.value?.cancel();
    timer.value = null;
    passedSeconds.value = passedSecondsWhenStopped;
  }

  void reset() {
    passedSeconds.value = 0;
    calledOnFinished.value = false;
  }

  return useMemoized(() {
    return CounterController(
      passedSeconds,
      start: start,
      stop: stop,
      reset: reset,
      goalSeconds: goalSeconds,
    );
  }, [passedSeconds.value]);
}
