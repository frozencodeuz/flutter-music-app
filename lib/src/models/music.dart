class MusicModel {
  List<Data> data;
  int code;

  MusicModel({this.data, this.code});

  MusicModel.fromJson(Map<String, dynamic> json) {
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
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int id;
  String url;
  int br;
  int size;
  String md5;
  int code;
  int expi;
  String type;
  double gain;
  int fee;
  Null uf;
  int payed;
  int flag;
  bool canExtend;
  Null freeTrialInfo;

  Data(
      {this.id,
        this.url,
        this.br,
        this.size,
        this.md5,
        this.code,
        this.expi,
        this.type,
        this.gain,
        this.fee,
        this.uf,
        this.payed,
        this.flag,
        this.canExtend,
        this.freeTrialInfo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    br = json['br'];
    size = json['size'];
    md5 = json['md5'];
    code = json['code'];
    expi = json['expi'];
    type = json['type'];
    gain = double.parse('${json['gain']}');
    fee = json['fee'];
    uf = json['uf'];
    payed = json['payed'];
    flag = json['flag'];
    canExtend = json['canExtend'];
    freeTrialInfo = json['freeTrialInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['br'] = this.br;
    data['size'] = this.size;
    data['md5'] = this.md5;
    data['code'] = this.code;
    data['expi'] = this.expi;
    data['type'] = this.type;
    data['gain'] = this.gain;
    data['fee'] = this.fee;
    data['uf'] = this.uf;
    data['payed'] = this.payed;
    data['flag'] = this.flag;
    data['canExtend'] = this.canExtend;
    data['freeTrialInfo'] = this.freeTrialInfo;
    return data;
  }
}