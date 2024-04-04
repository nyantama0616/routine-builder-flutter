import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food_menu/enum/scenes.dart';
import 'package:routine_builder/feature/food_cost/food_menu/hook/use_food_menu.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_menu_detail.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/foods/food_menus.dart';

class FoodMenuHeader extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useFoodMenu();
    final Widget mainScreen;

    switch (controller.scene) {
      case Scenes.foodMenus:
        mainScreen = FoodMenus(controller: controller.foodMenusController);
        break;
      case Scenes.foodMenuDetail:
        mainScreen = FoodMenuDetail();
        break;
      default:
        mainScreen = FoodMenus(controller: controller.foodMenusController);
    }

    return Center(
        child: Column(
          children: [
            Text(controller.title, style: TextStyle(fontSize: 30)),
            mainScreen,
          ],
    ));
  }
}
