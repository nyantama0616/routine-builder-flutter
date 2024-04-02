import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food-cost/class/food_edit_controller.dart';
import 'package:routine_builder/feature/food-cost/widget/food_detail/food_detail_editable.dart';
import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class FoodEdit extends StatelessWidget {
  final FoodEditController controller;
  final double width;
  final double height;

  FoodEdit({required this.controller, this.width = 250, this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: Column(children: [
          FoodDetailEditable(controller.food, isEditable: true, formController: controller.formController),
          SubmitButton(
            "保存",
            icon: Icons.edit,
            onPressed: controller.handleTapSaveButton,
            type: SubmitButtonType.save,
          )
        ]));
  }
}
