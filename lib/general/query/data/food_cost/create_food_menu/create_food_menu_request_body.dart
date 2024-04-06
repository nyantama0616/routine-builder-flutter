import 'package:routine_builder/general/model/food_menu.dart';

class CreateFoodMenuRequestBody {
  final FoodMenuForCreate foodMenu;

  CreateFoodMenuRequestBody({
    required this.foodMenu,
  });

  Map<String, dynamic> toJson() {
    return {
      'foodMenu': foodMenu.toJson(),
    };
  }
}

class FoodMenuForCreate {
  final String name;
  final List<FoodIdWithQuantity> foods;

  FoodMenuForCreate({
    required this.name,
    required this.foods,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'foods': foods.map((e) => e.toJson()).toList(),
    };
  }
}
