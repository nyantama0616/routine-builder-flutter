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

  FoodMenuHeader.init() : id = 0, name = "", foodIds = [];
  FoodMenuHeader.initDev(this.id) : name = "foodMenuHeader$id", foodIds = [
    FoodIdWithQuantity.initDev(Food.initDev(0), 1),
    FoodIdWithQuantity.initDev(Food.initDev(1), 2),
    FoodIdWithQuantity.initDev(Food.initDev(2), 3),
  ];

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

  FoodIdWithQuantity.init() : foodId = 0, quantity = 1;
  FoodIdWithQuantity.initDev(Food food, this.quantity) : foodId = food.id;

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

  FoodMenu.init() : id = 0, name = "", foods = [];
  FoodMenu.initDev(this.id) : name = "foodMenu$id", foods = [
    FoodWithQuantity.initDev(Food.initDev(0)),
    FoodWithQuantity.initDev(Food.initDev(1)),
    FoodWithQuantity.initDev(Food.initDev(2)),
  ];

  FoodMenu copyWith({String? name, List<FoodWithQuantity>? foods}) {
    return FoodMenu(
      id: id,
      name: name ?? this.name,
      foods: foods ?? List.from(this.foods), //MEMO: リストをコピーする際はこうする！
    );
  }
}

class FoodWithQuantity {
  final Food food;
  final int quantity;

  FoodWithQuantity({
    required this.food,
    required this.quantity,
  });

  FoodWithQuantity.init() : food = Food.initDev(0), quantity = 1;
  FoodWithQuantity.initDev(this.food) : quantity = 1;

  FoodWithQuantity copyWith({int? quantity}) {
    return FoodWithQuantity(
      food: food,
      quantity: quantity ?? this.quantity,
    );
  }
}
