import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_builder/feature/sleep/widget/sleep_button.dart';
import 'package:routine_builder/feature/sleep/widget/wake_up_button.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/provider/user_provider.dart';
import 'package:routine_builder/feature/sleep/hook/use_sleep.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class Sleep extends HookConsumerWidget {
  const Sleep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(userProvider).status;
    final controller = useSleep(ref.read(userProvider.notifier));

    final button = status == Statuses.sleeping
        ? WakeUpButton(
            onPressed: controller.handleWakeUp,
          )
        : SleepButton(
            onPressed: controller.handleSleep,
          );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "1日は良い睡眠から始まる",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          button,
        ],
      ),
    );
  }
}
