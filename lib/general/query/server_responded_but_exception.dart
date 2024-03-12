class ServerRespondedButException implements Exception {
  final String message = "Server responded but query has not been success.";
  final int statusCode;
  final List<String> errorMessages;

  ServerRespondedButException({required this.statusCode, errorMessages}) : errorMessages = errorMessages ?? [];
}
