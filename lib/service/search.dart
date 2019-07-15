import 'package:myapp/utils/api_client.dart';
import 'package:dio/dio.dart';

/// 搜索类型；默认为 1 即单曲 , 取值意义 : 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频
Future search({ keywords, type = 1 }) async {
  try {
    final response = await ApiClient().get("/search?keywords=$keywords&type=$type");
    return response.data;
  } on DioError catch(e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if(e.response != null) {
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request.path);
    } else{
      // Something happened in setting up or sending the request that triggered an Error
//      print(e.request);
      print(e.message);
    }
  }
}
