class PersonalFMModel {
  bool popAdjust;
  List<Data> data;
  int code;

  PersonalFMModel({this.popAdjust, this.data, this.code});

  PersonalFMModel.fromJson(Map<String, dynamic> json) {
    popAdjust = json['popAdjust'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popAdjust'] = this.popAdjust;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String name;
  int id;
  int position;
  List<Null> alias;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  Null crbt;
  Null audition;
  String copyFrom;
  String commentThreadId;
  Null rtUrl;
  int ftype;
  List<Null> rtUrls;
  int copyright;
  Null transName;
  Null sign;
  int rtype;
  Null rurl;
  int mvid;
  BMusic bMusic;
  Null mp3Url;
  HMusic hMusic;
  MMusic mMusic;
  LMusic lMusic;
  Privilege privilege;
  String alg;

  Data(
      {this.name,
        this.id,
        this.position,
        this.alias,
        this.status,
        this.fee,
        this.copyrightId,
        this.disc,
        this.no,
        this.artists,
        this.album,
        this.starred,
        this.popularity,
        this.score,
        this.starredNum,
        this.duration,
        this.playedNum,
        this.dayPlays,
        this.hearTime,
        this.ringtone,
        this.crbt,
        this.audition,
        this.copyFrom,
        this.commentThreadId,
        this.rtUrl,
        this.ftype,
        this.rtUrls,
        this.copyright,
        this.transName,
        this.sign,
        this.rtype,
        this.rurl,
        this.mvid,
        this.bMusic,
        this.mp3Url,
        this.hMusic,
        this.mMusic,
        this.lMusic,
        this.privilege,
        this.alg});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    position = json['position'];
    if (json['alias'] != null) {
      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
    }
    status = json['status'];
    fee = json['fee'];
    copyrightId = json['copyrightId'];
    disc = json['disc'];
    no = json['no'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    starred = json['starred'];
    popularity = json['popularity'];
    score = json['score'];
    starredNum = json['starredNum'];
    duration = json['duration'];
    playedNum = json['playedNum'];
    dayPlays = json['dayPlays'];
    hearTime = json['hearTime'];
    ringtone = json['ringtone'];
    crbt = json['crbt'];
    audition = json['audition'];
    copyFrom = json['copyFrom'];
    commentThreadId = json['commentThreadId'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    if (json['rtUrls'] != null) {
      rtUrls = new List<Null>();
//      json['rtUrls'].forEach((v) {
//        rtUrls.add(new Null.fromJson(v));
//      });
    }
    copyright = json['copyright'];
    transName = json['transName'];
    sign = json['sign'];
    rtype = json['rtype'];
    rurl = json['rurl'];
    mvid = json['mvid'];
    bMusic =
    json['bMusic'] != null ? new BMusic.fromJson(json['bMusic']) : null;
    mp3Url = json['mp3Url'];
    hMusic =
    json['hMusic'] != null ? new HMusic.fromJson(json['hMusic']) : null;
    mMusic =
    json['mMusic'] != null ? new MMusic.fromJson(json['mMusic']) : null;
    lMusic =
    json['lMusic'] != null ? new LMusic.fromJson(json['lMusic']) : null;
    privilege = json['privilege'] != null
        ? new Privilege.fromJson(json['privilege'])
        : null;
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['position'] = this.position;
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    data['status'] = this.status;
    data['fee'] = this.fee;
    data['copyrightId'] = this.copyrightId;
    data['disc'] = this.disc;
    data['no'] = this.no;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['score'] = this.score;
    data['starredNum'] = this.starredNum;
    data['duration'] = this.duration;
    data['playedNum'] = this.playedNum;
    data['dayPlays'] = this.dayPlays;
    data['hearTime'] = this.hearTime;
    data['ringtone'] = this.ringtone;
    data['crbt'] = this.crbt;
    data['audition'] = this.audition;
    data['copyFrom'] = this.copyFrom;
    data['commentThreadId'] = this.commentThreadId;
    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
//    if (this.rtUrls != null) {
//      data['rtUrls'] = this.rtUrls.map((v) => v.toJson()).toList();
//    }
    data['copyright'] = this.copyright;
    data['transName'] = this.transName;
    data['sign'] = this.sign;
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    data['mvid'] = this.mvid;
    if (this.bMusic != null) {
      data['bMusic'] = this.bMusic.toJson();
    }
    data['mp3Url'] = this.mp3Url;
    if (this.hMusic != null) {
      data['hMusic'] = this.hMusic.toJson();
    }
    if (this.mMusic != null) {
      data['mMusic'] = this.mMusic.toJson();
    }
    if (this.lMusic != null) {
      data['lMusic'] = this.lMusic.toJson();
    }
    if (this.privilege != null) {
      data['privilege'] = this.privilege.toJson();
    }
    data['alg'] = this.alg;
    return data;
  }
}

class Artists {
  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<Null> alias;
  String trans;
  int musicSize;

  Artists(
      {this.name,
        this.id,
        this.picId,
        this.img1v1Id,
        this.briefDesc,
        this.picUrl,
        this.img1v1Url,
        this.albumSize,
        this.alias,
        this.trans,
        this.musicSize});

  Artists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
//    if (json['alias'] != null) {
//      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
//    }
    trans = json['trans'];
    musicSize = json['musicSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    data['trans'] = this.trans;
    data['musicSize'] = this.musicSize;
    return data;
  }
}

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
  String company;
  String briefDesc;
  Artist artist;
  List<Null> songs;
  List<Null> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String subType;
  Null transName;

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
        this.company,
        this.briefDesc,
        this.artist,
        this.songs,
        this.alias,
        this.status,
        this.copyrightId,
        this.commentThreadId,
        this.artists,
        this.subType,
        this.transName});

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
    company = json['company'];
    briefDesc = json['briefDesc'];
    artist =
    json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    if (json['songs'] != null) {
      songs = new List<Null>();
//      json['songs'].forEach((v) {
//        songs.add(new Null.fromJson(v));
//      });
    }
    if (json['alias'] != null) {
      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
    }
    status = json['status'];
    copyrightId = json['copyrightId'];
    commentThreadId = json['commentThreadId'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    subType = json['subType'];
    transName = json['transName'];
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
    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
//    if (this.songs != null) {
//      data['songs'] = this.songs.map((v) => v.toJson()).toList();
//    }
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    data['status'] = this.status;
    data['copyrightId'] = this.copyrightId;
    data['commentThreadId'] = this.commentThreadId;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['subType'] = this.subType;
    data['transName'] = this.transName;
    return data;
  }
}

