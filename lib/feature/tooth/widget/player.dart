import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:routine_builder/feature/tooth/class/tooth_controller.dart';
import 'package:routine_builder/feature/tooth/settings.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/widget/counter.dart';
import 'package:routine_builder/general/widget/counter_submit_button.dart';

class Player extends StatelessWidget {
  final ToothController toothController;

  Player({super.key, required this.toothController});

  @override
  Widget build(BuildContext context) {
    final startButton = StartButton(toothController.start);
    final stopButton = StopButton(toothController.stop);
    final finishButton = FinishButton(toothController.finish);
    final button0 = toothController.status == BasicStatuses.none ||
            toothController.status == BasicStatuses.success
        ? startButton
        : finishButton;
    final button1 = toothController.status == BasicStatuses.doing
        ? stopButton
        : Container();
    
    final successMessage = Text("歯みがき終了!", style: TextStyle(color: Colors.green));
    final failedMessage = Text("保存失敗...", style: TextStyle(color: Colors.red));
    final message = toothController.status == BasicStatuses.success
        ? successMessage
        : toothController.status == BasicStatuses.failed
            ? failedMessage
            : Container();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          message,
          SizedBox(height: 10),
          Counter(GOAL_SECONDS - toothController.passedSeconds, goalSeconds: GOAL_SECONDS),
          SizedBox(height: 10),
          button0,
          SizedBox(height: 10),
          button1,
        ],
      ),
    );
  }
}
