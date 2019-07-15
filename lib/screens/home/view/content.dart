import 'package:flutter/material.dart';
import 'package:myapp/entity/my_playlist.dart';
import 'package:myapp/screens/home/state.dart';

class HomeContent extends StatelessWidget {
  HomeState state;
  Function onItemClicked;

  HomeContent({Key key, @required this.state, this.onItemClicked})
      : super(key: key);

  playlistClicked(Playlist playlist) async {
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) =>
//              MusicListScreen(id: playlist.id, title: playlist.name)),
//    );
  }

  onPersonalFMClicked() async {
//    PersonalFMModel personalFMModel = await getPersonalFM();
//    List<int> ids =
//    personalFMModel.data.map((item) => item.privilege.id).toList();
//    MusicDetailModel musicDetailModel =
//    await musicService.covertPrivilegesToMusicDetailList(ids);
//    appBloc.playController
//        .add(PlaySong(playLists: musicDetailModel.songs, playingIndex: 0));
  }

  Future<List<Playlist>> getMusicList() async {
    return null;
//    MyPlayListModel myPlayListModel = await userPlaylistService.getUserPlaylist(
//        id: appBloc.userModel.account.id);
//    return myPlayListModel.playlist;
  }

  @override
  Widget build(BuildContext context) {
    final playlistList = this.state.playlistList;
    return playlistList != null
        ? Column(children: <Widget>[
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
                    itemCount: playlistList.length,
                    itemBuilder: (context, index) {
                      return MaterialButton(
                          onPressed: () {
                            this.onItemClicked(playlistList[index]);
                          },
                          child: Row(
                            children: <Widget>[
                              Text(playlistList[index].name),
                            ],
                          ));
                    }),
              ),
            ),
          ])
        : Center(child: CircularProgressIndicator());
  }
}
