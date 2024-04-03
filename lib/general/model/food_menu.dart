class FoodMenuHeader {
  final int id;
  final String name;

  FoodMenuHeader({
    required this.id,
    required this.name,
  });

  FoodMenuHeader.init() : id = 0, name = "food";

  factory FoodMenuHeader.fromJson(Map<String, dynamic> json) {
    return FoodMenuHeader(
      id: json['id'],
      name: json['name'],
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
