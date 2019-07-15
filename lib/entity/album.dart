import 'artist.dart';
class Album {
  String name;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
//  Null company;
  String briefDesc;
  Artist artist;
//  Null songs;
//  List<Null> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artist> artists;
  bool paid;
  bool onSale;
  String picIdStr;
  String containedSong;
  int mark;
  String alg;

  Album(
      {this.name,
        this.id,
        this.type,
        this.size,
        this.picId,
        this.blurPicUrl,
        this.companyId,
        this.pic,
        this.picUrl,
        this.publishTime,
        this.description,
        this.tags,
//        this.company,
        this.briefDesc,
        this.artist,
//        this.songs,
//        this.alias,
        this.status,
        this.copyrightId,
        this.commentThreadId,
        this.artists,
        this.paid,
        this.onSale,
        this.picIdStr,
        this.containedSong,
        this.mark,
        this.alg});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
    picId = json['picId'];
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    picUrl = json['picUrl'];
    publishTime = json['publishTime'];
    description = json['description'];
    tags = json['tags'];
//    company = json['company'];
    briefDesc = json['briefDesc'];
    artist =
    json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
//    songs = json['songs'];
//    if (json['alias'] != null) {
//      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
//    }
    status = json['status'];
    copyrightId = json['copyrightId'];
    commentThreadId = json['commentThreadId'];
    if (json['artists'] != null) {
      artists = new List<Artist>();
      json['artists'].forEach((v) {
        artists.add(new Artist.fromJson(v));
      });
    }
    paid = json['paid'];
    onSale = json['onSale'];
    picIdStr = json['picId_str'];
    containedSong = json['containedSong'];
    mark = json['mark'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    data['picId'] = this.picId;
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['picUrl'] = this.picUrl;
    data['publishTime'] = this.publishTime;
    data['description'] = this.description;
    data['tags'] = this.tags;
//    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
//    data['songs'] = this.songs;
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    data['status'] = this.status;
    data['copyrightId'] = this.copyrightId;
    data['commentThreadId'] = this.commentThreadId;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['paid'] = this.paid;
    data['onSale'] = this.onSale;
    data['picId_str'] = this.picIdStr;
    data['containedSong'] = this.containedSong;
    data['mark'] = this.mark;
    data['alg'] = this.alg;
    return data;
  }
}
