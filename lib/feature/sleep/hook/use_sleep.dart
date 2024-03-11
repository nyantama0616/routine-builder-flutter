import "package:routine_builder/feature/sleep/class/sleep_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:routine_builder/general/provider/user_provider.dart";
import "package:routine_builder/general/enum/statuses.dart";

SleepController useSleep(WidgetRef ref) {
  final handleSleep = useCallback(() {
    final notifier = ref.read(userProvider.notifier);
    notifier.updateStatus(Statuses.sleeping);
  }, []);

  final handleWakeUp = useCallback(() {
    final notifier = ref.read(userProvider.notifier);
    notifier.updateStatus(Statuses.none);
  }, []);

  return SleepController(
    handleSleep: handleSleep,
    handleWakeUp: handleWakeUp,
  );
}
