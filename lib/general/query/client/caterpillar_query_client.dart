import "package:routine_builder/general/query/client/query_client.dart";
import "package:routine_builder/general/query/data/caterpillar/start/start_response_body.dart";
import "package:routine_builder/general/query/data/caterpillar/stop/stop_response_body.dart";
import "package:routine_builder/general/query/data/caterpillar/finish/finish_response_body.dart";
import 'dart:convert';
import 'package:routine_builder/general/query/requests.dart';
import "package:routine_builder/general/query/data/queryErrorResponseBody.dart";
import "package:routine_builder/general/query/server_responded_but_exception.dart";
import 'package:http/http.dart' as http;

class CaterpillarQueryClient {
  final QueryClient queryClient;

  CaterpillarQueryClient({QueryClient? queryClient})
      : queryClient = queryClient ?? QueryClient();

  Future<StartResponseBody> start({required String pattern}) async {
    final res = await queryClient.post(Requests.startCaterpillar,
        body: jsonEncode({'pattern': pattern}));

    if (res.statusCode == 200) {
      return StartResponseBody.fromJson(jsonDecode(res.body));
    }

    _handleError(res);
  }

  Future<StopResponseBody> stop() async {
    final res = await queryClient.post(Requests.stopCaterpillar);

    if (res.statusCode == 200) {
      return StopResponseBody.fromJson(jsonDecode(res.body));
    }

    _handleError(res);
  }

  Future<FinishResponseBody> finish() async {
    final res = await queryClient.post(Requests.finishCaterpillar);

    if (res.statusCode == 200) {
      return FinishResponseBody.fromJson(jsonDecode(res.body));
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
