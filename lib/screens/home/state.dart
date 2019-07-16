import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/global_store/state.dart';
import 'package:myapp/entity/index.dart';

import 'drawer_component/component.dart';

class HomeState extends GlobalState { // implements GlobalBaseState<HomeState> {
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

//  @override
//  Color themeColor;
//
//  @override
//  Playlist currentPlaylist;
//
//  @override
//  int currentPlayingIndex;
//
//  @override
//  List<MusicResource> currentMusicResourceList;
//
//  @override
//  List<Song> currentSongs;
//
//  @override
//  LoginUser currentUser;

  List<Playlist> playlistList;

  HomeState(
      {
//        this.themeColor,
        this.playlistList,
//        this.currentPlaylist
      });

  static HomeState fromJson(dynamic json) => HomeState(
        playlistList: (json['playlistList'] as List).map((v) => Playlist.fromJson(v)).toList(),
      );

  dynamic toJson() => {
        'playlistList':
            this.playlistList.map((playlist) => playlist.toJson()).toList(),
      };
}

class DrawConnector extends Reselect1<HomeState, UserState, LoginUser> {
  @override
  UserState computed(LoginUser sub0) {
    return UserState()
      ..loginUser = sub0;
  }

  @override
  LoginUser getSub0(HomeState state) {
    return state.currentUser;
  }

  @override
  void set(HomeState state, UserState subState) {
    // TODO: implement set
    throw Exception('Unexcepted to set PageState from ReportState');
  }

}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..playlistList = [];
}
