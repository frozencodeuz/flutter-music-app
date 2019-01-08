import 'package:flutter/material.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/models/player.dart';
import 'package:myapp/src/screens/player.dart';
import 'package:myapp/src/widgets/auto_rotate.dart';
import 'package:myapp/src/widgets/common_image.dart';
import 'package:myapp/src/resources/colors.dart' as AppColors;

class ScreenWithPlayerBottomBar extends StatelessWidget {
  final Widget child;

  ScreenWithPlayerBottomBar({this.child});

  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    return Stack(
      children: <Widget>[
        child,
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Card(
                  elevation: 5,
                  clipBehavior: Clip.none,
                  child: StreamBuilder<Songs>(
                    stream: appBloc.playingSong,
                    builder: (context, snapshot) => MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayerScreen()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: SmallDisc(),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${snapshot.data?.name ?? ''}',
                                          style: TextStyle(fontSize: 17),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          '${snapshot.data?.ar?.map((ar) => ar.name)?.join('/') ?? ''}-${snapshot.data?.al?.name ?? ''}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.subtitleColor),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  )),
            )),
      ],
    );
  }
}

class SmallDisc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    // TODO: implement build
    return StreamBuilder<PlayerStatus>(
      stream: appBloc.playingStatus,
      builder: (context, snapshot) => MaterialButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {},
            child: Center(
              child: snapshot.data == PlayerStatus.LOADING_FILE
                  ? Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    )
                  : (snapshot.data == PlayerStatus.PLAYING
                      ? AutoRotate(
                          child: DiscImage(),
                        )
                      : DiscImage()),
            ),
          ),
    );
  }
}

class DiscImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    // TODO: implement build
    return StreamBuilder<Songs>(
      stream: appBloc.playingSong,
      builder: (context, snapshot) => snapshot.data?.al?.picUrl != null
          ? CommonImage(
              picUrl: snapshot.data?.al?.picUrl,
              borderRadius: BorderRadius.circular(20.0),
              width: 40,
              height: 40,
            )
          : Container(),
    );
  }
}
