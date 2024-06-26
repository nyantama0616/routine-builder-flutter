import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food/controller/foods_controller.dart';
import 'package:routine_builder/feature/food_cost/food/widget/foods/food_list.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class Foods extends StatelessWidget {
  FoodsController controller;

  Foods({ required this.controller });

  @override
  Widget build(BuildContext context) {
    final List<Food> foods = controller.foods;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FoodList(foods, onTapFoodItem: controller.handleTapFoodItem),
          SubmitButton("食品追加", icon: Icons.add, type: SubmitButtonType.save, onPressed: controller.handleTapAddFoodButton)
        ],
      ),
    );
  }
}
