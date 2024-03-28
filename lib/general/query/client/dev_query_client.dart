import 'dart:convert';
import "package:routine_builder/general/query/client/query_client_base.dart";
import "package:routine_builder/general/query/data/ping/ping_response_body.dart";
import 'package:routine_builder/general/query/requests.dart' as requests;

class DevQueryClient extends QueryClientBase {
  Future<PingResponseBody> ping() async {
    final res = await queryClient.get(requests.ping);

    if (res.statusCode == 200) {
      return PingResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
