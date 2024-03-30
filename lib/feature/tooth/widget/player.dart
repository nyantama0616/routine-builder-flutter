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

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Counter(GOAL_SECONDS - toothController.passedSeconds),
          SizedBox(height: 10),
          button0,
          SizedBox(height: 10),
          button1,
        ],
      ),
    );
  }
}
