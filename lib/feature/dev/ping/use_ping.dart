import "package:routine_builder/general/query/client/dev_query_client.dart";
import "package:routine_builder/general/query/query_statuses.dart";

import "./ping_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";


PingController usePing({DevQueryClient? devQueryClient}) {
  DevQueryClient client = devQueryClient ?? DevQueryClient();

  final _message = useState<String>("");
  final _status = useState<QueryStatuses>(QueryStatuses.none);

  void submit() {
    _status.value = QueryStatuses.doing;

    client.ping().then((value) {
      _message.value = value;
      _status.value = QueryStatuses.success;
    }).catchError((error) {
      _message.value = error.toString();
      _status.value = QueryStatuses.failure;
    });
  }

  void reset() => _message.value = "";

  return useMemoized(() {
    return PingController(
      message: _message.value,
      status: _status.value,
      submit: submit,
      reset: reset,
    );
  }, [_message.value, _status.value]);
}
