import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/global_store/state.dart';
import 'package:myapp/entity/index.dart';

class PlaylistState implements GlobalBaseState<PlaylistState> {
  int playlistId;

  PlaylistDetail playlistDetail;

  List<Song> songs;

  @override
  PlaylistState clone() {
    return PlaylistState()
      ..playlistDetail = this.playlistDetail
      ..playlistId = this.playlistId
      ..songs = this.songs

      ..themeColor = this.themeColor
      ..currentPlaylist = this.currentPlaylist
      ..currentPlayingIndex = this.currentPlayingIndex
      ..currentSongs = this.currentSongs
      ..currentMusicResourceList = this.currentMusicResourceList
      ..currentUser = this.currentUser;
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

  PlaylistState(
      {this.playlistId,
      this.playlistDetail,
      this.songs,});

  static PlaylistState fromJson(dynamic json) => PlaylistState(
    playlistId: json['playlistId'] as int,
    playlistDetail: PlaylistDetail.fromJson(json['playlistDetail']),
    songs: (json['songs'] as List).map((song) => Song.fromJson(song)).toList(),
  );

  dynamic toJson() {
    return {
      'playlistId': this.playlistId,
      'playlistDetail': this.playlistDetail.toJson(),
      'songs': this.songs.map((song) => song.toJson()).toList(),
    };
  }

  @override
  LoginUser currentUser;
}

PlaylistState initState(Map<String, dynamic> args) {
  final id = args.putIfAbsent('id', () => 0);
  return PlaylistState()
    ..playlistId = id
    ..playlistDetail = PlaylistDetail()
    ..songs = [];
}
