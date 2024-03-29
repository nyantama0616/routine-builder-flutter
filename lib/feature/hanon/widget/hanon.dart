import 'package:flutter/material.dart';
import 'package:routine_builder/feature/hanon/widget/goal.dart';
import 'package:routine_builder/feature/hanon/widget/mode_selector.dart';
import 'package:routine_builder/feature/hanon/widget/player.dart';
import 'package:routine_builder/general/class/hanon.dart' as hanon;

class Hanon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "練習曲";

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Goal(),
        Text(title, style: TextStyle(fontSize: 20)),
        // ModeSelector(),
        Player(hanon: hanon.Hanon.init()),
      ],
    ));
  }
}
