import 'package:flutter/material.dart';

final SchoolButton = (Function()? onTap) => _ButtonBase("学校へ", onTap: onTap, color: Colors.blue);
final HomeButton = (Function()? onTap) => _ButtonBase("帰宅", onTap: onTap, color: Colors.orange!);
final ArrivalButton = (Function()? onTap) => _ButtonBase('到着', onTap: onTap, color: Colors.green);
final StopButton = (Function()? onTap) => _ButtonBase('停止', onTap: onTap, color: Colors.red);

class _ButtonBase extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color color;

  _ButtonBase(this.text, {required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
    );
  }
}
