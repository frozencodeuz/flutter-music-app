import 'dart:async';
import 'dart:math';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/player.dart';
import 'package:myapp/src/utils/player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class PlaySong {
  final List<Songs> playLists;
  final playingIndex;

  PlaySong({this.playLists = const [], this.playingIndex});
}

class PauseSong {
  PauseSong();
}

class NextSong {
  NextSong();
}

class ResumeSong {
  ResumeSong();
}

class ChangePlayOrder{
  final Order order;

  ChangePlayOrder({this.order});
}

class AppBloc {
  final PlayerSingleton _playing = PlayerSingleton();
  PlayerSingleton get playing => _playing;

  final StreamController<PlaySong> playController =
      StreamController.broadcast();
  final StreamController<ChangePlayOrder> changePlayOrderController =
  StreamController.broadcast();
  final StreamController<NextSong> nextSongController =
  StreamController.broadcast();
  final StreamController<PauseSong> pauseSongController =
  StreamController.broadcast();
  final StreamController<ResumeSong> resumeSongController =
  StreamController.broadcast();
  final StreamController<PlayerStatus> playingStatusController =
  StreamController.broadcast();


  AppBloc() {
    // 初始化时恢复播放状态
    SharedPreferences.getInstance().then((sharedPreferences) {
      String playingJson = sharedPreferences.getString('playing');
      print("初始化时恢复播放状态");
      print(playingJson);
    });

    PlayerUtils(onDurationChanged: (milliseconds){
      print('准备就绪:${milliseconds.toString()}');
    }, onPlayerCompletion: (event) => playNextSong());

    playController.stream.listen((playSong) {
      _playing.playerStatus = AudioPlayerState.PLAYING;
      _playing.playLists = playSong.playLists;
      _playing.playingIndex = playSong.playingIndex;

//      _playingSong.add(playSong.playLists[playSong.playingIndex]);
      playingStatusController.add(PlayerStatus.LOADING_FILE);
      _playSong(playSong.playLists[playSong.playingIndex]);
    });

    changePlayOrderController.stream.listen((changePlayOrder){
      _playing.order = changePlayOrder.order;
    });

    nextSongController.stream.listen((nextSong){
      playNextSong();
    });

    pauseSongController.stream.listen((pauseSong){
      PlayerUtils().audioPlayer.pause();
    });

    resumeSongController.stream.listen((resumeSong){
      PlayerUtils().audioPlayer.resume();
      _playing.playerStatus = AudioPlayerState.PLAYING;
    });
  }

  void _playSong(Songs song) {
    PlayerUtils().playSong(
      song: song,
    ).then((playResult) => {});
  }

  void playNextSong() {
    print(_playing.toJson());
    if (_playing.order == Order.DEFAULT) {
      if (_playing.playingIndex == _playing.playLists.length - 1) {
        // 最后一首歌
        _playing.playingIndex = 0;
      } else {
        _playing.playingIndex = _playing.playingIndex + 1;
      }
    } else if (_playing.order == Order.RANDOM) {
      // TODO 排除当前session已经随机到过的歌曲
      _playing.playingIndex = Random().nextInt(_playing.playLists.length) - 1;
    } else if (_playing.order == Order.SINGLE_CYCLE) {

    }
    playController.add(PlaySong(playLists: _playing.playLists, playingIndex: _playing.playingIndex));
  }

//  Sink<PlaySong> get playSong => playController.sink;
//  Sink<ChangePlayOrder> get playOrder => _changePlayOrderController.sink;
//  Sink<NextSong> get nextSong => _nextSongController.sink;
//  Sink<PauseSong> get pauseSong => _pauseSongController.sink;
//  Sink<ResumeSong> get resumeSong => _resumeSongController.sink;
//  Sink<CartAddition> get cartAddition => _cartAdditionController.sink;

//  Stream<Songs> get playingSong => _playingSong.stream;
//  Stream<PlayerStatus> get playingStatus => _playingStatus.stream;
//  Stream<Order> get playingOrder => _playingOrder.stream;
//  Stream<Duration> get playingPosition => _playingPosition.stream;
//  /// 当前播放的歌曲的总时长
//  Stream<Duration> get duration => _duration.stream;

  void dispose() {
    // 保存播放状态，重新初始化时恢复
    SharedPreferences.getInstance().then((sharedPreferences) {
      print("保存播放状态，重新初始化时恢复");
      sharedPreferences.setString('playing', _playing.toJson().toString());
    });

    playController.close();
    changePlayOrderController.close();
    nextSongController.close();
    pauseSongController.close();
    resumeSongController.close();

//    _playingSong.close();
//    _playingStatus.close();
//    _playingOrder.close();
//    _playingPosition.close();
//    _duration.close();
    PlayerUtils().dispose();
  }
}
