import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food-cost/widget/food_detail/food_detail.dart';
import "package:routine_builder/feature/food-cost/widget/foods/foods.dart";
import 'package:routine_builder/general/class/food.dart';
class FoodCost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Foods(),
      child: FoodDetail(Food.init(0))
    );
  }
}
