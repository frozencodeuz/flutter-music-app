import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/screens/home/drawer_component/state.dart';

import 'view.dart';

export 'state.dart';

class DrawerComponent extends Component<UserState> {
  DrawerComponent()
      : super(
          view: buildView,
        );
}