class Artist {
  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<Null> alias;
  String trans;
  int musicSize;

  Artist(
      {this.name,
        this.id,
        this.picId,
        this.img1v1Id,
        this.briefDesc,
        this.picUrl,
        this.img1v1Url,
        this.albumSize,
        this.alias,
        this.trans,
        this.musicSize});

  Artist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
    if (json['alias'] != null) {
      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
    }
    trans = json['trans'];
    musicSize = json['musicSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    data['trans'] = this.trans;
    data['musicSize'] = this.musicSize;
    return data;
  }
}

class BMusic {
  String name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  BMusic(
      {this.name,
        this.id,
        this.size,
        this.extension,
        this.sr,
        this.dfsId,
        this.bitrate,
        this.playTime,
        this.volumeDelta});

  BMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class HMusic {
  String name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  HMusic(
      {this.name,
        this.id,
        this.size,
        this.extension,
        this.sr,
        this.dfsId,
        this.bitrate,
        this.playTime,
        this.volumeDelta});

  HMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class MMusic {
  String name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  MMusic(
      {this.name,
        this.id,
        this.size,
        this.extension,
        this.sr,
        this.dfsId,
        this.bitrate,
        this.playTime,
        this.volumeDelta});

  MMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class LMusic {
  String name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  LMusic(
      {this.name,
        this.id,
        this.size,
        this.extension,
        this.sr,
        this.dfsId,
        this.bitrate,
        this.playTime,
        this.volumeDelta});

  LMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privilege(
      {this.id,
        this.fee,
        this.payed,
        this.st,
        this.pl,
        this.dl,
        this.sp,
        this.cp,
        this.subp,
        this.cs,
        this.maxbr,
        this.fl,
        this.toast,
        this.flag,
        this.preSell});

  Privilege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['preSell'] = this.preSell;
    return data;
  }
}