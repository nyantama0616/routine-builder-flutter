import 'package:routine_builder/general/model/food.dart';

class FoodsController {
  final List<Food> foods;
  Function(Food) handleTapFoodItem;
  Function() handleTapAddFoodButton;

  FoodsController({
    required this.foods,
    required this.handleTapFoodItem,
    required this.handleTapAddFoodButton,
  });
}
