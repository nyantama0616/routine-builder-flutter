import 'package:routine_builder/general/class/timer.dart';

class InitResponseBody {
  final _InProgress? inProgress;

  InitResponseBody({required this.inProgress});

  factory InitResponseBody.fromJson(Map<String, dynamic> json) {
    return InitResponseBody(
      inProgress: json['inProgress'] == null
          ? null
          : _InProgress.fromJson(json['inProgress']),
    );
  }
}

class _InProgress {
  Timer timer;

  _InProgress({required this.timer});

  factory _InProgress.fromJson(Map<String, dynamic> json) {
    return _InProgress(
      timer: Timer.fromJson(json['timer']),
    );
  }
}
