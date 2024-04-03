import 'package:flutter_hooks_test/flutter_hooks_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routine_builder/feature/sleep/controller/sleep_controller.dart';
import 'package:routine_builder/feature/sleep/hook/use_sleep.dart';
import 'package:routine_builder/general/provider/user_provider.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:mockito/mockito.dart';
import '../../../general/query/client/sleep_query_client_test.mocks.dart';

void main() {
  testWidgets("useSleep", (tester) async {
    final sleepQueryClient = MockSleepQueryClient();
    when(sleepQueryClient.startSleep()).thenAnswer((_) => Future.value());
    when(sleepQueryClient.finishSleep()).thenAnswer((_) => Future.value());

    final container = ProviderContainer();
    final result = await buildHook((_) {
      return useSleep(container.read(userProvider.notifier),
          sleepQueryClient: sleepQueryClient);
    });
    final SleepController controller = result.current;

    // Initial status
    Statuses status = container.read(userProvider).status;
    expect(status, Statuses.none);

    // Sleep
    controller.handleSleep();
    await tester.pump();
    status = container.read(userProvider).status;
    expect(status, Statuses.sleeping);

    // Wake up
    controller.handleWakeUp();
    await tester.pump();
    status = container.read(userProvider).status;
    expect(status, Statuses.none);

    // Nap
    controller.handleNap();
    await tester.pump();
    status = container.read(userProvider).status;
    expect(status, Statuses.napping);
  });
}
