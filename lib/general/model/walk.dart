class Walk {
  final int passedSeconds;

  Walk({
    required this.passedSeconds,
  });

  factory Walk.fromJson(Map<String, dynamic> json) {
    return Walk(
      passedSeconds: json['passedSeconds'],
    );
  }
}
