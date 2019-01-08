class UserModel {
  int loginType;
  int code;
  Account account;
  Profile profile;
  List<Bindings> bindings;

  UserModel({this.loginType, this.code, this.account, this.profile, this.bindings});

  UserModel.fromJson(Map<String, dynamic> json) {
    loginType = json['loginType'];
    code = json['code'];
    account = json['account'] != null ? new Account.fromJson(json['account']) : null;
    profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['bindings'] != null) {
      bindings = new List<Bindings>();
      json['bindings'].forEach((v) { bindings.add(new Bindings.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this.loginType;
    data['code'] = this.code;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Account {
  int id;
  String userName;
  int type;
  int status;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoyueVersion;
  int donateVersion;
  int vipType;
  int viptypeVersion;
  bool anonimousUser;

  Account({this.id, this.userName, this.type, this.status, this.whitelistAuthority, this.createTime, this.salt, this.tokenVersion, this.ban, this.baoyueVersion, this.donateVersion, this.vipType, this.viptypeVersion, this.anonimousUser});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    salt = json['salt'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoyueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    viptypeVersion = json['viptypeVersion'];
    anonimousUser = json['anonimousUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['whitelistAuthority'] = this.whitelistAuthority;
    data['createTime'] = this.createTime;
    data['salt'] = this.salt;
    data['tokenVersion'] = this.tokenVersion;
    data['ban'] = this.ban;
    data['baoyueVersion'] = this.baoyueVersion;
    data['donateVersion'] = this.donateVersion;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.viptypeVersion;
    data['anonimousUser'] = this.anonimousUser;
    return data;
  }
}

class Profile {
  String nickname;
  int accountStatus;
  int vipType;
  int gender;
  int province;
  bool defaultAvatar;
  String avatarUrl;
  int birthday;
  int city;
  int userId;
  Null expertTags;
  Experts experts;
  int djStatus;
  int avatarImgId;
  int backgroundImgId;
  int userType;
  bool mutual;
  Null remarkName;
  int authStatus;
  String detailDescription;
  bool followed;
  String backgroundUrl;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String description;
  String signature;
  int authority;
  int followeds;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile({this.nickname, this.accountStatus, this.vipType, this.gender, this.province, this.defaultAvatar, this.avatarUrl, this.birthday, this.city, this.userId, this.expertTags, this.experts, this.djStatus, this.avatarImgId, this.backgroundImgId, this.userType, this.mutual, this.remarkName, this.authStatus, this.detailDescription, this.followed, this.backgroundUrl, this.avatarImgIdStr, this.backgroundImgIdStr, this.description, this.signature, this.authority, this.followeds, this.follows, this.eventCount, this.playlistCount, this.playlistBeSubscribedCount});

  Profile.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    accountStatus = json['accountStatus'];
    vipType = json['vipType'];
    gender = json['gender'];
    province = json['province'];
    defaultAvatar = json['defaultAvatar'];
    avatarUrl = json['avatarUrl'];
    birthday = json['birthday'];
    city = json['city'];
    userId = json['userId'];
    expertTags = json['expertTags'];
    experts = json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
    djStatus = json['djStatus'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    userType = json['userType'];
    mutual = json['mutual'];
    remarkName = json['remarkName'];
    authStatus = json['authStatus'];
    detailDescription = json['detailDescription'];
    followed = json['followed'];
    backgroundUrl = json['backgroundUrl'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    description = json['description'];
    signature = json['signature'];
    authority = json['authority'];
    avatarImgIdStr = json['avatarImgId_str'];
    followeds = json['followeds'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['accountStatus'] = this.accountStatus;
    data['vipType'] = this.vipType;
    data['gender'] = this.gender;
    data['province'] = this.province;
    data['defaultAvatar'] = this.defaultAvatar;
    data['avatarUrl'] = this.avatarUrl;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['userId'] = this.userId;
    data['expertTags'] = this.expertTags;
    if (this.experts != null) {
      data['experts'] = this.experts.toJson();
    }
    data['djStatus'] = this.djStatus;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['userType'] = this.userType;
    data['mutual'] = this.mutual;
    data['remarkName'] = this.remarkName;
    data['authStatus'] = this.authStatus;
    data['detailDescription'] = this.detailDescription;
    data['followed'] = this.followed;
    data['backgroundUrl'] = this.backgroundUrl;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['description'] = this.description;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['avatarImgId_str'] = this.avatarImgIdStr;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}

class Experts {


  Experts();

Experts.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}

class Bindings {
  String tokenJsonStr;
  int userId;
  int refreshTime;
  int expiresIn;
  bool expired;
  String url;
  int id;
  int type;

  Bindings({this.tokenJsonStr, this.userId, this.refreshTime, this.expiresIn, this.expired, this.url, this.id, this.type});

  Bindings.fromJson(Map<String, dynamic> json) {
    tokenJsonStr = json['tokenJsonStr'];
    userId = json['userId'];
    refreshTime = json['refreshTime'];
    expiresIn = json['expiresIn'];
    expired = json['expired'];
    url = json['url'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['userId'] = this.userId;
    data['refreshTime'] = this.refreshTime;
    data['expiresIn'] = this.expiresIn;
    data['expired'] = this.expired;
    data['url'] = this.url;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}