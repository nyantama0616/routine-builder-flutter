import 'package:routine_builder/general/class/food.dart';

class FoodDetailController {
  final Food food;
  final Function() handleTapEditButton;

  FoodDetailController({
    required this.food,
    required this.handleTapEditButton,
  });
}
