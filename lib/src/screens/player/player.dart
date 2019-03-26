import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/screens/player/comment.dart';
import 'package:myapp/src/screens/player/disk.dart';

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
      body: PageView(children: <Widget>[
        Disc(),
        Comment(),
      ],),
    );
  }
}
