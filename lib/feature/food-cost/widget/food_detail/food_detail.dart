import 'package:flutter/material.dart';
import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/widget/detail_item_Editable.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  final double width;
  final double height;

  FoodDetail(this.food, {this.width = 250, this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            DetailItemEditable("名称", food.name),
            Divider(),
            DetailItemEditable("略称", food.abbName ?? ""),
            Divider(),
            DetailItemEditable("値段", food.price.toString()),
          ],
        ));
  }
}
