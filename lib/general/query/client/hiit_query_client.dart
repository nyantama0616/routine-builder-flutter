import 'dart:convert';
import 'package:routine_builder/general/model/hiit_setting.dart';
import 'package:routine_builder/general/model/hiit_train_data.dart';
import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/hiit/create/create_request_body.dart';
import 'package:routine_builder/general/query/data/hiit/create/create_response_body.dart';
import 'package:routine_builder/general/query/data/hiit/init/init_response_body.dart';
import 'package:routine_builder/general/query/data/hiit/update_setting/update_setting_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class HiitQueryClient extends QueryClientBase {
  Future<InitResponseBody> init() async {
    final res = await queryClient.get(requests.initHiit);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<CreateResponseBody> create(HiitTrainData trainData) async {
    final requestBody = CreateRequestBody(hiit: trainData).toJson();
    final res = await queryClient.post(requests.createHiit, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return CreateResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<UpdateSettingResponseBody> updateSetting(HiitSetting setting) async {
    final requestBody = UpdateSettingResponseBody(hiitSetting: setting).toJson();
    final res = await queryClient.patch(requests.updateHiitSetting, body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return UpdateSettingResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
