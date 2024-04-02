import 'package:routine_builder/feature/food-cost/class/food_form_controller.dart';
import 'package:routine_builder/general/class/food.dart';

class FoodEditController {
  final Food food;
  final Function() handleTapSaveButton;
  final FoodFormController formController;

  FoodEditController({
    required this.food,
    required this.handleTapSaveButton,
    required this.formController,
  });
}
