import 'package:flutter/material.dart';
import 'package:routine_builder/feature/hiit/widget/hiit.dart';

final SleepButton = (Function()? onPressed) => HomeButtonBase("睡眠", onPressed: onPressed, icon: Icons.bedtime);
final CaterpillarButton = (Function()? onPressed) => HomeButtonBase("いもむし", onPressed: onPressed, icon: Icons.bug_report);
final WaterButton = (Function()? onPressed) => HomeButtonBase("水", onPressed: onPressed, icon: Icons.local_drink);
final HiitButton = (Function()? onPressed) => HomeButtonBase("HIIT", onPressed: onPressed, icon: Icons.directions_run);
final PingButton = (Function()? onPressed) => HomeButtonBase("Ping", onPressed: onPressed, icon: Icons.network_check);
final HanonButton = (Function()? onPressed) => HomeButtonBase("Hanon", onPressed: onPressed, icon: Icons.piano);
final ToothButton = (Function()? onPressed) => HomeButtonBase("歯", onPressed: onPressed, icon: Icons.local_hospital);
final FoodCostButton = (Function()? onPressed) => HomeButtonBase("食費", onPressed: onPressed, icon: Icons.restaurant);
final LifeButton = (Function()? onPressed) => HomeButtonBase("生活", onPressed: onPressed, icon: Icons.home);
final WalkButton = (Function()? onPressed) => HomeButtonBase("散歩", onPressed: onPressed, icon: Icons.flag);

class HomeButtonBase extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final IconData icon;

  HomeButtonBase(this.text, {super.key, required , this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
