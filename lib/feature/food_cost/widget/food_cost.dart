import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/enum/scenes.dart';
import 'package:routine_builder/feature/food_cost/food/widget/food.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu.dart';
import 'package:routine_builder/feature/food_cost/home/home.dart';
import 'package:routine_builder/feature/food_cost/hook/use_food_cost.dart';

class FoodCost extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useFoodCost();
    
    Widget mainScreen;
    switch (controller.scene) {
      case Scenes.food:
        mainScreen = Food();
        break;
      case Scenes.foodMenu:
        mainScreen = FoodMenuHeader();
        break;
      default:
        mainScreen = Home(controller: controller);
    }
    return Center(
      child: mainScreen,
    );
  }
}
