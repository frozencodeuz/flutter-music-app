import 'dart:ui';

import 'package:myapp/entity/login_user.dart';
import 'package:myapp/entity/music.dart';
import 'package:myapp/entity/my_playlist.dart';
import 'package:myapp/entity/song.dart';
import 'package:myapp/global_store/state.dart';

class LoginState implements GlobalBaseState<LoginState> {
  @override
  LoginState clone() {
    return LoginState();
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
  return LoginState();
}
