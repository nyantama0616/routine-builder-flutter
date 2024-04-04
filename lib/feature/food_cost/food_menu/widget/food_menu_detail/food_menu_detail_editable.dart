import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_list_editable.dart';
import 'package:routine_builder/general/model/food_menu.dart';
import 'package:routine_builder/general/widget/detail_item_Editable.dart';

class FoodMenuDetailEditable extends StatelessWidget {
  final FoodMenu foodMenu;
  final bool isEditable;
  final double width;
  final double height;
  // final FoodMenuFormController? formController;

  FoodMenuDetailEditable(this.foodMenu, {this.width = 250, this.height = 540, this.isEditable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            DetailItemEditable("id", foodMenu.id.toString(), keyLabel: ""),
            Divider(),
            DetailItemEditable("名前", foodMenu.name, keyLabel: "name", isEditable: isEditable),
            Divider(),
            SizedBox(height: 10),
            Text("食材一覧", style: TextStyle(fontSize: 20)),
            FoodListEditable(foodMenu.foods, isEditable: isEditable),
          ],
        ));
  }
}
