import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
      GlobalAction.updateState: _onUpdateState,
    },
  );
}

List<Color> _colors = <Color>[
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.blue
];

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  final Color next =
      _colors[((_colors.indexOf(state.themeColor) + 1) % _colors.length)];
  return state.clone()..themeColor = next;
}

final globalPersistor = Persistor<GlobalState>(
  debug: true,
  storage: FlutterStorage(key: 'GlobalState'),
  serializer: JsonSerializer<GlobalState>(GlobalState.fromJson),
);

GlobalState _onUpdateState(GlobalState state, Action action) {
  // 保存数据到shared_preferences
//  final persistor = Persistor<GlobalState>(
//    storage: FlutterStorage(),
//    serializer: JsonSerializer<GlobalState>(GlobalState.fromJson),
//  );
  globalPersistor.save(action.payload);
  return action.payload;
}

