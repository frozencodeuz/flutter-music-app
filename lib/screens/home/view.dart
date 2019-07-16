import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myapp/entity/my_playlist.dart';

import 'package:myapp/widgets/player_bar.dart';
import 'state.dart';
import 'view/content.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  var currentPlayingSong;
  if (state.currentSongs.length > 0 && state.currentPlayingIndex != -1) {
    currentPlayingSong = state.currentSongs[state.currentPlayingIndex];
  }
  return Scaffold(
    drawer: viewService.buildComponent('drawer'),
    bottomNavigationBar: PlayerBar(currentPlayingSong),
    appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(""),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(viewService.context)
                  .pushNamed('search', arguments: null);
            })
      ],
    ),
    body: HomeContent(
        state: state,
        onItemClicked: (Playlist playlist) {
          Navigator.of(viewService.context)
              .pushNamed('playlist', arguments: { 'id': playlist.id });
//          Navigator.push(viewService.context,
//              MaterialPageRoute(builder: (context) => MusicListScreen()));
        }),
  );
}
