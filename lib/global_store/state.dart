import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/entity/index.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  Color get themeColor;

  set themeColor(Color color);

  /// 当前播放的歌单，注意歌单里面不包含歌曲
  Playlist get currentPlaylist;

  set currentPlaylist(Playlist playlist);

  int get currentPlayingIndex;

  set currentPlayingIndex(int index);

  /// 当前播放的歌单的歌曲URL列表
  List<MusicResource> get currentMusicResourceList;

  set currentMusicResourceList(List<MusicResource> currentMusicResourceList);

  /// 当前播放的歌单的歌曲详情
  List<Song> get currentSongs;

  set currentSongs(List<Song> currentSongs);

  LoginUser get currentUser;

  set currentUser(LoginUser currentUser);

//  GlobalBaseState fromJson(dynamic json);
//  Map<String, dynamic> toJson();
}

class GlobalState implements GlobalBaseState<GlobalState> {
  @override
  Color themeColor;

  GlobalState(
      {this.themeColor,
      this.currentPlaylist,
      this.currentPlayingIndex,
      this.currentSongs,
      this.currentMusicResourceList, this.currentUser})
      : super();

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = this.themeColor
      ..currentPlaylist = this.currentPlaylist
      ..currentPlayingIndex = this.currentPlayingIndex
      ..currentSongs = this.currentSongs
      ..currentMusicResourceList = this.currentMusicResourceList
      ..currentUser = this.currentUser;
  }

  @override
  Playlist currentPlaylist;

  @override
  int currentPlayingIndex;

  @override
  List<Song> currentSongs;

  @override
  List<MusicResource> currentMusicResourceList;

  @override
  LoginUser currentUser;

  static GlobalState fromJson(dynamic json) {
    if (json == null) {
      return GlobalState(
          currentPlaylist: null,
          currentPlayingIndex: -1,
          currentSongs: [],
          currentMusicResourceList: [],
          currentUser: null);
    }
    return GlobalState(
        currentPlaylist: json['current_playlist'] == null
            ? null
            : Playlist.fromJson(json['current_playlist']),
        currentPlayingIndex: json['current_playing_index'] == null
            ? -1
            : json['current_playing_index'] as int,
        currentSongs: json['current_songs'] == null
            ? []
            : (json['current_songs'] as List)
                .map((v) => Song.fromJson(v))
                .toList(),
        currentMusicResourceList: json['current_music_resource_list'] == null
            ? []
            : (json['current_music_resource_list'] as List)
                .map((v) => MusicResource.fromJson(v))
                .toList(),
        currentUser: json["current_user"] != null ? LoginUser.fromJson(json["current_user"]) : null);
  }

  dynamic toJson() {
    return {
      'current_playlist': currentPlaylist?.toJson(),
      'current_playing_index': currentPlayingIndex,
      'current_songs': currentSongs == null
          ? []
          : currentSongs.map((song) => song.toJson()).toList(),
      'current_music_resource_list': currentMusicResourceList == null
          ? []
          : currentMusicResourceList
              .map((musicResource) => musicResource.toJson())
              .toList(),
      'current_user': currentUser.toJson(),
    };
  }
}
