import 'package:flutter/material.dart';
import 'package:routine_builder/feature/caterpillar/widget/goal.dart';
import 'package:routine_builder/feature/caterpillar/widget/mode_selector.dart';

class Caterpillar extends StatelessWidget {
  const Caterpillar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Goal(),
          ModeSelector(),
        ],
    ));
  }
}
