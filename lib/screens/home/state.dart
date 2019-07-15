import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/global_store/state.dart';
import 'package:myapp/entity/index.dart';

class HomeState implements GlobalBaseState<HomeState> {
  @override
  HomeState clone() {
    return HomeState()
      ..playlistList = this.playlistList

      ..themeColor = this.themeColor
      ..currentPlaylist = this.currentPlaylist
      ..currentPlayingIndex = this.currentPlayingIndex
      ..currentSongs = this.currentSongs
      ..currentMusicResourceList = this.currentMusicResourceList
      ..currentUser = this.currentUser;
  }

  @override
  Color themeColor;

  @override
  Playlist currentPlaylist;

  @override
  int currentPlayingIndex;

  @override
  List<MusicResource> currentMusicResourceList;

  @override
  List<Song> currentSongs;

  @override
  LoginUser currentUser;

  List<Playlist> playlistList;

  HomeState(
      {this.themeColor,
      this.playlistList,
      this.currentPlaylist});

  static HomeState fromJson(dynamic json) => HomeState(
        playlistList: (json['playlistList'] as List).map((v) => Playlist.fromJson(v)).toList(),
      );

  dynamic toJson() => {
        'playlistList':
            this.playlistList.map((playlist) => playlist.toJson()).toList(),
      };
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..playlistList = [];
}
