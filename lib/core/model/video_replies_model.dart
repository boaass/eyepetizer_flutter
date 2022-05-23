class ZCLVideoReply {
  ZCLVideoReply({
    this.itemList,
    this.count,
    this.total,
    this.nextPageUrl,
    this.adExist,
  });

  List<ReplyItemList>? itemList;
  int? count;
  int? total;
  String? nextPageUrl;
  bool? adExist;

  factory ZCLVideoReply.fromJson(Map<String, dynamic> json) => ZCLVideoReply(
    itemList: json["itemList"] == null ? null : List<ReplyItemList>.from(json["itemList"].map((x) => ReplyItemList.fromJson(x))),
    count: json["count"] == null ? null : json["count"],
    total: json["total"] == null ? null : json["total"],
    nextPageUrl: json["nextPageUrl"],
    adExist: json["adExist"] == null ? null : json["adExist"],
  );

  Map<String, dynamic> toJson() => {
    "itemList": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "count": count == null ? null : count,
    "total": total == null ? null : total,
    "nextPageUrl": nextPageUrl,
    "adExist": adExist == null ? null : adExist,
  };
}

class ReplyItemList {
  ReplyItemList({
    this.type,
    this.data,
    this.trackingData,
    this.tag,
    this.id,
    this.adIndex,
  });

  String? type;
  Data? data;
  dynamic? trackingData;
  dynamic? tag;
  int? id;
  int? adIndex;

