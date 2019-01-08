import 'dart:async';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/utils/player.dart' as playUtils;
import 'package:rxdart/subjects.dart';

enum PlayerStatus {
  PLAYING,
  LOADING_FILE,
  PAUSE,
}

class PlayerSingleton {
  /// 正在播放的歌单，情况比较多，比如：真的播放某个歌单，加入下一首播放，甚至在朋友哪里点击了一首歌
  List<Songs> playLists = [];
  Songs song = new Songs(name: '');
  PlayerStatus playerStatus;
  int inSeconds = 0;
  Duration duration = Duration();
  int playingIndex = 0;

  PlayerSingleton({ this.song, this.playerStatus, this.playLists = const [], this.playingIndex });
}