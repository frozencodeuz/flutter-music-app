import "package:cookie_jar/cookie_jar.dart";
import "package:dio/dio.dart";

String urlPrefix = "https://neteasecloudmusicapi.liuxuanping.com";
//String urlPrefix = "http://10.44.51.79:3000";

class ApiClient extends Dio {
  static ApiClient _apiClient;

  factory ApiClient({ cookiesPath }) {
    if (_apiClient != null) {
      return _apiClient;
    } else {
      _apiClient = new ApiClient._internal()
        ..options.baseUrl = urlPrefix
        ..options.connectTimeout = 15000
        ..options.receiveTimeout = 1000; // with default Options
      var cookieJar = new PersistCookieJar(dir: cookiesPath);
      _apiClient.interceptors.add(CookieManager(cookieJar));
      return _apiClient;
    }
  }

  ApiClient._internal();

}
