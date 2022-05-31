class ZCLTopicDetailTag {
  ZCLTopicDetailTag({
    this.itemList,
    this.count,
    this.total,
    this.nextPageUrl,
    this.adExist,
  });

  List<ItemList>? itemList;
  int? count;
  int? total;
  String? nextPageUrl;
  bool? adExist;

  factory ZCLTopicDetailTag.fromJson(Map<String, dynamic> json) => ZCLTopicDetailTag(
    itemList: json["itemList"] == null ? null : List<ItemList>.from(json["itemList"].map((x) => ItemList.fromJson(x))),
    count: json["count"] == null ? null : json["count"],
    total: json["total"] == null ? null : json["total"],
    nextPageUrl: json["nextPageUrl"] == null ? null : json["nextPageUrl"],
    adExist: json["adExist"] == null ? null : json["adExist"],
  );

  Map<String, dynamic> toJson() => {
    "itemList": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "count": count == null ? null : count,
    "total": total == null ? null : total,
    "nextPageUrl": nextPageUrl == null ? null : nextPageUrl,
    "adExist": adExist == null ? null : adExist,
  };
}

class ItemList {
  ItemList({
    this.type,
    this.data,
    this.tag,
    this.id,
    this.adIndex,
  });

  ItemListType? type;
  ItemListData? data;
  dynamic? tag;
  int? id;
  int? adIndex;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    type: json["type"] == null ? null : itemListTypeValues.maps![json["type"]],
    data: json["data"] == null ? null : ItemListData.fromJson(json["data"]),
    tag: json["tag"],
    id: json["id"] == null ? null : json["id"],
    adIndex: json["adIndex"] == null ? null : json["adIndex"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : itemListTypeValues.reverse![type],
    "data": data == null ? null : data!.toJson(),
    "tag": tag,
    "id": id == null ? null : id,
    "adIndex": adIndex == null ? null : adIndex,
  };
}

class ItemListData {
  ItemListData({
    this.dataType,
    this.header,
    this.content,
  });

  FluffyDataType? dataType;
  Header? header;
  Content? content;

  factory ItemListData.fromJson(Map<String, dynamic> json) => ItemListData(
    dataType: json["dataType"] == null ? null : fluffyDataTypeValues.maps![json["dataType"]],
    header: json["header"] == null ? null : Header.fromJson(json["header"]),
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : fluffyDataTypeValues.reverse![dataType],
    "header": header == null ? null : header!.toJson(),
    "content": content == null ? null : content!.toJson(),
  };
}

class Content {
  Content({
    this.type,
    this.data,
    this.tag,
    this.id,
    this.adIndex,
  });

  ContentType? type;
  ContentData? data;
  dynamic? tag;
  int? id;
  int? adIndex;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    type: json["type"] == null ? null : contentTypeValues.maps![json["type"]],
    data: json["data"] == null ? null : ContentData.fromJson(json["data"]),
    tag: json["tag"],
    id: json["id"] == null ? null : json["id"],
    adIndex: json["adIndex"] == null ? null : json["adIndex"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : contentTypeValues.reverse![type],
    "data": data == null ? null : data!.toJson(),
    "tag": tag,
    "id": id == null ? null : id,
    "adIndex": adIndex == null ? null : adIndex,
  };
}

class ContentData {
  ContentData({
    this.dataType,
    this.id,
    this.title,
    this.description,
    this.dataLibrary,
    this.tags,
    this.consumption,
    this.resourceType,
    this.uid,
    this.createTime,
    this.updateTime,
    this.collected,
    this.reallyCollected,
    this.owner,
    this.cover,
    this.selectedTime,
    this.checkStatus,
    this.area,
    this.city,
    this.longitude,
    this.latitude,
    this.ifMock,
    this.validateStatus,
    this.validateResult,
    this.width,
    this.height,
    this.addWatermark,
    this.recentOnceReply,
    this.privateMessageActionUrl,
    this.source,
    this.url,
    this.urls,
    this.status,
    this.releaseTime,
    this.urlsWithWatermark,
    this.playUrl,
    this.duration,
    this.transId,
    this.type,
    this.validateTaskId,
    this.playUrlWatermark,
  });

