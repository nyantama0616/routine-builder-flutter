import 'package:routine_builder/feature/caterpillar/class/caterpillar_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/general/hook/use_counter.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/provider/app_provider.dart';
import "package:routine_builder/general/query/client/caterpillar_query_client.dart";
import 'package:routine_builder/general/class/caterpillar.dart';
import 'package:routine_builder/feature/caterpillar/settings.dart';
import 'package:routine_builder/general/util/train_sound_player.dart';

CaterpillarController useCaterpillar(
    {CaterpillarQueryClient? caterpillarQueryClient,
    required AppNotifier appNotifier}) {
  final currentMode = useState<Caterpillar?>(null);
  final status = useState<BasicStatuses>(BasicStatuses.none);
  final client = caterpillarQueryClient ?? CaterpillarQueryClient();
  final patterns = useState<Map<String, int>>({});

  final tsPlayer = TrainSoundPlayer();

  void selectMode(Caterpillar mode) {
    currentMode.value = mode;
  }

  void finish() async {
    client.finish().then((res) {
      status.value = BasicStatuses.success;
      selectMode(res.caterpillar);
      appNotifier.setTodayLife(res.todayLife);
      tsPlayer.playSaveSuccess(); //保存成功を音声で教える
    }).catchError((e) {
      status.value = BasicStatuses.failed;
      print(e);
      tsPlayer.playSaveFailed(); //保存失敗を音声で教える
      return;
    });
  }

  final counter = useCounter(goalSeconds: TRAIN_SECONDS, onFinished: finish);

  void init() async {
    try {
      final res = await client.init();
      patterns.value = res.patterns;

      if (res.inProgress != null) {
        selectMode(res.inProgress!.caterpillar);

        if (res.inProgress!.timer.isRunning) {
          counter.start(res.inProgress!.timer.startedAt,
              res.inProgress!.timer.passedSecondsWhenStopped);
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

    tsPlayer.playCountDownToStart(() {
      client.start(pattern: currentMode.value!.pattern).then((res) {
        counter.reset();
        counter.start(res.timer.startedAt, res.timer.passedSecondsWhenStopped);
        status.value = BasicStatuses.doing;
        selectMode(res.caterpillar);
        appNotifier.setTodayLife(res.todayLife);
      }).catchError((e) {
        print(e);
        return;
      });
    });
  }

  void stop() async {
    try {
      final res = await client.stop();
      counter.stop(res.timer.passedSecondsWhenStopped);
      status.value = BasicStatuses.none;
      selectMode(res.caterpillar);
      appNotifier.setTodayLife(res.todayLife);
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
    return () {
      if (status.value == BasicStatuses.doing) {
        print("stop on dispose");
        //TODO: エラーの対処する
        // 一応動いてはいるから、とりあえずは放置
        // また、アプリをブチっと切った場合は、タイマー止まらないと思う
        client.stop();
      }
      tsPlayer.dispose();
    };
  }, []);

  return useMemoized(() {
    return CaterpillarController(
      currentMode: currentMode.value,
      status: status.value,
      counter: counter,
      patterns: patterns.value,
      passedSeconds: counter.passedSeconds,
      selectMode: selectMode,
      start: start,
      stop: stop,
      toModeSelector: toModeSelector,
    );
  }, [currentMode.value, status.value, patterns.value, counter.passedSeconds]);
}
