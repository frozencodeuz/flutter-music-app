import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchAction.updateState: _onUpdateState,
    },
  );
}

SearchState _onUpdateState(SearchState state, Action action) {
  return action.payload;
}
