import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { action, fetchMyPlayList, updateState }

class HomeActionCreator {
  static Action fetchMyPlayListAction() {
    return const Action(HomeAction.fetchMyPlayList);
  }
}
