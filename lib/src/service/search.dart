import 'package:myapp/src/models/search.dart';
import 'package:myapp/src/utils/api_client.dart';
import 'package:dio/dio.dart';

Future<SearchModel> search({ keywords, type = 1 }) async {
  print("keywords:$keywords");
  try {
    final response = await ApiClient().get("/search?keywords=$keywords&type=$type");
    return SearchModel.fromJson(response.data);
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