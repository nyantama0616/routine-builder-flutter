import 'package:routine_builder/feature/food-cost/class/food_create_controller.dart';
import 'package:routine_builder/feature/food-cost/class/food_detail_controller.dart';
import 'package:routine_builder/feature/food-cost/class/food_edit_controller.dart';
import 'package:routine_builder/feature/food-cost/class/foods_controller.dart';
import 'package:routine_builder/feature/food-cost/enum/scenes.dart';

class FoodCostController {
  final Scenes scene;
  final String title;
  Function() handleTapBackButton;
  FoodsController foodsController;
  FoodDetailController foodDetailController;
  FoodEditController foodEditController;
  FoodCreateController foodCreateController;

  FoodCostController({
    required this.scene,
    required this.title,
    required this.handleTapBackButton,
    required this.foodsController,
    required this.foodDetailController,
    required this.foodEditController,
    required this.foodCreateController,
  });
}
