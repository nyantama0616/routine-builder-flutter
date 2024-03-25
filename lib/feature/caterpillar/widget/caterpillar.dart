import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/caterpillar/widget/goal.dart';
import 'package:routine_builder/feature/caterpillar/widget/mode_selector.dart';
import 'package:routine_builder/feature/caterpillar/widget/player.dart';
import 'package:routine_builder/feature/caterpillar/hook/use_caterpillar.dart';

class Caterpillar extends HookWidget {
  const Caterpillar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useCaterpillar();
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
