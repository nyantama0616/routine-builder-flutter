import "package:routine_builder/feature/sleep/class/sleep_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:routine_builder/general/provider/user_provider.dart";
import "package:routine_builder/general/enum/statuses.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:routine_builder/general/query/client/sleep_query_client.dart";

SleepController useSleep(UserNotifier notifier,
    {SleepQueryClient? sleepQueryClient}) {
  final client = sleepQueryClient ?? SleepQueryClient();

  //TODO: loading, errorの状態を管理する
  final handleSleep = useCallback(() async {
    try {
      await client.startSleep();
      notifier.updateStatus(Statuses.sleeping);
    } catch (e) {
      print(e);
      return;
    }
  }, []);

  final handleWakeUp = useCallback(() async {
    try {
      await client.finishSleep();
      notifier.updateStatus(Statuses.none);
    } catch (e) {
      print(e);
    }
  }, []);

  return SleepController(
    handleSleep: handleSleep,
    handleWakeUp: handleWakeUp,
  );
}
