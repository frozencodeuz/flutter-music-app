import 'Song.dart';

class PlaylistDetailPlaylist {
  int privacy;
  dynamic description;
  int trackNumberUpdateTime;
  bool subscribed;
  int shareCount;
  int adType;
  int trackCount;
  String coverimgidStr;
  int specialType;
//  List<Trackid> trackIds;
  int id;
  bool ordered;
//  PlaylistDetailPlaylistCreator creator;
//  List<Null> subscribers;
  dynamic backgroundCoverUrl;
  bool highQuality;
  String commentThreadId;
  int updateTime;
  int trackUpdateTime;
  int userId;
  List<Song> tracks;
//  List<Null> tags;
  int commentCount;
  int cloudTrackCount;
  String coverImgUrl;
  int playCount;
  int coverImgId;
  int createTime;
  String name;
  int backgroundCoverId;
  int subscribedCount;
  dynamic updateFrequency;
  bool newImported;
  int status;

  PlaylistDetailPlaylist({this.privacy, this.description, this.trackNumberUpdateTime, this.subscribed, this.shareCount, this.adType, this.trackCount, this.coverimgidStr, this.specialType,
//    this.trackIds,
    this.id, this.ordered,
//    this.creator,
//    this.subscribers,
    this.backgroundCoverUrl, this.highQuality, this.commentThreadId, this.updateTime, this.trackUpdateTime, this.userId, this.tracks,
//    this.tags,
    this.commentCount, this.cloudTrackCount, this.coverImgUrl, this.playCount, this.coverImgId, this.createTime, this.name, this.backgroundCoverId, this.subscribedCount, this.updateFrequency, this.newImported, this.status});

  PlaylistDetailPlaylist.fromJson(Map<String, dynamic> json) {
    privacy = json['privacy'];
    description = json['description'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    subscribed = json['subscribed'];
    shareCount = json['shareCount'];
    adType = json['adType'];
    trackCount = json['trackCount'];
    coverimgidStr = json['coverImgId_str'];
    specialType = json['specialType'];
//    if (json['trackIds'] != null) {
//      trackIds = new List<PlaylistDetailPlaylistTrackid>();(json['trackIds'] as List).forEach((v) { trackIds.add(new PlaylistDetailPlaylistTrackid.fromJson(v)); });
//    }
    id = json['id'];
    ordered = json['ordered'];
//    creator = json['creator'] != null ? new PlaylistDetailPlaylistCreator.fromJson(json['creator']) : null;
//    if (json['subscribers'] != null) {
//      subscribers = new List<Null>();
//    }
    backgroundCoverUrl = json['backgroundCoverUrl'];
    highQuality = json['highQuality'];
    commentThreadId = json['commentThreadId'];
    updateTime = json['updateTime'];
    trackUpdateTime = json['trackUpdateTime'];
    userId = json['userId'];
    if (json['tracks'] != null) {
      tracks = new List<Song>();(json['tracks'] as List).forEach((v) { tracks.add(new Song.fromJson(v)); });
    }
//    if (json['tags'] != null) {
//      tags = new List<Null>();
//    }
    commentCount = json['commentCount'];
    cloudTrackCount = json['cloudTrackCount'];
    coverImgUrl = json['coverImgUrl'];
    playCount = json['playCount'];
    coverImgId = json['coverImgId'];
    createTime = json['createTime'];
    name = json['name'];
    backgroundCoverId = json['backgroundCoverId'];
    subscribedCount = json['subscribedCount'];
    updateFrequency = json['updateFrequency'];
    newImported = json['newImported'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy'] = this.privacy;
    data['description'] = this.description;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['subscribed'] = this.subscribed;
    data['shareCount'] = this.shareCount;
    data['adType'] = this.adType;
    data['trackCount'] = this.trackCount;
    data['coverImgId_str'] = this.coverimgidStr;
    data['specialType'] = this.specialType;
//    if (this.trackIds != null) {
//      data['trackIds'] =  this.trackIds.map((v) => v.toJson()).toList();
//    }
    data['id'] = this.id;
    data['ordered'] = this.ordered;
//    if (this.creator != null) {
//      data['creator'] = this.creator.toJson();
//    }
//    if (this.subscribers != null) {
//      data['subscribers'] =  [];
//    }
    data['backgroundCoverUrl'] = this.backgroundCoverUrl;
    data['highQuality'] = this.highQuality;
    data['commentThreadId'] = this.commentThreadId;
    data['updateTime'] = this.updateTime;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['userId'] = this.userId;
    if (this.tracks != null) {
      data['tracks'] =  this.tracks.map((v) => v.toJson()).toList();
    }
//    if (this.tags != null) {
//      data['tags'] =  [];
//    }
    data['commentCount'] = this.commentCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['coverImgUrl'] = this.coverImgUrl;
    data['playCount'] = this.playCount;
    data['coverImgId'] = this.coverImgId;
    data['createTime'] = this.createTime;
    data['name'] = this.name;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['subscribedCount'] = this.subscribedCount;
    data['updateFrequency'] = this.updateFrequency;
    data['newImported'] = this.newImported;
    data['status'] = this.status;
    return data;
  }
}
