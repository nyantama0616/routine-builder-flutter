import 'dart:convert';

import 'package:routine_builder/general/class/hiit_setting.dart';
import 'package:routine_builder/general/class/hiit_train_data.dart';
import 'package:routine_builder/general/query/client/query_client.dart';
import 'package:routine_builder/general/query/data/hiit/create/create_request_body.dart';
import 'package:routine_builder/general/query/data/hiit/create/create_response_body.dart';
import 'package:routine_builder/general/query/data/hiit/init/init_response_body.dart';
import 'package:routine_builder/general/query/data/hiit/update_setting/update_setting_response_body.dart';
import 'package:routine_builder/general/query/requests.dart';
import 'package:http/http.dart' as http;
import "package:routine_builder/general/query/data/queryErrorResponseBody.dart";
import "package:routine_builder/general/query/server_responded_but_exception.dart";

class HiitQueryClient {
  final QueryClient queryClient;

  HiitQueryClient({QueryClient? queryClient})
      : queryClient = queryClient ?? QueryClient();

  Future<InitResponseBody> init() async {
    final res = await queryClient.get(Requests.initHiit);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    _handleError(res);
  }

  Future<CreateResponseBody> create(HiitTrainData trainData) async {
    final requestBody = CreateRequestBody(hiit: trainData).toJson();
    final res = await queryClient.post(Requests.createHiit, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return CreateResponseBody.fromJson(jsonDecode(res.body));
    }

    _handleError(res);
  }

  Future<UpdateSettingResponseBody> updateSetting(HiitSetting setting) async {
    final requestBody = UpdateSettingResponseBody(hiitSetting: setting).toJson();
    final res = await queryClient.patch(Requests.updateHiitSetting, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return UpdateSettingResponseBody.fromJson(jsonDecode(res.body));
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
