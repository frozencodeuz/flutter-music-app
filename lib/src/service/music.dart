import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/src/models/music.dart';
import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/utils/api_client.dart';

Future<MusicModel> getMusic(List ids) async {
  final response = await ApiClient().get("/song/url?id=${ids.join(",")}");
  return MusicModel.fromJson(response.data);
}

Future<MusicModel> get(int id) async {
  return getMusic([id]);
}

Future<MusicModel> covertPrivilegesToMusicList(List ids) {
  return getMusic(ids);
}


Future<MusicDetailModel> covertPrivilegesToMusicDetailList(List ids) async {
  final response = await ApiClient().get("/song/detail?ids=${ids.join(",")}");
  return MusicDetailModel.fromJson(response.data);
}