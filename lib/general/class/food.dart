class Food {
  String name;
  String? abbName;
  double price;

  Food({required this.name, this.abbName, required this.price});

  Food.init(int id) : name = "food$id", price = 0;

  factory Food.fromJSON(Map<String, dynamic> json) {
    return Food(
      name: json["name"],
      abbName: json["abbName"],
      price: json["price"],
    );
  }
}
