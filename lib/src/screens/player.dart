import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/player.dart';
import 'package:myapp/src/widgets/auto_rotate.dart';
import 'package:myapp/src/widgets/common_image.dart';
import 'package:myapp/src/utils/player.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
        title: StreamBuilder<PlaySong>(
            stream: appBloc.playController.stream,
            initialData: PlaySong(playLists: appBloc.playing.playLists, playingIndex: appBloc.playing.playingIndex),
            builder: (context, snapshot) {
              Songs playingSong;
              if (snapshot.data?.playLists != null) {
                playingSong = snapshot.data?.playLists[snapshot.data?.playingIndex];
              }
              return Text(playingSong == null ? '' : playingSong.name);
            },
          ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: BigDisc(),
            ),
            StreamBuilder<Duration>(
                stream: PlayerUtils().audioPlayer.onAudioPositionChanged,
                builder: (context, positionSnapshot) => StreamBuilder<Duration>(
                    stream: PlayerUtils().audioPlayer.onDurationChanged,
                    initialData: null,
                    builder: (context, durationSnapshot) => Container(
                          margin: EdgeInsets.only(
                              top: 16, bottom: 16, left: 16, right: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40,
                                child: Text(
                                    (positionSnapshot.data).toString().length > 6
                                        ? (positionSnapshot.data).toString().substring(2, 7)
                                        : ""),
                              ),
                              Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: 6, right: 6),
                                    height: 2,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey[300],
                                      value: (positionSnapshot.data != null
                                      && positionSnapshot
                                              .data.inMilliseconds > 0 )
                                          ? positionSnapshot
                                                  .data.inMilliseconds /
                                              durationSnapshot
                                                  .data.inMilliseconds
                                          : 0.0,
                                      valueColor: new AlwaysStoppedAnimation(
                                          Colors.redAccent),
                                    )),
                              ),
                              Container(
                                  width: 40,
                                  child: Text((durationSnapshot.data).toString().substring(2, 7))),
                            ],
                          ),
                        ))),
            StreamBuilder<AudioPlayerState>(
              stream: PlayerUtils().audioPlayer.onPlayerStateChanged,
              builder: (context, playingStatusSnapshot) => Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: StreamBuilder<ChangePlayOrder>(
                            stream: appBloc.changePlayOrderController.stream,
                            initialData: ChangePlayOrder(order: appBloc.playing.order),
                            builder: (context, playingOrderSnapshot) {
                              IconData iconData = Icons.repeat;
                              Order order = playingOrderSnapshot.data.order;
                              if (order ==
                                  Order.DEFAULT) {
                                order = Order.SINGLE_CYCLE;
                                iconData = Icons.plus_one;
                              } else if (order ==
                                  Order.RANDOM) {
                                order = Order.DEFAULT;
                                iconData = Icons.shuffle;
                              } else if (order ==
                                  Order.SINGLE_CYCLE) {
                                order = Order.RANDOM;
                                iconData = Icons.repeat;
                              }
                              return IconButton(
                                  onPressed: () {
                                    print("onPressed============");
                                    print(order);
                                    appBloc.changePlayOrderController
                                        .add(ChangePlayOrder(order: order));
                                  },
                                  iconSize: 32.0,
                                  icon: Icon(iconData),
                                  color: Colors.grey);
                            },
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          child: IconButton(
                              onPressed: () {
                                playingStatusSnapshot.data ==
                                        AudioPlayerState.PLAYING
                                    ? appBloc.pauseSongController
                                        .add(PauseSong())
                                    : appBloc.resumeSongController
                                        .add(ResumeSong());
                              },
                              // _isPlaying ? () => _pause() : null,
                              iconSize: 32.0,
                              icon: Icon(PlayerUtils().audioPlayer.state ==
                                      AudioPlayerState.PLAYING
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              color: Colors.grey)),
                      Flexible(
                          fit: FlexFit.tight,
                          child: IconButton(
                              onPressed: () {
                                appBloc.nextSongController.add(NextSong());
                              },
                              iconSize: 32.0,
                              icon: new Icon(Icons.skip_next),
                              color: Colors.grey)),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class BigDisc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    // TODO: implement build
    return StreamBuilder<AudioPlayerState>(
      stream: PlayerUtils().audioPlayer.onPlayerStateChanged,
      initialData: appBloc.playing.playerStatus,
      builder: (context, snapshot) => Center(
            child: (snapshot.data == AudioPlayerState.PLAYING
                ? new AutoRotate(child: DiscImage())
                : DiscImage()),
          ),
    );
  }
}

class DiscImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    // TODO: implement build
    return StreamBuilder<PlaySong>(
      stream: appBloc.playController.stream,
      initialData: PlaySong(playLists: appBloc.playing.playLists, playingIndex: appBloc.playing.playingIndex),
      builder: (context, snapshot) {
        Songs playingSong;
        if (snapshot.data?.playLists != null) {
          playingSong = snapshot.data?.playLists[snapshot.data?.playingIndex];
        }
        return playingSong?.al?.picUrl != null
            ? CommonImage(
                picUrl: playingSong?.al?.picUrl,
                borderRadius: BorderRadius.circular(160.0),
                width: 320,
                height: 320,
              )
            : Container(
                width: 320,
                height: 320,
              );
      },
    );
  }
}
