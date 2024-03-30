import 'package:routine_builder/general/class/life.dart';
import 'package:routine_builder/general/class/timer.dart';

class StartResponseBody {
  final Timer timer;
  final Life todayLife;

  StartResponseBody({required this.timer, required this.todayLife});

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      timer: Timer.fromJson(json['timer']),
      todayLife: Life.fromJson(json['todayLife']),
    );
  }
}
