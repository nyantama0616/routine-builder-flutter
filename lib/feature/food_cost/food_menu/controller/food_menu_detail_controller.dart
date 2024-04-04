import 'package:routine_builder/general/model/food_menu.dart';

class FoodMenuDetailController {
  final FoodMenu foodMenu;
  final Function() handleTapEditButton;

  FoodMenuDetailController({
    required this.foodMenu,
    required this.handleTapEditButton,
  });
}
