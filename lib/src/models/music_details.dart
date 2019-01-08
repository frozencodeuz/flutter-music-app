class MusicDetailModel {
  List<Songs> songs;
  List<Privileges> privileges;
  int code;

  MusicDetailModel({this.songs, this.privileges, this.code});

  MusicDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) {
        songs.add(new Songs.fromJson(v));
      });
    }
//    if (json['privileges'] != null) {
//      privileges = new List<Privileges>();
//      json['privileges'].forEach((v) {
//        privileges.add(new Privileges.fromJson(v));
//      });
//    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    if (this.privileges != null) {
      data['privileges'] = this.privileges.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Songs {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
//  List<Null> alia;
  int pop;
  int st;
//  Null rt;
  int fee;
  int v;
//  Null crbt;
  String cf;
  Al al;
  int dt;
  H h;
  M m;
  L l;
//  Null a;
  String cd;
  int no;
//  Null rtUrl;
  int ftype;
//  List<Null> rtUrls;
  int djId;
  int copyright;
  int sId;
  int rtype;
//  Null rurl;
  int mst;
  int cp;
  int mv;
  int publishTime;

  Songs(
      {this.name,
        this.id,
        this.pst,
        this.t,
        this.ar,
//        this.alia,
        this.pop,
        this.st,
//        this.rt,
        this.fee,
        this.v,
//        this.crbt,
        this.cf,
        this.al,
        this.dt,
        this.h,
        this.m,
        this.l,
//        this.a,
        this.cd,
        this.no,
//        this.rtUrl,
        this.ftype,
//        this.rtUrls,
        this.djId,
        this.copyright,
        this.sId,
        this.rtype,
//        this.rurl,
        this.mst,
        this.cp,
        this.mv,
        this.publishTime});

  Songs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pst = json['pst'];
    t = json['t'];
    if (json['ar'] != null) {
      ar = new List<Ar>();
      json['ar'].forEach((v) {
        ar.add(new Ar.fromJson(v));
      });
    }
//    if (json['alia'] != null) {
//      alia = new List<Null>();
//      json['alia'].forEach((v) {
//        alia.add(new Null.fromJson(v));
//      });
//    }
    pop = json['pop'];
    st = json['st'];
//    rt = json['rt'];
    fee = json['fee'];
    v = json['v'];
//    crbt = json['crbt'];
    cf = json['cf'];
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
    dt = json['dt'];
    h = json['h'] != null ? new H.fromJson(json['h']) : null;
    m = json['m'] != null ? new M.fromJson(json['m']) : null;
    l = json['l'] != null ? new L.fromJson(json['l']) : null;
//    a = json['a'];
    cd = json['cd'];
    no = json['no'];
//    rtUrl = json['rtUrl'];
//    ftype = json['ftype'];
//    if (json['rtUrls'] != null) {
//      rtUrls = new List<Null>();
//      json['rtUrls'].forEach((v) {
//        rtUrls.add(new Null.fromJson(v));
//      });
//    }
    djId = json['djId'];
    copyright = json['copyright'];
    sId = json['s_id'];
    rtype = json['rtype'];
//    rurl = json['rurl'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
    publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pst'] = this.pst;
    data['t'] = this.t;
    if (this.ar != null) {
      data['ar'] = this.ar.map((v) => v.toJson()).toList();
    }
//    if (this.alia != null) {
//      data['alia'] = this.alia.map((v) => v.toJson()).toList();
//    }
    data['pop'] = this.pop;
    data['st'] = this.st;
//    data['rt'] = this.rt;
    data['fee'] = this.fee;
    data['v'] = this.v;
//    data['crbt'] = this.crbt;
    data['cf'] = this.cf;
    if (this.al != null) {
      data['al'] = this.al.toJson();
    }
    data['dt'] = this.dt;
    if (this.h != null) {
      data['h'] = this.h.toJson();
    }
    if (this.m != null) {
      data['m'] = this.m.toJson();
    }
    if (this.l != null) {
      data['l'] = this.l.toJson();
    }
//    data['a'] = this.a;
    data['cd'] = this.cd;
    data['no'] = this.no;
//    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
//    if (this.rtUrls != null) {
//      data['rtUrls'] = this.rtUrls.map((v) => v.toJson()).toList();
//    }
    data['djId'] = this.djId;
    data['copyright'] = this.copyright;
    data['s_id'] = this.sId;
    data['rtype'] = this.rtype;
//    data['rurl'] = this.rurl;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['mv'] = this.mv;
    data['publishTime'] = this.publishTime;
    return data;
  }
}

class Ar {
  int id;
  String name;
//  List<Null> tns;
//  List<Null> alias;

  Ar({this.id, this.name});

  Ar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
//    if (json['tns'] != null) {
//      tns = new List<Null>();
//      json['tns'].forEach((v) {
//        tns.add(new Null.fromJson(v));
//      });
//    }
//    if (json['alias'] != null) {
//      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
//    if (this.tns != null) {
//      data['tns'] = this.tns.map((v) => v.toJson()).toList();
//    }
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}

class Al {
  int id;
  String name;
  String picUrl;
//  List<Null> tns;
  String picStr;
  int pic;

  Al({this.id, this.name, this.picUrl, this.picStr, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
//    if (json['tns'] != null) {
//      tns = new List<Null>();
//      json['tns'].forEach((v) {
//        tns.add(new Null.fromJson(v));
//      });
//    }
    picStr = json['pic_str'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
//    if (this.tns != null) {
//      data['tns'] = this.tns.map((v) => v.toJson()).toList();
//    }
    data['pic_str'] = this.picStr;
    data['pic'] = this.pic;
    return data;
  }
}

class H {
  int br;
  int fid;
  int size;
//  int vd;

  H({this.br, this.fid, this.size});

  H.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
//    vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
//    data['vd'] = this.vd;
    return data;
  }
}

class M {
  int br;
  int fid;
  int size;
//  int vd;

  M({this.br, this.fid, this.size});

  M.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
//    vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
//    data['vd'] = this.vd;
    return data;
  }
}

class L {
  int br;
  int fid;
  int size;
//  int vd;

  L({this.br, this.fid, this.size});

  L.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
//    vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
//    data['vd'] = this.vd;
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