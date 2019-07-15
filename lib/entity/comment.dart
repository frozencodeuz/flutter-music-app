class CommentModel {
  bool isMusician;
  int userId;
//  List<Null> topComments;
  bool moreHot;
  List<HotComments> hotComments;
  int code;
  List<Comments> comments;
  int total;
  bool more;

  CommentModel({this.isMusician, this.userId,
//    this.topComments,
    this.moreHot, this.hotComments, this.code, this.comments, this.total, this.more});

  CommentModel.fromJson(Map<String, dynamic> json) {
    isMusician = json['isMusician'];
    userId = json['userId'];
//    if (json['topComments'] != null) {
//      topComments = new List<Null>();
//      json['topComments'].forEach((v) { topComments.add(new Null.fromJson(v)); });
//    }
    moreHot = json['moreHot'];
    if (json['hotComments'] != null) {
      hotComments = new List<HotComments>();
      json['hotComments'].forEach((v) { hotComments.add(new HotComments.fromJson(v)); });
    }
    code = json['code'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) { comments.add(new Comments.fromJson(v)); });
    }
    total = json['total'];
    more = json['more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMusician'] = this.isMusician;
    data['userId'] = this.userId;
//    if (this.topComments != null) {
//      data['topComments'] = this.topComments.map((v) => v.toJson()).toList();
//    }
    data['moreHot'] = this.moreHot;
    if (this.hotComments != null) {
      data['hotComments'] = this.hotComments.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['more'] = this.more;
    return data;
  }
}

class HotComments {
  User user;
//  List<Null> beReplied;
//  Null pendantData;
//  Null showFloorComment;
  int status;
  int commentLocationType;
  int parentCommentId;
//  Null decoration;
  bool repliedMark;
  int likedCount;
//  Null expressionUrl;
  int time;
  bool liked;
  int commentId;
  String content;

  HotComments({this.user,
//    this.beReplied, this.pendantData, this.showFloorComment,
    this.status, this.commentLocationType, this.parentCommentId,
//    this.decoration,
    this.repliedMark, this.likedCount,
//    this.expressionUrl,
    this.time, this.liked, this.commentId, this.content});

  HotComments.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
//    if (json['beReplied'] != null) {
//      beReplied = new List<Null>();
//      json['beReplied'].forEach((v) { beReplied.add(new Null.fromJson(v)); });
//    }
//    pendantData = json['pendantData'];
//    showFloorComment = json['showFloorComment'];
    status = json['status'];
    commentLocationType = json['commentLocationType'];
    parentCommentId = json['parentCommentId'];
//    decoration = json['decoration'];
    repliedMark = json['repliedMark'];
    likedCount = json['likedCount'];
//    expressionUrl = json['expressionUrl'];
    time = json['time'];
    liked = json['liked'];
    commentId = json['commentId'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
//    if (this.beReplied != null) {
//      data['beReplied'] = this.beReplied.map((v) => v.toJson()).toList();
//    }
//    data['pendantData'] = this.pendantData;
//    data['showFloorComment'] = this.showFloorComment;
    data['status'] = this.status;
    data['commentLocationType'] = this.commentLocationType;
    data['parentCommentId'] = this.parentCommentId;
//    data['decoration'] = this.decoration;
    data['repliedMark'] = this.repliedMark;
    data['likedCount'] = this.likedCount;
//    data['expressionUrl'] = this.expressionUrl;
    data['time'] = this.time;
    data['liked'] = this.liked;
    data['commentId'] = this.commentId;
    data['content'] = this.content;
    return data;
  }
}

class User {
//  Null locationInfo;
  int userId;
//  Null vipRights;
  int authStatus;
  int userType;
//  Null remarkName;
  String nickname;
  int vipType;
  String avatarUrl;
//  Null experts;
//  Null expertTags;

  User({
//    this.locationInfo,
    this.userId,
//    this.vipRights,
    this.authStatus, this.userType,
//    this.remarkName,
    this.nickname, this.vipType, this.avatarUrl,
//    this.experts, this.expertTags
  });

