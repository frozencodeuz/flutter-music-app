import 'package:fish_redux/fish_redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//final loginPersistor = Persistor<LoginState>(
//  storage: FlutterStorage(key: 'LoginState'),
//  serializer: JsonSerializer<LoginState>(LoginState.fromJson),
//);
//
//Middleware<LoginState> loginPersistMiddleware =
//    ({Dispatch dispatch, Get<LoginState> getState}) {
//  return (Dispatch next) {
//    return (Action action) {
//      next(action);
//      final state = getState();
//      loginPersistor.save(state);
//    };
//  };
//};


class LoginPage extends Page<LoginState, Map<String, dynamic>> {
  LoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LoginState>(
                adapter: null,
                slots: <String, Dependent<LoginState>>{
                }),
            middleware: <Middleware<LoginState>>[
//              loginPersistMiddleware,
            ],);

}
