import "package:routine_builder/general/query/client/query_client_base.dart";
import "../requests.dart";
import 'dart:convert';

class SleepQueryClient extends QueryClientBase {
  Future<void> startSleep({bool isNap = false}) async {
    final res = await queryClient.post(Requests.startSleep,
        body: jsonEncode({'isNap': isNap}));

    if (res.statusCode == 200) return;

    handleError(res);
  }
  
  Future<void> finishSleep() async {
    final res = await queryClient.post(Requests.finishSleep);

    if (res.statusCode == 200) return;

    handleError(res);
  }
}
