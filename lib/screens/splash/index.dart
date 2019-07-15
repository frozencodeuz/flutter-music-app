//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:myapp/src/bloc/app_provider.dart';
//import 'package:myapp/src/screens/home/index.dart';
//
///// 延时启动，目前主要是为了：在发网络请求前，让异步路径下Cookie先加载完成
//class SplashScreen extends StatelessWidget {
//
//  BuildContext context;
//  Timer timer;
//
//  init() async {
//    // 先初始化网络请求库
//
//    //再检查登录
//
//    //再
//    timer = new Timer(const Duration(milliseconds: 1500), () {
//      try {
//        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
//            builder: (BuildContext context) => MyMusicListScreen()), (//跳转到主页
//            Route route) => false);
//      } catch (e) {
//
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    this.context = context;
//    this.init();
//    return Center(
//        child: CircularProgressIndicator()
//    );
//  }
//}
