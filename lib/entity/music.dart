class MusicResource {
  int code;
  int expi;
  int flag;
  String level;
  int fee;
  String type;
  bool canExtend;
  String url;
  int gain;
  int br;
  dynamic uf;
  int size;
  String encodeType;
  int id;
  String md5;
  int payed;
  dynamic freeTrialInfo;

  MusicResource({this.code, this.expi, this.flag, this.level, this.fee, this.type, this.canExtend, this.url, this.gain, this.br, this.uf, this.size, this.encodeType, this.id, this.md5, this.payed, this.freeTrialInfo});

  MusicResource.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    expi = json['expi'];
    flag = json['flag'];
    level = json['level'];
    fee = json['fee'];
    type = json['type'];
    canExtend = json['canExtend'];
    url = json['url'];
    gain = json['gain'];
    br = json['br'];
    uf = json['uf'];
    size = json['size'];
    encodeType = json['encodeType'];
    id = json['id'];
    md5 = json['md5'];
    payed = json['payed'];
    freeTrialInfo = json['freeTrialInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['expi'] = this.expi;
    data['flag'] = this.flag;
    data['level'] = this.level;
    data['fee'] = this.fee;
    data['type'] = this.type;
    data['canExtend'] = this.canExtend;
    data['url'] = this.url;
    data['gain'] = this.gain;
    data['br'] = this.br;
    data['uf'] = this.uf;
    data['size'] = this.size;
    data['encodeType'] = this.encodeType;
    data['id'] = this.id;
    data['md5'] = this.md5;
    data['payed'] = this.payed;
    data['freeTrialInfo'] = this.freeTrialInfo;
    return data;
  }
}
