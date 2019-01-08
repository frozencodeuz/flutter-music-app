import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/src/models/personal_fm.dart';
import 'package:myapp/src/utils/api_client.dart';

Future<PersonalFMModel> fetchPersonalFM() async {
  final response = await ApiClient.get("/personal_fm");
  final responseBody = response.body;
  return compute(parsePersonalFM, responseBody);
}

PersonalFMModel parsePersonalFM(String responseBody) {
  final parsed = json.decode(responseBody);
  return PersonalFMModel.fromJson(parsed);
}

Future<PersonalFMModel> getPersonalFM() async {
  return fetchPersonalFM();
}
