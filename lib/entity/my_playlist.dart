import 'artist.dart';

class MyPlayListModel {
  bool more;
  List<Playlist> playlist;
  int code;

  MyPlayListModel({this.more, this.playlist, this.code});

  MyPlayListModel.fromJson(Map<String, dynamic> json) {
    more = json['more'];
    if (json['playlist'] != null) {
      playlist = new List<Playlist>();
      json['playlist'].forEach((v) {
        playlist.add(new Playlist.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['more'] = this.more;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Playlist {
//  List<Null> subscribers;
  bool subscribed;
  Creator creator;
  List<Artist> artists;
//  Null tracks;
  bool ordered;
  int status;
  int createTime;
  bool highQuality;
  int cloudTrackCount;
  int subscribedCount;
  String description;
  List<String> tags;
  int trackNumberUpdateTime;
  String coverImgUrl;
  int trackUpdateTime;
  int trackCount;
  int playCount;
  int updateTime;
  int coverImgId;
  int totalDuration;
  String commentThreadId;
  int userId;
  bool anonimous;
  int privacy;
  bool newImported;
  int specialType;
  int adType;
  String name;
  int id;

  Playlist(
      {
//        this.subscribers,
        this.subscribed,
        this.creator,
//        this.artists,
//        this.tracks,
        this.ordered,
        this.status,
        this.createTime,
        this.highQuality,
        this.cloudTrackCount,
        this.subscribedCount,
        this.description,
        this.tags,
        this.trackNumberUpdateTime,
        this.coverImgUrl,
        this.trackUpdateTime,
        this.trackCount,
        this.playCount,
        this.updateTime,
        this.coverImgId,
        this.totalDuration,
        this.commentThreadId,
        this.userId,
        this.anonimous,
        this.privacy,
        this.newImported,
        this.specialType,
        this.adType,
        this.name,
        this.id});

  Playlist.fromJson(Map<String, dynamic> json) {
//    if (json['subscribers'] != null) {
//      subscribers = new List<Null>();
//      json['subscribers'].forEach((v) {
//        subscribers.add(new Null.fromJson(v));
//      });
//    }
    subscribed = json['subscribed'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
//    artists = json['artists'];
//    tracks = json['tracks'];
    ordered = json['ordered'];
    status = json['status'];
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    cloudTrackCount = json['cloudTrackCount'];
    subscribedCount = json['subscribedCount'];
    description = json['description'];
    tags = json['tags']?.cast<String>();
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    coverImgUrl = json['coverImgUrl'];
    trackUpdateTime = json['trackUpdateTime'];
    trackCount = json['trackCount'];
    playCount = json['playCount'];
    updateTime = json['updateTime'];
    coverImgId = json['coverImgId'];
    totalDuration = json['totalDuration'];
    commentThreadId = json['commentThreadId'];
    userId = json['userId'];
    anonimous = json['anonimous'];
    privacy = json['privacy'];
    newImported = json['newImported'];
    specialType = json['specialType'];
    adType = json['adType'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.subscribers != null) {
//      data['subscribers'] = this.subscribers.map((v) => v.toJson()).toList();
//    }
    data['subscribed'] = this.subscribed;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
//    data['artists'] = this.artists;
//    data['tracks'] = this.tracks;
    data['ordered'] = this.ordered;
    data['status'] = this.status;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['subscribedCount'] = this.subscribedCount;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['coverImgUrl'] = this.coverImgUrl;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['trackCount'] = this.trackCount;
    data['playCount'] = this.playCount;
    data['updateTime'] = this.updateTime;
    data['coverImgId'] = this.coverImgId;
    data['totalDuration'] = this.totalDuration;
    data['commentThreadId'] = this.commentThreadId;
    data['userId'] = this.userId;
    data['anonimous'] = this.anonimous;
    data['privacy'] = this.privacy;
    data['newImported'] = this.newImported;
    data['specialType'] = this.specialType;
    data['adType'] = this.adType;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
//  Null expertTags;
//  Null experts;
  int djStatus;
  int vipType;
//  Null remarkName;
  String backgroundImgIdStr;
  String avatarImgIdStr;

  Creator(
      {this.defaultAvatar,
        this.province,
        this.authStatus,
        this.followed,
        this.avatarUrl,
        this.accountStatus,
        this.gender,
        this.city,
        this.birthday,
        this.userId,
        this.userType,
        this.nickname,
        this.signature,
        this.description,
        this.detailDescription,
        this.avatarImgId,
        this.backgroundImgId,
        this.backgroundUrl,
        this.authority,
        this.mutual,
//        this.expertTags,
//        this.experts,
        this.djStatus,
        this.vipType,
//        this.remarkName,
        this.backgroundImgIdStr,
        this.avatarImgIdStr});

  Creator.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
//    expertTags = json['expertTags'];
//    experts = json['experts'];
    djStatus = json['djStatus'];
    vipType = json['vipType'];
//    remarkName = json['remarkName'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    avatarImgIdStr = json['avatarImgIdStr'];
    avatarImgIdStr = json['avatarImgId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['avatarUrl'] = this.avatarUrl;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birthday'] = this.birthday;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['authority'] = this.authority;
    data['mutual'] = this.mutual;
//    data['expertTags'] = this.expertTags;
//    data['experts'] = this.experts;
    data['djStatus'] = this.djStatus;
    data['vipType'] = this.vipType;
//    data['remarkName'] = this.remarkName;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['avatarImgId_str'] = this.avatarImgIdStr;
    return data;
  }
}
