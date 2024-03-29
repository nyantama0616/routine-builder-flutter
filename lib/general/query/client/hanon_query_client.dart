import 'dart:convert';

import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/hanon/finish/finish_response_body.dart';
import 'package:routine_builder/general/query/data/hanon/init/init_response_body.dart';
import 'package:routine_builder/general/query/data/hanon/start/start_request_body.dart';
import 'package:routine_builder/general/query/data/hanon/start/start_response_body.dart';
import 'package:routine_builder/general/query/data/hanon/stop/stop_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class HanonQueryClient extends QueryClientBase {
  Future<InitResponseBody> init() async {
    final res = await queryClient.get(requests.initHanon);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
  
  Future<StartResponseBody> start(
      {required int num, required String pattern}) async {
    final requestBody = StartRequestBody(num: num, pattern: pattern).toJson();
    final res = await queryClient.post(requests.startHanon,
        body: jsonEncode(requestBody));

    if (res.statusCode == 200) {
      return StartResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<StopResponseBody> stop() async {
    final res = await queryClient.post(requests.stopHanon);

    if (res.statusCode == 200) {
      return StopResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<FinishResponseBody> finish() async {
    final res = await queryClient.post(requests.finishHanon);

    if (res.statusCode == 200) {
      return FinishResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
