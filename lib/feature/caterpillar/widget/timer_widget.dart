import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final int seconds;

  TimerWidget(this.seconds);

  @override
  Widget build(BuildContext context) {
    final minutePart = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secondPart = (seconds % 60).toString().padLeft(2, '0');

    return Stack(children: [
      _ProgressCircle(1, color: Colors.grey),
      _ProgressCircle(seconds / (30 * 60), color: Colors.blue),
      Container(
        height: 180,
        width: 180,
        child: Center(
          child: Text(
            "$minutePart:$secondPart",
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
