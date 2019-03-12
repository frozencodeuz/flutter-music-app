import 'package:myapp/src/models/user.dart';
import 'package:myapp/src/models/user_profile.dart';
import 'package:myapp/src/utils/api_client.dart';

Future<UserModel> loginWithPhone(phone, password) async {
  final response =
      await ApiClient().get("/login/cellphone?phone=$phone&password=$password");
  return UserModel.fromJson(response.data);
}

Future<UserProfileModel> loginStatus() async {
  final response = await ApiClient().get("/login/status");
  return UserProfileModel.fromJson(response.data);
}