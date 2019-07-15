import 'package:flutter/material.dart';
import 'package:myapp/utils/index.dart';
import 'package:myapp/widgets/auto_listview.dart';
import 'package:myapp/widgets/common_image.dart';

import 'package:myapp/entity/index.dart';

class PlaylistList extends StatelessWidget {
  final List<Playlist> playlistList;

  PlaylistList(this.playlistList);

  @override
  Widget build(BuildContext context) {
    return AutoListView(
      itemCount: playlistList.length,
      itemBuilder: (BuildContext context, int index) {
        return MaterialButton(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
          onPressed: () {},
          child: Row(
            children: <Widget>[
              CommonImage(
                picUrl: playlistList[index].coverImgUrl,
                width: 60,
                height: 60,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${playlistList[index].name.trim()}',
                        style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${playlistList[index].trackCount}首  ${playlistList[index].creator.nickname}  ${convertToTenThousand(playlistList[index].playCount)}次播放',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
