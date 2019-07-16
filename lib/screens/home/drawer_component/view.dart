import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:myapp/utils/index.dart';
import 'package:myapp/widgets/common_image.dart';

import 'state.dart';

Widget buildView(
  UserState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  final currentUser = state.loginUser;
  return Drawer(
    child: Container(
      padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: currentUser == null
                    ? Container(
                        color: Theme.of(viewService.context).accentColor,
                        height: 200,
                      )
                    : CommonImage(
                        picUrl: currentUser.profile.backgroundUrl,
                      ),
              ),
              SafeArea(
                child: MaterialButton(
                    onPressed: () {
                      if (currentUser == null) {
                        Navigator.of(viewService.context)
                            .pushNamed('login', arguments: null);
                      }
                    },
                    padding: EdgeInsets.all(0),
                    child: currentUser == null
                        ? Container(
                            child: Center(
                              child: Text(
                                '登录',
                                style: Theme.of(viewService.context)
                                    .textTheme
                                    .title
                                    .merge(TextStyle(color: Colors.white)),
                              ),
                            ),
                            color: Theme.of(viewService.context).accentColor,
                            height: 200,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                child: CommonImage(
                                  width: 80,
                                  height: 80,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  picUrl: currentUser.profile
                                      .avatarUrl, //appBloc.userModel.profile.avatarUrl,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Text(
                                  currentUser.profile.nickname,
                                  // appBloc.userModel.profile.nickname,
                                  style: Theme.of(viewService.context)
                                      .textTheme
                                      .title
                                      .merge(TextStyle(color: Colors.white)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 80),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            currentUser.profile.gender == 1
                                                ? '♂'
                                                : '♀',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '${convertToFiveYear(DateTime.fromMicrosecondsSinceEpoch(currentUser.profile.birthday * 1000).toString())}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            ' 关注${currentUser.profile.follows}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            ' 粉丝${currentUser.profile.followeds}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
              ),
            ],
          )
        ],
      ),
//          color: Theme.of(context).primaryColor,
//      child: currentUser != null
//          ? Column(
//              children: <Widget>[
//                Stack(
//                  children: <Widget>[
//                    Center(
//                      child: CommonImage(
//                        picUrl: currentUser.profile.backgroundUrl,
//                      ),
//                    ),
//                    SafeArea(
//                      child: MaterialButton(
//                          onPressed: () {
//                            if (currentUser == null) {
//                              Navigator.of(viewService.context)
//                                  .pushNamed('login', arguments: null);
//                            }
//                          },
//                          padding: EdgeInsets.all(0),
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Container(
//                                margin: EdgeInsets.only(top: 40),
//                                child: CommonImage(
//                                  width: 80,
//                                  height: 80,
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(40.0)),
//                                  picUrl: currentUser.profile
//                                      .avatarUrl, //appBloc.userModel.profile.avatarUrl,
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(top: 6),
//                                child: Text(
//                                  currentUser.profile.nickname,
//                                  // appBloc.userModel.profile.nickname,
//                                  style: Theme.of(viewService.context)
//                                      .textTheme
//                                      .title
//                                      .merge(TextStyle(color: Colors.white)),
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(top: 80),
//                                child: Row(
//                                  children: <Widget>[
//                                    Container(
//                                      margin: EdgeInsets.only(left: 16),
//                                      child: Row(
//                                        children: <Widget>[
//                                          Text(
//                                            currentUser.profile.gender == 1
//                                                ? '♂'
//                                                : '♀',
//                                            style:
//                                                TextStyle(color: Colors.white),
//                                          ),
//                                          Text(
//                                            '${convertToFiveYear(DateTime.fromMicrosecondsSinceEpoch(currentUser.profile.birthday * 1000).toString())}',
//                                            style:
//                                                TextStyle(color: Colors.white),
//                                          ),
//                                          Text(
//                                            ' 关注${currentUser.profile.follows}',
//                                            style:
//                                                TextStyle(color: Colors.white),
//                                          ),
//                                          Text(
//                                            ' 粉丝${currentUser.profile.followeds}',
//                                            style:
//                                                TextStyle(color: Colors.white),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          )),
//                    ),
//                  ],
//                )
//              ],
//            )
//          : Center(
//              child: Text(
//                '登录',
//                style: Theme.of(viewService.context)
//                    .textTheme
//                    .title
//                    .merge(TextStyle(color: Colors.white)),
//              ),
//            ),
    ),
  );
}
