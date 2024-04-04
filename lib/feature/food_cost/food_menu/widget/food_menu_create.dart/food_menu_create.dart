import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_create_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_menu_detail_editable.dart';
import 'package:routine_builder/general/model/food_menu.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class FoodMenuCreate extends StatelessWidget {
  final FoodMenuCreateController controller;
  final double width;
  final double height;

  FoodMenuCreate({required this.controller, this.width = 360, this.height = 600});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            FoodMenuDetailEditable(FoodMenu.init(),
                isEditable: true, formController: controller.formController),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SubmitButton("保存",
                  icon: Icons.save,
                  type: SubmitButtonType.save,
                  onPressed: controller.handleTapSaveButton),
            ])
          ],
        ));
  }
}
