import 'dart:convert';
import "package:routine_builder/general/query/data/ping/Ping_response_body.dart";
import "query_client.dart";
import "../requests.dart";
class DevQueryClient {
  final QueryClient queryClient;

  DevQueryClient({QueryClient? queryClient}) : queryClient = queryClient ?? QueryClient();

  Future<String> ping() async {
    final response = await queryClient.get(Requests.ping);
    final body = jsonDecode(response.body);
    final parsedBody = PingResponseBody.fromJson(body);
    return parsedBody.message;
  }
}
