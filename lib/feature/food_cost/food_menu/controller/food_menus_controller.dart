import 'package:routine_builder/general/model/food_menu.dart';

class FoodMenusController {
  final List<FoodMenuHeader> foodMenus;
  Function(FoodMenuHeader) handleTapFoodMenuItem;
  Function() handleTapAddFoodMenuButton;

  FoodMenusController({
    required this.foodMenus,
    required this.handleTapFoodMenuItem,
    required this.handleTapAddFoodMenuButton,
  });
}
