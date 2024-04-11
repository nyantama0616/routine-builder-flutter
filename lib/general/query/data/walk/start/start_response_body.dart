import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/model/timer.dart';
import 'package:routine_builder/general/model/walk.dart';

class StartResponseBody {
  final Walk walk;
  final Timer timer;
  final Statuses status;

  StartResponseBody({
    required this.walk,
    required this.timer,
    required this.status,
  });

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      walk: Walk.fromJson(json['walk']),
      timer: Timer.fromJson(json['timer']),
      status: statusFromRawValue(json['status']),
    );
  }
}
