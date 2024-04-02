import 'dart:convert';

import 'package:routine_builder/general/class/food.dart';
import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/food_cost/create/create_request_body.dart';
import 'package:routine_builder/general/query/data/food_cost/create/create_response_body.dart';
import 'package:routine_builder/general/query/data/food_cost/init/init_response_body.dart';
import 'package:routine_builder/general/query/data/food_cost/update/update_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class FoodCostQueryClient extends QueryClientBase {
  Future<InitResponseBody> initFood() async {
    final res = await queryClient.get(requests.initFood);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<CreateResponseBody> createFood(Food food) async {
    final requestBody = CreateRequestBody(food: food).toJson();
    final res = await queryClient.post(requests.createFood, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return CreateResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<UpdateResponseBody> updateFood(Food food) async {
    final requestBody = CreateRequestBody(food: food).toJson();
    final res = await queryClient.patch(requests.updateFood(food.id), body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return UpdateResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
