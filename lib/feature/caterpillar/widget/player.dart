import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/caterpillar/class/caterpillar_controller.dart';
import 'package:routine_builder/feature/caterpillar/class/mode.dart';
import 'package:routine_builder/feature/caterpillar/widget/counter.dart';
import 'package:routine_builder/feature/caterpillar/widget/submit_button.dart';
import 'package:routine_builder/feature/caterpillar/hook/use_counter.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';

class Player extends HookWidget {
  final CaterpillarController controller;

  Player({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final StartButton = SubmitButton("開始",
        icon: Icons.play_circle_outline, color: Colors.blue, onPressed: controller.start);
    final StopButton = SubmitButton("停止",
        icon: Icons.stop_circle_outlined,
        color: const Color.fromARGB(255, 239, 131, 123),
        onPressed: controller.stop);
    final button = controller.status == BasicStatuses.none ? StartButton : StopButton;
    return Center(
      child: Container(
        height: 400,
        width: 250,
        color: Color.fromARGB(255, 193, 212, 247),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.currentMode!.pattern, style: TextStyle(fontSize: 36)),
            SizedBox(height: 10),
            Counter(30*60 - controller.passedSeconds),
            SizedBox(height: 10),
            button,
          ],
        ),
      )
    );
  }
}
