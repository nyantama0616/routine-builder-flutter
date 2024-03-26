class DrinkWaterRequestBody {
  final int xml;

  DrinkWaterRequestBody({required this.xml});

  Map<String, dynamic> toJson() {
    return {
      'xml': xml,
    };
  }
}
