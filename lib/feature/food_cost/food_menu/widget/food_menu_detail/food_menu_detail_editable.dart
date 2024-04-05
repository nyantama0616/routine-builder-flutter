import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_form_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_list_editable.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_selector.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';
import 'package:routine_builder/general/widget/detail_item_Editable.dart';
import 'package:routine_builder/general/widget/icon_buttons.dart';

//TODO: スクロールの挙動が少し変
// ListViewを多用しているため
class FoodMenuDetailEditable extends StatelessWidget {
  final FoodMenu foodMenu;
  final bool isEditable;
  final double width;
  final double height;
  final FoodMenuFormController? formController;

  FoodMenuDetailEditable(this.foodMenu,
      {this.formController,
      this.width = 250,
      this.height = 540,
      this.isEditable = false});

  @override
  Widget build(BuildContext context) {
    final addButton = isEditable
        ? AddButton(onTap: formController?.handleTapAddButton)
        : Container();

    final dialog = formController?.showFoodList ?? false
        ? Dialog(
            child: FoodSelector(
              formController?.foods ?? [],
              onTapItem: (Food food) {
                //TODO: ちゃんと実装する
                final fq = FoodWithQuantity(food: food, quantity: 1);
                formController?.handleAddFood(fq);
              },
              onTapCrossButton: formController?.handleTapCrossButton,
              disabledIds: formController?.disabledIds ?? [],
            ),
          )
        : Container();

    final name = formController?.map["name"] ?? foodMenu.name;
    final foods = formController?.foodMenu.foods ?? foodMenu.foods;
    return Container(
        width: width,
        height: height,
        child: Stack(children: [
          ListView(
            children: [
              DetailItemEditable("id", foodMenu.id.toString(), keyLabel: ""),
              Divider(),
              DetailItemEditable("名前", name,
                  keyLabel: "name",
                  isEditable: isEditable,
                  onChanged: formController?.handleChange),
              Divider(),
              DetailItemEditable("コスト", "${foodMenu.price}円", keyLabel: ""),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("食材一覧", style: TextStyle(fontSize: 20)),
                  addButton,
                ],
              ),
              FoodListEditable(foods,
                  isEditable: isEditable,
                  onChangedFood: formController?.handleEditFood,
                  onRemoveFood: formController?.handleRemoveFood),
            ],
          ),
          Center(
            child: dialog,
          ),
        ]));
  }
}
