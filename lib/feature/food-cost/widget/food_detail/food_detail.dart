import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food-cost/class/food_detail_controller.dart';
import 'package:routine_builder/feature/food-cost/widget/food_detail/food_detail_editable.dart';
import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class FoodDetail extends StatelessWidget {
  final FoodDetailController controller;
  final double width;
  final double height;

  FoodDetail({required this.controller, this.width = 250, this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: Column(children: [
          FoodDetailEditable(controller.food, isEditable: false),
          SubmitButton(
            "編集",
            icon: Icons.edit,
            onPressed: controller.handleTapEditButton,
            type: SubmitButtonType.edit,
          )
        ]));
  }
}
