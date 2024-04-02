import 'package:flutter/material.dart';
import 'package:routine_builder/general/class/food.dart';

class FoodListItem extends StatelessWidget {
  final Food food;

  FoodListItem(this.food);

  @override
  Widget build(BuildContext context) {
    final displayName = food.abbName ?? food.name;
    final price = "${food.price}円";

    return Material(
      color: Color.fromARGB(255, 193, 212, 247),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(displayName),
          trailing: Text(price),
        ),
      ),
    );
  }
}
