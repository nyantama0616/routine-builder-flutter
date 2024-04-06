import 'package:routine_builder/feature/food_cost/enum/scenes.dart';

class FoodCostController {
  final Scenes scene;
  final Function() toFood;
  final Function() toFoodMenu;

  FoodCostController({
    required this.scene,
    required this.toFood,
    required this.toFoodMenu,
  });
}
