import 'package:routine_builder/general/model/food.dart';

class CreateRequestBody {
  final Food food;

  CreateRequestBody({
    required this.food,
  });

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
    };
  }
}
