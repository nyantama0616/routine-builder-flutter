class StartRequestBody {
  final bool isNap;
  
  const StartRequestBody({required this.isNap});
  
  Map<String, dynamic> toJson() {
    return {
      'isNap': isNap,
    };
  }
}
