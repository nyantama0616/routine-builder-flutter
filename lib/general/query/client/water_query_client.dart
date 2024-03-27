import "package:routine_builder/general/query/client/query_client_base.dart";
import 'package:routine_builder/general/query/requests.dart';
import 'dart:convert';
import "package:routine_builder/general/query/data/water/drink_water/drink_water_request_body.dart";
import "package:routine_builder/general/query/data/water/drink_water/drink_water_response_body.dart";
import "package:routine_builder/general/query/data/water/init/init_response_body.dart";

class WaterQueryClient extends QueryClientBase {
  Future<InitResponseBody> init() async {
    final res = await queryClient.get(Requests.initWater);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  //TODO: 将来的にdrinkに名称変更すると思う
  Future<DrinkWaterResponseBody> drinkWater(int xml) async {
    final requestBody = DrinkWaterRequestBody(xml: xml);
    final res = await queryClient.post(Requests.drinkWater, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return DrinkWaterResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
