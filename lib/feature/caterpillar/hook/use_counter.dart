import 'dart:async';
import "package:routine_builder/feature/caterpillar/class/counter_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";

CounterController useCounter() {
  final passedSeconds = useState<int>(0);
  final timer = useRef<Timer?>(null);

  void start(DateTime startedAt) {
    if (timer.value != null) {
      throw Exception("Timer is already running");
    }

    timer.value = Timer.periodic(Duration(seconds: 1), (Timer t) {
      final now = DateTime.now();
      final difference = now.difference(startedAt);
      passedSeconds.value = difference.inSeconds;
    });
  }

  void stop() {
    timer.value?.cancel();
    timer.value = null;
  }

  void reset() {
    passedSeconds.value = 0;
  }

  return useMemoized(() {
    return CounterController(
      passedSeconds,
      start: start,
      stop: stop,
      reset: reset,
    );
  }, [passedSeconds.value]);
}
