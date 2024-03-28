import 'dart:convert';

import 'package:routine_builder/general/query/client/query_client_base.dart';
import 'package:routine_builder/general/query/data/home/init/init_response_body.dart';
import 'package:routine_builder/general/query/requests.dart' as requests;

class HomeQueryClient extends QueryClientBase {
  Future<InitResponseBody> init() async {
    final res = await queryClient.get(requests.initHome);

    if (res.statusCode == 200) {
      return InitResponseBody.fromJson(jsonDecode(res.body));
    }

    handleError(res);
  }
}
