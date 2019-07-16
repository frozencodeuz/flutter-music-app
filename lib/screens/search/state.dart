import 'dart:ui';

import 'package:myapp/entity/index.dart';
import 'package:myapp/global_store/state.dart';

class SearchState extends GlobalState { //  GlobalBaseState<SearchState> {
  List<Song> songs = [];
  List<Artist> artists = [];
  List<Album> albums = [];
  List<Playlist> playlistList = [];

  @override
  SearchState clone() {
    return SearchState()
      ..artists = artists
      ..songs = songs
      ..albums = albums
      ..playlistList = playlistList
      ..currentSongs = currentSongs
      ..currentPlayingIndex = currentPlayingIndex
      ..currentMusicResourceList = currentMusicResourceList
      ..currentPlaylist = currentPlaylist;
  }

  @override
  List<MusicResource> currentMusicResourceList;

  @override
  int currentPlayingIndex;

  @override
  Playlist currentPlaylist;

  @override
  List<Song> currentSongs;

  @override
  Color themeColor;

  SearchState(
      {this.songs,
      this.artists,
      this.albums,
      this.playlistList,
      this.currentMusicResourceList,
      this.currentPlayingIndex,
      this.currentPlaylist,
      this.currentSongs,
      this.themeColor,
      this.currentUser});

  static SearchState fromJson(dynamic json) => SearchState(
        songs: json['songs'].map((v) => Song.fromJson(v)),
        artists: json['artists'].map((v) => Song.fromJson(v)),
        albums: json['albums'].map((v) => Song.fromJson(v)),
        playlistList: json['playlistList'].map((v) => Playlist.fromJson(v)),
        currentMusicResourceList:
            json['currentMusicResourceList'].map((song) => Song.fromJson(song)),
        currentPlayingIndex: json['currentPlayingIndex'] as int,
        currentPlaylist: Playlist.fromJson(json['currentPlaylist']),
        currentSongs: json['currentSongs'].map((song) => Song.fromJson(song)),
        themeColor: json['themeColor'],
        currentUser: json['currentUser'],
      );

  dynamic toJson() => {
        'playlistList':
            this.playlistList.map((playlist) => playlist.toJson()).toList(),
        'songs': this.songs.map((song) => song.toJson()).toList(),
        'artists': this.artists.map((artist) => artist.toJson()).toList(),
        'albums': this.albums.map((album) => album.toJson()).toList(),
        'currentMusicResourceList': this
            .currentMusicResourceList
            .map((musicResource) => musicResource.toJson())
            .toList(),
        'currentPlaylist': this.currentPlaylist?.toJson(),
        'currentPlayingIndex': this.currentPlayingIndex,
        'currentSongs': this.currentSongs.map((song) => song.toJson()).toList(),
        'currentUser': this.currentUser.toJson(),
      };

  @override
  LoginUser currentUser;
}

SearchState initState(Map<String, dynamic> args) {
  return SearchState()
    ..songs = []
    ..artists = []
    ..albums = []
    ..playlistList = []
    ..currentSongs = []
    ..currentMusicResourceList = []
    ..currentPlayingIndex = -1
    ..currentPlaylist = Playlist();
  ;
}
