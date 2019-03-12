class UserProfileModel {
  int code;
  Profile profile;
  List<Bindings> bindings;

  UserProfileModel({this.code, this.profile, this.bindings});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['bindings'] != null) {
      bindings = new List<Bindings>();
      json['bindings'].forEach((v) {
        bindings.add(new Bindings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  int userId;
  String nickname;
  String avatarUrl;
  String birthday;
  int userType;
  int djStatus;

  Profile(
      {this.userId,
        this.nickname,
        this.avatarUrl,
        this.birthday,
        this.userType,
        this.djStatus});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatarUrl = json['avatarUrl'];
    birthday = json['birthday'];
    userType = json['userType'];
    djStatus = json['djStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['avatarUrl'] = this.avatarUrl;
    data['birthday'] = this.birthday;
    data['userType'] = this.userType;
    data['djStatus'] = this.djStatus;
    return data;
  }
}

class Bindings {
  int expiresIn;
  bool expired;
  String tokenJsonStr;
  int refreshTime;
  int id;
  int type;
  int userId;
  String url;

  Bindings(
      {this.expiresIn,
        this.expired,
        this.tokenJsonStr,
        this.refreshTime,
        this.id,
        this.type,
        this.userId,
        this.url});

  Bindings.fromJson(Map<String, dynamic> json) {
    expiresIn = json['expiresIn'];
    expired = json['expired'];
    tokenJsonStr = json['tokenJsonStr'];
    refreshTime = json['refreshTime'];
    id = json['id'];
    type = json['type'];
    userId = json['userId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiresIn'] = this.expiresIn;
    data['expired'] = this.expired;
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['refreshTime'] = this.refreshTime;
    data['id'] = this.id;
    data['type'] = this.type;
    data['userId'] = this.userId;
    data['url'] = this.url;
    return data;
  }
}