import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/entity/my_playlist.dart';
import 'action.dart';
import 'state.dart';
import 'service.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    HomeAction.fetchMyPlayList: _onFetchMyPlayList,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  ctx.dispatch(HomeActionCreator.fetchMyPlayListAction());
}

void _onFetchMyPlayList(Action action, Context<HomeState> ctx) async {
  MyPlayListModel myPlayListModel = await getUserPlaylist(id: 113217521);
  HomeState state = ctx.state.clone();
  state.playlistList = myPlayListModel.playlist;
  ctx.dispatch(Action(HomeAction.updateState, payload: state));
}