  User.fromJson(Map<String, dynamic> json) {
//    locationInfo = json['locationInfo'];
    userId = json['userId'];
//    vipRights = json['vipRights'];
    authStatus = json['authStatus'];
    userType = json['userType'];
//    remarkName = json['remarkName'];
    nickname = json['nickname'];
    vipType = json['vipType'];
    avatarUrl = json['avatarUrl'];
//    experts = json['experts'];
//    expertTags = json['expertTags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['locationInfo'] = this.locationInfo;
    data['userId'] = this.userId;
//    data['vipRights'] = this.vipRights;
    data['authStatus'] = this.authStatus;
    data['userType'] = this.userType;
//    data['remarkName'] = this.remarkName;
    data['nickname'] = this.nickname;
    data['vipType'] = this.vipType;
    data['avatarUrl'] = this.avatarUrl;
//    data['experts'] = this.experts;
//    data['expertTags'] = this.expertTags;
    return data;
  }
}

class Comments {
  User user;
//  List<Null> beReplied;
//  Null pendantData;
//  Null showFloorComment;
  int status;
  int commentLocationType;
  int parentCommentId;
  Decoration decoration;
  bool repliedMark;
  int likedCount;
//  Null expressionUrl;
  int time;
  bool liked;
  int commentId;
  String content;
  bool isRemoveHotComment;

  Comments({this.user,
//    this.beReplied, this.pendantData, this.showFloorComment,
    this.status, this.commentLocationType, this.parentCommentId, this.decoration, this.repliedMark, this.likedCount,
//    this.expressionUrl,
    this.time, this.liked, this.commentId, this.content, this.isRemoveHotComment});

  Comments.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
//    if (json['beReplied'] != null) {
//      beReplied = new List<Null>();
//      json['beReplied'].forEach((v) { beReplied.add(new Null.fromJson(v)); });
//    }
//    pendantData = json['pendantData'];
//    showFloorComment = json['showFloorComment'];
    status = json['status'];
    commentLocationType = json['commentLocationType'];
    parentCommentId = json['parentCommentId'];
    decoration = json['decoration'] != null ? new Decoration.fromJson(json['decoration']) : null;
    repliedMark = json['repliedMark'];
    likedCount = json['likedCount'];
//    expressionUrl = json['expressionUrl'];
    time = json['time'];
    liked = json['liked'];
    commentId = json['commentId'];
    content = json['content'];
    isRemoveHotComment = json['isRemoveHotComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
//    if (this.beReplied != null) {
//      data['beReplied'] = this.beReplied.map((v) => v.toJson()).toList();
//    }
//    data['pendantData'] = this.pendantData;
//    data['showFloorComment'] = this.showFloorComment;
    data['status'] = this.status;
    data['commentLocationType'] = this.commentLocationType;
    data['parentCommentId'] = this.parentCommentId;
    if (this.decoration != null) {
      data['decoration'] = this.decoration.toJson();
    }
    data['repliedMark'] = this.repliedMark;
    data['likedCount'] = this.likedCount;
//    data['expressionUrl'] = this.expressionUrl;
    data['time'] = this.time;
    data['liked'] = this.liked;
    data['commentId'] = this.commentId;
    data['content'] = this.content;
    data['isRemoveHotComment'] = this.isRemoveHotComment;
    return data;
  }
}

class VipRights {
  Associator associator;
//  Null musicPackage;
  int redVipAnnualCount;

  VipRights({this.associator,
//    this.musicPackage,
    this.redVipAnnualCount});

  VipRights.fromJson(Map<String, dynamic> json) {
    associator = json['associator'] != null ? new Associator.fromJson(json['associator']) : null;
//    musicPackage = json['musicPackage'];
    redVipAnnualCount = json['redVipAnnualCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.associator != null) {
      data['associator'] = this.associator.toJson();
    }
//    data['musicPackage'] = this.musicPackage;
    data['redVipAnnualCount'] = this.redVipAnnualCount;
    return data;
  }
}

class Associator {
  int vipCode;
  bool rights;

  Associator({this.vipCode, this.rights});

  Associator.fromJson(Map<String, dynamic> json) {
    vipCode = json['vipCode'];
    rights = json['rights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vipCode'] = this.vipCode;
    data['rights'] = this.rights;
    return data;
  }
}

class Decoration {


  Decoration();

Decoration.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}