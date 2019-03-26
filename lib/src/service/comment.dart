import 'package:myapp/src/models/comment.dart';
import 'package:myapp/src/utils/api_client.dart';

Future<CommentModel> getMusicComment(id, { limit = 20, offset = 0 }) async {
  final response = await ApiClient().get("/comment/music?id=$id&limit=$limit&offset=$offset");
  print(response);
  return CommentModel.fromJson(response.data);
}

class ApiResponse {
  int code;

  ApiResponse(this.code);

  static ApiResponse fromJson(Map jsonMap) {
    return ApiResponse(jsonMap['code']);
  }
}

/// [t] : 是否点赞 ,1 为点赞 ,0 为取消点赞
/// [type] : 数字 , 资源类型 , 对应歌曲 , mv, 专辑 , 歌单 , 电台, 视频对应以下类型
/// 0: 歌曲 1: mv 2: 歌单 3: 专辑 4: 电台 5: 视频 6: 动态
Future<ApiResponse> postMusicComment(musicId, commentId, { t: 1, type: 0 } ) async {
  var url = "/comment/like?id=$musicId&cid=$commentId&t=$t&type=$type";
  print(url);
  final response = await ApiClient().get(url);
  print(response);
  return ApiResponse.fromJson(response.data);
}