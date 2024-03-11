import "package:routine_builder/general/query/client/dev_query_client.dart";
import "package:routine_builder/general/query/query_statuses.dart";

import "./ping_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";


PingController usePing({DevQueryClient? devQueryClient}) {
  DevQueryClient client = devQueryClient ?? DevQueryClient();

  final message = useState<String>("");
  final status = useState<QueryStatuses>(QueryStatuses.none);

  void submit() {
    status.value = QueryStatuses.doing;

    client.ping().then((value) {
      message.value = value;
      status.value = QueryStatuses.success;
    }).catchError((error) {
      message.value = error.toString();
      status.value = QueryStatuses.failure;
    });
  }

  void reset() => message.value = "";

  return useMemoized(() {
    return PingController(
        message: message, status: status, submit: submit, reset: reset);
  }, [message.value]);
}
