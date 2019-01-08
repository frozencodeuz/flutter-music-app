import 'package:flutter/material.dart';

import 'package:myapp/src/models/paly_list.dart';
import 'package:myapp/src/screens/music_list.dart';
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
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: null)
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

  PhotosList({Key key, this.playlists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWithPlayerBottomBar(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MusicListScreen(id: playlists[index].id, title: playlists[index].name)),
              );
            },
            child: CommonImage(picUrl: playlists[index].coverImgUrl),
          );
        },
      ),
    );
  }
}