class PingResponseBody {
  final String message;

  PingResponseBody({required this.message});

  factory PingResponseBody.fromJson(Map<String, dynamic> json) {
    return PingResponseBody(
      message: json['message'],
    );
  }
}
