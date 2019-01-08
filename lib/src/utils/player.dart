import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:myapp/src/models/music.dart';
import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/service/music.dart' as musicService;

class PlayerUtils {
  static AudioPlayer _audioPlayer;

  static Future<int> playSong(
      {@required Songs song,
      VoidCallback completionHandler,
      TimeChangeHandler durationHandler,
      TimeChangeHandler positionHandler}) async {
    MusicModel musicModel = await musicService.get(song.id);
    if (_audioPlayer == null) {
      _audioPlayer = new AudioPlayer();
    }
    _audioPlayer.completionHandler = completionHandler;
    _audioPlayer.durationHandler = durationHandler;
    _audioPlayer.positionHandler = positionHandler;
    return _audioPlayer.play(musicModel.data[0].url, isLocal: false);
//    return playResult;
  }

  static Future<int> playSongWithRemote(
      {@required Songs song,
      VoidCallback completionHandler,
      TimeChangeHandler durationHandler,
      TimeChangeHandler positionHandler}) async {
    MusicModel musicModel = await musicService.get(song.id);
    if (_audioPlayer == null) {
      _audioPlayer = new AudioPlayer();
    }
    _audioPlayer.completionHandler = completionHandler;
    _audioPlayer.durationHandler = durationHandler;
    _audioPlayer.positionHandler = positionHandler;
    setNowPlayingInfo(song, 0, 0);
    return _audioPlayer.play(musicModel.data[0].url, isLocal: false);
//    return playResult;
  }

  static setNowPlayingInfo(
      Songs song, double playbackDuration, double elapsedPlaybackTime) {
    _audioPlayer.setNowPlayingInfo(
      song.al.picUrl,
      song.name,
      song.ar.map((ar) => ar.name).join('/'),
      song.al.name,
      playbackDuration,
      elapsedPlaybackTime,
    );
  }

  static get audioPlayer => _audioPlayer;
}
