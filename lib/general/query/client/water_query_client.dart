import "package:routine_builder/general/query/client/query_client.dart";
import 'package:routine_builder/general/query/requests.dart';
import 'package:http/http.dart' as http;
import "package:routine_builder/general/query/data/queryErrorResponseBody.dart";
import "package:routine_builder/general/query/server_responded_but_exception.dart";
import 'dart:convert';
import "package:routine_builder/general/query/data/water/drink_water/drink_water_request_body.dart";
import "package:routine_builder/general/query/data/water/drink_water/drink_water_response_body.dart";
import "package:routine_builder/general/query/data/water/init/init_response_body.dart";

class WaterQueryClient {
  final QueryClient queryClient;

  WaterQueryClient({QueryClient? queryClient}) : queryClient = queryClient ?? QueryClient();

  Future<InitResponseBody> init() async {
    final res = await queryClient.get(Requests.initWater);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    _handleError(res);
  }

  //TODO: 将来的にdrinkに名称変更すると思う
  Future<DrinkWaterResponseBody> drinkWater(int xml) async {
    final requestBody = DrinkWaterRequestBody(xml: xml);
    final res = await queryClient.post(Requests.drinkWater, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return DrinkWaterResponseBody.fromJson(jsonDecode(res.body));
    }

    _handleError(res);
  }

  Never _handleError(http.Response res) {
    if (res.statusCode == 400) {
      final parsedBody = QueryErrorResponseBody.fromJson(jsonDecode(res.body));
      throw ServerRespondedButException(
          statusCode: res.statusCode, errorMessages: parsedBody.errors);
    } else {
      throw Exception("Unknown error. statusCode: ${res.statusCode}");
    }
  }
}