  factory ReplyItemList.fromJson(Map<String, dynamic> json) => ReplyItemList(
    type: json["type"] == null ? null : json["type"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    trackingData: json["trackingData"],
    tag: json["tag"],
    id: json["id"] == null ? null : json["id"],
    adIndex: json["adIndex"] == null ? null : json["adIndex"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "data": data == null ? null : data!.toJson(),
    "trackingData": trackingData,
    "tag": tag,
    "id": id == null ? null : id,
    "adIndex": adIndex == null ? null : adIndex,
  };
}

class Data {
  Data({
    this.dataType,
    this.id,
    this.type,
    this.text,
    this.subTitle,
    this.actionUrl,
    this.adTrack,
    this.follow,
    this.videoId,
    this.videoTitle,
    this.parentReplyId,
    this.rootReplyId,
    this.sequence,
    this.message,
    this.replyStatus,
    this.createTime,
    this.user,
    this.likeCount,
    this.liked,
    this.hot,
    this.userType,
    this.imageUrl,
    this.ugcVideoId,
    this.recommendLevel,
    this.parentReply,
    this.showParentReply,
    this.showConversationButton,
    this.ugcVideoUrl,
    this.cover,
    this.userBlocked,
    this.sid,
  });

  String? dataType;
  double? id;
  String? type;
  String? text;
  dynamic? subTitle;
  dynamic? actionUrl;
  dynamic? adTrack;
  dynamic? follow;
  int? videoId;
  String? videoTitle;
  int? parentReplyId;
  double? rootReplyId;
  int? sequence;
  String? message;
  String? replyStatus;
  int? createTime;
  User? user;
  int? likeCount;
  bool? liked;
  bool? hot;
  dynamic? userType;
  String? imageUrl;
  dynamic? ugcVideoId;
  String? recommendLevel;
  ParentReply? parentReply;
  bool? showParentReply;
  bool? showConversationButton;
  dynamic? ugcVideoUrl;
  dynamic? cover;
  bool? userBlocked;
  String? sid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dataType: json["dataType"] == null ? null : json["dataType"],
    id: json["id"] == null ? null : json["id"].toDouble(),
    type: json["type"] == null ? null : json["type"],
    text: json["text"] == null ? null : json["text"],
    subTitle: json["subTitle"],
    actionUrl: json["actionUrl"],
    adTrack: json["adTrack"],
    follow: json["follow"],
    videoId: json["videoId"] == null ? null : json["videoId"],
    videoTitle: json["videoTitle"] == null ? null : json["videoTitle"],
    parentReplyId: json["parentReplyId"] == null ? null : json["parentReplyId"],
    rootReplyId: json["rootReplyId"] == null ? null : json["rootReplyId"].toDouble(),
    sequence: json["sequence"] == null ? null : json["sequence"],
    message: json["message"] == null ? null : json["message"],
    replyStatus: json["replyStatus"] == null ? null : json["replyStatus"],
    createTime: json["createTime"] == null ? null : json["createTime"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    likeCount: json["likeCount"] == null ? null : json["likeCount"],
    liked: json["liked"] == null ? null : json["liked"],
    hot: json["hot"] == null ? null : json["hot"],
    userType: json["userType"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    ugcVideoId: json["ugcVideoId"],
    recommendLevel: json["recommendLevel"] == null ? null : json["recommendLevel"],
    parentReply: json["parentReply"] == null ? null : ParentReply.fromJson(json["parentReply"]),
    showParentReply: json["showParentReply"] == null ? null : json["showParentReply"],
    showConversationButton: json["showConversationButton"] == null ? null : json["showConversationButton"],
    ugcVideoUrl: json["ugcVideoUrl"],
    cover: json["cover"],
    userBlocked: json["userBlocked"] == null ? null : json["userBlocked"],
    sid: json["sid"] == null ? null : json["sid"],
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : dataType,
    "id": id == null ? null : id,
    "type": type == null ? null : type,
    "text": text == null ? null : text,
    "subTitle": subTitle,
    "actionUrl": actionUrl,
    "adTrack": adTrack,
    "follow": follow,
    "videoId": videoId == null ? null : videoId,
    "videoTitle": videoTitle == null ? null : videoTitle,
    "parentReplyId": parentReplyId == null ? null : parentReplyId,
    "rootReplyId": rootReplyId == null ? null : rootReplyId,
    "sequence": sequence == null ? null : sequence,
    "message": message == null ? null : message,
    "replyStatus": replyStatus == null ? null : replyStatus,
    "createTime": createTime == null ? null : createTime,
    "user": user == null ? null : user!.toJson(),
    "likeCount": likeCount == null ? null : likeCount,
    "liked": liked == null ? null : liked,
    "hot": hot == null ? null : hot,
    "userType": userType,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "ugcVideoId": ugcVideoId,
    "recommendLevel": recommendLevel == null ? null : recommendLevel,
    "parentReply": parentReply == null ? null : parentReply!.toJson(),
    "showParentReply": showParentReply == null ? null : showParentReply,
    "showConversationButton": showConversationButton == null ? null : showConversationButton,
    "ugcVideoUrl": ugcVideoUrl,
    "cover": cover,
    "userBlocked": userBlocked == null ? null : userBlocked,
    "sid": sid == null ? null : sid,
  };
}

class ParentReply {
  ParentReply({
    this.id,
    this.user,
    this.message,
    this.imageUrl,
    this.replyStatus,
  });

  double? id;
  User? user;
  String? message;
  String? imageUrl;
  String? replyStatus;

  factory ParentReply.fromJson(Map<String, dynamic> json) => ParentReply(
    id: json["id"] == null ? null : json["id"].toDouble(),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    message: json["message"] == null ? null : json["message"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    replyStatus: json["replyStatus"] == null ? null : json["replyStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user": user == null ? null : user!.toJson(),
    "message": message == null ? null : message,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "replyStatus": replyStatus == null ? null : replyStatus,
  };
}

class User {
  User({
    this.uid,
    this.nickname,
    this.avatar,
    this.userType,
    this.ifPgc,
    this.description,
    this.area,
    this.gender,
    this.registDate,
    this.releaseDate,
    this.cover,
    this.actionUrl,
    this.followed,
    this.limitVideoOpen,
    this.userLibrary,
    this.birthday,
    this.country,
    this.city,
    this.university,
    this.job,
    this.expert,
  });

  int? uid;
  String? nickname;
  String? avatar;
  String? userType;
  bool? ifPgc;
  String? description;
  dynamic? area;
  String? gender;
  int? registDate;
  dynamic? releaseDate;
  dynamic? cover;
  String? actionUrl;
  bool? followed;
  bool? limitVideoOpen;
  String? userLibrary;
  int? birthday;
  dynamic? country;
  dynamic? city;
  dynamic? university;
  dynamic? job;
  bool? expert;

  factory User.fromJson(Map<String, dynamic> json) => User(
    uid: json["uid"] == null ? null : json["uid"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    userType: json["userType"] == null ? null : json["userType"],
    ifPgc: json["ifPgc"] == null ? null : json["ifPgc"],
    description: json["description"] == null ? null : json["description"],
    area: json["area"],
    gender: json["gender"] == null ? null : json["gender"],
    registDate: json["registDate"] == null ? null : json["registDate"],
    releaseDate: json["releaseDate"],
    cover: json["cover"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    followed: json["followed"] == null ? null : json["followed"],
    limitVideoOpen: json["limitVideoOpen"] == null ? null : json["limitVideoOpen"],
    userLibrary: json["library"] == null ? null : json["library"],
    birthday: json["birthday"] == null ? null : json["birthday"],
    country: json["country"],
    city: json["city"],
    university: json["university"],
    job: json["job"],
    expert: json["expert"] == null ? null : json["expert"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "userType": userType == null ? null : userType,
    "ifPgc": ifPgc == null ? null : ifPgc,
    "description": description == null ? null : description,
    "area": area,
    "gender": gender == null ? null : gender,
    "registDate": registDate == null ? null : registDate,
    "releaseDate": releaseDate,
    "cover": cover,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "followed": followed == null ? null : followed,
    "limitVideoOpen": limitVideoOpen == null ? null : limitVideoOpen,
    "library": userLibrary == null ? null : userLibrary,
    "birthday": birthday == null ? null : birthday,
    "country": country,
    "city": city,
    "university": university,
    "job": job,
    "expert": expert == null ? null : expert,
  };
}
