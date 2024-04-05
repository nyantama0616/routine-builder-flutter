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

  FoodMenuHeader.init()
      : id = 0,
        name = "",
        foodIds = [];
  FoodMenuHeader.initDev(this.id)
      : name = "foodMenuHeader$id",
        foodIds = [
          FoodIdWithQuantity.initDev(Food.initDev(0), 1),
          FoodIdWithQuantity.initDev(Food.initDev(1), 2),
          FoodIdWithQuantity.initDev(Food.initDev(2), 3),
        ];

  factory FoodMenuHeader.fromJson(Map<String, dynamic> json) {
    return FoodMenuHeader(
      id: json['id'],
      name: json['name'],
      foodIds: (json['foodIds'] as List)
          .map((foodIdWithQuantity) =>
              FoodIdWithQuantity.fromJson(foodIdWithQuantity))
          .toList(),
    );
  }
}

class FoodIdWithQuantity {
  final int foodId;
  final double quantity;

  FoodIdWithQuantity({
    required this.foodId,
    required this.quantity,
  });

  FoodIdWithQuantity.init()
      : foodId = 0,
        quantity = 1;
  FoodIdWithQuantity.initDev(Food food, this.quantity) : foodId = food.id;

  factory FoodIdWithQuantity.fromJson(Map<String, dynamic> json) {
    return FoodIdWithQuantity(
      foodId: json['foodId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': foodId, //TODO: ここid, foodIdのどちらかで統一するべき
      'quantity': quantity,
    };
  }
}

class FoodMenu {
  final int id;
  final String name;
  final List<FoodWithQuantity> foods;
  final double price;

  FoodMenu({
    required this.id,
    required this.name,
    required this.foods,
    required this.price,
  });

  FoodMenu.init()
      : id = 0,
        name = "",
        foods = [],
        price = 0.0
      ;
  FoodMenu.initDev(this.id)
      : name = "foodMenu$id",
        foods = [
          FoodWithQuantity.initDev(Food.initDev(0)),
          FoodWithQuantity.initDev(Food.initDev(1)),
          FoodWithQuantity.initDev(Food.initDev(2)),
        ],
        price = 100.0
        ;

  factory FoodMenu.fromJson(Map<String, dynamic> json) {
    return FoodMenu(
      id: json['id'],
      name: json['name'],
      foods: (json['foods'] as List)
          .map(
              (foodWithQuantity) => FoodWithQuantity.fromJson(foodWithQuantity))
          .toList(),
      price: json['price'],
    );
  }

  FoodMenu copyWith({String? name, List<FoodWithQuantity>? foods}) {
    return FoodMenu(
      id: id,
      name: name ?? this.name,
      foods: foods ?? List.from(this.foods), //MEMO: リストをコピーする際はこうする！
      price: price,
    );
  }
}

class FoodWithQuantity {
  final Food food;
  final double quantity;

  FoodWithQuantity({
    required this.food,
    required this.quantity,
  });

  FoodWithQuantity.init()
      : food = Food.initDev(0),
        quantity = 1;
  FoodWithQuantity.initDev(this.food) : quantity = 1;

  FoodWithQuantity copyWith({double? quantity}) {
    return FoodWithQuantity(
      food: food,
      quantity: quantity ?? this.quantity,
    );
  }

  factory FoodWithQuantity.fromJson(Map<String, dynamic> json) {
    return FoodWithQuantity(
      food: Food.fromJson(json['food']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
      'quantity': quantity,
    };
  }

  FoodIdWithQuantity toFoodIdWithQuantity() {
    return FoodIdWithQuantity(
      foodId: food.id,
      quantity: quantity,
    );
  }
}
