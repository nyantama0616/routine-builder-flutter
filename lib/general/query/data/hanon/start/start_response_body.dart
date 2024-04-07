import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/model/hanon.dart';
import 'package:routine_builder/general/model/life.dart';
import 'package:routine_builder/general/model/timer.dart';

class StartResponseBody {
  final Hanon hanon;
  final Timer timer;
  final Statuses status;

  StartResponseBody({
    required this.hanon,
    required this.timer,
    required this.status,
  });

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      hanon: Hanon.fromJson(json['hanon']),
      timer: Timer.fromJson(json['timer']),
      status: statusFromRawValue(json['status']),
    );
  }
}
