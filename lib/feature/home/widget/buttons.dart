import 'package:flutter/material.dart';

final SleepButton = (Function()? onPressed) => _ButtonBase("睡眠", onPressed: onPressed, icon: Icons.bedtime);
final CaterpillarButton = (Function()? onPressed) => _ButtonBase("いもむし", onPressed: onPressed, icon: Icons.bug_report);
final WaterButton = (Function()? onPressed) => _ButtonBase("水", onPressed: onPressed, icon: Icons.local_drink);

class _ButtonBase extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final IconData icon;

  _ButtonBase(this.text, {super.key, required , this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
