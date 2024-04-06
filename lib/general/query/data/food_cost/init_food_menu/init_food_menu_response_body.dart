import 'package:routine_builder/general/model/food_menu.dart';

class InitFoodMenuResponseBody {
  final List<FoodMenu> foodMenus;

  InitFoodMenuResponseBody({required this.foodMenus});

  factory InitFoodMenuResponseBody.fromJson(Map<String, dynamic> json) {
    final foodMenus = (json['foodMenus'] as List).map((e) => FoodMenu.fromJson(e)).toList();

    return InitFoodMenuResponseBody(foodMenus: foodMenus);
  }
}
