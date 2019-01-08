import 'package:http/http.dart' as http;

String urlPrefix = "http://120.79.86.120";

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

  Future<http.Response> get(String url, {Map<String, String> headers}) {
    if (!url.startsWith('http')) {
      url = urlPrefix + url;
    }
    return http.get(url, headers: headers);
  }

}