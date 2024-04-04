import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food/widget/foods/food_list.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/widget/icon_buttons.dart';

class FoodSelector extends StatelessWidget {
  final List<Food> foods;
  final double width;
  final double height;
  final Function(Food)? onTapItem;
  final Function()? onTapCrossButton;

  FoodSelector(this.foods,
      {this.width = 250, this.height = 400, this.onTapItem, this.onTapCrossButton});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.topRight,
        child: CrossButton(onTap: onTapCrossButton),
      ),
      Center(
          child: Container(
        width: width,
        height: height,
        child: FoodList(
          foods,
          width: 220,
          onTapFoodItem: onTapItem,
        ),
      ))
    ]);
  }
}
