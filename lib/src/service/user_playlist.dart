import 'package:myapp/src/models/my_playlist.dart';
import 'package:myapp/src/utils/api_client.dart';

Future<MyPlayListModel> getUserPlaylist({ id }) async {
  final response = await ApiClient().get("/user/playlist?uid=$id");
  return MyPlayListModel.fromJson(response.data);
}
