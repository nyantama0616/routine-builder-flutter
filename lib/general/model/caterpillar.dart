class Caterpillar {
  final String pattern;
  final int passedSeconds;

  Caterpillar({
    required this.pattern,
    required this.passedSeconds,
  });

  factory Caterpillar.fromJson(Map<String, dynamic> json) {
    return Caterpillar(
      pattern: json['pattern'],
      passedSeconds: json['passedSeconds'],
    );
  }
}
