import 'package:routine_builder/general/class/food.dart';

class CreateResponseBody {
  final Food food;

  CreateResponseBody({
    required this.food,
  });

  factory CreateResponseBody.fromJson(Map<String, dynamic> json) {
    return CreateResponseBody(
      food: Food.fromJson(json['food']),
    );
  }
}
