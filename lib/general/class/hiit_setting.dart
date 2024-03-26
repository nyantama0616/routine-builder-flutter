class HiitSetting {
  final int workTime;
  final int breakTime;
  final int roundCount;

  HiitSetting(
    {
      required this.workTime,
      required this.breakTime,
      required this.roundCount
    }
  );

  HiitSetting copyWith({int? workTime, int? breakTime, int? roundCount}) {
    return HiitSetting(
      workTime: workTime ?? this.workTime,
      breakTime: breakTime ?? this.breakTime,
      roundCount: roundCount ?? this.roundCount,
    );
  }

  factory HiitSetting.fromJson(Map<String, dynamic> json) {
    return HiitSetting(
      workTime: json['workTime'],
      breakTime: json['breakTime'],
      roundCount: json['roundCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workTime': workTime,
      'breakTime': breakTime,
      'roundCount': roundCount,
    };
  }
}
