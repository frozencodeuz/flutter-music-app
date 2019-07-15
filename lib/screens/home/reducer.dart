import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.updateState: _onUpdateState,
    },
  );
}

HomeState _onUpdateState(HomeState state, Action action) {
  return action.payload;
}
