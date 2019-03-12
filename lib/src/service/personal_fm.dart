import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/src/models/personal_fm.dart';
import 'package:myapp/src/utils/api_client.dart';

Future<PersonalFMModel> getPersonalFM() async {
  final response = await ApiClient().get("/personal_fm");
  return PersonalFMModel.fromJson(response.data);
}
