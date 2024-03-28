import 'package:flutter/material.dart';
import 'package:routine_builder/feature/sleep/class/sleep_controller.dart';
import 'package:routine_builder/feature/sleep/widget/nap_button.dart';
import 'package:routine_builder/feature/sleep/widget/sleep_button.dart';
import 'package:routine_builder/feature/sleep/widget/wake_up_button.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/provider/app_provider.dart';
import 'package:routine_builder/feature/sleep/hook/use_sleep.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Sleep extends HookConsumerWidget {
  SleepController? controller;
  Sleep({super.key, this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(appProvider).todayLife.status;
    controller ??= useSleep(ref.read(appProvider.notifier));

    final button = status == Statuses.sleep || status == Statuses.nap
        ? WakeUpButton(
            key: const Key("wake_up_button"),
            onPressed: controller!.handleWakeUp,
          )
        : Column(
            children: [
              SleepButton(
                key: const Key("sleep_button"),
                onPressed: controller!.handleSleep,
              ),
              NapButton(
                key: const Key("nap_button"),
                onPressed: controller!.handleNap,
              )
            ],
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
