import 'package:flutter/material.dart';
import 'package:routine_builder/feature/hanon/controller/hanon_controller.dart';
import 'package:routine_builder/feature/hanon/settings.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/widget/counter.dart';
import 'package:routine_builder/general/widget/counter_submit_button.dart';

class Player extends StatelessWidget {
  final HanonController hanonController;

  Player({super.key, required this.hanonController});

  @override
  Widget build(BuildContext context) {
    final hanon = hanonController.hanon;
    final startButton = StartButton(hanonController.start);
    final stopButton = StopButton(hanonController.stop);
    final submitButton = hanonController.status == BasicStatuses.none ||
            hanonController.status == BasicStatuses.success
        ? startButton
        : stopButton;

    return Center(
      child: Container(
          height: 400,
          width: 250,
          color: Color.fromARGB(255, 193, 212, 247),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("第${hanon!.num}番", style: TextStyle(fontSize: 36)),
              Text(hanon.pattern, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Counter(TRAIN_SECONDS - hanonController.passedSeconds, goalSeconds: TRAIN_SECONDS),
              SizedBox(height: 10),
              submitButton,
            ],
          )),
    );
  }
}
