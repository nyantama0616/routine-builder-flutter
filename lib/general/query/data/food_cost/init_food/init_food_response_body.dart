import 'package:routine_builder/general/model/food.dart';

class InitFoodResponseBody {
  final List<Food> foods;

  InitFoodResponseBody({ required this.foods });

  factory InitFoodResponseBody.fromJson(Map<String, dynamic> json) {
    final foods = (json['foods'] as List).map((e) => Food.fromJson(e)).toList();

    return InitFoodResponseBody(foods: foods);
  }
}
