import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/FoodWithQuantityEditable.dart';
import 'package:routine_builder/general/model/food_menu.dart';

class FoodListEditable extends StatelessWidget {
  final List<FoodWithQuantity> foods;
  final bool isEditable;
  final Function(FoodWithQuantity)? onChangedFood;
  final Function(FoodWithQuantity)? onRemoveFood;
  final double width;
  final double height;

  FoodListEditable(this.foods, {this.width = 250, this.height = 400, this.isEditable = false, this.onChangedFood, this.onRemoveFood});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return FoodWithQuantityEditable(
            value: foods[index],
            isEditable: isEditable,
            onChanged: onChangedFood,
            onRemove: onRemoveFood,
          );
        },
      )
    );
  }
}
