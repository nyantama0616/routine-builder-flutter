import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food-cost/class/food_form_controller.dart';
import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/widget/detail_item_Editable.dart';

class FoodDetailEditable extends StatelessWidget {
  final Food food;
  final bool isEditable;
  final double width;
  final double height;
  final FoodFormController? formController;

  FoodDetailEditable(this.food, {this.width = 250, this.height = 300, this.isEditable = false, this.formController});

  DetailItemEditable _createDetailItem(String label, String keyLabel) {
    return DetailItemEditable(
      label,
      formController?.map[keyLabel] ?? "",
      keyLabel: keyLabel,
      isEditable: isEditable,
      onChanged: formController?.onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            _createDetailItem("名前", "name"),
            Divider(),
            _createDetailItem("略称", "abbName"),
            Divider(),
            _createDetailItem("価格", "price"),
          ],
        ));
  }
}
