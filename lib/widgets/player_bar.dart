import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/entity/index.dart';
import 'package:myapp/screens/index.dart';

import 'auto_rotate.dart';
import 'common_image.dart';

class PlayerBar extends StatelessWidget {
  final Song currentPlayingSong;

  PlayerBar(this.currentPlayingSong);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      height: 50,
      onPressed: () {
        Navigator.of(context)
            .pushNamed('player', arguments: null);
      },
      child: Container(
        height: 61,
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              child: CommonImage(
                picUrl: currentPlayingSong?.al?.picUrl,
                borderRadius: BorderRadius.circular(20.0),
                width: 40,
                height: 40,
              ),
//              child: currentPlayingSong?.al?.picUrl == null
//                  ? Center()
//                  : AutoRotate(
//                      child: CommonImage(
//                        picUrl: currentPlayingSong?.al?.picUrl,
//                        borderRadius: BorderRadius.circular(20.0),
//                        width: 40,
//                        height: 40,
//                      ),
//                    ), // ,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${currentPlayingSong?.name ?? ''}',
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${currentPlayingSong?.ar?.map((ar) => ar.name)?.join('/') ?? ''}'
                    '-${currentPlayingSong?.al?.name ?? ''}',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF666666)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
//                                appBloc.nextSongController.add(NextSong());
                }),
          ],
        ),
      ),
    );
  }
}
