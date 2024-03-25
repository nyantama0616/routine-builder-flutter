import 'package:routine_builder/feature/caterpillar/class/caterpillar_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/caterpillar/hook/use_counter.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import "package:routine_builder/general/query/client/caterpillar_query_client.dart";
import 'package:routine_builder/general/class/caterpillar.dart';

CaterpillarController useCaterpillar({CaterpillarQueryClient? caterpillarQueryClient}) {
  // final currentMode = useState<Mode?>(null);
  final currentMode = useState<Caterpillar?>(Caterpillar(pattern: "4321", passedSeconds: 30));
  final status = useState<BasicStatuses>(BasicStatuses.none);
  final client = caterpillarQueryClient ?? CaterpillarQueryClient();

  void selectMode(Caterpillar mode) {
    currentMode.value = mode;
  }

  void finish() async {
    try {
      final res = await client.finish();
      status.value = BasicStatuses.none;
      selectMode(res.caterpillar);
    } catch (e) {
      print(e);
      return;
    }
  }
  
  final counter = useCounter(goalSeconds: 3, onFinished: finish);

  void start() async {
    if (currentMode.value == null) {
      throw Exception("Mode is not selected");
    }

    try {
      final res = await client.start(pattern: currentMode.value!.pattern);
      counter.reset();
      counter.start(res.timer.startedAt, res.timer.passedSecondsWhenStopped);
      status.value = BasicStatuses.doing;
      selectMode(res.caterpillar);
    } catch (e) {
      print(e);
      return;
    }
  }

  void stop() async {
    try {
      final res = await client.stop();
      counter.stop(res.timer.passedSecondsWhenStopped);
      status.value = BasicStatuses.none;
      selectMode(res.caterpillar);
    } catch (e) {
      print(e);
      return;
    }
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
