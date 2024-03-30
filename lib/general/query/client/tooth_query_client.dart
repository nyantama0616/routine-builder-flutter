import 'dart:convert';
import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/tooth/finish/finish_response_body.dart';
import 'package:routine_builder/general/query/data/tooth/init/init_response_body.dart';
import 'package:routine_builder/general/query/data/tooth/start/start_response_body.dart';
import 'package:routine_builder/general/query/data/tooth/stop/stop_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class ToothQueryClient extends QueryClientBase {
  Future<InitResponseBody> init() async {
    final res = await queryClient.get(requests.initTooth);

    if (res.statusCode == 200) return InitResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }

  Future<StartResponseBody> start() async {
    final res = await queryClient.post(requests.startTooth);

    if (res.statusCode == 200)
      return StartResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }

  Future<StopResponseBody> stop() async {
    final res = await queryClient.post(requests.stopTooth);

    if (res.statusCode == 200)
      return StopResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }

  Future<FinishResponseBody> finish() async {
    final res = await queryClient.post(requests.finishTooth);

    if (res.statusCode == 200)
      return FinishResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }
}
