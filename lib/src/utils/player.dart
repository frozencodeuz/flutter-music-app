import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:myapp/src/models/music.dart';
import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/service/music.dart' as musicService;

class PlayerUtils {
  AudioPlayer _audioPlayer;
  static PlayerUtils _playerUtils;

  factory PlayerUtils({ onDurationChanged, onPlayerCompletion }) {
    if (_playerUtils != null) {
      return _playerUtils;
    } else {
      _playerUtils = new PlayerUtils._internal(
          onDurationChanged: onDurationChanged,
          onPlayerCompletion: onPlayerCompletion,
      );
      return _playerUtils;
    }
  }

  PlayerUtils._internal({ onDurationChanged, onPlayerCompletion }) {
    _audioPlayer = new AudioPlayer();
    _audioPlayer.onPlayerCompletion.listen((event){
      onPlayerCompletion(event);
    });
    _audioPlayer.onAudioPositionChanged.listen((event){
//      print("onAudioPositionChanged========================");
//      print(event);
    });
    _audioPlayer.onDurationChanged.listen((event){
//      print("onDurationChanged========================");
//      print(event);
//      onDurationChanged && onDurationChanged(event);
    });
    _audioPlayer.onPlayerStateChanged.listen((event){
//      onDurationChanged && onDurationChanged(event);
    });
  }

  Future<int> playSong(
      {@required Songs song}) async {
    MusicModel musicModel = await musicService.get(song.id);
    return _audioPlayer.play(musicModel.data[0].url, isLocal: false);
//    return playResult;
  }

  Future<int> playSongWithRemote(
      {@required Songs song}) async {
    MusicModel musicModel = await musicService.get(song.id);
    if (_audioPlayer == null) {
      _audioPlayer = new AudioPlayer();
    }
    setNowPlayingInfo(song, 0, 0, 1);
    return _audioPlayer.play(musicModel.data[0].url, isLocal: false);
//    return playResult;
  }

  setNowPlayingInfo(
      Songs song, double playbackDuration, double elapsedPlaybackTime, playbackRate) {
//    _audioPlayer.setNowPlayingInfo(
//      song.al.picUrl,
//      song.name,
//      song.ar.map((ar) => ar.name).join('/'),
//      song.al.name,
//      playbackDuration,
//      elapsedPlaybackTime,
//      playbackRate,
//    );
  }

  AudioPlayer get audioPlayer => _audioPlayer;

  void dispose() {
    _audioPlayer.release();
  }
}
