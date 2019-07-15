import 'package:fish_redux/fish_redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

final homePersistor = Persistor<HomeState>(
  storage: FlutterStorage(key: 'HomeState'),
  serializer: JsonSerializer<HomeState>(HomeState.fromJson),
);

Middleware<HomeState> homePersistMiddleware =
    ({Dispatch dispatch, Get<HomeState> getState}) {
  return (Dispatch next) {
    return (Action action) {
      next(action);
      final state = getState();
      homePersistor.save(state);
    };
  };
};

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                }),
            middleware: <Middleware<HomeState>>[
              homePersistMiddleware
            ],);

}
