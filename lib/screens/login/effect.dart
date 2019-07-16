import 'package:fish_redux/fish_redux.dart';
import 'package:myapp/entity/index.dart';
import 'package:myapp/global_store/action.dart';
import 'package:myapp/global_store/state.dart';
import 'package:myapp/global_store/store.dart';
import 'package:myapp/service/index.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.loginWithPhone: _onLoginWithPhone,
  });
}

void _onLoginWithPhone(Action action, Context<LoginState> ctx) async {
  LoginUser loginUser = await loginWithPhone(ctx.state.accountEditingController.text, ctx.state.passwordEditingController.text);
  GlobalState state = GlobalStore.store.getState().clone()..currentUser = loginUser;
  ctx.dispatch(Action(GlobalAction.updateState, payload: state));
  GlobalStore.store.dispatch(Action(GlobalAction.updateState, payload: state));
}
