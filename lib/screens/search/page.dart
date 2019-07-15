import 'package:fish_redux/fish_redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

final searchPersistor = Persistor<SearchState>(
  storage: FlutterStorage(key: 'SearchState'),
  serializer: JsonSerializer<SearchState>(SearchState.fromJson),
);

Middleware<SearchState> searchPersistMiddleware =
    ({Dispatch dispatch, Get<SearchState> getState}) {
  return (Dispatch next) {
    return (Action action) {
      next(action);
      final state = getState();
      searchPersistor.save(state);
    };
  };
};

class SearchPage extends Page<SearchState, Map<String, dynamic>> {
  SearchPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SearchState>(
              adapter: null, slots: <String, Dependent<SearchState>>{}),
          middleware: <Middleware<SearchState>>[searchPersistMiddleware],
        );
}
