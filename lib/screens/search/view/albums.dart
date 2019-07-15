import 'package:flutter/material.dart';
import 'package:myapp/widgets/auto_listview.dart';
import 'package:myapp/widgets/common_image.dart';

import 'package:myapp/entity/index.dart';

class Albums extends StatelessWidget {
  final List<Album> albums;

  Albums(this.albums);

  @override
  Widget build(BuildContext context) {
    return AutoListView(
      itemCount: albums.length,
      itemBuilder: (BuildContext context, int index) {
        return MaterialButton(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
          onPressed: () {},
          child: Row(
            children: <Widget>[
              CommonImage(
                picUrl: albums[index].blurPicUrl,
                width: 60,
                height: 60,
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${albums[index].name.trim()}',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '${albums[index].artists.map((artist) => artist.name).join('')}'
                      '  ${DateTime.fromMicrosecondsSinceEpoch(albums[index].publishTime * 1000, isUtc: false).toString().substring(0, 10)}',
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
