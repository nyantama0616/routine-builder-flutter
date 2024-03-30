import 'package:flutter/material.dart';
import 'package:routine_builder/feature/caterpillar/settings.dart';

class Counter extends StatelessWidget {
  final int seconds;

  Counter(this.seconds);

  @override
  Widget build(BuildContext context) {
    final minutePart =
        ((seconds.abs() % 3600) ~/ 60).toString().padLeft(2, '0');
    final secondPart = (seconds.abs() % 60).toString().padLeft(2, '0');
    final sign = seconds < 0 ? "-" : "";
    final displayString = "$sign$minutePart:$secondPart";

    return Stack(children: [
      _ProgressCircle(1, color: Colors.grey),
      _ProgressCircle(seconds / (TRAIN_SECONDS), color: Colors.blue),
      Container(
        height: 180,
        width: 180,
        child: Center(
          child: Text(
            displayString,
            style: TextStyle(fontSize: 36),
          ),
        ),
      )
    ]);
  }
}

class _ProgressCircle extends StatelessWidget {
  final double progress;
  final Color color;

  _ProgressCircle(this.progress, {required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: CircularProgressIndicator(
        color: color,
        value: progress,
      ),
    );
  }
}
