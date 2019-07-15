import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/entity/single_play_list.dart';
import 'package:myapp/service/index.dart';
import 'action.dart';
import 'state.dart';

Effect<PlaylistState> buildEffect() {
  return combineEffects(<Object, Effect<PlaylistState>>{
    Lifecycle.initState: _init,
    PlaylistAction.fetchPlaylist: _onFetchPlaylist,
    PlaylistAction.fetchSongs: _onFetchSongs,
  });
}

void _init(Action action, Context<PlaylistState> ctx) {
  ctx.dispatch(Action(PlaylistAction.fetchPlaylist, payload: ctx.state.playlistId));
}

/// 说明 : 歌单能看到歌单名字 , 但看不到具体歌单内容 , 调用此接口 , 传入歌单 id, 可 以获取对应歌单内的所有的音乐，
/// 但是返回的trackIds是完整的，tracks 则是不完整的，可拿全部 trackIds 请求一次 song/detail 接口获取所有歌曲的
void _onFetchPlaylist(Action action, Context<PlaylistState> ctx) async {
  PlaylistDetail playlistDetail = await getPlaylistDetail(action.payload);
  PlaylistState state = ctx.state.clone();
  state.playlistDetail = playlistDetail;
  ctx.dispatch(Action(PlaylistAction.updateState, payload: state));
//  await singlePlayListModel.privileges
//  HomeState state = ctx.state.clone();
//  state.playlistList = myPlayListModel.playlist;
}

void _onFetchSongs(Action action, Context<PlaylistState> ctx) async {
//  await covertPrivilegesToMusicDetailList(ids);
//  HomeState state = ctx.state.clone();
//  state.playlistList = myPlayListModel.playlist;
//  ctx.dispatch(Action(HomeAction.updateState, payload: state));
}
