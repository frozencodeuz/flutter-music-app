import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/src/models/paly_list.dart';
import 'package:myapp/src/models/single_play_list.dart';
import 'package:myapp/src/utils/api_client.dart';

ApiClient apiClient = new ApiClient();

Future<PlayListModel> fetchPlayList() async {
  final response = await apiClient.get("/top/playlist?limit=10&order=new");
  return compute(parsePlayList, response.body);
}

PlayListModel parsePlayList(String responseBody) {
    final parsed = json.decode(responseBody);
  return PlayListModel.fromJson(parsed);
}

Future<PlayListModel> top() async {
  return fetchPlayList();
}


Future<SinglePlayListModel> getPlayList(id) async {
  final response = await apiClient.get("/playlist/detail?id=$id");
  return compute(parseSinglePlayList, response.body);
}

SinglePlayListModel parseSinglePlayList(String responseBody) {
  final parsed = json.decode(responseBody);
  return SinglePlayListModel.fromJson(parsed);
}

Future<SinglePlayListModel> get(int id) async {
  return getPlayList(id);
}