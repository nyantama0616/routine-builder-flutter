class StartRequestBody {
  final int num;
  final String pattern;

  StartRequestBody({
    required this.num,
    required this.pattern,
  });

  Map<String, dynamic> toJson() {
    return {
      'num': num,
      'pattern': pattern,
    };
  }
}
