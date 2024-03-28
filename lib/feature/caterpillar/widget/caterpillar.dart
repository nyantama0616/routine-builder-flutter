import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routine_builder/feature/caterpillar/widget/goal.dart';
import 'package:routine_builder/feature/caterpillar/widget/mode_selector.dart';
import 'package:routine_builder/feature/caterpillar/widget/player.dart';
import 'package:routine_builder/feature/caterpillar/hook/use_caterpillar.dart';
import 'package:routine_builder/general/provider/app_provider.dart';

class Caterpillar extends HookConsumerWidget {
  const Caterpillar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNotifier = ref.watch(appProvider.notifier);
    final controller = useCaterpillar(appNotifier: appNotifier);
    final mainScreen = controller.currentMode == null ? ModeSelector(controller: controller,) : Player(controller: controller);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Goal(),
          // ModeSelector(),
          // Player(controller: controller),
          mainScreen,
        ],
    ));
  }
}
