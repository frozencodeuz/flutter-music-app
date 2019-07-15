import 'package:flutter/material.dart';
import 'package:myapp/widgets/auto_listview.dart';
import 'package:myapp/widgets/common_image.dart';

import 'package:myapp/entity/index.dart';

class Songs extends StatelessWidget {

  final List<Song> songs;

  Songs(this.songs);

  @override
  Widget build(BuildContext context) {
    return AutoListView(
      itemCount: songs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${songs[index].name.trim()}',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            '${songs[index].artists.map((ar) => ar.name).join('/')} - ${songs[index].album.name}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
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
