import 'package:flutter/material.dart';
import 'package:routine_builder/general/model/food.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final Function(Food)? onTap;
  final bool disabled;

  FoodListItem(this.food, { this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    final displayName = food.abbName != null && food.abbName!.isNotEmpty
        ? food.abbName!
        : food.name;
    final price = "${food.price}円";

    final opacity = disabled ? 0.5 : 1.0;
    final color = disabled ? const Color.fromARGB(255, 198, 197, 197) : Color.fromARGB(255, 193, 212, 247); //TODO: ちゃんと配色考える
    final _onTap = disabled ? null : () => onTap?.call(food);

    return Material(
      color: color,
      child: Opacity(
        opacity: opacity,
        child: InkWell(
          onTap: _onTap,
          child: ListTile(
            leading: Text(food.id.toString(), style: TextStyle(fontSize: 16)),
            title: Text(displayName),
            trailing: Text(price),
          ),
        ),
      )
    );
  }
}
