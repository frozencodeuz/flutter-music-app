import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/models/user.dart';
import 'package:myapp/src/screens/my_music_list.dart';
import 'package:myapp/src/service/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final accountEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('登录'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              textInputAction: TextInputAction.next,
              autofocus: true,
              onEditingComplete: () {},
              controller: accountEditingController,
            ),
            TextField(
              textInputAction: TextInputAction.go,
              autofocus: false,
              onEditingComplete: () {},
              controller: passwordEditingController,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: MaterialButton(
                onPressed: () async {
                  UserModel userModel = await loginWithPhone(accountEditingController.text, passwordEditingController.text);
                  if (userModel.code == 200) {
                    // 持久化登录
                    var sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.setString('login', json.encode(userModel.toJson()));
                    appBloc.loginController.add(userModel);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyMusicListScreen(),
                        ),
                            (predicate) => false
                    );
                  }
                },
                child: Text('登录'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
