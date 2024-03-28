import 'package:flutter/foundation.dart';
import "package:routine_builder/general/query/query_statuses.dart";

class PingController {
  final String message;
  final bool authorized;
  final QueryStatuses status;
  final VoidCallback submit;
  final VoidCallback reset;

  PingController(
    {
      required this.message,
      required this.authorized,
      required this.status,
      required this.submit,
      required this.reset
    }
  );
}
