import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/screens/home/drawer_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

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
                  'drawer': DrawConnector() + DrawerComponent(),
                }),
            middleware: <Middleware<HomeState>>[
            ],);

}
