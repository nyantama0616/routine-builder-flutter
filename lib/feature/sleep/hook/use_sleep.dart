import "package:routine_builder/feature/sleep/class/sleep_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:routine_builder/general/provider/user_provider.dart";
import "package:routine_builder/general/enum/statuses.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

SleepController useSleep(UserNotifier notifier) {
  final handleSleep = useCallback(() {
    notifier.updateStatus(Statuses.sleeping);
  }, []);

  final handleWakeUp = useCallback(() {
    notifier.updateStatus(Statuses.none);
  }, []);

  return SleepController(
    handleSleep: handleSleep,
    handleWakeUp: handleWakeUp,
  );
}
