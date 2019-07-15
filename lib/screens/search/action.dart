import 'package:fish_redux/fish_redux.dart';

enum SearchAction { searchOnlineSongs, searchOnlineArtists, searchOnlineAlbums, searchOnlinePlaylistList, updateState }

class SearchActionCreator {
  static Action onSearchOnlineSongs(keywords) {
    return Action(SearchAction.searchOnlineSongs, payload: { "keywords": keywords });
  }
  static Action onSearchOnlineArtists(keywords) {
    return Action(SearchAction.searchOnlineArtists, payload: { "keywords": keywords });
  }
  static Action onSearchOnlineAlbums(keywords) {
    return Action(SearchAction.searchOnlineAlbums, payload: { "keywords": keywords });
  }
  static Action onSearchOnlinePlaylistList(keywords) {
    return Action(SearchAction.searchOnlinePlaylistList, payload: { "keywords": keywords });
  }
}
