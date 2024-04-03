import 'package:routine_builder/feature/food_cost/food/class/food_form_controller.dart';

class FoodCreateController {
  final Function() handleTapSaveButton;
  final FoodFormController formController;

  FoodCreateController({
    required this.handleTapSaveButton,
    required this.formController,
  });
}
