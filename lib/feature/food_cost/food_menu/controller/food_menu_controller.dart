import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menus_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/enum/scenes.dart';

class FoodMenuController {
  final Scenes scene;
  final String title;
  final Function() handleTapBackButton;
  final FoodMenusController foodMenusController;

  FoodMenuController({
    required this.scene,
    required this.title,
    required this.handleTapBackButton,
    required this.foodMenusController,
  });
}
