import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/player.dart';
import 'package:myapp/src/screens/player.dart';
import 'package:myapp/src/widgets/auto_rotate.dart';
import 'package:myapp/src/widgets/common_image.dart';
import 'package:myapp/src/resources/colors.dart' as AppColors;

import 'package:audioplayers/audioplayers.dart';
import 'package:myapp/src/utils/player.dart';

class ScreenWithPlayerBottomBar extends StatelessWidget {
  final Widget child;

  ScreenWithPlayerBottomBar({this.child});

  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    return Stack(
      children: <Widget>[
        child,
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Card(
                  elevation: 5,
                  clipBehavior: Clip.none,
                  child: StreamBuilder<PlaySong>(
                    stream: appBloc.playController.stream,
                    builder: (context, snapshot){
                      Songs playingSong;
                      if (snapshot.data?.playLists != null) {
                        playingSong = snapshot.data?.playLists[snapshot.data?.playingIndex];
                      }
                     return MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerScreen()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 40,
                                height: 40,
                                  child: SmallDisc(),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${playingSong?.name ?? ''}',
                                      style: TextStyle(fontSize: 17),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${playingSong?.ar?.map((ar) => ar.name)?.join('/') ?? ''}'
                                          '-${playingSong?.al?.name ?? ''}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.subtitleColor),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.skip_next),
                                  onPressed: () {
                                    appBloc.nextSongController.add(NextSong());
                                  }),
                            ],
                          ),
                        ),
                      );
                    },
                  )
              ),
            )
        ),
      ],
    );
  }
}

class SmallDisc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    // TODO: implement build
    return StreamBuilder<AudioPlayerState>(
      stream: PlayerUtils().audioPlayer.onPlayerStateChanged,// appBloc.playingStatusController.stream,
      initialData: appBloc.playing.playerStatus,
      builder: (context, snapshot) {
        return MaterialButton(
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            snapshot.data ==
                AudioPlayerState.PLAYING
                ? appBloc.pauseSongController.add(PauseSong())
                : appBloc.resumeSongController.add(ResumeSong());
          },
          child: Center(
            child: (snapshot.data == AudioPlayerState.PLAYING
                ? AutoRotate(
              child: DiscImage(),
            )
                : DiscImage()),
          ),
        );
      },
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
      builder: (context, snapshot){
        Songs playSong;
        if (snapshot.data != null) {
          playSong = snapshot.data.playLists[snapshot.data.playingIndex];
        }
        return playSong?.al?.picUrl != null
            ? CommonImage(
          picUrl: playSong?.al?.picUrl,
          borderRadius: BorderRadius.circular(20.0),
          width: 40,
          height: 40,
        )
            : Container();
      },
    );
  }
}
