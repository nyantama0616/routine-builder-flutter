import 'package:routine_builder/general/class/food.dart';

class FoodEditController {
  final Food food;
  final Function() handleTapSaveButton;

  FoodEditController({
    required this.food,
    required this.handleTapSaveButton,
  });
}
