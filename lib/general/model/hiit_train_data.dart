import 'package:routine_builder/general/model/hiit_setting.dart';

class HiitTrainData {
  final int workTime;
  final int breakTime;
  final int roundCount;
  final DateTime? startedAt;
  final DateTime? finishedAt;

  HiitTrainData({
    required this.workTime,
    required this.breakTime,
    required this.roundCount,
    this.startedAt,
    this.finishedAt,
  });

  factory HiitTrainData.fromJson(Map<String, dynamic> json) {
    final DateTime? startedAt = json['startedAt'] == null ? null : DateTime.parse(json['startedAt']);
    final DateTime? finishedAt = json['finishedAt'] == null ? null : DateTime.parse(json['finishedAt']);
    return HiitTrainData(
      workTime: json['workTime'],
      breakTime: json['breakTime'],
      roundCount: json['roundCount'],
      startedAt: startedAt,
      finishedAt: finishedAt,
    );
  }
}
