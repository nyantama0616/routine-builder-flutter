import 'package:flutter_test/flutter_test.dart';
import "package:routine_builder/general/query/client/dev_query_client.dart";

import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:routine_builder/general/query/requests.dart';
import 'dart:convert';

import 'query_client_test.mocks.dart';

void main() {
  testWidgets("DevQueryClient.ping", (tester) async {
    final mockQueryClient = MockQueryClient();


    // TODO: これがなぜ上手くかないのか調べる
    final mockResponse = Future.value(http.Response(jsonEncode({'message': 'pong'}), 200));
    when(mockQueryClient.get(Requests.ping))
        .thenAnswer((_) => mockResponse);

    final client = DevQueryClient(queryClient: mockQueryClient);

    final message = await client.ping();
    expect(message, "pong");
  });
}
