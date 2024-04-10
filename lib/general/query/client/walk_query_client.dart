import 'dart:convert';

import 'package:routine_builder/general/enum/places.dart';
import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/walk/finish/finish_response_body.dart';
import 'package:routine_builder/general/query/data/walk/start/start_request_body.dart';
import 'package:routine_builder/general/query/data/walk/start/start_response_body.dart';
import 'package:routine_builder/general/query/data/walk/stop/stop_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class WalkQueryClient extends QueryClientBase {
  Future<StartResponseBody> start({required Places from, required Places to}) async {
    final requestBody = StartRequestBody(from, to).toJson();
    final res = await queryClient.post(requests.startWalk, body: jsonEncode(requestBody));

    if (res.statusCode == 200) return StartResponseBody.fromJson(jsonDecode(res.body));
    
    handleError(res);
  }
  
  Future<StartResponseBody> restart() async {
    final res = await queryClient.post(requests.startWalk);

    if (res.statusCode == 200) return StartResponseBody.fromJson(jsonDecode(res.body));
    
    handleError(res);
  }

  Future<StopResponseBody> stop() async {
    final res = await queryClient.post(requests.stopWalk);

    if (res.statusCode == 200) return StopResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }

  Future<FinishResponseBody> finish() async {
    final res = await queryClient.post(requests.finishWalk);

    if (res.statusCode == 200) return FinishResponseBody.fromJson(jsonDecode(res.body));

    handleError(res);
  }
}
