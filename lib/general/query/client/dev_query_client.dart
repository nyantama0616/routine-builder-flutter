import 'dart:convert';
import "package:routine_builder/general/query/client/query_client_base.dart";
import "package:routine_builder/general/query/data/ping/ping_response_body.dart";
import "query_client.dart";
import "../requests.dart";
class DevQueryClient extends QueryClientBase {
  Future<String> ping() async {
    final res = await queryClient.get(Requests.ping);
    final body = jsonDecode(res.body);
    final parsedBody = PingResponseBody.fromJson(body);

    if (res.statusCode == 200) {
      return parsedBody.message;
    }

    handleError(res);
  }
}
