import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/models/player.dart';
import 'package:myapp/src/resources/colors.dart' as AppColors;
import 'package:myapp/src/utils/player.dart';
import 'package:myapp/src/widgets/auto_rotate.dart';
import 'package:myapp/src/widgets/common_image.dart';
import 'dart:async';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/single_play_list.dart';
import 'package:myapp/src/service/playlist.dart' as playlistService;
import 'package:myapp/src/service/music.dart' as musicService;
import 'package:myapp/src/widgets/screen_with_bottom_player_bar.dart';

class MusicListScreen extends StatelessWidget {
  final int id;
  final String title;

  MusicListScreen({Key key, @required this.id, @required this.title})
      : super(key: key);

  Future<MusicDetailModel> getMusicList() async {
    SinglePlayListModel singlePlayListModel = await playlistService.get(id);
    List<int> ids = singlePlayListModel.privileges
        .map((privileges) => privileges.id)
        .toList();
    return musicService.covertPrivilegesToMusicDetailList(ids);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title == null ? '歌单详情' : title),
      ),
      body: FutureBuilder<MusicDetailModel>(
        future: getMusicList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? MusicListPage(songs: snapshot.data.songs)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MusicListPage extends StatelessWidget {
  final List<Songs> songs;
  AppBloc appBloc;
  int indexSong = 0;
  bool loadingMusic = false;
  bool playing = false;

  MusicListPage({Key key, this.songs});

  musicClicked(playlist, int clickedIndex) async {
    appBloc.playController.add(new PlaySong(playLists: playlist, playingIndex: clickedIndex));
  }

  @override
  Widget build(BuildContext context) {
    appBloc = AppProvider.of(context);
//    appBloc.playSong.add(new PlaySong(song: songs[0], playLists: songs));
    return ScreenWithPlayerBottomBar(
      child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return MaterialButton(
              onPressed: () {
                musicClicked(songs, index);
              },
              child: Container(
                padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      child: CommonImage(picUrl: songs[index].al.picUrl, width: 40, height: 40,),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${songs[index].name.trim()}',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              '${songs[index].ar.map((ar) => ar.name).join('/')}-${songs[index].al.name}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.subtitleColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
