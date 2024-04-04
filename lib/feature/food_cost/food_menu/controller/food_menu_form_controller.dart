import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';

class FoodMenuFormController {
  final FoodMenu foodMenu;
  final Map<String, String> map;
  final List<Food> foods;
  final showFoodList;
  final Function() handleTapAddButton;
  final Function() handleTapCrossButton;
  final Function(String, String) handleChange;
  final Function(FoodWithQuantity) handleAddFood;
  final Function(FoodWithQuantity) handleEditFood;

  final FoodMenuAndValid Function() getFoodMenuAndValidate;
  final Function(FoodMenu foodMenu) init;

  FoodMenuFormController({
    required this.foodMenu,
    required this.map,
    required this.foods,
    required this.showFoodList,
    required this.handleTapAddButton,
    required this.handleTapCrossButton,
    required this.handleChange,
    required this.handleAddFood,
    required this.handleEditFood,
    required this.getFoodMenuAndValidate,
    required this.init,
  });
}

class FoodMenuAndValid {
  final FoodMenu foodMenu;
  final bool isValid;

  FoodMenuAndValid(this.foodMenu, this.isValid);
}
