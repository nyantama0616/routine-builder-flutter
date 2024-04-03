class Hanon {
  final int num;
  final String pattern;
  final int passedSeconds;

  Hanon({required this.num, required this.pattern, required this.passedSeconds});

  Hanon.init() : num = 1, pattern = "1:CM", passedSeconds = 30*60;

  factory Hanon.fromJson(Map<String, dynamic> json) {
    return Hanon(
      num: json['num'],
      pattern: json['pattern'],
      passedSeconds: json['passedSeconds'],
    );
  }
}
