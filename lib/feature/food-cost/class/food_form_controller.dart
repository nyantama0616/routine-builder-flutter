import 'package:routine_builder/general/class/food.dart';

class FoodFormController {
  final Map<String, String> map;
  final Function(String, String) onChanged;
  final FoodAndValid Function() getFoodAndValidate;
  final Function() reset;

  FoodFormController({
    required this.map,
    required this.onChanged,
    required this.getFoodAndValidate,
    required this.reset,
  });
}

class FoodAndValid {
  final Food food;
  final bool isValid;

  FoodAndValid(this.food, this.isValid);
}
