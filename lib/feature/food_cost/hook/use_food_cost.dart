import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/controller/food_cost_controller.dart';
import 'package:routine_builder/feature/food_cost/enum/scenes.dart';

FoodCostController useFoodCost() {
  final scene = useState<Scenes>(Scenes.home);

  void toFood() {
    scene.value = Scenes.food;
  }

  void toFoodMenu() {
    scene.value = Scenes.foodMenu;
  }

  return FoodCostController(
    scene: scene.value,
    toFood: toFood,
    toFoodMenu: toFoodMenu,
  );
}
