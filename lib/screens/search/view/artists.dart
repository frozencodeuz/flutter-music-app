import 'package:flutter/material.dart';
import 'package:myapp/widgets/auto_listview.dart';
import 'package:myapp/widgets/common_image.dart';

import 'package:myapp/entity/index.dart';

class Artists extends StatelessWidget {
  final List<Artist> artists;

  Artists(this.artists);

  @override
  Widget build(BuildContext context) {
    return AutoListView(
      itemCount: artists.length,
      itemBuilder: (BuildContext context, int index) {
        return MaterialButton(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
          onPressed: () {},
          child: Row(
            children: <Widget>[
              CommonImage(
                picUrl: artists[index].img1v1Url,
                width: 60,
                height: 60,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${artists[index].name.trim()}',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '专辑:${artists[index].albumSize} 视频:${artists[index].mvSize}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
