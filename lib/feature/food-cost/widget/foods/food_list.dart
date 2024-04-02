import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food-cost/widget/foods/food_list_item.dart';
import 'package:routine_builder/general/class/food.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;
  final double width;
  final double height;

  FoodList(this.foods, {this.width = 250, this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ListView.separated(
        itemCount: foods.length,
        itemBuilder: (context, index) => FoodListItem(foods[index]),
        separatorBuilder: (context, index) => Divider(
          color: Colors.white,
          height: 0,
        ),
      ),
    );
  }
}
