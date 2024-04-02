class Food {
  int id;
  String name;
  String? abbName;
  double price;

  Food({required this.id, required this.name, this.abbName, required this.price});

  Food.init(int id) : this(id: id, name: "food$id", price: 0);

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json["id"],
      name: json["name"],
      abbName: json["abbName"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "abbName": abbName,
      "price": price,
    };
  }
}
