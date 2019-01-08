import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/src/models/user.dart';
import 'package:myapp/src/utils/api_client.dart';

Future<UserModel> fetchUser(phone, password) async {
  final response =
      await ApiClient.get("/login/cellphone?phone=$phone&password=$password");
  return compute(parseUser, response.body);
}

UserModel parseUser(String responseBody) {
  final parsed = json.decode(responseBody);
  return UserModel.fromJson(parsed);
}

Future<UserModel> loginWithPhone(phone, password) async {
  return fetchUser(phone, password);
}
