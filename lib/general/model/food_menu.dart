import 'package:routine_builder/general/model/food.dart';

class FoodMenuHeader {
  final int id;
  final String name;
  final List<FoodIdWithQuantity> foodIds;

  FoodMenuHeader({
    required this.id,
    required this.name,
    required this.foodIds,
  });

  FoodMenuHeader.init() : id = 0, name = "foodMenu", foodIds = [];

  factory FoodMenuHeader.fromJson(Map<String, dynamic> json) {
    return FoodMenuHeader(
      id: json['id'],
      name: json['name'],
      foodIds: (json['foodIds'] as List)
          .map((foodIdWithQuantity) => FoodIdWithQuantity.fromJson(foodIdWithQuantity))
          .toList(),
    );
  }
}

class FoodIdWithQuantity {
  final int foodId;
  final int quantity;

  FoodIdWithQuantity({
    required this.foodId,
    required this.quantity,
  });

  factory FoodIdWithQuantity.fromJson(Map<String, dynamic> json) {
    return FoodIdWithQuantity(
      foodId: json['foodId'],
      quantity: json['quantity'],
    );
  }
}

class FoodMenu {
  final int id;
  final String name;
  final List<FoodWithQuantity> foods;

  FoodMenu({
    required this.id,
    required this.name,
    required this.foods,
  });

  FoodMenu.init() : id = 0, name = "foodMenu", foods = [];
}

class FoodWithQuantity {
  final Food food;
  final int quantity;

  FoodWithQuantity({
    required this.food,
    required this.quantity,
  });

  FoodWithQuantity.init() : food = Food.init(0), quantity = 0;
}
