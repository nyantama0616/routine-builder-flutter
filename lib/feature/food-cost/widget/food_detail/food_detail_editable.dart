import 'package:flutter/material.dart';
import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/widget/detail_item_Editable.dart';

class FoodDetailEditable extends StatelessWidget {
  final Food food;
  final bool isEditable;
  final double width;
  final double height;

  FoodDetailEditable(this.food, {this.width = 250, this.height = 300, this.isEditable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            DetailItemEditable("名称", food.name, isEditable: isEditable),
            Divider(),
            DetailItemEditable("略称", food.abbName ?? "", isEditable: isEditable),
            Divider(),
            DetailItemEditable("値段", food.price.toString(), isEditable: isEditable),
          ],
        ));
  }
}
