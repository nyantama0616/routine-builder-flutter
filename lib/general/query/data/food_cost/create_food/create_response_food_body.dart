import 'package:routine_builder/general/model/food.dart';

class CreateFoodResponseBody {
  final Food food;

  CreateFoodResponseBody({
    required this.food,
  });

  factory CreateFoodResponseBody.fromJson(Map<String, dynamic> json) {
    return CreateFoodResponseBody(
      food: Food.fromJson(json['food']),
    );
  }
}
