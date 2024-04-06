class FinishRequestBody {
  final int roundCount;

  FinishRequestBody({
    required this.roundCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'roundCount': roundCount,
    };
  }
}
