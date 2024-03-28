import 'package:routine_builder/general/enum/statuses.dart';

class Life {
  final DateTime startedAt;
  final Statuses status;

  Life({
    required this.startedAt,
    required this.status,
  });

  Life.init() : startedAt = DateTime.now(), status = Statuses.none;

  factory Life.fromJson(Map<String, dynamic> json) {
    return Life(
      startedAt: DateTime.parse(json["startedAt"]),
      status: statusFromRawValue(json["status"]),
    );
  }
}
