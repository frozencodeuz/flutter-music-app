import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/global_store/state.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

final persistor = Persistor<PlaylistState>(
  storage: FlutterStorage(key: 'PlaylistState'),
  serializer: JsonSerializer<PlaylistState>(PlaylistState.fromJson),
);

Middleware<PlaylistState> persistMiddleware =
    ({Dispatch dispatch, Get<PlaylistState> getState}) {
  return (Dispatch next) {
    return (Action action) {
      next(action);
      final state = getState();
      persistor.save(state);
    };
  };
};

class PlaylistPage extends Page<PlaylistState, Map<String, dynamic>> {
  PlaylistPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PlaylistState>(
              adapter: null, slots: <String, Dependent<PlaylistState>>{}),
          middleware: <Middleware<PlaylistState>>[
            persistMiddleware,
          ],
        );
}
