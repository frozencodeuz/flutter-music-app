import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/src/models/music.dart';
import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/utils/api_client.dart';

ApiClient apiClient = new ApiClient();

Future<MusicModel> getMusic(List ids) async {
  final response = await apiClient.get("/song/url?id=${ids.join(",")}");
  String responseBody = response.body;
  return compute(parseMusic, responseBody);
}

MusicModel parseMusic(String responseBody) {
  final parsed = json.decode(responseBody);
  return MusicModel.fromJson(parsed);
}

Future<MusicModel> get(int id) async {
  return getMusic([id]);
}

Future<MusicModel> covertPrivilegesToMusicList(List ids) {
  return getMusic(ids);
}





Future<MusicDetailModel> getMusicDetailList(List ids) async {
  final response = await apiClient.get("/song/detail?ids=${ids.join(",")}");
  String responseBody = response.body;
  return compute(parseMusicDetail, responseBody);
}

MusicDetailModel parseMusicDetail(String responseBody) {
  final parsed = json.decode(responseBody);
  return MusicDetailModel.fromJson(parsed);
}
Future<MusicDetailModel> covertPrivilegesToMusicDetailList(List ids) {
  return getMusicDetailList(ids);
}