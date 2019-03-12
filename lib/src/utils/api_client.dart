import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

String urlPrefix = "https://neteasecloudmusicapi.liuxuanping.com";

class ApiClient {
//  final String name;
//  ApiClient(this.userAgent, this._inner);
//  ApiClient(this.params);

  static ApiClient _apiClient;
  Dio _dio;

  factory ApiClient() {
    if (_apiClient != null) {
      return _apiClient;
    } else {
      _apiClient = new ApiClient._internal();
      return _apiClient;
    }
  }

  ApiClient._internal() {
    _dio = Dio()
      ..options.baseUrl = urlPrefix
      ..options.connectTimeout = 15000
      ..options.receiveTimeout = 1000; // with default Options
    List<Cookie> cookies = [
      new Cookie("MUSIC_U",
          "8d8933803473d4df90b36c81e2018f910097d4f175c7b65a267f3059813e3ffa87796cdce1bac5db5beba0fdce2b6dd97b6b220de7f6b737"),
      new Cookie("__remember_me", "true"),
      new Cookie("__csrf", "70ca27ada30558b5c37d55f295cc82f1")
    ];

    getTemporaryDirectory().then((tempDir) {
      String tempPath = tempDir.path;
      var cookieJar = new PersistCookieJar(dir: tempPath);
      //Save cookies
      cookieJar.saveFromResponse(Uri.parse(urlPrefix), cookies);
      _dio.interceptors.add(CookieManager(CookieJar()));
    });
  }

  Future<Response> get<T>(String url, {Map<String, String> headers}) {
    Options options = new Options(headers: headers);
    return _dio.get<T>(url, options: options);
  }

  Future<Response> post(String url, {Map<String, String> headers, body}) {
    Options options = new Options(headers: headers);
    return _dio.post(url, options: options);
  }
}
