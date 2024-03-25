import "package:routine_builder/general/class/caterpillar.dart";
import "package:routine_builder/general/class/timer.dart";

class InitResponseBody {
  final Map<String, int> patterns;
  final _inProgress? inProgress;

  InitResponseBody({
    required this.patterns,
    required this.inProgress,
  });

  factory InitResponseBody.fromJson(Map<String, dynamic> json) {
    return InitResponseBody(
      patterns: Map<String, int>.from(json['patterns']),
      inProgress: json['inProgress'] == null
          ? null
          : _inProgress.fromJson(json['inProgress']),
    );
  }
}

class _inProgress {
  final Caterpillar caterpillar;
  final Timer timer;

  _inProgress({
    required this.caterpillar,
    required this.timer,
  });

  factory _inProgress.fromJson(Map<String, dynamic> json) {
    return _inProgress(
      caterpillar: Caterpillar.fromJson(json['caterpillar']),
      timer: Timer.fromJson(json['timer']),
    );
  }
}
