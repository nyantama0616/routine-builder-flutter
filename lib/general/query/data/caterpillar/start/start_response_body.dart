import "package:routine_builder/general/enum/statuses.dart";
import "package:routine_builder/general/model/caterpillar.dart";
import "package:routine_builder/general/model/life.dart";
import "package:routine_builder/general/model/timer.dart";

class StartResponseBody {
  final Caterpillar caterpillar;
  final Timer timer;
  final Statuses status;

  StartResponseBody({
    required this.caterpillar,
    required this.timer,
    required this.status,
  });

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      caterpillar: Caterpillar.fromJson(json['caterpillar']),
      timer: Timer.fromJson(json['timer']),
      status: statusFromRawValue(json['status']),
    );
  }
}
