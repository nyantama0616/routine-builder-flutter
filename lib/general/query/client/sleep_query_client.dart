import "package:routine_builder/general/query/data/queryErrorResponseBody.dart";
import "package:routine_builder/general/query/server_responded_but_exception.dart";

import "query_client.dart";
import "../requests.dart";
import 'dart:convert';

class SleepQueryClient {
  final QueryClient queryClient;

  SleepQueryClient({QueryClient? queryClient})
      : queryClient = queryClient ?? QueryClient();

  Future<void> startSleep({bool isNap = false}) async {
    final res = await queryClient.post(Requests.startSleep,
        body: jsonEncode({'isNap': isNap}));

    if (res.statusCode == 200) return;

    if (res.statusCode == 400) {
      final parsedBody = QueryErrorResponseBody.fromJson(jsonDecode(res.body));
      throw ServerRespondedButException(statusCode: res.statusCode, errorMessages: parsedBody.errors);
    } else {
      throw Exception("Unknown error. statusCode: ${res.statusCode}");
    }
  }
  
  Future<void> finishSleep() async {
    final res = await queryClient.post(Requests.finishSleep);

    if (res.statusCode == 200) return;

    if (res.statusCode == 400) {
      final parsedBody = QueryErrorResponseBody.fromJson(jsonDecode(res.body));
      throw ServerRespondedButException(statusCode: res.statusCode, errorMessages: parsedBody.errors);
    } else {
      throw Exception("Unknown error. statusCode: ${res.statusCode}");
    }
  }
}
