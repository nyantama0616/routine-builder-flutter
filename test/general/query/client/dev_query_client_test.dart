import 'package:flutter_test/flutter_test.dart';
import 'package:routine_builder/general/query/client/query_client.dart';
import "package:routine_builder/general/query/client/dev_query_client.dart";

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:routine_builder/general/query/requests.dart';

void main() {
  testWidgets("DevQueryClient.ping", (tester) async {
    final mockQueryClient = MockQueryClient();

    // TODO: これがなぜ上手くかないのか調べる
    // final mockResponse = http.Response(jsonEncode({'message': 'pong'}), 200);
    // when(mockQueryClient.get(Requests.ping))
    //     .thenAnswer((_) async => mockResponse);

    final client = DevQueryClient(queryClient: mockQueryClient);

    final message = await client.ping();
    expect(message, "pong");
  });
}

class MockQueryClient extends Mock implements QueryClient {
  @override
  Future<http.Response> get(String path, {Map<String, String>? headers}) {
    final mockResponse = http.Response(jsonEncode({'message': 'pong'}), 200);
    return Future.value(mockResponse);
  }
}
