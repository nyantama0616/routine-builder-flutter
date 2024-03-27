import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/caterpillar/class/caterpillar_controller.dart';
import 'package:routine_builder/feature/caterpillar/widget/counter.dart';
import 'package:routine_builder/feature/caterpillar/widget/submit_button.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/feature/caterpillar/widget/back_button.dart' as MyBack;
import 'package:routine_builder/feature/caterpillar/settings.dart';

//TODO: 上の余白気になる(BackButtonのせい)
//BackButton表示・非表示の切り替えの際に「ガタッ」となるのも気になる

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
    final backButton = controller.status == BasicStatuses.doing ? null : MyBack.BackButton(onPressed: controller.toModeSelector);
    final submitButton = controller.status == BasicStatuses.none || controller.status == BasicStatuses.success ? StartButton : StopButton;
    final message = controller.status == BasicStatuses.success ? Text("保存成功", style: TextStyle(color: Colors.green)) :
                    controller.status == BasicStatuses.failed ? Text("保存失敗", style: TextStyle(color: Colors.red)) :
                    Text("");
    return Center(
      child: Container(
        height: 400,
        width: 250,
        color: Color.fromARGB(255, 193, 212, 247),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: backButton,
            ),
            message,
            Text(controller.currentMode!.pattern, style: TextStyle(fontSize: 36)),
            SizedBox(height: 10),
            Counter(TRAIN_SECONDS - controller.passedSeconds),
            SizedBox(height: 10),
            submitButton,
          ],
        ),
      )
    );
  }
}
