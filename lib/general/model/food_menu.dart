class FoodMenu {
  final int id;
  final String name;
  final List<FoodIdWithQuantity> foodIds;

  FoodMenu({
    required this.id,
    required this.name,
    required this.foodIds,
  });

  FoodMenu.init() : id = 0, name = "food", foodIds = [];

  factory FoodMenu.fromJson(Map<String, dynamic> json) {
    return FoodMenu(
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
