import "dart:async";

import "package:routine_builder/feature/sleep/class/sleep_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:routine_builder/general/provider/app_provider.dart";
import "package:routine_builder/general/query/client/sleep_query_client.dart";
import "package:routine_builder/general/sound/sound_player.dart";
import "package:routine_builder/general/sound/sounds.dart" as sounds;
import "package:routine_builder/general/extention/list.dart";

SleepController useSleep(AppNotifier notifier,
    {SleepQueryClient? sleepQueryClient}) {
  final client = sleepQueryClient ?? SleepQueryClient();
  final soundPlayer = SoundPlayer();
  
  Timer? _timer;
  final _callable = useState(true);

  void _handleSleep({bool isNap = false}) async {
    if (!_callable.value) return;

    client.startSleep(isNap: isNap).then((res) {
      notifier.setTodayLife(res.todayLife);
      soundPlayer.playOneShot(sounds.sleepGoToBedSound);
      
      /* 3秒間は連続で呼べないようにする
        TODO:
        けど実際は連続で呼べちゃう。
        stateの変更時にdisposeされるからだと思うけど、
        なんでdisposeされるのかはわからない。
      */

      _callable.value = false;
      _timer = Timer(Duration(seconds: 3), () {
        _callable.value = true;
      });
    }).catchError((e) {
      print(e);
    });
  }

  //TODO: loading, errorの状態を管理する
  void handleSleep() async {
    _handleSleep();
  }

  void handleNap() async {
    _handleSleep(isNap: true);
  }

  void handleWakeUp() async {
    if (!_callable.value) return;
    
    client.finishSleep().then((res) {
      notifier.setTodayLife(res.todayLife);
      soundPlayer.playOneShot(sounds.sleepWakeUpSounds.pick());
      soundPlayer.playOneShot(sounds.sleepWakeUpVoices.pick(), delay: 1500);

      // 3秒間は連続で呼べないようにする
      _callable.value = false;
      _timer = Timer(Duration(seconds: 3), () {
        _callable.value = true;
      });
    }).catchError((e) {
      print(e);
    });
  }

  useEffect(() {
    return () {
      _timer?.cancel();
    };
  }, []);

  return useMemoized(() {
    return SleepController(
      handleSleep: handleSleep,
      handleWakeUp: handleWakeUp,
      handleNap: handleNap,
    );
  }, []);
}
