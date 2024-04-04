import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food_menu/enum/scenes.dart';
import 'package:routine_builder/feature/food_cost/food_menu/hook/use_food_menu.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_create.dart/food_menu_create.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_edit.dart/food_menu_edit.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_menu_detail.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/foods/food_menus.dart';
import 'package:routine_builder/general/widget/back_button.dart' as back;

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
        mainScreen = FoodMenuDetail(controller: controller.foodMenuDetailController);
        break;
      case Scenes.foodMenuEdit:
        mainScreen = FoodMenuEdit(controller: controller.foodMenuEditController);
        break;
      case Scenes.foodMenuCreate:
        mainScreen = FoodMenuCreate(controller: controller.foodMenuCreateController);
        break;
      default:
        mainScreen = FoodMenus(controller: controller.foodMenusController);
    }

    return Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: back.BackButton(onPressed: controller.handleTapBackButton),
                ),
                Text(controller.title, style: TextStyle(fontSize: 30)), //TODO: 微妙に真ん中からズレてるから直す
              ]
            ),
            mainScreen,
          ],
    ));
  }
}
