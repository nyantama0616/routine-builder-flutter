import 'dart:convert';

import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/food_cost/create_food/create_request_food_body.dart';
import 'package:routine_builder/general/query/data/food_cost/create_food/create_response_food_body.dart';
import 'package:routine_builder/general/query/data/food_cost/init_food/init_food_response_body.dart';
import 'package:routine_builder/general/query/data/food_cost/update_food_food/update_food_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class FoodCostQueryClient extends QueryClientBase {
  Future<InitFoodResponseBody> initFood() async {
    final res = await queryClient.get(requests.initFood);

    if (res.statusCode == 200) {
      return InitFoodResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<CreateFoodResponseBody> createFood(Food food) async {
    final requestBody = CreateRequestBody(food: food).toJson();
    final res = await queryClient.post(requests.createFood, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return CreateFoodResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<UpdateFoodResponseBody> updateFood(Food food) async {
    final requestBody = CreateRequestBody(food: food).toJson();
    final res = await queryClient.patch(requests.updateFood(food.id), body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return UpdateFoodResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
