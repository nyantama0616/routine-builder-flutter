import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/foods/food_menu_list_item.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';

class FoodMenuList extends StatelessWidget {
  final List<FoodMenu> foodMenus;
  final Function(FoodMenu)? onTapFoodMenuItem;
  final double width;
  final double height;

  FoodMenuList(
    this.foodMenus, {
    this.onTapFoodMenuItem,
    this.width = 250,
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ListView.separated(
        itemCount: foodMenus.length,
        itemBuilder: (context, index) => FoodMenuListItem(foodMenus[index], onTap: onTapFoodMenuItem),
        separatorBuilder: (context, index) => Divider(
          color: Colors.white,
          height: 0,
        ),
      ),
    );
  }
}
