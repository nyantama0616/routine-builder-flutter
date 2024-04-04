import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_form_controller.dart';
import 'package:routine_builder/general/model/food_menu.dart';

class FoodMenuEditController {
  final FoodMenu foodMenu;
  final Function() handleTapSaveButton;
  final Function() handleTapDeleteButton;
  final FoodMenuFormController formController;

  FoodMenuEditController({
    required this.foodMenu,
    required this.handleTapSaveButton,
    required this.formController,
    required this.handleTapDeleteButton,
  });
}
