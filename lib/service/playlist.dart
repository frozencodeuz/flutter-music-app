import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/entity/paly_list.dart';
import 'package:myapp/entity/single_play_list.dart';
import 'package:myapp/utils/api_client.dart';

Future<PlayListModel> top() async {
  Response response = await ApiClient().get("/top/playlist?limit=10&order=new");
  PlayListModel top = PlayListModel.fromJson(response.data);
  return top;
}

Future<PlaylistDetail> getPlaylistDetail(int id) async {
  final response = await ApiClient().get("/playlist/detail?id=$id");
  return PlaylistDetail.fromJson(response.data);
}
