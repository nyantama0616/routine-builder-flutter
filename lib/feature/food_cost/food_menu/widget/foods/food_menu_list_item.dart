import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:routine_builder/general/model/food_menu.dart';

class FoodMenuListItem extends StatelessWidget {
  final FoodMenu foodMenu;
  final Function(FoodMenu)? onTap;

  FoodMenuListItem(this.foodMenu, { this.onTap });

  void _onTap() {
    onTap?.call(foodMenu);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 193, 212, 247),
      child: InkWell(
        onTap: _onTap,
        child: ListTile(
          title: Text(foodMenu.name),
        ),
      ),
    );
  }
}
