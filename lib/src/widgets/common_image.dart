import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommonImage extends StatelessWidget {

  final String picUrl;
  final double width;
  final double height;
  final BorderRadius borderRadius;

  CommonImage({
    Key key,
    this.picUrl,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(3.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return FadeInImage.assetNetwork(
//      placeholder: "assets/images/pic_default.png",
//      image: picUrl,
//      width: this.width,
//      height: this.height,
//    );
    print(picUrl);
    return Center(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          placeholder: (BuildContext context, String url){
            return Container(
              color: Colors.grey[200],
              width: this.width,
              height: this.height,
            );
          },
          imageUrl: picUrl,
          width: this.width,
          height: this.height,
//          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

