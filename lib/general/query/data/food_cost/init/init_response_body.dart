import 'package:routine_builder/general/model/food.dart';

class InitResponseBody {
  final List<Food> foods;

  InitResponseBody({ required this.foods });

  factory InitResponseBody.fromJson(Map<String, dynamic> json) {
    final foods = (json['foods'] as List).map((e) => Food.fromJson(e)).toList();

    return InitResponseBody(foods: foods);
  }
}
