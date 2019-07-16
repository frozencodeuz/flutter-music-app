import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

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
          ],
        );
}
