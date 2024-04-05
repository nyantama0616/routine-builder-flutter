import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food/widget/foods/food_list_item.dart';
import 'package:routine_builder/general/extention/list.dart';
import 'package:routine_builder/general/model/food.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;
  final Function(Food)? onTapFoodItem;
  final double width;
  final double height;
  final List<int> disabledIds;

  FoodList(this.foods,
      {this.onTapFoodItem,
      this.width = 250,
      this.height = 400,
      this.disabledIds = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ListView.separated(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final disabled = _binarySearch(disabledIds, foods[index].id) != -1;
          return FoodListItem(foods[index],
              onTap: onTapFoodItem, disabled: disabled);
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.white,
          height: 0,
        ),
      ),
    );
  }
}

int _binarySearch(List<int> list, int value) {
  int low = 0;
  int high = list.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    int midValue = list[mid];

    if (midValue == value) {
      return mid;
    } else if (midValue < value) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return -1; // 値が見つからなかった場合
}