  PurpleDataType? dataType;
  int? id;
  String? title;
  String? description;
  TypeEnum? dataLibrary;
  List<Tag>? tags;
  Consumption? consumption;
  ResourceType? resourceType;
  int? uid;
  int? createTime;
  int? updateTime;
  bool? collected;
  bool? reallyCollected;
  Owner? owner;
  Cover? cover;
  dynamic? selectedTime;
  CheckStatus? checkStatus;
  String? area;
  String? city;
  double? longitude;
  double? latitude;
  bool? ifMock;
  ValidateStatus? validateStatus;
  ValidateResult? validateResult;
  int? width;
  int? height;
  bool? addWatermark;
  RecentOnceReply? recentOnceReply;
  String? privateMessageActionUrl;
  String? source;
  String? url;
  List<String>? urls;
  dynamic? status;
  int? releaseTime;
  List<String>? urlsWithWatermark;
  String? playUrl;
  int? duration;
  dynamic? transId;
  String? type;
  String? validateTaskId;
  String? playUrlWatermark;

  factory ContentData.fromJson(Map<String, dynamic> json) => ContentData(
    dataType: json["dataType"] == null ? null : purpleDataTypeValues.maps![json["dataType"]],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    dataLibrary: json["library"] == null ? null : typeEnumValues.maps![json["library"]],
    tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    consumption: json["consumption"] == null ? null : Consumption.fromJson(json["consumption"]),
    resourceType: json["resourceType"] == null ? null : resourceTypeValues.maps![json["resourceType"]],
    uid: json["uid"] == null ? null : json["uid"],
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    collected: json["collected"] == null ? null : json["collected"],
    reallyCollected: json["reallyCollected"] == null ? null : json["reallyCollected"],
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    cover: json["cover"] == null ? null : Cover.fromJson(json["cover"]),
    selectedTime: json["selectedTime"],
    checkStatus: json["checkStatus"] == null ? null : checkStatusValues.maps![json["checkStatus"]],
    area: json["area"] == null ? null : json["area"],
    city: json["city"] == null ? null : json["city"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    ifMock: json["ifMock"] == null ? null : json["ifMock"],
    validateStatus: json["validateStatus"] == null ? null : validateStatusValues.maps![json["validateStatus"]],
    validateResult: json["validateResult"] == null ? null : validateResultValues.maps![json["validateResult"]],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    addWatermark: json["addWatermark"] == null ? null : json["addWatermark"],
    recentOnceReply: json["recentOnceReply"] == null ? null : RecentOnceReply.fromJson(json["recentOnceReply"]),
    privateMessageActionUrl: json["privateMessageActionUrl"] == null ? null : json["privateMessageActionUrl"],
    source: json["source"] == null ? null : json["source"],
    url: json["url"] == null ? null : json["url"],
    urls: json["urls"] == null ? null : List<String>.from(json["urls"].map((x) => x)),
    status: json["status"],
    releaseTime: json["releaseTime"] == null ? null : json["releaseTime"],
    urlsWithWatermark: json["urlsWithWatermark"] == null ? null : List<String>.from(json["urlsWithWatermark"].map((x) => x)),
    playUrl: json["playUrl"] == null ? null : json["playUrl"],
    duration: json["duration"] == null ? null : json["duration"],
    transId: json["transId"],
    type: json["type"] == null ? null : json["type"],
    validateTaskId: json["validateTaskId"] == null ? null : json["validateTaskId"],
    playUrlWatermark: json["playUrlWatermark"] == null ? null : json["playUrlWatermark"],
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : purpleDataTypeValues.reverse![dataType],
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "library": dataLibrary == null ? null : typeEnumValues.reverse![dataLibrary],
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "consumption": consumption == null ? null : consumption!.toJson(),
    "resourceType": resourceType == null ? null : resourceTypeValues.reverse![resourceType],
    "uid": uid == null ? null : uid,
    "createTime": createTime == null ? null : createTime,
    "updateTime": updateTime == null ? null : updateTime,
    "collected": collected == null ? null : collected,
    "reallyCollected": reallyCollected == null ? null : reallyCollected,
    "owner": owner == null ? null : owner!.toJson(),
    "cover": cover == null ? null : cover!.toJson(),
    "selectedTime": selectedTime,
    "checkStatus": checkStatus == null ? null : checkStatusValues.reverse![checkStatus],
    "area": area == null ? null : area,
    "city": city == null ? null : city,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
    "ifMock": ifMock == null ? null : ifMock,
    "validateStatus": validateStatus == null ? null : validateStatusValues.reverse![validateStatus],
    "validateResult": validateResult == null ? null : validateResultValues.reverse![validateResult],
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "addWatermark": addWatermark == null ? null : addWatermark,
    "recentOnceReply": recentOnceReply == null ? null : recentOnceReply!.toJson(),
    "privateMessageActionUrl": privateMessageActionUrl == null ? null : privateMessageActionUrl,
    "source": source == null ? null : source,
    "url": url == null ? null : url,
    "urls": urls == null ? null : List<dynamic>.from(urls!.map((x) => x)),
    "status": status,
    "releaseTime": releaseTime == null ? null : releaseTime,
    "urlsWithWatermark": urlsWithWatermark == null ? null : List<dynamic>.from(urlsWithWatermark!.map((x) => x)),
    "playUrl": playUrl == null ? null : playUrl,
    "duration": duration == null ? null : duration,
    "transId": transId,
    "type": type == null ? null : type,
    "validateTaskId": validateTaskId == null ? null : validateTaskId,
    "playUrlWatermark": playUrlWatermark == null ? null : playUrlWatermark,
  };
}

enum CheckStatus { CHECKED, UNCHECKED }

final checkStatusValues = EnumValues({
  "CHECKED": CheckStatus.CHECKED,
  "UNCHECKED": CheckStatus.UNCHECKED
});

class Consumption {
  Consumption({
    this.collectionCount,
    this.shareCount,
    this.replyCount,
    this.realCollectionCount,
    this.playCount,
  });

