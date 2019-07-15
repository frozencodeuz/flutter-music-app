class Artist {
  int id;
  String name;
  String picUrl;
//  List<Null> alias;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;
//  Null trans;
  int mvSize;

  Artist(
      {this.id,
        this.name,
        this.picUrl,
//        this.alias,
        this.albumSize,
        this.picId,
        this.img1v1Url,
        this.img1v1,
//        this.trans,
      this.mvSize,
      });

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
//    if (json['alias'] != null) {
//      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
//    }
    albumSize = json['albumSize'];
    picId = json['picId'];
    img1v1Url = json['img1v1Url'];
    img1v1 = json['img1v1'];
    mvSize = json['mvSize'];
//    trans = json['trans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    data['albumSize'] = this.albumSize;
    data['picId'] = this.picId;
    data['img1v1Url'] = this.img1v1Url;
    data['img1v1'] = this.img1v1;
//    data['trans'] = this.trans;
    data['mvSize'] = this.mvSize;
    return data;
  }
}
