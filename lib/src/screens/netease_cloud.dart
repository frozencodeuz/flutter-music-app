import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/models/music.dart';
import 'package:myapp/src/models/music_details.dart';

import 'package:myapp/src/models/paly_list.dart';
import 'package:myapp/src/models/personal_fm.dart';
import 'package:myapp/src/models/single_play_list.dart';
import 'package:myapp/src/screens/music_list.dart';
import 'package:myapp/src/screens/my_music_list.dart';
import 'package:myapp/src/screens/search.dart';
import 'package:myapp/src/service/music.dart' as musicService;
import 'package:myapp/src/service/personal_fm.dart';
import 'package:myapp/src/service/playlist.dart' as playlistService;
import 'package:myapp/src/widgets/common_image.dart';
import 'package:myapp/src/widgets/screen_with_bottom_player_bar.dart';

class NeteaseCloudScreen extends StatelessWidget {
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
        title: Text('Music'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen(), fullscreenDialog: true));
              })
        ],
      ),
      body: FutureBuilder<PlayListModel>(
        future: playlistService.top(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(playlists: snapshot.data.playlists)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

playlistClicked(int id) async {
//  SinglePlayListModel singlePlaylistModel = await playlistService.get(id);
//  MusicModel musicModel = await musicService.get(singlePlaylistModel.privileges[0].id);
//  int playResult = await audioPlayer.play(musicModel.data[0].url);
//  print(playResult);
//  if (playResult == 1) {
//    // success
//
//  }
}

class PhotosList extends StatelessWidget {
  final List<Playlists> playlists;
  AppBloc appBloc;

  PhotosList({Key key, this.playlists}) : super(key: key);

  onPersonalFMClicked() async {
    PersonalFMModel personalFMModel  = await getPersonalFM();
    List<int> ids = personalFMModel.data.map((item) => item.privilege.id).toList();
    MusicDetailModel musicDetailModel = await musicService.covertPrivilegesToMusicDetailList(ids);
    appBloc.playController.add(PlaySong(playLists: musicDetailModel.songs, playingIndex: 0));
  }

  @override
  Widget build(BuildContext context) {
    appBloc = AppProvider.of(context);
    return ScreenWithPlayerBottomBar(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                onPersonalFMClicked();
              },
              child: Text("私人FM"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyMusicListScreen()),
                );
              },
              child: Text("我喜欢的"),
            )
          ],
        ),
        Flexible(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            return MaterialButton(
              padding: EdgeInsets.all(4),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MusicListScreen(
                          id: playlists[index].id,
                          title: playlists[index].name)),
                );
              },
              child: CommonImage(picUrl: playlists[index].coverImgUrl),
            );
          },
        ))
      ],
    ));
  }
}
