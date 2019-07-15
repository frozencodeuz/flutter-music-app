import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'global_store/state.dart';
import 'global_store/store.dart';
import './screens/index.dart';

final AbstractRoutes routes = PageRoutes(
  pages: <String, Page<Object, dynamic>>{
    'home': HomePage(),
    'playlist': PlaylistPage(),
    'player': PlayerPage(),
    'search': SearchPage(),
    'login': LoginPage(),
  },
  visitor: (String path, Page<Object, dynamic> page) {
    /// XXX
    if (page.isTypeof<GlobalBaseState>()) {
      page.connectExtraStore<GlobalState>(GlobalStore.store,
              (Object pageState, GlobalState appState) {
            final GlobalBaseState p = pageState;
            if (pageState is Cloneable) {
//                final Object copy = pageState.clone();
//                final GlobalBaseState newState = copy;
//                newState.themeColor = appState.themeColor;

              final GlobalBaseState newPageState = pageState.clone();
              newPageState.themeColor  = appState.themeColor;
              newPageState.currentPlayingIndex = appState.currentPlayingIndex ?? -1;
              newPageState.currentPlaylist = appState.currentPlaylist;
              newPageState.currentMusicResourceList = appState.currentMusicResourceList ?? [];
              newPageState.currentSongs = appState.currentSongs ?? [];
              newPageState.currentUser = appState.currentUser;
              return newPageState;
            }
            return pageState;
          });
    }

    page.enhancer.append(
      viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
      adapterMiddleware: <AdapterMiddleware<dynamic>>[
        safetyAdapter<dynamic>()
      ],
      effectMiddleware: [],
      middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
    );

    // }
    ///updateMiddleware
    /// TODO
    // ..updateMiddleware(
    //   view: (List<ViewMiddleware<T>> viewMiddleware) {
    //     viewMiddleware.add(safetyView<T>());
    //   },
    //   adapter: (List<AdapterMiddleware<T>> adapterMiddleware) {
    //     adapterMiddleware.add(safetyAdapter<T>());
    //   },
    // )
  },
);

Widget createApp() {

  return MaterialApp(
    title: 'Music',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: routes.buildPage('home', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
