import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myapp/entity/index.dart';

import 'action.dart';
import 'state.dart';
import 'view/comment.dart';
import 'view/disk.dart';

Widget buildView(
    PlayerState state, Dispatch dispatch, ViewService viewService) {
  Song currentPlayingSong;
  if (state.currentSongs.length > 0 && state.currentPlayingIndex != -1) {
    currentPlayingSong = state.currentSongs[state.currentPlayingIndex];
  }
  return Scaffold(
    appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Column(
        children: <Widget>[
          Text(currentPlayingSong.name),
          Text('${currentPlayingSong.ar.map((ar) => ar.name).join('/')} - ${currentPlayingSong.al.name}', style: TextStyle(fontSize: 12),)
        ],
      ),
    ),
    body: PageView(
      onPageChanged: (index) {
        print('object:$index');
      },
      children: <Widget>[
        Disc(state),
        Disc(state),
//      Comment(state),
      ],
    ),
  );
}