  int? collectionCount;
  int? shareCount;
  int? replyCount;
  int? realCollectionCount;
  int? playCount;

  factory Consumption.fromJson(Map<String, dynamic> json) => Consumption(
    collectionCount: json["collectionCount"] == null ? null : json["collectionCount"],
    shareCount: json["shareCount"] == null ? null : json["shareCount"],
    replyCount: json["replyCount"] == null ? null : json["replyCount"],
    realCollectionCount: json["realCollectionCount"] == null ? null : json["realCollectionCount"],
    playCount: json["playCount"] == null ? null : json["playCount"],
  );

  Map<String, dynamic> toJson() => {
    "collectionCount": collectionCount == null ? null : collectionCount,
    "shareCount": shareCount == null ? null : shareCount,
    "replyCount": replyCount == null ? null : replyCount,
    "realCollectionCount": realCollectionCount == null ? null : realCollectionCount,
    "playCount": playCount == null ? null : playCount,
  };
}

class Cover {
  Cover({
    this.feed,
    this.detail,
    this.blurred,
    this.sharing,
    this.homepage,
  });

  String? feed;
  String? detail;
  dynamic? blurred;
  dynamic? sharing;
  dynamic? homepage;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
    feed: json["feed"] == null ? null : json["feed"],
    detail: json["detail"] == null ? null : json["detail"],
    blurred: json["blurred"],
    sharing: json["sharing"],
    homepage: json["homepage"],
  );

  Map<String, dynamic> toJson() => {
    "feed": feed == null ? null : feed,
    "detail": detail == null ? null : detail,
    "blurred": blurred,
    "sharing": sharing,
    "homepage": homepage,
  };
}

enum TypeEnum { NOT_RECOMMEND, DEFAULT }

final typeEnumValues = EnumValues({
  "DEFAULT": TypeEnum.DEFAULT,
  "NOT_RECOMMEND": TypeEnum.NOT_RECOMMEND
});

enum PurpleDataType { UGC_PICTURE_BEAN, UGC_VIDEO_BEAN }

