import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';
import 'view/albums.dart';
import 'view/artists.dart';
import 'view/playlist_list.dart';
import 'view/songs.dart';

final textEditingController = TextEditingController();
SearchState searchState;
Dispatch dispatch;
ViewService viewService;

Widget buildView(SearchState a, Dispatch b, ViewService c) {
  searchState = a;
  dispatch = b;
  viewService = c;
  return MyTabbedPage();
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "单曲",
    ),
    Tab(
      text: "歌手",
    ),
    Tab(
      text: "专辑",
    ),
    Tab(
      text: "歌单",
    )
  ];
  TabController _tabController;

  getIndexData() {
    if (textEditingController.text.isEmpty) {
      return;
    }
    switch(_tabController.index){
      case 0:
        dispatch(Action(SearchAction.searchOnlineSongs, payload: { 'keywords': textEditingController.text }));
        break;
      case 1:
        dispatch(Action(SearchAction.searchOnlineArtists, payload: { 'keywords': textEditingController.text }));
        break;
      case 2:
        dispatch(Action(SearchAction.searchOnlineAlbums, payload: { 'keywords': textEditingController.text }));
        break;
      case 3:
        dispatch(Action(SearchAction.searchOnlinePlaylistList, payload: { 'keywords': textEditingController.text }));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.addListener((){
      print(_tabController.index);
      if (!_tabController.indexIsChanging) {
        this.getIndexData();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          cursorColor: Colors.white,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          textInputAction: TextInputAction.search,
          autofocus: true,
          onEditingComplete: () {
            this.getIndexData();
          },
          controller: textEditingController,
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          if (tab.text == myTabs[0].text) {
            return Songs(searchState.songs);
          } else if (tab.text == myTabs[1].text) {
            return Artists(searchState.artists);
          } else if (tab.text == myTabs[2].text) {
            return Albums(searchState.albums);
          } else if (tab.text == myTabs[3].text) {
            return PlaylistList(searchState.playlistList);
          }
          return Center(child: Text(tab.text));
        }).toList(),
      ),
    );
  }
}
