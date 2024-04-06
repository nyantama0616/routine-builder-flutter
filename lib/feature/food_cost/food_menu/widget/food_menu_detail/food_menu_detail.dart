import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_detail_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_menu_detail_editable.dart';
import 'package:routine_builder/general/model/food_menu.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class FoodMenuDetail extends StatelessWidget {
  final FoodMenuDetailController controller;
  final double width;
  final double height;

  FoodMenuDetail({required this.controller, this.width = 360, this.height = 600});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            FoodMenuDetailEditable(controller.foodMenu, isEditable: false),
            SubmitButton("編集", icon: Icons.edit, type: SubmitButtonType.edit, onPressed: controller.handleTapEditButton),
          ],
        ));
  }
}
