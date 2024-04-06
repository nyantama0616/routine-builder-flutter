import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/controller/food_cost_controller.dart';
import 'package:routine_builder/feature/food_cost/home/menu_buttons.dart';

class Home extends StatelessWidget {
  final FoodCostController controller;

  Home({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FoodsButton(onTap: controller.toFood),
          SizedBox(width: 20),
          FoodMenusButton(onTap: controller.toFoodMenu),
        ],
      )
    );
  }
}
