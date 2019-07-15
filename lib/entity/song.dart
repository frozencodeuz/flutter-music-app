import 'package:myapp/entity/al.dart';

import 'album.dart';
import 'ar.dart';
import 'artist.dart';

class Song {
  int no;
  dynamic rt;
  int copyright;
  int fee;
  dynamic rurl;
  int mst;
  int pst;
  int pop;
  int dt;
  int rtype;
  int sId;
  List<Artist> artists;
//  List<Null> rtUrls;
  Album album;
  int id;
  int st;
  dynamic a;
  String cd;
  int publishTime;
  String cf;
//  MusicDetailSongsH h;
  int mv;
  Al al;
//  MusicDetailSongsL l;
//  MusicDetailSongsM m;
  int cp;
//  List<Null> alia;
  int djId;
  dynamic crbt;
  List<Ar> ar;
  dynamic rtUrl;
  int ftype;
  int t;
  int v;
  String name;
  int mark;

  Song({this.no, this.rt, this.copyright, this.fee, this.rurl, this.mst, this.pst, this.pop, this.dt, this.rtype, this.sId,
    this.artists, this.album,
//    this.rtUrls,
    this.id, this.st, this.a, this.cd, this.publishTime, this.cf,
//    this.h,
    this.mv,
    this.al,
//    this.l, this.m,
    this.cp,
//    this.alia,
    this.djId, this.crbt,
    this.ar,
    this.rtUrl, this.ftype, this.t, this.v, this.name, this.mark});

  Song.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    rt = json['rt'];
    copyright = json['copyright'];
    fee = json['fee'];
    rurl = json['rurl'];
    mst = json['mst'];
    pst = json['pst'];
    pop = json['pop'];
    dt = json['dt'];
    rtype = json['rtype'];
    sId = json['s_id'];
    if (json['artists'] != null) {
      artists = (json['artists'] as List).map((v) => Artist.fromJson(v)).toList();
    }
    if (json['album'] != null) {
      album = Album.fromJson(json['album']);
    }
//    if (json['rtUrls'] != null) {
//      rtUrls = new List<Null>();
//    }
    id = json['id'];
    st = json['st'];
    a = json['a'];
    cd = json['cd'];
    publishTime = json['publishTime'] ?? 0;
    cf = json['cf'];
//    h = json['h'] != null ? new MusicDetailSongsH.fromJson(json['h']) : null;
    mv = json['mv'];
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
//    l = json['l'] != null ? new MusicDetailSongsL.fromJson(json['l']) : null;
//    m = json['m'] != null ? new MusicDetailSongsM.fromJson(json['m']) : null;
    cp = json['cp'];
//    if (json['alia'] != null) {
//      alia = new List<Null>();
//    }
    djId = json['djId'];
    crbt = json['crbt'];
    if (json['ar'] != null) {
      ar = new List<Ar>();
      (json['ar'] as List).forEach((v) { ar.add(new Ar.fromJson(v)); });
    }
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    t = json['t'];
    v = json['v'];
    name = json['name'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['rt'] = this.rt;
    data['copyright'] = this.copyright;
    data['fee'] = this.fee;
    data['rurl'] = this.rurl;
    data['mst'] = this.mst;
    data['pst'] = this.pst;
    data['pop'] = this.pop;
    data['dt'] = this.dt;
    data['rtype'] = this.rtype;
    data['s_id'] = this.sId;
    if (this.artists == null) {
      data['artists'] =  [];
    }
    if (this.album != null) {
      data["album"] = album.toJson();
    }
//    if (this.rtUrls != null) {
//      data['rtUrls'] =  [];
//    }
    data['id'] = this.id;
    data['st'] = this.st;
    data['a'] = this.a;
    data['cd'] = this.cd;
    data['publishTime'] = this.publishTime;
    data['cf'] = this.cf;
//    if (this.h != null) {
//      data['h'] = this.h.toJson();
//    }
    data['mv'] = this.mv;
    if (this.al != null) {
      data['al'] = this.al.toJson();
    }
//    if (this.l != null) {
//      data['l'] = this.l.toJson();
//    }
//    if (this.m != null) {
//      data['m'] = this.m.toJson();
//    }
    data['cp'] = this.cp;
//    if (this.alia != null) {
//      data['alia'] =  [];
//    }
    data['djId'] = this.djId;
    data['crbt'] = this.crbt;
//    if (this.ar != null) {
//      data['ar'] =  this.ar.map((v) => v.toJson()).toList();
//    }
    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
    data['t'] = this.t;
    data['v'] = this.v;
    data['name'] = this.name;
    data['mark'] = this.mark;
    return data;
  }
}
