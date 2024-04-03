import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food/class/food_controller.dart';
import 'package:routine_builder/feature/food_cost/food/enum/scenes.dart';
import 'package:routine_builder/feature/food_cost/food/hook/use_food.dart';
import 'package:routine_builder/feature/food_cost/food/widget/food_create/food_create.dart';
import 'package:routine_builder/feature/food_cost/food/widget/food_detail/food_detail.dart';
import 'package:routine_builder/feature/food_cost/food/widget/food_detail/food_detail_editable.dart';
import 'package:routine_builder/feature/food_cost/food/widget/food_edit/food_edit.dart';
import "package:routine_builder/feature/food_cost/food/widget/foods/foods.dart";
import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/widget/back_button.dart' as back;

class Food extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useFood();
    final Widget mainScreen;

    switch (controller.scene) {
      case Scenes.foods:
        mainScreen = Foods(controller: controller.foodsController);
        break;
      case Scenes.foodDetail:
        mainScreen = FoodDetail(controller: controller.foodDetailController);
        break;
      case Scenes.foodCreate:
        mainScreen = FoodCreate(controller: controller.foodCreateController,);
        break;
      case Scenes.foodEdit:
        mainScreen = FoodEdit(controller: controller.foodEditController);
        break;
      default:
        mainScreen = Foods(controller: controller.foodsController);
    }

    return Center(
      child: Column(
        children: [
          Row(
          children: [
            SizedBox(width: 56),
            back.BackButton(onPressed: controller.handleTapBackButton)
          ],
        ),
          Text(controller.title, style: TextStyle(fontSize: 20)),
          mainScreen,
        ],
      )
    );
  }
}
