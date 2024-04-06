import 'package:flutter/material.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';
import 'package:routine_builder/general/widget/icon_buttons.dart';

class FoodWithQuantityEditable extends StatelessWidget {
  final FoodWithQuantity value;
  final bool isEditable;
  final Function(FoodWithQuantity)? onChanged;
  final Function(FoodWithQuantity)? onRemove;

  FoodWithQuantityEditable({ required this.value, this.isEditable = false, this.onChanged, this.onRemove});

  void _onChanged(String quantityStr) {
    double quantity;
    
    try {
      quantity = double.parse(quantityStr);
    } catch (e) {
      return;
    }

    onChanged?.call(value.copyWith(quantity: quantity));
  }

  @override
  Widget build(BuildContext context) {
    final textElement = isEditable ? 
      TextField(
        controller: TextEditingController(text: value.quantity.toString()),
        onChanged: _onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        )
      ) : 
      Text(value.quantity.toString(), style: TextStyle(fontSize: 16));

      final removeButton = isEditable ? 
        RemoveButton(onTap: () => onRemove?.call(value)):
        Container();

    return ListTile(
      title: Text(value.food.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${value.food.price}円"),
      leading: Text(value.food.id.toString(), style: TextStyle(fontSize: 16)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60,
            child: textElement,
          ),
          SizedBox(width: 10),
          Text("個", style: TextStyle(fontSize: 16)),
          SizedBox(width: 10),
          removeButton,
        ],
      ),
    );
  }
}
