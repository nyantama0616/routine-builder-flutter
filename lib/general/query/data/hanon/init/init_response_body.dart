import 'package:routine_builder/general/class/hanon.dart';
import 'package:routine_builder/general/class/hanon_patterns.dart';
import "package:routine_builder/general/class/timer.dart";

class InitResponseBody {
  final HanonPatterns patterns;
  final _inProgress? inProgress;

  InitResponseBody({
    required this.patterns,
    required this.inProgress,
  });

  factory InitResponseBody.fromJson(Map<String, dynamic> json) {
    return InitResponseBody(
      patterns: hanonPatternsFromJson(json['patterns']),
      inProgress: json['inProgress'] == null
          ? null
          : _inProgress.fromJson(json['inProgress']),
    );
  }
}

class _inProgress {
  final Hanon hanon;
  final Timer timer;

  _inProgress({
    required this.hanon,
    required this.timer,
  });

  factory _inProgress.fromJson(Map<String, dynamic> json) {
    return _inProgress(
      hanon: Hanon.fromJson(json['hanon']),
      timer: Timer.fromJson(json['timer']),
    );
  }
}
