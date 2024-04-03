import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food/widget/food.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu.dart';

class FoodCost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FoodMenuHeader(),
      // child: Food(),
    );
  }
}
