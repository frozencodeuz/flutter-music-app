import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:myapp/entity/index.dart';
import 'package:myapp/utils/player.dart';
import 'package:myapp/widgets/auto_rotate.dart';
import 'package:myapp/widgets/common_image.dart';

import '../state.dart';

class Disc extends StatelessWidget {
  final PlayerState state;

  Disc(this.state);

  @override
  Widget build(BuildContext context) {
    var currentPlayingSong;
    if (state.currentSongs.length > 0 && state.currentPlayingIndex != -1) {
      currentPlayingSong = state.currentSongs[state.currentPlayingIndex];
    }
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
//child: Center(),
              child: DiscImage(currentPlayingSong),
            ),
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("00:00"),
                  Flexible(
                    child: Container(
                        margin: EdgeInsets.only(left: 6, right: 6),
                        height: 2,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[300],
                          value: 0.5,
                          valueColor:
                              new AlwaysStoppedAnimation(Colors.redAccent),
                        )),
                  ),
                  Text("00:00")
                ],
              ),
            ),
//          Container(
//              margin: EdgeInsets.only(bottom: 30),
//              child: Row(
//                mainAxisSize: MainAxisSize.min,
//                children: [
//                  Flexible(
//                      fit: FlexFit.tight,
//                      child: IconButton(
//                          onPressed: () {
//                            print("onPressed============");
//                          },
//                          iconSize: 32.0,
//                          icon: Icon(Icons.pause),
//                          color: Colors.grey)),
//                  Flexible(
//                      fit: FlexFit.tight,
//                      child: IconButton(
//                          onPressed: () {},
//                          // _isPlaying ? () => _pause() : null,
//                          iconSize: 32.0,
//                          icon: Icon(PlayerUtils().audioPlayer.state ==
//                              AudioPlayerState.PLAYING
//                              ? Icons.pause
//                              : Icons.play_arrow),
//                          color: Colors.grey)),
//                  Flexible(
//                      fit: FlexFit.tight,
//                      child: IconButton(
//                          onPressed: () {},
//                          iconSize: 32.0,
//                          icon: new Icon(Icons.skip_next),
//                          color: Colors.grey)),
//                ],
//              )),
          ],
        ),
      ),
    );
  }
}

class DiscImage extends StatelessWidget {
  final Song currentPlayingSong;

  DiscImage(this.currentPlayingSong);

  @override
  Widget build(BuildContext context) {
    return currentPlayingSong?.al?.picUrl != null
        ? CommonImage(
            picUrl: currentPlayingSong?.al?.picUrl,
            borderRadius: BorderRadius.circular(160.0),
            width: 320,
            height: 320,
          )
        : Container(
            width: 320,
            height: 320,
          );
  }
}
