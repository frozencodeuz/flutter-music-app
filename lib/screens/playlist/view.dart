import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:myapp/global_store/action.dart';
import 'package:myapp/global_store/state.dart';
import 'package:myapp/global_store/store.dart';
import 'package:myapp/widgets/auto_listview.dart';
import 'package:myapp/widgets/common_image.dart';
import 'package:myapp/widgets/player_bar.dart';
import 'package:myapp/entity/index.dart';

import 'action.dart';
import 'state.dart';

songClicked(tracks, index, PlaylistState state) {
  final globalState = GlobalState().clone()
    ..currentPlaylist = state.currentPlaylist
    ..currentPlayingIndex = index
    ..currentSongs = state.playlistDetail.playlist.tracks.map((track) {
      final json = track.toJson();
      Song song = Song.fromJson(json);
      return song;
    }).toList();
  GlobalStore.store
      .dispatch(Action(GlobalAction.updateState, payload: globalState));
}

Widget buildView(
    PlaylistState state, Dispatch dispatch, ViewService viewService) {
  final tracks = state.playlistDetail?.playlist?.tracks ?? [];
  var currentPlayingSong;
  if (state.currentSongs.length > 0 && state.currentPlayingIndex != -1) {
    currentPlayingSong = state.currentSongs[state.currentPlayingIndex];
  }
  return Scaffold(
      bottomNavigationBar: PlayerBar(currentPlayingSong),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(state.playlistDetail?.playlist?.name ?? ''),
      ),
      body: AutoListView(
        itemCount: tracks?.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {
              songClicked(tracks, index, state);
            },
            child: Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    child: CommonImage(
                      picUrl: tracks[index].al.picUrl,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${tracks[index].name.trim()}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                '${tracks[index].ar.map((ar) => ar.name).join('/')} - ${tracks[index].al.name}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ));
}
