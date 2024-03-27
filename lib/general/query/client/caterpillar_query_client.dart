import "package:routine_builder/general/query/client/query_client_base.dart";
import "package:routine_builder/general/query/data/caterpillar/start/start_response_body.dart";
import "package:routine_builder/general/query/data/caterpillar/stop/stop_response_body.dart";
import "package:routine_builder/general/query/data/caterpillar/finish/finish_response_body.dart";
import "package:routine_builder/general/query/data/caterpillar/init/init_response_body.dart";
import 'dart:convert';
import 'package:routine_builder/general/query/requests.dart';

class CaterpillarQueryClient extends QueryClientBase {
  Future<InitResponseBody> init() async {
    final res = await queryClient.get(Requests.initCaterpillar);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<StartResponseBody> start({required String pattern}) async {
    final res = await queryClient.post(Requests.startCaterpillar,
        body: jsonEncode({'pattern': pattern}));

    if (res.statusCode == 200) {
      return StartResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<StopResponseBody> stop() async {
    final res = await queryClient.post(Requests.stopCaterpillar);

    if (res.statusCode == 200) {
      return StopResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }

  Future<FinishResponseBody> finish() async {
    final res = await queryClient.post(Requests.finishCaterpillar);

    if (res.statusCode == 200) {
      return FinishResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
