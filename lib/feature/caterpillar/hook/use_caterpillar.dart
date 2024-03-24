import 'package:routine_builder/feature/caterpillar/class/caterpillar_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/caterpillar/class/mode.dart';
import 'package:routine_builder/feature/caterpillar/hook/use_counter.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';

CaterpillarController useCaterpillar() {
  // final currentMode = useState<Mode?>(null);
  final currentMode = useState<Mode?>(Mode(pattern: "4321", minutes: 30));
  final status = useState<BasicStatuses>(BasicStatuses.none);
  final counter = useCounter();

  void selectMode(Mode mode) {
    currentMode.value = mode;
  }

  void start() {
    if (currentMode.value == null) {
        throw Exception("Mode is not selected");
    }

    counter.start(DateTime.now());
    status.value = BasicStatuses.doing;
  }

  void stop() {
    counter.stop();
    status.value = BasicStatuses.none;
  }

  return useMemoized(() {
    return CaterpillarController(
      currentMode,
      status,
      counter,
      selectMode: selectMode,
      start: start,
      stop: stop,
    );
  }, [currentMode.value, counter.passedSeconds]);
}
