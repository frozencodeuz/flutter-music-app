class SinglePlayListModel {
  int code;
  List<Privileges> privileges;

  SinglePlayListModel({this.code, this.privileges});

  SinglePlayListModel.fromJson(Map<String, dynamic> json) {
//    playlist = json['playlist'] != null
//        ? new Playlist.fromJson(json['playlist'])
//        : null;
//    code = json['code'];
    if (json['privileges'] != null) {
      privileges = new List<Privileges>();
      json['privileges'].forEach((v) {
        privileges.add(new Privileges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.privileges != null) {
      data['privileges'] = this.privileges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Privileges {
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

  Privileges(
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

  Privileges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
//    fee = json['fee'];
//    payed = json['payed'];
//    st = json['st'];
//    pl = json['pl'];
//    dl = json['dl'];
//    sp = json['sp'];
//    cp = json['cp'];
//    subp = json['subp'];
//    cs = json['cs'];
//    maxbr = json['maxbr'];
//    fl = json['fl'];
//    toast = json['toast'];
//    flag = json['flag'];
//    preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
//    data['fee'] = this.fee;
//    data['payed'] = this.payed;
//    data['st'] = this.st;
//    data['pl'] = this.pl;
//    data['dl'] = this.dl;
//    data['sp'] = this.sp;
//    data['cp'] = this.cp;
//    data['subp'] = this.subp;
//    data['cs'] = this.cs;
//    data['maxbr'] = this.maxbr;
//    data['fl'] = this.fl;
//    data['toast'] = this.toast;
//    data['flag'] = this.flag;
//    data['preSell'] = this.preSell;
    return data;
  }
}