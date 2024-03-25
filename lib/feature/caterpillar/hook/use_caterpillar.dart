import 'package:routine_builder/feature/caterpillar/class/caterpillar_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/caterpillar/hook/use_counter.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import "package:routine_builder/general/query/client/caterpillar_query_client.dart";
import 'package:routine_builder/general/class/caterpillar.dart';

CaterpillarController useCaterpillar(
    {CaterpillarQueryClient? caterpillarQueryClient}) {
  final currentMode = useState<Caterpillar?>(null);
  final status = useState<BasicStatuses>(BasicStatuses.none);
  final client = caterpillarQueryClient ?? CaterpillarQueryClient();
  final patterns = useState<Map<String, int>>({});

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

  final counter = useCounter(goalSeconds: 10, onFinished: finish);

  void init() async {
    print("init");

    try {
      final res = await client.init();
      patterns.value = res.patterns;
      
      if (res.inProgress != null) {
        selectMode(res.inProgress!.caterpillar);

        if (res.inProgress!.timer.isRunning) {
          counter.start(res.inProgress!.timer.startedAt, res.inProgress!.timer.passedSecondsWhenStopped);
          status.value = BasicStatuses.doing;
        } else {
          counter.stop(res.inProgress!.timer.passedSecondsWhenStopped);
          status.value = BasicStatuses.none;
        }
      }
    } catch (e) {
      print(e);
      return;
    }
  }

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

  void toModeSelector() {
    currentMode.value = null;
  }

  useEffect(() {
    init();
    return null;
  }, []);

  return useMemoized(() {
    return CaterpillarController(
      currentMode,
      status,
      counter,
      patterns,
      selectMode: selectMode,
      start: start,
      stop: stop,
      toModeSelector: toModeSelector,
    );
  }, [currentMode.value, counter.passedSeconds]);
}