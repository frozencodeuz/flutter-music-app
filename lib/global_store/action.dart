import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor, playSong, setCurrentUser, updateState }

class GlobalActionCreator {
  static Action onchangeThemeColor() {
    return const Action(GlobalAction.changeThemeColor);
  }
}
