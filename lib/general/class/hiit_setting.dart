class HiitSetting {
  final int workTime;
  final int breakTime;
  final int setCount;

  HiitSetting(
    {
      required this.workTime,
      required this.breakTime,
      required this.setCount
    }
  );

  HiitSetting copyWith({int? workTime, int? breakTime, int? setCount}) {
    return HiitSetting(
      workTime: workTime ?? this.workTime,
      breakTime: breakTime ?? this.breakTime,
      setCount: setCount ?? this.setCount,
    );
  }

  factory HiitSetting.fromJson(Map<String, dynamic> json) {
    return HiitSetting(
      workTime: json['workTime'],
      breakTime: json['breakTime'],
      setCount: json['setCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workTime': workTime,
      'breakTime': breakTime,
      'setCount': setCount,
    };
  }
}
