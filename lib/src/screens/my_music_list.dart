import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/my_playlist.dart';
import 'package:myapp/src/models/personal_fm.dart';
import 'package:myapp/src/screens/music_list.dart';
import 'package:myapp/src/screens/search.dart';
import 'package:myapp/src/service/personal_fm.dart';
import 'dart:async';

import 'package:myapp/src/service/music.dart' as musicService;
import 'package:myapp/src/service/user_playlist.dart' as userPlaylistService;
import 'package:myapp/src/widgets/common_image.dart';
import 'package:myapp/src/widgets/screen_with_bottom_player_bar.dart';

class MyMusicListScreen extends StatelessWidget {
  final int id;
  final String title;
  AppBloc appBloc;

  final List<ListItem> menuItems = [
    HeadingItem(""),
    CategoryItem("设置"),
    MessageItem("退出", "退出"),
  ];

  MyMusicListScreen({Key key, @required this.id, @required this.title})
      : super(key: key);

  Future<List<Playlist>> getMusicList() async {
    MyPlayListModel myPlayListModel =
        await userPlaylistService.getUserPlaylist(id: "113217521");

    return myPlayListModel.playlist;
  }

  @override
  Widget build(BuildContext context) {
    appBloc = AppProvider.of(context);
    return Scaffold(
      drawer: Drawer(
//        child: Container(
//          padding: EdgeInsets.all(0),
//          height: 200,
//          color: Theme.of(context).primaryColor,
//          child: Text(
//            '__lxp__',
//            style: Theme.of(context).textTheme.title,
//          ),
//        )
        child: Container(
          padding: EdgeInsets.all(0),
//          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            // Let the ListView know how many items it needs to build
            itemCount: menuItems.length,
            // Provide a builder function. This is where the magic happens! We'll
            // convert each item into a Widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = menuItems[index];
              if (item is HeadingItem) {
                return Container(
                  padding: EdgeInsets.all(0),
                  height: 200,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CommonImage(
                        width: 80,
                        height: 80,
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        picUrl: '',
                      ),
                      Text(
                        '__lxp__',
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .merge(TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              } else if (item is CategoryItem) {
                return ListTile(
                  title: Text(
                    item.category,
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              } else if (item is MessageItem) {
                return MaterialButton(
                  onPressed: () {
                    appBloc.dispose();
                  },
                  child: ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.body),
                  ),
                );
              }
            },
          ),
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title == null ? '首页' : title),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                        fullscreenDialog: true));
              })
        ],
      ),
      body: FutureBuilder<List<Playlist>>(
        future: getMusicList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PlayListPage(playlists: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PlayListPage extends StatelessWidget {
  final List<Playlist> playlists;
  AppBloc appBloc;
  int indexSong = 0;
  bool loadingMusic = false;
  bool playing = false;
  BuildContext context;

  PlayListPage({Key key, this.playlists});

  playlistClicked(Playlist playlist) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              MusicListScreen(id: playlist.id, title: playlist.name)),
    );
  }

  onPersonalFMClicked() async {
    PersonalFMModel personalFMModel = await getPersonalFM();
    List<int> ids =
        personalFMModel.data.map((item) => item.privilege.id).toList();
    MusicDetailModel musicDetailModel =
        await musicService.covertPrivilegesToMusicDetailList(ids);
    appBloc.playController
        .add(PlaySong(playLists: musicDetailModel.songs, playingIndex: 0));
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    appBloc = AppProvider.of(context);
//    appBloc.playSong.add(new PlaySong(song: songs[0], playLists: songs));
    return ScreenWithPlayerBottomBar(
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              onPersonalFMClicked();
            },
            child: Text("私人FM"),
          ),
        ],
      ),
      Container(
        child: Flexible(
          child: ListView.builder(
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                return MaterialButton(
                    onPressed: () {
                      playlistClicked(playlists[index]);
                    },
                    child: Row(
                      children: <Widget>[
                        Text(playlists[index].name),
                      ],
                    ));
              }),
        ),
      ),
    ]));
  }
}

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a heading
class CategoryItem implements ListItem {
  final String category;

  CategoryItem(this.category);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String title;
  final String body;

  MessageItem(this.title, this.body);
}
