import 'package:routine_builder/general/class/hanon.dart';
import 'package:routine_builder/general/class/life.dart';
import 'package:routine_builder/general/class/timer.dart';

class StartResponseBody {
  final Hanon hanon;
  final Timer timer;
  final Life todayLife;

  StartResponseBody({
    required this.hanon,
    required this.timer,
    required this.todayLife,
  });

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      hanon: Hanon.fromJson(json['hanon']),
      timer: Timer.fromJson(json['timer']),
      todayLife: Life.fromJson(json['todayLife']),
    );
  }
}
