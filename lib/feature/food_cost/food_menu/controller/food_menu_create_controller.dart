import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_form_controller.dart';

class FoodMenuCreateController {
  final Function() handleTapSaveButton;
  final FoodMenuFormController formController;

  FoodMenuCreateController({
    required this.handleTapSaveButton,
    required this.formController,
  });
}
