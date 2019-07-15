import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/entity/index.dart';
import 'package:myapp/service/index.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchState> buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchAction.searchOnlineSongs: _onSearchOnlineSongs,
    SearchAction.searchOnlineArtists: _onSearchOnlineArtists,
    SearchAction.searchOnlineAlbums: _onSearchOnlineAlbums,
    SearchAction.searchOnlinePlaylistList: _onSearchOnlinePlaylistList,
  });
}

void _onSearchOnlineSongs(Action action, Context<SearchState> ctx) async {
  final json = await search(keywords: action.payload['keywords'], type: 1);
  List<Song> songs =
      (json['result']['songs'] as List).map((v) => Song.fromJson(v)).toList();
  ctx.dispatch(Action(SearchAction.updateState,
      payload: ctx.state.clone()..songs = songs));
}

void _onSearchOnlineArtists(Action action, Context<SearchState> ctx) async {
  final json = await search(keywords: action.payload['keywords'], type: 100);
  List<Artist> artists =
  (json['result']['artists'] as List).map((v) => Artist.fromJson(v)).toList();
  ctx.dispatch(Action(SearchAction.updateState,
      payload: ctx.state.clone()..artists = artists));
}

void _onSearchOnlineAlbums(Action action, Context<SearchState> ctx) async {
  final json = await search(keywords: action.payload['keywords'], type: 10);
  List<Album> albums =
  (json['result']['albums'] as List).map((v) => Album.fromJson(v)).toList();
  ctx.dispatch(Action(SearchAction.updateState,
      payload: ctx.state.clone()..albums = albums));
}

void _onSearchOnlinePlaylistList(Action action, Context<SearchState> ctx) async {
  final json = await search(keywords: action.payload['keywords'], type: 1000);
  List<Playlist> playlistList =
  (json['result']['playlists'] as List).map((v) => Playlist.fromJson(v)).toList();
  ctx.dispatch(Action(SearchAction.updateState,
      payload: ctx.state.clone()..playlistList = playlistList));
}
