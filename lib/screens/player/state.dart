import 'dart:ui';

import 'package:myapp/entity/index.dart';
import 'package:myapp/global_store/state.dart';

class PlayerState extends GlobalBaseState<PlayerState> {

  @override
  PlayerState clone() {
    return PlayerState();
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
}

PlayerState initState(Map<String, dynamic> args) {
  return PlayerState();
}
