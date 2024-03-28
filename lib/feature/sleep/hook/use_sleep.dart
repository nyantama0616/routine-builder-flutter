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

  void _handleSleep({bool isNap = false}) async {
    client.startSleep(isNap: isNap).then((res) {
      notifier.setTodayLife(res.todayLife);
      soundPlayer.playOneShot(sounds.sleepGoToBedSound);
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
    client.finishSleep().then((res) {
      notifier.setTodayLife(res.todayLife);
      soundPlayer.playOneShot(sounds.sleepWakeUpSounds.pick());
      soundPlayer.playOneShot(sounds.sleepWakeUpVoices.pick(), delay: 1500);
    }).catchError((e) {
      print(e);
    });
  }

  return SleepController(
    handleSleep: handleSleep,
    handleWakeUp: handleWakeUp,
    handleNap: handleNap,
  );
}
