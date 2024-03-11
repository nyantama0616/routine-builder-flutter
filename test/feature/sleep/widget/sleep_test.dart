import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routine_builder/feature/sleep/widget/sleep.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:routine_builder/feature/sleep/class/sleep_controller.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/provider/user_provider.dart';

@GenerateNiceMocks([MockSpec<SleepController>(as: #MockSleepController)])
import 'sleep_test.mocks.dart';

void main() {
  testWidgets('Sleep widget test', (tester) async {
    final controller = MockSleepController();

    await tester.pumpWidget(
        ProviderScope(child: TestSleepWidget(controller: controller)));

    Finder sleepButton;
    Finder wakeUpButton;
    
    //「寝る」ボタンが表示されていて、「起きる」ボタンが表示されていない
    sleepButton = find.byKey(const Key("sleep_button"));
    wakeUpButton = find.byKey(const Key("wake_up_button"));
    expect(sleepButton, findsOneWidget);
    expect(wakeUpButton, findsNothing);
    
    //「寝る」ボタンを押すと、controllerのhandleSleepが1回呼ばれる
    await tester.tap(sleepButton);
    await tester.pump();
    verify(controller.handleSleep()).called(1);

    //「寝る」ボタンが表示されていなくて、「起きる」ボタンが表示されている
    sleepButton = find.byKey(const Key("sleep_button"));
    wakeUpButton = find.byKey(const Key("wake_up_button"));
    expect(sleepButton, findsNothing);
    expect(wakeUpButton, findsOneWidget);

    //「起きる」ボタンを押すと、controllerのhandleWakeUpが1回呼ばれる
    wakeUpButton = find.byKey(const Key("wake_up_button"));
    await tester.tap(wakeUpButton);
    await tester.pump();
    verify(controller.handleWakeUp()).called(1);
  });
}

class TestSleepWidget extends ConsumerWidget {
  final MockSleepController controller;
  const TestSleepWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    when(controller.handleSleep()).thenAnswer((_) => () {
          final notifier = ref.read(userProvider.notifier);
          notifier.updateStatus(Statuses.sleeping);
        });
    return MaterialApp(
      home: Sleep(controller: controller),
    );
  }
}
