import 'package:flutter/material.dart';
import 'package:myapp/entity/comment.dart';
import 'package:myapp/widgets/common_image.dart';

class TopCommentItem extends StatelessWidget {
  final HotComments comment;
  final Function onLikeClicked;

  TopCommentItem({this.comment, this.onLikeClicked});

  itemClicked() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          itemClicked();
        },
        child: Container(
          padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                child: CommonImage(
                  picUrl: this.comment.user.avatarUrl,
                  width: 40,
                  height: 40,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Flexible(
                child: Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      this.comment.user.nickname,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                    Text(
                                      DateTime.fromMillisecondsSinceEpoch(
                                              (this.comment.time).toInt(),
                                              isUtc: true)
                                          .toLocal()
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    )
                                  ],
                                )),
                            Text(
                              this.comment.likedCount.toString(),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_up,
                                size: 16,
                                color: this.comment.liked ? Theme.of(context).colorScheme.primary : Colors.grey,
                              ),
                              onPressed: () => onLikeClicked(this.comment),
                            ),
                          ],
                        ),
                        Text(this.comment.content),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
