import 'package:routine_builder/feature/food_cost/food/controller/food_form_controller.dart';
import 'package:routine_builder/general/model/food.dart';

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
