class WaterAmount {
  final int water;

  WaterAmount({
    required this.water,
  });

  WaterAmount.init() : water = 0;

  WaterAmount copyWith({
    int? water,
  }) {
    return WaterAmount(
      water: water ?? this.water,
    );
  }

  factory WaterAmount.fromJson(Map<String, dynamic> json) {
    return WaterAmount(
      water: json['water'],
    );
  }
}
