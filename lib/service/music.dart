import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/entity/music.dart';
import 'package:myapp/entity/music_details.dart';
import 'package:myapp/utils/api_client.dart';

Future<MusicResource> getMusic(List ids) async {
  final response = await ApiClient().get("/song/url?id=${ids.join(",")}");
  return MusicResource.fromJson(response.data);
}

Future<MusicResource> get(int id) async {
  return getMusic([id]);
}

Future<MusicResource> covertPrivilegesToMusicList(List ids) {
  return getMusic(ids);
}


Future<MusicDetail> covertPrivilegesToMusicDetailList(List ids) async {
  final response = await ApiClient().get("/song/detail?ids=${ids.join(",")}");
  return MusicDetail.fromJson(response.data);
}
