import 'dart:math';

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int seconds;
  final int goalSeconds;

  Counter(this.seconds, {this.goalSeconds = 9223372036854775807});

  @override
  Widget build(BuildContext context) {
    final minutePart =
        ((seconds.abs() % 3600) ~/ 60).toString().padLeft(2, '0');
    final secondPart = (seconds.abs() % 60).toString().padLeft(2, '0');
    final sign = seconds < 0 ? "-" : "";
    final displayString = "$sign$minutePart:$secondPart";
    final progress = min(1.0, seconds / goalSeconds);

    return Stack(children: [
      _ProgressCircle(1, color: Colors.grey),
      _ProgressCircle(progress, color: Colors.blue),
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
