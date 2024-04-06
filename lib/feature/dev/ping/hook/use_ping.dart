import "package:routine_builder/general/query/client/dev_query_client.dart";
import "package:routine_builder/general/query/query_statuses.dart";

import "../controller/ping_controller.dart";
import "package:flutter_hooks/flutter_hooks.dart";


PingController usePing({DevQueryClient? devQueryClient}) {
  DevQueryClient client = devQueryClient ?? DevQueryClient();

  final _message = useState<String>("");
  final _authorized = useState<bool>(false);
  final _status = useState<QueryStatuses>(QueryStatuses.none);

  void submit() {
    _status.value = QueryStatuses.doing;

    client.ping().then((res) {
      _message.value = res.message;
      _authorized.value = res.authorized;
      _status.value = QueryStatuses.success;
    }).catchError((error) {
      _message.value = error.toString();
      _authorized.value = false;
      _status.value = QueryStatuses.failure;
    });
  }

  void reset() => _message.value = "";

  return useMemoized(() {
    return PingController(
      message: _message.value,
      authorized: _authorized.value,
      status: _status.value,
      submit: submit,
      reset: reset,
    );
  }, [_message.value, _status.value]);
}
