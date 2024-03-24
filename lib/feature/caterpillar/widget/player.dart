import 'package:flutter/material.dart';
import 'package:routine_builder/feature/caterpillar/class/mode.dart';
import 'package:routine_builder/feature/caterpillar/widget/timer_widget.dart';
import 'package:routine_builder/feature/caterpillar/widget/submit_button.dart';

class Player extends StatelessWidget {
  final Mode mode = Mode(pattern: "1234", minutes: 55);

  Player({super.key});

  @override
  Widget build(BuildContext context) {
    final StartButton = SubmitButton("開始",
        icon: Icons.play_circle_outline, color: Colors.blue, onPressed: () {});
    final StopButton = SubmitButton("停止",
        icon: Icons.stop_circle_outlined,
        color: const Color.fromARGB(255, 239, 131, 123),
        onPressed: () {});
    return Center(
      child: Container(
        height: 400,
        width: 250,
        color: Color.fromARGB(255, 193, 212, 247),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mode.pattern, style: TextStyle(fontSize: 36)),
            SizedBox(height: 10),
            TimerWidget(90),
            SizedBox(height: 10),
            StartButton,
            StopButton,
          ],
        ),
      )
    );
  }
}
