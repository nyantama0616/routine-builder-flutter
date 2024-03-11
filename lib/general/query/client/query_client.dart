import 'package:http/http.dart' as http;

class QueryClient {
  Future<http.Response> get(String path, {Map<String, String>? headers}) {
    return http.get(Uri.parse(path), headers: headers);
  }

  Future<http.Response> post(String path, {dynamic body, Map<String, String>? headers}) {
    return http.post(Uri.parse(path), body: body, headers: headers);
  }

  Future<http.Response> patch(String path, {dynamic body, Map<String, String>? headers}) {
    return http.patch(Uri.parse(path),
        body: body, headers: headers);
  }
}
