import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistState>>{
      PlaylistAction.updateState: _onUpdateState,
    },
  );
}

PlaylistState _onUpdateState(PlaylistState state, Action action) {
  return action.payload;
}
