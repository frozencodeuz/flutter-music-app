import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/entity/personal_fm.dart';
import 'package:myapp/utils/api_client.dart';

Future<PersonalFMModel> getPersonalFM() async {
  final response = await ApiClient().get("/personal_fm");
  return PersonalFMModel.fromJson(response.data);
}
