import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'reducer.dart';
import 'state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(initialState, buildReducer());

  static GlobalState initialState = GlobalState(
    currentSongs: [],
    currentPlaylist: null,
    currentPlayingIndex: -1,
    currentMusicResourceList: [],
    themeColor: Colors.blue,
  );
}
