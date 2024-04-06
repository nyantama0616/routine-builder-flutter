import 'package:routine_builder/general/model/food.dart';

class FoodDetailController {
  final Food food;
  final Function() handleTapEditButton;

  FoodDetailController({
    required this.food,
    required this.handleTapEditButton,
  });
}
