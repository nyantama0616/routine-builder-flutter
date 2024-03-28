import "package:routine_builder/general/query/client/query_client_base.dart";
import "package:routine_builder/general/query/data/sleep/finish/finish_response_body.dart";
import "package:routine_builder/general/query/data/sleep/start/start_request_body.dart";
import "package:routine_builder/general/query/data/sleep/start/start_response_body.dart";
import "../requests.dart";
import 'dart:convert';

class SleepQueryClient extends QueryClientBase {
  Future<StartResponseBody> startSleep({bool isNap = false}) async {
    final requestBody = StartRequestBody(isNap: isNap).toJson();
    final res = await queryClient.post(Requests.startSleep, body: jsonEncode(requestBody));

    if (res.statusCode == 200) return StartResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }

  Future<FinishResponseBody> finishSleep() async {
    final res = await queryClient.post(Requests.finishSleep);

    if (res.statusCode == 200) return FinishResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }
}
