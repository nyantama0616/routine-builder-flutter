import "package:routine_builder/general/class/water_amount.dart";

class WaterController {
  final WaterAmount waterAmount;
  final bool drinkable;
  Function() drinkWater200 = () {};

  WaterController({
    required this.waterAmount,
    required this.drinkable,
    required this.drinkWater200,
  });
}
