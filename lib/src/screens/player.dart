import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_provider.dart';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/player.dart';
import 'package:myapp/src/widgets/auto_rotate.dart';
import 'package:myapp/src/widgets/common_image.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: StreamBuilder<Songs>(
            stream: appBloc.playingSong,
            builder: (context, snapshot) => Text(snapshot.data.name)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BigDisc(),
            StreamBuilder<Duration>(
                stream: appBloc.playingPosition,
                builder: (context, positionSnapshot) => StreamBuilder<Duration>(
                    stream: appBloc.duration,
                    initialData: null,
                    builder: (context, durationSnapshot) => Container(
                          margin: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40,
                                child: Text(
                                    (positionSnapshot.data).toString().length >
                                            6
                                        ? (positionSnapshot.data)
                                            .toString()
                                            .substring(2, 7)
                                        : ""),
                              ),
                              Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: 6, right: 6),
                                    height: 2,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey[300],
                                      value:
                                          positionSnapshot.data.inMilliseconds >
                                                  0
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
                                  child: Text((durationSnapshot.data)
                                      .toString()
                                      .substring(2, 7))),
                            ],
                          ),
                        ))),
            StreamBuilder<PlayerStatus>(
                stream: appBloc.playingStatus,
                builder: (context, playingStatusSnapshot) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        new IconButton(
                            onPressed: null,
                            // _isPlaying ? null : () => _play(),
                            iconSize: 32.0,
                            icon: new Icon(Icons.play_arrow),
                            color: Colors.cyan),
                        new IconButton(
                            onPressed: playingStatusSnapshot.data ==
                                    PlayerStatus.PLAYING
                                ? null
                                : null,
                            // _isPlaying ? () => _pause() : null,
                            iconSize: 32.0,
                            icon: Icon(playingStatusSnapshot.data ==
                                    PlayerStatus.PLAYING
                                ? Icons.pause
                                : Icons.play_arrow),
                            color: Colors.cyan),
                        new IconButton(
                            onPressed: null,
                            // _isPlaying || _isPaused ? () => _stop() : null,
                            iconSize: 32.0,
                            icon: new Icon(Icons.stop),
                            color: Colors.cyan),
                      ],
                    )),
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
    return StreamBuilder<PlayerStatus>(
      stream: appBloc.playingStatus,
      initialData: null,
      builder: (context, snapshot) => Center(
            child: snapshot.data == PlayerStatus.LOADING_FILE
                ? CircularProgressIndicator()
                : (snapshot.data == PlayerStatus.PLAYING
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
    return StreamBuilder<Songs>(
      stream: appBloc.playingSong,
      initialData: null,
      builder: (context, snapshot) => snapshot.data?.al?.picUrl != null
          ? CommonImage(
              picUrl: snapshot.data?.al?.picUrl,
              borderRadius: BorderRadius.circular(160.0),
              width: 320,
              height: 320,
            )
          : Container(
              width: 320,
              height: 320,
            ),
    );
  }
}
