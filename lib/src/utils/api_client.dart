import 'package:http/http.dart' as http;

String urlPrefix = "https://neteasecloudmusicapi.liuxuanping.com";

class ApiClient {
//  final String name;
//  ApiClient(this.userAgent, this._inner);
//  ApiClient(this.params);

  static ApiClient _apiClient;

  factory ApiClient () {
    if (_apiClient != null) {
      return _apiClient;
    } else {
      _apiClient = new ApiClient._internal();
      return _apiClient;
    }
  }

  ApiClient._internal();

  static Future<http.Response> get(String url, {Map<String, String> headers}) {
    if (!url.startsWith('http')) {
      url = urlPrefix + url;
    }
    if (headers == null) {
      headers = new Map();
    }
    headers.putIfAbsent("Cookie", () => "8d8933803473d4df90b36c81e2018f910097d4f175c7b65a267f3059813e3ffa87796cdce1bac5db5beba0fdce2b6dd97b6b220de7f6b737");
    return http.get(url, headers: headers);
  }

  static Future<http.Response> post(String url, {Map<String, String> headers, body}) {
    if (!url.startsWith('http')) {
      url = urlPrefix + url;
    }
    if (headers == null) {
      headers = new Map();
    }
    headers.putIfAbsent("Cookie", () => "8d8933803473d4df90b36c81e2018f910097d4f175c7b65a267f3059813e3ffa87796cdce1bac5db5beba0fdce2b6dd97b6b220de7f6b737");
    return http.post(url, headers: headers, body: body);
  }

}