class SleepStartRequestBody {
  final bool isNap;
  
  const SleepStartRequestBody({required this.isNap});
  
  Map<String, dynamic> toJson() {
    return {
      'isNap': isNap,
    };
  }
}
