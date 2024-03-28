import "package:routine_builder/general/class/caterpillar.dart";
import "package:routine_builder/general/class/life.dart";
import "package:routine_builder/general/class/timer.dart";

class StartResponseBody {
  final Caterpillar caterpillar;
  final Timer timer;
  final Life todayLife;

  StartResponseBody({
    required this.caterpillar,
    required this.timer,
    required this.todayLife,
  });

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      caterpillar: Caterpillar.fromJson(json['caterpillar']),
      timer: Timer.fromJson(json['timer']),
      todayLife: Life.fromJson(json['todayLife']),
    );
  }
}
