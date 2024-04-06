import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_edit_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_detail/food_menu_detail_editable.dart';
import 'package:routine_builder/feature/food_cost/food_menu/widget/food_menu_edit.dart/delete_dialog.dart';
import 'package:routine_builder/general/widget/submit_button.dart';

class FoodMenuEdit extends StatelessWidget {
  final FoodMenuEditController controller;
  final double width;
  final double height;

  FoodMenuEdit({required this.controller, this.width = 360, this.height = 600});

  @override
  Widget build(BuildContext context) {
    final dialog = controller.showDeleteDialog
        ? DeleteDialog(
            onConfirm: controller.deleteFoodMenu,
            onCancel: controller.toggleShowDeleteDialog,
          )
        : Container();

    return Stack(children: [
      Container(
          width: width,
          height: height,
          child: ListView(
            children: [
              FoodMenuDetailEditable(controller.foodMenu,
                  isEditable: true, formController: controller.formController),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SubmitButton("削除",
                    icon: Icons.cancel,
                    type: SubmitButtonType.delete,
                    onPressed: controller.toggleShowDeleteDialog),
                SubmitButton("保存",
                    icon: Icons.save,
                    type: SubmitButtonType.save,
                    onPressed: controller.handleTapSaveButton),
              ])
            ],
          )),
      Center(
        child: dialog,
      )
    ]);
  }
}
