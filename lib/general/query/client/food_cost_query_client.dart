import 'dart:convert';

import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';
import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/food_cost/create_food/create_request_food_body.dart';
import 'package:routine_builder/general/query/data/food_cost/create_food/create_response_food_body.dart';
import 'package:routine_builder/general/query/data/food_cost/create_food_menu/create_food_menu_request_body.dart';
import 'package:routine_builder/general/query/data/food_cost/create_food_menu/create_food_menu_response_body.dart';
import 'package:routine_builder/general/query/data/food_cost/init_food/init_food_response_body.dart';
import 'package:routine_builder/general/query/data/food_cost/init_food_menu/init_food_menu_response_body.dart';
import 'package:routine_builder/general/query/data/food_cost/update_food_food/update_food_response_body.dart';
import 'package:routine_builder/general/query/data/food_cost/update_food_menu/update_food_menu_response_body.dart';
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
    final res = await queryClient.post(requests.createFood,
        body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return CreateFoodResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<UpdateFoodResponseBody> updateFood(Food food) async {
    final requestBody = CreateRequestBody(food: food).toJson();
    final res = await queryClient.patch(requests.updateFood(food.id),
        body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return UpdateFoodResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<InitFoodMenuResponseBody> initFoodMenu() async {
    final res = await queryClient.get(requests.initFoodMenu);

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
      return InitFoodMenuResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<CreateFoodMenuResponseBody> createFoodMenu(
      String name, List<FoodIdWithQuantity> foods) async {
    final requestBody = CreateFoodMenuRequestBody(
            foodMenu: FoodMenuForCreate(name: name, foods: foods))
        .toJson();
    print(requestBody);
    final res = await queryClient.post(requests.createFoodMenu,
        body: jsonEncode(requestBody));
    print(jsonDecode(res.body));

    if (res.statusCode == 200) {
      return CreateFoodMenuResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<UpdateFoodMenuResponseBody> updateFoodMenu(
      int foodMenuId, String name, List<FoodIdWithQuantity> foods) async {
    final requestBody = CreateFoodMenuRequestBody(
            foodMenu: FoodMenuForCreate(name: name, foods: foods))
        .toJson();
    final res = await queryClient.patch(requests.updateFoodMenu(foodMenuId),
        body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return UpdateFoodMenuResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
