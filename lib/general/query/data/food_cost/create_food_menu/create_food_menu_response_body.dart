import 'package:routine_builder/general/model/food_menu.dart';

class CreateFoodMenuResponseBody {
  final FoodMenu foodMenu;

  CreateFoodMenuResponseBody({
    required this.foodMenu,
  });

  factory CreateFoodMenuResponseBody.fromJson(Map<String, dynamic> json) {
    return CreateFoodMenuResponseBody(
      foodMenu: FoodMenu.fromJson(json['foodMenu']),
    );
  }
}
