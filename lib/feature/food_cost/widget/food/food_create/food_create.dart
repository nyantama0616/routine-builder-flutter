import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/class/food/food_create_controller.dart';
import 'package:routine_builder/feature/food_cost/widget/food/food_detail/food_detail_editable.dart';
import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class FoodCreate extends StatelessWidget {
  final FoodCreateController controller;
  final double width;
  final double height;

  FoodCreate({required this.controller, this.width = 250, this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          FoodDetailEditable(Food.init(0), isEditable: true, formController: controller.formController),
          SubmitButton(
            "作成",
            icon: Icons.add,
            onPressed: controller.handleTapSaveButton,
            type: SubmitButtonType.save,
          )
        ]
      )
    );
  }
}
