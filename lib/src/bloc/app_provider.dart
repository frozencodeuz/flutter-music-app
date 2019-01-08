import 'package:flutter/widgets.dart';
import 'package:myapp/src/bloc/app_bloc.dart';

/// This is an InheritedWidget that wraps around [CartBloc]. Think about this
/// as Scoped Model for that specific class.
///
/// This merely solves the "passing reference down the tree" problem for us.
/// You can solve this in other ways, like through dependency injection.
///
/// Also note that this does not call [CartBloc.dispose]. If your app
/// ever doesn't need to access the cart, you should make sure it's
/// disposed of properly.
class AppProvider extends InheritedWidget {
  final AppBloc appBloc;

  AppProvider({
    Key key,
    AppBloc appBloc,
    Widget child,
  })  : appBloc = appBloc ?? AppBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider)
          .appBloc;
}
