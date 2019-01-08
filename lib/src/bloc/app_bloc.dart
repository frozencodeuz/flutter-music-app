import 'dart:async';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/player.dart';
import 'package:myapp/src/utils/player.dart';
import 'package:rxdart/subjects.dart';

class PlaySong {
  final List<Songs> playLists;
  final playingIndex;

  PlaySong({this.playLists = const [], this.playingIndex});
}

class PauseSong {
  PauseSong();
}

class AppBloc {
  final PlayerSingleton _playing = PlayerSingleton();

  final BehaviorSubject<Songs> _playingSong =
      BehaviorSubject<Songs>(seedValue: new Songs(name: '暂无播放'));

  final BehaviorSubject<PlayerStatus> _playingStatus =
      BehaviorSubject<PlayerStatus>(seedValue: PlayerStatus.PAUSE);

  final BehaviorSubject<Duration> _playingPosition =
      BehaviorSubject<Duration>(seedValue: Duration(seconds: 0));

  final BehaviorSubject<Duration> _duration =
      BehaviorSubject<Duration>(seedValue: Duration(seconds: 0));

  final StreamController<PlaySong> _playController =
      StreamController<PlaySong>();

  AppBloc() {
    _playController.stream.listen((playSong) {
      _playing.playerStatus = PlayerStatus.LOADING_FILE;
      _playing.song = playSong.playLists[playSong.playingIndex];
      _playing.playLists = playSong.playLists;
      _playing.playingIndex = playSong.playingIndex;

      _playingSong.add(playSong.playLists[playSong.playingIndex]);
      _playingStatus.add(PlayerStatus.LOADING_FILE);
      _playSong(playSong.playLists[playSong.playingIndex]);
    });
  }

  void _playSong(Songs song) {
    PlayerUtils.playSong(
      song: song,
      durationHandler: (Duration milliseconds) {
        print('准备就绪:${milliseconds.toString()}');
        if (!milliseconds.isNegative) {
          _playing.playerStatus = PlayerStatus.PLAYING;
          _playing.duration = milliseconds;

          _playingStatus.add(PlayerStatus.PLAYING);
          _duration.add(milliseconds);

          double totalSeconds = milliseconds.inMicroseconds / 1000000;
          PlayerUtils.setNowPlayingInfo(
            song,
            totalSeconds,
            0.00,
          );
        }
      },
      positionHandler: (Duration milliseconds) {
        if (_playing.inSeconds != milliseconds.inSeconds) {
          _playing.inSeconds = milliseconds.inSeconds;
          _playingPosition.add(milliseconds);
        }
      },
      completionHandler: () {
        _playing.playingIndex++;
        playSong.add(PlaySong(playLists: _playing.playLists, playingIndex: _playing.playingIndex));
      },
    ).then((playResult) => {});
  }

//  Sink<CartAddition> get cartAddition => _cartAdditionController.sink;

  Stream<Songs> get playingSong => _playingSong.stream;

  Sink<PlaySong> get playSong => _playController.sink;

//  Sink<PlayerStatus> get playingStatus => _playingStatus.sink;

  Stream<PlayerStatus> get playingStatus => _playingStatus.stream;

  Stream<Duration> get playingPosition => _playingPosition.stream;

  /// 当前播放的歌曲的总时长
  Stream<Duration> get duration => _duration.stream;

  void dispose() {
    _playingSong.close();
    _playController.close();
    _playingStatus.close();
    _playingPosition.close();
    _duration.close();
  }
}
