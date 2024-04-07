import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/model/life.dart';
import 'package:routine_builder/general/model/timer.dart';

class StartResponseBody {
  final Timer timer;
  final Statuses status;

  StartResponseBody({required this.timer, required this.status});

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      timer: Timer.fromJson(json['timer']),
      status: statusFromRawValue(json['status']),
    );
  }
}
