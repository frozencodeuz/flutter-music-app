import 'package:myapp/entity/index.dart';
import 'package:myapp/entity/login_user.dart';
import 'package:myapp/utils/api_client.dart';

Future<LoginUser> loginWithPhone(phone, password) async {
  final response =
      await ApiClient().get("/login/cellphone?phone=$phone&password=$password");
  return LoginUser.fromJson(response.data);
}

Future<LoginUser> loginStatus() async {
  final response = await ApiClient().get("/login/status");
  return LoginUser.fromJson(response.data);
}
