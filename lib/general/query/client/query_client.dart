import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

//TODO: テスト書く
class QueryClient {
  Future<http.Response> get(String path, {Map<String, String>? headers}) {
    headers ??= {};
    _setDefaultValuesToHeaders(headers);
    return http.get(Uri.parse(path), headers: headers);
  }

  Future<http.Response> post(String path,
      {dynamic body, Map<String, String>? headers}) {
    headers ??= {};
    _setDefaultValuesToHeaders(headers);
    return http.post(Uri.parse(path), body: body, headers: headers);
  }

  Future<http.Response> patch(String path,
      {dynamic body, Map<String, String>? headers}) {
    headers ??= {};
    _setDefaultValuesToHeaders(headers);
    return http.patch(Uri.parse(path), body: body, headers: headers);
  }

  Future<http.Response> delete(String path, {Map<String, String>? headers}) {
    headers ??= {};
    _setDefaultValuesToHeaders(headers);
    return http.delete(Uri.parse(path), headers: headers);
  }

  void _setDefaultValuesToHeaders(Map<String, String> headers) {
    headers["Content-Type"] ??= "application/json";
    headers["data-access-key"] ??= dotenv.env["ACCESS_KEY"]!;
  }
}
