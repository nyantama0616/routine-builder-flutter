import 'package:flutter/material.dart';
import 'package:routine_builder/feature/water/class/WaterController.dart';

class Today extends StatelessWidget {
  final WaterController controller;

  Today({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final waterAmount = controller.waterAmount.water;
    return Column(
      children: [
        Text("今日の水分摂取量", style: TextStyle(fontSize: 20)),
        Text("${waterAmount}ml", style: TextStyle(fontSize: 20)),
      ],
    );
  } 
}
