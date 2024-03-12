class QueryErrorResponseBody {
  List<String> errors;

  QueryErrorResponseBody({required this.errors});

  factory QueryErrorResponseBody.fromJson(Map<String, dynamic> json) {
    return QueryErrorResponseBody(
      errors: List<String>.from(json['errors']),
    );
  } 
}
