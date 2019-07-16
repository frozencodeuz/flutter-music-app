import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("登录"),
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white10,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  onEditingComplete: () {},
                  controller: state.accountEditingController,
                  decoration: InputDecoration(
                    labelText: "账号",
//                      hintText: "账号",
                    hintStyle: TextStyle(fontSize: 16.0),
//                      contentPadding:
//                          EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
//                      border: UnderlineInputBorder(
//                          borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white10,
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  autofocus: false,
                  onEditingComplete: () {},
                  controller: state.passwordEditingController,
                  decoration: InputDecoration(
                    labelText: "密码",
//                      hintText: "密码",
//                      hintStyle: TextStyle(fontSize: 16.0),
//                      contentPadding:
//                          EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
//                      border: UnderlineInputBorder(
//                          borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: MaterialButton(
                      color: Theme.of(viewService.context).primaryColor,
                      onPressed: (state.accountEditingController.text.isNotEmpty && state.passwordEditingController.text.isNotEmpty) ? () {
                        dispatch(LoginActionCreator.onLoginWithPhone());
                      } : null,
                      child: Text(
                        '登录',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ));
}
