import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/foundation.dart';

//TODO replace with your own action
enum LoginAction { loginWithPhone, updateState }

class LoginActionCreator {
  static Action onLoginWithPhone({@required String phone, @required String password}) {
    return Action(LoginAction.loginWithPhone, payload: { "phone": phone, "password": password });
  }
}
