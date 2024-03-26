import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/water/hook/use_water.dart';
import 'package:routine_builder/feature/water/widget/goal.dart';
import 'package:routine_builder/feature/water/widget/today.dart';
import 'package:routine_builder/feature/water/widget/buttons.dart';

class Water extends HookWidget {
  Water({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = useWater();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Goal(),
          SizedBox(height: 20),
          Today(controller: controller),
          SizedBox(height: 20),
          Water200Button(controller.drinkWater200),
        ],
      ),
    );
  }
}
