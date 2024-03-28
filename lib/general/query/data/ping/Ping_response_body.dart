class PingResponseBody {
  final String message;
  final bool authorized;

  PingResponseBody({required this.message, required this.authorized});

  factory PingResponseBody.fromJson(Map<String, dynamic> json) {
    return PingResponseBody(
      message: json['message'],
      authorized: json['authorized'],
    );
  }
}
