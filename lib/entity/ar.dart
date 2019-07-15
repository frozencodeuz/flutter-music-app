class Ar {
  String name;
//  List<Null> tns;
//  List<Null> alias;
  int id;

  Ar({this.name,
//    this.tns, this.alias,
    this.id});

  Ar.fromJson(Map<String, dynamic> json) {
    name = json['name'];
//    if (json['tns'] != null) {
//      tns = new List<Null>();
//    }
//    if (json['alias'] != null) {
//      alias = new List<Null>();
//    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
//    if (this.tns != null) {
//      data['tns'] =  [];
//    }
//    if (this.alias != null) {
//      data['alias'] =  [];
//    }
    data['id'] = this.id;
    return data;
  }
}
