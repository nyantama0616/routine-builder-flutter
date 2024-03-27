import 'package:routine_builder/general/query/client/query_client.dart';
import 'package:http/http.dart' as http;
import "package:routine_builder/general/query/data/queryErrorResponseBody.dart";
import "package:routine_builder/general/query/server_responded_but_exception.dart";
import 'dart:convert';

abstract class QueryClientBase {
  final QueryClient queryClient;
  
  QueryClientBase({QueryClient? queryClient}) : queryClient = queryClient ?? QueryClient();

  //TODO: protectedにしたい
  Never handleError(http.Response res) {
    if (res.statusCode == 400) {
      final parsedBody = QueryErrorResponseBody.fromJson(jsonDecode(res.body));
      throw ServerRespondedButException(
          statusCode: res.statusCode, errorMessages: parsedBody.errors);
    } else {
      throw Exception("Unknown error. statusCode: ${res.statusCode}");
    }
  }
}
