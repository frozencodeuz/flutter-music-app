import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:myapp/entity/login_user.dart';
import 'package:myapp/entity/music.dart';
import 'package:myapp/entity/my_playlist.dart';
import 'package:myapp/entity/song.dart';
import 'package:myapp/global_store/state.dart';

class LoginState implements GlobalBaseState<LoginState> {
  @override
  LoginState clone() {
    return LoginState()
    ..accountEditingController = accountEditingController
    ..passwordEditingController = passwordEditingController

    ..themeColor = this.themeColor
    ..currentPlaylist = this.currentPlaylist
    ..currentPlayingIndex = this.currentPlayingIndex
    ..currentSongs = this.currentSongs
    ..currentMusicResourceList = this.currentMusicResourceList
    ..currentUser = this.currentUser;
  }

  @override
  List<MusicResource> currentMusicResourceList;

  @override
  int currentPlayingIndex;

  @override
  Playlist currentPlaylist;

  @override
  List<Song> currentSongs;

  @override
  Color themeColor;

  @override
  LoginUser currentUser;

  TextEditingController accountEditingController;
  TextEditingController passwordEditingController;
  String account;
  String password;

  LoginState();

  static LoginState fromJson(dynamic json) => LoginState(
//        themeColor: json['themeColor'],
      );

  dynamic toJson() {
    return {
    };
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState()
    ..accountEditingController = TextEditingController(text: '')
    ..passwordEditingController = TextEditingController(text: '');
}
