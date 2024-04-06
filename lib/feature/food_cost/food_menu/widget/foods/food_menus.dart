import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menus_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/foods/food_menu_list.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class FoodMenus extends StatelessWidget {
  final FoodMenusController controller;

  FoodMenus({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FoodMenuList(controller.foodMenus, onTapFoodMenuItem: controller.handleTapFoodMenuItem),
          SubmitButton("追加", icon: Icons.add, type: SubmitButtonType.save, onPressed: controller.handleTapAddFoodMenuButton),
        ],
      ),
    );
  }
}
