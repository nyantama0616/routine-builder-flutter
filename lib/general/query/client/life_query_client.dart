import 'dart:convert';
import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/life/today/today_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class LifeQueryClient extends QueryClientBase {
  Future<TodayResponseBody> today() async {
    final res = await queryClient.get(requests.todayLife);

    if (res.statusCode == 200) {
      return TodayResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
