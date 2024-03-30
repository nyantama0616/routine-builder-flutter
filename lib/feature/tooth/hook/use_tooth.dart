import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/tooth/class/tooth_controller.dart';
import 'package:routine_builder/feature/tooth/settings.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/hook/use_counter.dart';

ToothController useTooth() {
  final _status = useState<BasicStatuses>(BasicStatuses.none);
  final _counter = useCounter();

  void _init() {
    print("init");
  }

  void start() {
    _status.value = BasicStatuses.doing;
    print("start");
  }

  void stop() {
    _status.value = BasicStatuses.none;
    print("stop");
  }

  void finish() {
    _status.value = BasicStatuses.success;
    print("finish");
  }

  useEffect(() {
    _init();
    return () => {};
  }, []);

  return useMemoized(() {
    return ToothController(
      status: _status.value,
      passedSeconds: _counter.passedSeconds,
      start: start,
      stop: stop,
      finish: finish,
    );
  }, [_status.value, _counter.passedSeconds]);
}
