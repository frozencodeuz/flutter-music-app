import 'package:myapp/entity/index.dart';
import 'package:audioplayers/audioplayers.dart';

enum PlayerStatus {
  PLAYING,
  LOADING_FILE,
  PAUSE,
}

enum Order {
  DEFAULT,
  RANDOM,
  SINGLE_CYCLE,
}

class PlayerSingleton {
  /// 正在播放的歌单，情况比较多，比如：真的播放某个歌单，加入下一首播放，甚至在朋友哪里点击了一首歌
  List<Song> playLists = [];
  AudioPlayerState playerStatus;
  /// 当前歌曲已播放时长
  int inSeconds = 0;
  /// 当前歌曲总时长
  Duration duration = Duration();
  int playingIndex = 0;
  Order order;

  PlayerSingleton({ this.playerStatus, this.playLists = const [], this.playingIndex, this.order = Order.DEFAULT });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playLists != null) {
      data['playLists'] = this.playLists.map((v) => v.toJson()).toList();
    }
    data["playerStatus"] = this.playerStatus.toString();
    data["inSeconds"] = this.inSeconds;
    data["duration"] = this.duration.toString();
    data["playingIndex"] = this.playingIndex;
    data["order"] = this.order.toString();

    return data;
  }

  PlayerSingleton.fromJson(Map<String, dynamic> json) {
    playerStatus = json['playerStatus'];
    inSeconds = json['inSeconds'];
    duration = json['duration'];
    playingIndex = json['playingIndex'];
    order = json['order'];
    if (json['playLists'] != null) {
      playLists = json['playLists'];
    }
  }
}
