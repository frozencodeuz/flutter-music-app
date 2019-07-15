import 'Song.dart';
import 'album.dart';
import 'artist.dart';

class MusicDetail {
  List<Privilege> privileges;
  int code;
  List<Song> songs;

  MusicDetail({this.privileges, this.code, this.songs});

  MusicDetail.fromJson(Map<String, dynamic> json) {
    if (json['privileges'] != null) {
      privileges = new List<Privilege>();(json['privileges'] as List).forEach((v) { privileges.add(new Privilege.fromJson(v)); });
    }
    code = json['code'];
    if (json['songs'] != null) {
      songs = new List<Song>();(json['songs'] as List).forEach((v) { songs.add(new Song.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.privileges != null) {
      data['privileges'] =  this.privileges.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    if (this.songs != null) {
      data['songs'] =  this.songs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Privilege {
  int st;
  int flag;
  int subp;
  int fl;
  int fee;
  int dl;
  int cp;
  bool preSell;
  bool cs;
  bool toast;
  int maxbr;
  int id;
  int pl;
  int sp;
  int payed;

  Privilege({this.st, this.flag, this.subp, this.fl, this.fee, this.dl, this.cp, this.preSell, this.cs, this.toast, this.maxbr, this.id, this.pl, this.sp, this.payed});

  Privilege.fromJson(Map<String, dynamic> json) {
    st = json['st'];
    flag = json['flag'];
    subp = json['subp'];
    fl = json['fl'];
    fee = json['fee'];
    dl = json['dl'];
    cp = json['cp'];
    preSell = json['preSell'];
    cs = json['cs'];
    toast = json['toast'];
    maxbr = json['maxbr'];
    id = json['id'];
    pl = json['pl'];
    sp = json['sp'];
    payed = json['payed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['st'] = this.st;
    data['flag'] = this.flag;
    data['subp'] = this.subp;
    data['fl'] = this.fl;
    data['fee'] = this.fee;
    data['dl'] = this.dl;
    data['cp'] = this.cp;
    data['preSell'] = this.preSell;
    data['cs'] = this.cs;
    data['toast'] = this.toast;
    data['maxbr'] = this.maxbr;
    data['id'] = this.id;
    data['pl'] = this.pl;
    data['sp'] = this.sp;
    data['payed'] = this.payed;
    return data;
  }
}


class MusicDetailSongsH {
  int br;
  int fid;
  int size;
  double vd;

  MusicDetailSongsH({this.br, this.fid, this.size, this.vd});

  MusicDetailSongsH.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = double.parse(json['vd'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
    data['vd'] = this.vd;
    return data;
  }
}

class MusicDetailSongsL {
  int br;
  int fid;
  int size;
  double vd;

  MusicDetailSongsL({this.br, this.fid, this.size, this.vd});

  MusicDetailSongsL.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = double.parse(json['vd'].toString());;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
    data['vd'] = this.vd;
    return data;
  }
}

class MusicDetailSongsM {
  int br;
  int fid;
  int size;
  double vd;

  MusicDetailSongsM({this.br, this.fid, this.size, this.vd});

  MusicDetailSongsM.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = double.parse(json['vd'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
    data['vd'] = this.vd;
    return data;
  }
}
