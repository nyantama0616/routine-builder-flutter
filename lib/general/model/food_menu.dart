class FoodMenuHeader {
  final int id;
  final String name;
  final List<FoodIdWithQuantity> foods;

  FoodMenuHeader({
    required this.id,
    required this.name,
    required this.foods,
  });

  FoodMenuHeader.init() : id = 0, name = "food", foods = [];

  factory FoodMenuHeader.fromJson(Map<String, dynamic> json) {
    return FoodMenuHeader(
      id: json['id'],
      name: json['name'],
      foods: (json['foods'] as List).map((e) => FoodIdWithQuantity.fromJson(e)).toList(),
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
