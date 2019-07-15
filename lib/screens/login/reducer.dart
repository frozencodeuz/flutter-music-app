import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.updateState: _onUpdateState,
    },
  );
}

LoginState _onUpdateState(LoginState state, Action action) {
  return action.payload;
}
