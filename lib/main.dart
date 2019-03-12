import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/screens/my_music_list.dart';
import 'package:myapp/src/screens/netease_cloud.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/src/utils/player.dart';

import 'package:myapp/src/service/user.dart' as userService ;

void main() {
//  debugPaintSizeEnabled=true;
  final appBloc = AppBloc();
  runApp(MyApp(appBloc));
}

class MyApp extends StatelessWidget {
  final AppBloc appBloc;
  MyApp(this.appBloc);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

//    return AppProvider(
//      child: Stack(
//        children: <Widget>[
//          MaterialApp(
//            title: 'Flutter Demo',
//            theme: ThemeData(
//              // This is the theme of your application.
//              //
//              // Try running your application with "flutter run". You'll see the
//              // application has a blue toolbar. Then, without quitting the app, try
//              // changing the primarySwatch below to Colors.green and then invoke
//              // "hot reload" (press "r" in the console where you ran "flutter run",
//              // or simply save your changes to "hot reload" in a Flutter IDE).
//              // Notice that the counter didn't reset back to zero; the application
//              // is not restarted.
//              primarySwatch: Colors.red,
//            ),
//            home: MyHomePage(title: 'Flutter Demo Home Page'),
//            routes: <String, WidgetBuilder> {
//              '/screen1': (BuildContext context) => MyMusicListScreen(),
//              '/screen2' : (BuildContext context) => MyMusicListScreen(),
//              '/screen3' : (BuildContext context) => MyMusicListScreen(),
//              '/screen4' : (BuildContext context) => MyMusicListScreen()
//            },
//          ),
//          Positioned(
//              left: 0,
//              right: 0,
//              bottom: 0,
//              child: Container(
//                width: 100,
//                height: 100,
//                color: Colors.white,
//                child: Text('TextTextTextTextTextText'),
//              )
//          ),
//        ],
//      )
//    );
    return AppProvider(
      appBloc: appBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder> {
          '/screen1': (BuildContext context) => MyMusicListScreen(),
          '/screen2' : (BuildContext context) => MyMusicListScreen(),
          '/screen3' : (BuildContext context) => MyMusicListScreen(),
          '/screen4' : (BuildContext context) => MyMusicListScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  BuildContext context;


  @override
  void initState() {
    super.initState();
    userService.loginStatus();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    this.context = context;
    return Scaffold(
      body: MyMusicListScreen(),// NeteaseCloudScreen(), // ImageRotate(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    super.dispose();
    final appBloc = AppProvider.of(this.context);
    // 保存当前播放的状态

    appBloc.dispose();
    PlayerUtils().dispose();
  }

}
