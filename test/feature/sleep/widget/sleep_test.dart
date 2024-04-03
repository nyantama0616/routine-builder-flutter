import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routine_builder/feature/sleep/widget/sleep.dart';
import 'package:mockito/mockito.dart';
import 'package:routine_builder/feature/sleep/controller/sleep_controller.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/provider/user_provider.dart';
import '../../../general/query/client/sleep_query_client_test.mocks.dart';
import "package:routine_builder/feature/sleep/hook/use_sleep.dart";
import 'package:flutter_hooks_test/flutter_hooks_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routine_builder/general/class/user.dart';

final sleepQueryClient = MockSleepQueryClient();

void main() {
  tearDown(() {
    reset(sleepQueryClient);
  });

  group("Sleep Widget", () {
    testWidgets('When sleep button is tapped.', (tester) async {
      await draw(tester, Statuses.none);

      // 「寝る」と「昼寝」ボタンが表示されていて、「起きる」ボタンが表示されていない
      var sleepButton = find.byKey(const Key("sleep_button"));
      var napButton = find.byKey(const Key("nap_button"));
      var wakeUpButton = find.byKey(const Key("wake_up_button"));
      expect(sleepButton, findsOneWidget);
      expect(napButton, findsOneWidget);
      expect(wakeUpButton, findsNothing);

      // 寝るボタンをタップすると、sleepQueryClient.startSleepが1回呼ばれる
      await tester.tap(sleepButton);
      await tester.pump();
      verify(sleepQueryClient.startSleep()).called(1);

      // 起きるボタンが表示されていて、「寝る」と「昼寝」ボタンが表示されていない
      sleepButton = find.byKey(const Key("sleep_button"));
      napButton = find.byKey(const Key("nap_button"));
      wakeUpButton = find.byKey(const Key("wake_up_button"));
      expect(sleepButton, findsNothing);
      expect(napButton, findsNothing);
      expect(wakeUpButton, findsOneWidget);
    });
  });

  testWidgets("When nap button is tapped.", (tester) async {
    await draw(tester, Statuses.none);

    //「昼寝」ボタンをタップすると、sleepQueryClient.startSleepが1回呼ばれる
    var napButton = find.byKey(const Key("nap_button"));
    await tester.tap(napButton);
    await tester.pump();
    verify(sleepQueryClient.startSleep(isNap: true)).called(1);

    // 起きるボタンが表示されていて、「寝る」と「昼寝」ボタンが表示されていない
    napButton = find.byKey(const Key("nap_button"));
    var sleepButton = find.byKey(const Key("sleep_button"));
    var wakeUpButton = find.byKey(const Key("wake_up_button"));
    expect(napButton, findsNothing);
    expect(sleepButton, findsNothing);
    expect(wakeUpButton, findsOneWidget);
  });

  testWidgets("When wake up button is tapped.", (tester) async {
    await draw(tester, Statuses.sleeping);

    //「起きる」ボタンをタップすると、sleepQueryClient.finishSleepが1回呼ばれる
    var wakeUpButton = find.byKey(const Key("wake_up_button"));
    await tester.tap(wakeUpButton);
    await tester.pump();
    verify(sleepQueryClient.finishSleep()).called(1);

    //「寝る」と「昼寝」ボタンが表示されていて、「起きる」ボタンが表示されていない
    var sleepButton = find.byKey(const Key("sleep_button"));
    var napButton = find.byKey(const Key("nap_button"));
    wakeUpButton = find.byKey(const Key("wake_up_button"));
    expect(sleepButton, findsOneWidget);
    expect(napButton, findsOneWidget);
    expect(wakeUpButton, findsNothing);
  });
}

Future<void> draw(WidgetTester tester, Statuses initialStatus) async {
  final container = ProviderContainer(overrides: [
    userProvider.overrideWith(
        (ref) => UserNotifier(User(name: "test", status: initialStatus))),
  ]);
  final result = await buildHook((_) {
    return useSleep(container.read(userProvider.notifier),
        sleepQueryClient: sleepQueryClient);
  });
  final SleepController controller = result.current;

  await tester.pumpWidget(
    UncontrolledProviderScope(
        container: container, child: TestSleep(controller: controller)),
  );
}

class TestSleep extends HookConsumerWidget {
  final SleepController controller;
  const TestSleep({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Sleep(controller: controller),
    );
  }
}
