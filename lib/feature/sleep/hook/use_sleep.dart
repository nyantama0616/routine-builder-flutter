import "package:routine_builder/feature/sleep/class/sleep_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:routine_builder/general/provider/app_provider.dart";
import "package:routine_builder/general/query/client/sleep_query_client.dart";

SleepController useSleep(AppNotifier notifier,
    {SleepQueryClient? sleepQueryClient}) {
  final client = sleepQueryClient ?? SleepQueryClient();

  //TODO: loading, errorの状態を管理する
  final handleSleep = useCallback(() async {
    client.startSleep().then((res) {
      notifier.setTodayLife(res.todayLife);
    }).catchError((e) {
      print(e);
    });
  }, []);

  final handleWakeUp = useCallback(() async {
    client.finishSleep().then((res) {
      notifier.setTodayLife(res.todayLife);
    }).catchError((e) {
      print(e);
    });
  }, []);

  final handleNap = useCallback(() async {
    client.startSleep(isNap: true).then((res) {
      notifier.setTodayLife(res.todayLife);
    }).catchError((e) {
      print(e);
    });
  }, []);

  return SleepController(
    handleSleep: handleSleep,
    handleWakeUp: handleWakeUp,
    handleNap: handleNap,
  );
}
