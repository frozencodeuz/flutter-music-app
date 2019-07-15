class Al {
  String picUrl;
  String name;
//  List<Null> tns;
  String picStr;
  int id;
  int pic;

  Al({this.picUrl, this.name,
//    this.tns,
    this.picStr, this.id, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    picUrl = json['picUrl'];
    name = json['name'];
//    if (json['tns'] != null) {
//      tns = new List<Null>();
//    }
    picStr = json['pic_str'];
    id = json['id'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picUrl'] = this.picUrl;
    data['name'] = this.name;
//    if (this.tns != null) {
//      data['tns'] =  [];
//    }
    data['pic_str'] = this.picStr;
    data['id'] = this.id;
    data['pic'] = this.pic;
    return data;
  }
}
