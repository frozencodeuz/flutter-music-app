import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/entity/index.dart';
import 'package:myapp/utils/index.dart';
import 'package:myapp/widgets/common_image.dart';

class HomeDrawer extends StatefulWidget {
  final LoginUser currentUser;

  HomeDrawer({@required this.currentUser});

  @override
  State<StatefulWidget> createState() =>
      _HomeDrawerState(currentUser: this.currentUser);
}

class _HomeDrawerState extends State<HomeDrawer> {
  final LoginUser currentUser;
  List _pcaCodeData;

  @override
  void initState() {
    super.initState();
//    Future<String> loadString = DefaultAssetBundle.of(context)
//        .loadString('assets/datasets/pca-code.json');
//
//    loadString.then((String value) {
//      final pcaCodeData = json.decode(value) as List;
//      pcaCodeData.firstWhere((v) => v.)
//      print(currentUser.profile.province);
//      setState(() {
//        _pcaCodeData = pcaCodeData;
//      });
//    });
  }

  _HomeDrawerState({@required this.currentUser});

  final List<ListItem> menuItems = [
    HeadingItem(""),
//    CategoryItem("设置"),
//    MessageItem("退出", "退出"),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(0),
//          color: Theme.of(context).primaryColor,
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          // Let the ListView know how many items it needs to build
          itemCount: menuItems.length,
          // Provide a builder function. This is where the magic happens! We'll
          // convert each item into a Widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = menuItems[index];
            if (item is HeadingItem) {
              return Stack(
                children: <Widget>[
                  Center(
                    child: CommonImage(
                      picUrl: currentUser.profile.backgroundUrl,
                    ),
                  ),
                  SafeArea(
                    child: MaterialButton(
                      onPressed: () {
                        if (currentUser == null) {
                          Navigator.of(context)
                              .pushNamed('login', arguments: null);
                        }
                      },
                      padding: EdgeInsets.all(0),
                      child: currentUser.loginType != null
                          ? Column(
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
                                    style: Theme.of(context)
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '${convertToFiveYear(DateTime.fromMicrosecondsSinceEpoch(currentUser.profile.birthday * 1000).toString())}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              ' 关注${currentUser.profile.follows}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              ' 粉丝${currentUser.profile.followeds}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Center(
                              child: Text(
                                '登录',
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .merge(TextStyle(color: Colors.white)),
                              ),
                            ),
                    ),
                  ),
                ],
              );
            } else if (item is CategoryItem) {
              return ListTile(
                title: Text(
                  item.category,
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            } else {
              return MaterialButton(
                onPressed: () {
//                  appBloc.dispose();
                },
                child: ListTile(
                  title: Text((item as MessageItem).title),
                  subtitle: Text((item as MessageItem).body),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a heading
class CategoryItem implements ListItem {
  final String category;

  CategoryItem(this.category);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String title;
  final String body;

  MessageItem(this.title, this.body);
}