final purpleDataTypeValues = EnumValues({
  "UgcPictureBean": PurpleDataType.UGC_PICTURE_BEAN,
  "UgcVideoBean": PurpleDataType.UGC_VIDEO_BEAN
});

class Owner {
  Owner({
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
    this.ownerLibrary,
    this.birthday,
    this.country,
    this.city,
    this.university,
    this.job,
    this.expert,
    this.username,
    this.uploadStatus,
    this.bannedDate,
    this.bannedDays,
    this.tagIds,
    this.userMedalBeanList,
  });

  int? uid;
  String? nickname;
  String? avatar;
  UploadStatus? userType;
  bool? ifPgc;
  String? description;
  dynamic? area;
  String? gender;
  int? registDate;
  int? releaseDate;
  String? cover;
  String? actionUrl;
  bool? followed;
  bool? limitVideoOpen;
  OwnerLibrary? ownerLibrary;
  int? birthday;
  String? country;
  String? city;
  String? university;
  String? job;
  bool? expert;
  String? username;
  UploadStatus? uploadStatus;
  dynamic? bannedDate;
  int? bannedDays;
  dynamic? tagIds;
  dynamic? userMedalBeanList;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    uid: json["uid"] == null ? null : json["uid"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    userType: json["userType"] == null ? null : uploadStatusValues.maps![json["userType"]],
    ifPgc: json["ifPgc"] == null ? null : json["ifPgc"],
    description: json["description"] == null ? null : json["description"],
    area: json["area"],
    gender: json["gender"] == null ? null : json["gender"],
    registDate: json["registDate"] == null ? null : json["registDate"],
    releaseDate: json["releaseDate"] == null ? null : json["releaseDate"],
    cover: json["cover"] == null ? null : json["cover"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    followed: json["followed"] == null ? null : json["followed"],
    limitVideoOpen: json["limitVideoOpen"] == null ? null : json["limitVideoOpen"],
    ownerLibrary: json["library"] == null ? null : ownerLibraryValues.maps![json["library"]],
    birthday: json["birthday"] == null ? null : json["birthday"],
    country: json["country"] == null ? null : json["country"],
    city: json["city"] == null ? null : json["city"],
    university: json["university"] == null ? null : json["university"],
    job: json["job"] == null ? null : json["job"],
    expert: json["expert"] == null ? null : json["expert"],
    username: json["username"] == null ? null : json["username"],
    uploadStatus: json["uploadStatus"] == null ? null : uploadStatusValues.maps![json["uploadStatus"]],
    bannedDate: json["bannedDate"],
    bannedDays: json["bannedDays"] == null ? null : json["bannedDays"],
    tagIds: json["tagIds"],
    userMedalBeanList: json["userMedalBeanList"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "userType": userType == null ? null : uploadStatusValues.reverse![userType],
    "ifPgc": ifPgc == null ? null : ifPgc,
    "description": description == null ? null : description,
    "area": area,
    "gender": gender == null ? null : gender,
    "registDate": registDate == null ? null : registDate,
    "releaseDate": releaseDate == null ? null : releaseDate,
    "cover": cover == null ? null : cover,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "followed": followed == null ? null : followed,
    "limitVideoOpen": limitVideoOpen == null ? null : limitVideoOpen,
    "library": ownerLibrary == null ? null : ownerLibraryValues.reverse![ownerLibrary],
    "birthday": birthday == null ? null : birthday,
    "country": country == null ? null : country,
    "city": city == null ? null : city,
    "university": university == null ? null : university,
    "job": job == null ? null : job,
    "expert": expert == null ? null : expert,
    "username": username == null ? null : username,
    "uploadStatus": uploadStatus == null ? null : uploadStatusValues.reverse![uploadStatus],
    "bannedDate": bannedDate,
    "bannedDays": bannedDays == null ? null : bannedDays,
    "tagIds": tagIds,
    "userMedalBeanList": userMedalBeanList,
  };
}

enum OwnerLibrary { BLOCK }

final ownerLibraryValues = EnumValues({
  "BLOCK": OwnerLibrary.BLOCK
});

enum UploadStatus { NORMAL, PGC }

final uploadStatusValues = EnumValues({
  "NORMAL": UploadStatus.NORMAL,
  "PGC": UploadStatus.PGC
});

class RecentOnceReply {
  RecentOnceReply({
    this.dataType,
    this.message,
    this.nickname,
    this.actionUrl,
    this.contentType,
  });

  String? dataType;
  String? message;
  String? nickname;
  String? actionUrl;
  String? contentType;

  factory RecentOnceReply.fromJson(Map<String, dynamic> json) => RecentOnceReply(
    dataType: json["dataType"] == null ? null : json["dataType"],
    message: json["message"] == null ? null : json["message"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    contentType: json["contentType"] == null ? null : json["contentType"],
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : dataType,
    "message": message == null ? null : message,
    "nickname": nickname == null ? null : nickname,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "contentType": contentType == null ? null : contentType,
  };
}

enum ResourceType { UGC_PICTURE, UGC_VIDEO }

final resourceTypeValues = EnumValues({
  "ugc_picture": ResourceType.UGC_PICTURE,
  "ugc_video": ResourceType.UGC_VIDEO
});

class Tag {
  Tag({
    this.id,
    this.name,
    this.actionUrl,
    this.desc,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.childTagList,
    this.childTagIdList,
    this.haveReward,
    this.ifNewest,
    this.newestEndTime,
    this.communityIndex,
    this.alias,
    this.type,
    this.tagStatus,
    this.level,
    this.top,
    this.parentId,
    this.recWeight,
    this.ifShow,
    this.relationType,
  });

  int? id;
  String? name;
  String? actionUrl;
  String? desc;
  String? bgPicture;
  String? headerImage;
  UploadStatus? tagRecType;
  List<Tag>? childTagList;
  List<String>? childTagIdList;
  bool? haveReward;
  bool? ifNewest;
  String? newestEndTime;
  int? communityIndex;
  dynamic? alias;
  TypeEnum? type;
  TagStatus? tagStatus;
  int? level;
  int? top;
  int? parentId;
  double? recWeight;
  bool? ifShow;
  int? relationType;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    desc: json["desc"] == null ? null : json["desc"],
    bgPicture: json["bgPicture"] == null ? null : json["bgPicture"],
    headerImage: json["headerImage"] == null ? null : json["headerImage"],
    tagRecType: json["tagRecType"] == null ? null : uploadStatusValues.maps![json["tagRecType"]],
    childTagList: json["childTagList"] == null ? null : List.from(json["childTagList"]).map((e) => Tag.fromJson(e)).toList(),
    childTagIdList: json["childTagIdList"] == null ? null : json["childTagIdList"],
    haveReward: json["haveReward"] == null ? null : json["haveReward"],
    ifNewest: json["ifNewest"] == null ? null : json["ifNewest"],
    newestEndTime: json["newestEndTime"] == null ? null : json["newestEndTime"],
    communityIndex: json["communityIndex"] == null ? null : json["communityIndex"],
    alias: json["alias"] == null ? null : json["alias"],
    type: json["type"] == null ? null : typeEnumValues.maps![json["type"]],
    tagStatus: json["tagStatus"] == null ? null : tagStatusValues.maps![json["tagStatus"]],
    level: json["level"] == null ? null : json["level"],
    top: json["top"] == null ? null : json["top"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    recWeight: json["recWeight"] == null ? null : json["recWeight"],
    ifShow: json["ifShow"] == null ? null : json["ifShow"],
    relationType: json["relationType"] == null ? null : json["relationType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "desc": desc == null ? null : desc,
    "bgPicture": bgPicture == null ? null : bgPicture,
    "headerImage": headerImage == null ? null : headerImage,
    "tagRecType": tagRecType == null ? null : uploadStatusValues.reverse![tagRecType],
    "childTagList": childTagList,
    "childTagIdList": childTagIdList,
    "haveReward": haveReward == null ? null : haveReward,
    "ifNewest": ifNewest == null ? null : ifNewest,
    "newestEndTime": newestEndTime,
    "communityIndex": communityIndex == null ? null : communityIndex,
    "alias": alias,
    "type": type == null ? null : typeEnumValues.reverse![type],
    "tagStatus": tagStatus == null ? null : tagStatusValues.reverse![tagStatus],
    "level": level == null ? null : level,
    "top": top == null ? null : top,
    "parentId": parentId == null ? null : parentId,
    "recWeight": recWeight == null ? null : recWeight,
    "ifShow": ifShow == null ? null : ifShow,
    "relationType": relationType == null ? null : relationType,
  };
}

enum TagStatus { SHOW }

final tagStatusValues = EnumValues({
  "SHOW": TagStatus.SHOW
});

enum ValidateResult { PASS, DEFAULT }

final validateResultValues = EnumValues({
  "DEFAULT": ValidateResult.DEFAULT,
  "PASS": ValidateResult.PASS
});

enum ValidateStatus { RECYCLED, SUBMIT }

final validateStatusValues = EnumValues({
  "RECYCLED": ValidateStatus.RECYCLED,
  "SUBMIT": ValidateStatus.SUBMIT
});

enum ContentType { UGC_PICTURE, VIDEO }

final contentTypeValues = EnumValues({
  "ugcPicture": ContentType.UGC_PICTURE,
  "video": ContentType.VIDEO
});

enum FluffyDataType { FOLLOW_CARD }

final fluffyDataTypeValues = EnumValues({
  "FollowCard": FluffyDataType.FOLLOW_CARD,
});

class Header {
  Header({
    this.id,
    this.actionUrl,
    this.labelList,
    this.icon,
    this.iconType,
    this.time,
    this.showHateVideo,
    this.followType,
    this.tagId,
    this.tagName,
    this.issuerName,
    this.topShow,
  });

  int? id;
  String? actionUrl;
  List? labelList;
  String? icon;
  IconType? iconType;
  int? time;
  bool? showHateVideo;
  FollowType? followType;
  int? tagId;
  String? tagName;
  String? issuerName;
  bool? topShow;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    id: json["id"] == null ? null : json["id"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    labelList: json["labelList"] == null ? null : json["labelList"],
    icon: json["icon"] == null ? null : json["icon"],
    iconType: json["iconType"] == null ? null : iconTypeValues.maps![json["iconType"]],
    time: json["time"] == null ? null : json["time"],
    showHateVideo: json["showHateVideo"] == null ? null : json["showHateVideo"],
    followType: json["followType"] == null ? null : followTypeValues.maps![json["followType"]],
    tagId: json["tagId"] == null ? null : json["tagId"],
    tagName: json["tagName"] == null ? null : json["tagName"],
    issuerName: json["issuerName"] == null ? null : json["issuerName"],
    topShow: json["topShow"] == null ? null : json["topShow"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "labelList": labelList,
    "icon": icon == null ? null : icon,
    "iconType": iconType == null ? null : iconTypeValues.reverse![iconType],
    "time": time == null ? null : time,
    "showHateVideo": showHateVideo == null ? null : showHateVideo,
    "followType": followType == null ? null : followTypeValues.reverse![followType],
    "tagId": tagId == null ? null : tagId,
    "tagName": tagName,
    "issuerName": issuerName == null ? null : issuerName,
    "topShow": topShow == null ? null : topShow,
  };
}

enum FollowType { USER }

final followTypeValues = EnumValues({
  "user": FollowType.USER
});

enum IconType { ROUND }

final iconTypeValues = EnumValues({
  "round": IconType.ROUND
});

enum ItemListType { PICTURE_FOLLOW_CARD, AUTO_PLAY_FOLLOW_CARD }

final itemListTypeValues = EnumValues({
  "autoPlayFollowCard": ItemListType.AUTO_PLAY_FOLLOW_CARD,
  "pictureFollowCard": ItemListType.PICTURE_FOLLOW_CARD
});

class EnumValues<T> {
  Map<String, T>? maps;
  Map<T, String>? reverseMap;

  EnumValues(this.maps);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = maps!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
