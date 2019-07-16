import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/entity/index.dart';

class UserState implements Cloneable<UserState> {
  LoginUser loginUser;

  UserState({this.loginUser});

  @override
  UserState clone() {
    return UserState()
      ..loginUser = loginUser;
  }

  @override
  String toString() {
    return 'UserState ${loginUser.toJson()}';
  }
}
