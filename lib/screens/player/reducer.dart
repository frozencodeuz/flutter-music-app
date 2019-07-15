import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayerState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayerState>>{
      PlayerAction.updateState: _updateState,
    },
  );
}

PlayerState _updateState(PlayerState state, Action action) {
  final PlayerState newState = state.clone();
  return newState;
}
