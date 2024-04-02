import 'package:flutter/material.dart';
import 'package:routine_builder/feature/food-cost/widget/foods/food_list.dart';
import 'package:routine_builder/general/class/food.dart';

class Foods extends StatelessWidget {
  final List<Food> foods = [
    Food(name: "りんご", price: 100),
    Food(name: "バナナ", price: 50),
    Food(name: "みかん", price: 30),
    Food(name: "ぶどう", price: 200),
    Food(name: "いちご", price: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("食品一覧", style: TextStyle(fontSize: 20)),
          FoodList(foods)
        ],
      ),
    );
  }
}
