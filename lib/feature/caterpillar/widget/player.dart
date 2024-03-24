import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/caterpillar/class/mode.dart';
import 'package:routine_builder/feature/caterpillar/widget/counter.dart';
import 'package:routine_builder/feature/caterpillar/widget/submit_button.dart';
import 'package:routine_builder/feature/caterpillar/hook/use_counter.dart';

class Player extends HookWidget {
  final Mode mode = Mode(pattern: "1234", minutes: 55);

  Player({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useCounter();
    final StartButton = SubmitButton("開始",
        icon: Icons.play_circle_outline, color: Colors.blue, onPressed: () {counter.start(DateTime.now());});
    final StopButton = SubmitButton("停止",
        icon: Icons.stop_circle_outlined,
        color: const Color.fromARGB(255, 239, 131, 123),
        onPressed: () {counter.stop();});
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
            Counter(30*60 - counter.passedSeconds),
            SizedBox(height: 10),
            StartButton,
            StopButton,
          ],
        ),
      )
    );
  }
}
