import 'package:routine_builder/feature/food_cost/class/food/food_create_controller.dart';
import 'package:routine_builder/feature/food_cost/class/food/food_detail_controller.dart';
import 'package:routine_builder/feature/food_cost/class/food/food_edit_controller.dart';
import 'package:routine_builder/feature/food_cost/class/food/foods_controller.dart';
import 'package:routine_builder/feature/food_cost/enum/scenes.dart';

class FoodController {
  final Scenes scene;
  final String title;
  Function() handleTapBackButton;
  FoodsController foodsController;
  FoodDetailController foodDetailController;
  FoodEditController foodEditController;
  FoodCreateController foodCreateController;

  FoodController({
    required this.scene,
    required this.title,
    required this.handleTapBackButton,
    required this.foodsController,
    required this.foodDetailController,
    required this.foodEditController,
    required this.foodCreateController,
  });
}
