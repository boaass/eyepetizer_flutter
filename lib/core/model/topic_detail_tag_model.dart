class ZCLTopicDetailTagModel {
  ZCLTopicDetailTagModel({
    this.id,
    this.headerImage,
    this.brief,
    this.text,
    this.shareLink,
    this.itemList,
    this.count,
    this.adTrack,
    this.nextPageUrl,
  });

  int? id;
  String? headerImage;
  String? brief;
  String? text;
  String? shareLink;
  List<ItemList>? itemList;
  int? count;
  dynamic? adTrack;
  String? nextPageUrl;

  factory ZCLTopicDetailTagModel.fromJson(Map<String, dynamic> json) => ZCLTopicDetailTagModel(
    id: json["id"] == null ? null : json["id"],
    headerImage: json["headerImage"] == null ? null : json["headerImage"],
    brief: json["brief"] == null ? null : json["brief"],
    text: json["text"] == null ? null : json["text"],
    shareLink: json["shareLink"] == null ? null : json["shareLink"],
    itemList: json["itemList"] == null ? null : List<ItemList>.from(json["itemList"].map((x) => ItemList.fromJson(x))),
    count: json["count"] == null ? null : json["count"],
    adTrack: json["adTrack"],
    nextPageUrl: json["nextPageUrl"] == null ? null : json["nextPageUrl"]
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "headerImage": headerImage == null ? null : headerImage,
    "brief": brief == null ? null : brief,
    "text": text == null ? null : text,
    "shareLink": shareLink == null ? null : shareLink,
    "itemList": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "count": count == null ? null : count,
    "adTrack": adTrack,
    "nextPageUrl": nextPageUrl
  };
}

class ItemList {
  ItemList({
    this.type,
    this.data,
    this.trackingData,
    this.tag,
    this.id,
    this.adIndex,
  });

  ItemListType? type;
  ItemListData? data;
  dynamic? trackingData;
  dynamic? tag;
  int? id;
  int? adIndex;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    type: json["type"] == null ? null : itemListTypeEnumValues.map![json["type"]],
    data: json["data"] == null ? null : ItemListData.fromJson(json["data"]),
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

enum ItemListType { PICTURE_FOLLOW_CARD, AUTO_PLAY_FOLLOW_CARD, VIDEO_SMALL_CARD, TEXT_CARD, FOLLOW_CARD}

final itemListTypeEnumValues = EnumValues({
  "pictureFollowCard": ItemListType.PICTURE_FOLLOW_CARD,
  "autoPlayFollowCard": ItemListType.AUTO_PLAY_FOLLOW_CARD,
  "videoSmallCard": ItemListType.VIDEO_SMALL_CARD,
  "textCard": ItemListType.TEXT_CARD,
  "followCard": ItemListType.FOLLOW_CARD,
});

enum ItemListDataType { FOLLOW_CARD, TEXT_CARD, VIDEO_BEAN_FOR_CLIENT}

final itemListDataTypeEnumValues = EnumValues({
  "FollowCard": ItemListDataType.FOLLOW_CARD,
  "TextCard": ItemListDataType.TEXT_CARD,
  "VideoBeanForClient": ItemListDataType.VIDEO_BEAN_FOR_CLIENT
});

class ItemListData {
  ItemListData({
    this.dataType,
    this.header,
    this.content,
    this.adTrack,
    this.id,
    this.type,
    this.text,
    this.subTitle,
    this.actionUrl,

    this.title,
    this.description,
    this.metroItemLibrary,
    this.tags,
    this.consumption,
    this.resourceType,
    this.slogan,
    this.provider,
    this.category,
    this.author,
    this.cover,
    this.playUrl,
    this.thumbPlayUrl,
    this.duration,
    this.webUrl,
    this.releaseTime,
    this.playInfo,
    this.campaign,
    this.waterMarks,
    this.ad,
    this.titlePgc,
    this.descriptionPgc,
    this.remark,
    this.ifLimitVideo,
    this.searchWeight,
    this.brandWebsiteInfo,
    this.videoPosterBean,
    this.idx,
    this.shareAdTrack,
    this.favoriteAdTrack,
    this.webAdTrack,
    this.date,
    this.promotion,
    this.label,
    this.labelList,
    this.descriptionEditor,
    this.collected,
    this.reallyCollected,
    this.played,
    this.subtitles,
    this.lastViewTime,
    this.playlists,
    this.src,
    this.recallSource,
    this.metroItemRecallSource,
    this.candidateId,
    this.sourceUrl,
    this.tailTimePoint,
    this.createTime,
    this.updateTime,
    this.infoStatus,
    this.status,
    this.showLabel,
    this.premiereDate,
    this.areaSet,
    this.subtitleStatus,
    this.translateStatus,
  });

  ItemListDataType? dataType;
  Header? header;
  Content? content;
  List<dynamic>? adTrack;
  String? id;
  String? type;
  String? text;
  String? subTitle;
  String? actionUrl;

  String? title;
  String? description;
  String? metroItemLibrary;
  List<Tag>? tags;
  Consumption? consumption;
  String? resourceType;
  dynamic? slogan;
  ZCLProvider? provider;
  String? category;
  Author? author;
  Cover? cover;
  String? playUrl;
  dynamic? thumbPlayUrl;
  int? duration;
  WebUrl? webUrl;
  int? releaseTime;
  List<PlayInfo>? playInfo;
  dynamic? campaign;
  dynamic? waterMarks;
  bool? ad;
  String? titlePgc;
  String? descriptionPgc;
  dynamic? remark;
  bool? ifLimitVideo;
  int? searchWeight;
  dynamic? brandWebsiteInfo;
  dynamic? videoPosterBean;
  int? idx;
  dynamic? shareAdTrack;
  dynamic? favoriteAdTrack;
  dynamic? webAdTrack;
  int? date;
  dynamic? promotion;
  dynamic? label;
  List<dynamic>? labelList;
  String? descriptionEditor;
  bool? collected;
  bool? reallyCollected;
  bool? played;
  List<dynamic>? subtitles;
  dynamic? lastViewTime;
  dynamic? playlists;
  int? src;
  String? recallSource;
  String? metroItemRecallSource;
  int? candidateId;
  String? sourceUrl;
  int? tailTimePoint;
  int? createTime;
  int? updateTime;
  String? infoStatus;
  String? status;
  bool? showLabel;
  dynamic? premiereDate;
  List<dynamic>? areaSet;
  String? subtitleStatus;
  String? translateStatus;

  factory ItemListData.fromJson(Map<String, dynamic> json) => ItemListData(
    dataType: json["dataType"] == null ? null : itemListDataTypeEnumValues.map![json["dataType"]],
    header: json["header"] == null ? null : Header.fromJson(json["header"]),
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
    adTrack: json["adTrack"] == null ? null : List<dynamic>.from(json["adTrack"].map((x) => x)),
    id: json["id"] == null ? null : json["id"].toString(),
    type: json["type"] == null ? null : json["type"],
    text: json["text"] == null ? null : json["text"],
    subTitle: json["subTitle"] == null ? null : json["subTitle"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],

    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    metroItemLibrary: json["library"] == null ? null : json["library"],
    tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    consumption: json["consumption"] == null ? null : Consumption.fromJson(json["consumption"]),
    resourceType: json["resourceType"] == null ? null : json["resourceType"],
    slogan: json["slogan"],
    provider: json["provider"] == null ? null : ZCLProvider.fromJson(json["provider"]),
    category: json["category"] == null ? null : json["category"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    cover: json["cover"] == null ? null : Cover.fromJson(json["cover"]),
    playUrl: json["playUrl"] == null ? null : json["playUrl"],
    thumbPlayUrl: json["thumbPlayUrl"],
    duration: json["duration"] == null ? null : json["duration"],
    webUrl: json["webUrl"] == null ? null : WebUrl.fromJson(json["webUrl"]),
    releaseTime: json["releaseTime"] == null ? null : json["releaseTime"],
    playInfo: json["playInfo"] == null ? null : List<PlayInfo>.from(json["playInfo"].map((x) => PlayInfo.fromJson(x))),
    campaign: json["campaign"],
    waterMarks: json["waterMarks"],
    ad: json["ad"] == null ? null : json["ad"],
    titlePgc: json["titlePgc"] == null ? null : json["titlePgc"],
    descriptionPgc: json["descriptionPgc"] == null ? null : json["descriptionPgc"],
    remark: json["remark"],
    ifLimitVideo: json["ifLimitVideo"] == null ? null : json["ifLimitVideo"],
    searchWeight: json["searchWeight"] == null ? null : json["searchWeight"],
    brandWebsiteInfo: json["brandWebsiteInfo"],
    videoPosterBean: json["videoPosterBean"],
    idx: json["idx"] == null ? null : json["idx"],
    shareAdTrack: json["shareAdTrack"],
    favoriteAdTrack: json["favoriteAdTrack"],
    webAdTrack: json["webAdTrack"],
    date: json["date"] == null ? null : json["date"],
    promotion: json["promotion"],
    label: json["label"],
    labelList: json["labelList"] == null ? null : List<dynamic>.from(json["labelList"].map((x) => x)),
    descriptionEditor: json["descriptionEditor"] == null ? null : json["descriptionEditor"],
    collected: json["collected"] == null ? null : json["collected"],
    reallyCollected: json["reallyCollected"] == null ? null : json["reallyCollected"],
    played: json["played"] == null ? null : json["played"],
    subtitles: json["subtitles"] == null ? null : List<dynamic>.from(json["subtitles"].map((x) => x)),
    lastViewTime: json["lastViewTime"],
    playlists: json["playlists"],
    src: json["src"] == null ? null : json["src"],
    recallSource: json["recallSource"] == null ? null : json["recallSource"],
    metroItemRecallSource: json["recall_source"] == null ? null : json["recall_source"],
    candidateId: json["candidateId"] == null ? null : json["candidateId"],
    sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
    tailTimePoint: json["tailTimePoint"] == null ? null : json["tailTimePoint"],
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    infoStatus: json["infoStatus"] == null ? null : json["infoStatus"],
    status: json["status"] == null ? null : json["status"],
    showLabel: json["showLabel"] == null ? null : json["showLabel"],
    premiereDate: json["premiereDate"],
    areaSet: json["areaSet"] == null ? null : List<dynamic>.from(json["areaSet"].map((x) => x)),
    subtitleStatus: json["subtitleStatus"] == null ? null : json["subtitleStatus"],
    translateStatus: json["translateStatus"] == null ? null : json["translateStatus"],
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : dataType,
    "header": header == null ? null : header!.toJson(),
    "content": content == null ? null : content!.toJson(),
    "adTrack": adTrack == null ? null : List<dynamic>.from(adTrack!.map((x) => x)),
    "id": id == null ? null : id,
    "type": type == null ? null : type,
    "text": text == null ? null : text,
    "subTitle": subTitle == null ? null : subTitle,
    "actionUrl": actionUrl == null ? null : actionUrl,

    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "library": metroItemLibrary == null ? null : metroItemLibrary,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "consumption": consumption == null ? null : consumption!.toJson(),
    "resourceType": resourceType == null ? null : resourceType,
    "slogan": slogan,
    "provider": provider == null ? null : provider!.toJson(),
    "category": category == null ? null : category,
    "author": author == null ? null : author!.toJson(),
    "cover": cover == null ? null : cover!.toJson(),
    "playUrl": playUrl == null ? null : playUrl,
    "thumbPlayUrl": thumbPlayUrl,
    "duration": duration == null ? null : duration,
    "webUrl": webUrl == null ? null : webUrl!.toJson(),
    "releaseTime": releaseTime == null ? null : releaseTime,
    "playInfo": playInfo == null ? null : List<dynamic>.from(playInfo!.map((x) => x.toJson())),
    "campaign": campaign,
    "waterMarks": waterMarks,
    "ad": ad == null ? null : ad,
    "titlePgc": titlePgc == null ? null : titlePgc,
    "descriptionPgc": descriptionPgc == null ? null : descriptionPgc,
    "remark": remark,
    "ifLimitVideo": ifLimitVideo == null ? null : ifLimitVideo,
    "searchWeight": searchWeight == null ? null : searchWeight,
    "brandWebsiteInfo": brandWebsiteInfo,
    "videoPosterBean": videoPosterBean,
    "idx": idx == null ? null : idx,
    "shareAdTrack": shareAdTrack,
    "favoriteAdTrack": favoriteAdTrack,
    "webAdTrack": webAdTrack,
    "date": date == null ? null : date,
    "promotion": promotion,
    "label": label,
    "labelList": labelList == null ? null : List<dynamic>.from(labelList!.map((x) => x)),
    "descriptionEditor": descriptionEditor == null ? null : descriptionEditor,
    "collected": collected == null ? null : collected,
    "reallyCollected": reallyCollected == null ? null : reallyCollected,
    "played": played == null ? null : played,
    "subtitles": subtitles == null ? null : List<dynamic>.from(subtitles!.map((x) => x)),
    "lastViewTime": lastViewTime,
    "playlists": playlists,
    "src": src == null ? null : src,
    "recallSource": recallSource == null ? null : recallSource,
    "recall_source": metroItemRecallSource == null ? null : metroItemRecallSource,
    "candidateId": candidateId == null ? null : candidateId,
    "sourceUrl": sourceUrl == null ? null : sourceUrl,
    "tailTimePoint": tailTimePoint == null ? null : tailTimePoint,
    "createTime": createTime == null ? null : createTime,
    "updateTime": updateTime == null ? null : updateTime,
    "infoStatus": infoStatus == null ? null : infoStatus,
    "status": status == null ? null : status,
    "showLabel": showLabel == null ? null : showLabel,
    "premiereDate": premiereDate,
    "areaSet": areaSet == null ? null : List<dynamic>.from(areaSet!.map((x) => x)),
    "subtitleStatus": subtitleStatus == null ? null : subtitleStatus,
    "translateStatus": translateStatus == null ? null : translateStatus,
  };
}

class Content {
  Content({
    this.type,
    this.data,
    this.trackingData,
    this.tag,
    this.id,
    this.adIndex,
  });

  ContentType? type;
  ContentData? data;
  dynamic? trackingData;
  dynamic? tag;
  int? id;
  int? adIndex;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    type: json["type"] == null ? null : contentTypeValues.map![json["type"]],
    data: json["data"] == null ? null : ContentData.fromJson(json["data"]),
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

enum ContentType {VIDEO, UGC_PICTURE}
final contentTypeValues = EnumValues({
  "video": ContentType.VIDEO,
  "ugcPicture": ContentType.UGC_PICTURE
});

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
    this.owner,
    this.slogan,
    this.provider,
    this.category,
    this.author,
    this.cover,
    this.playUrl,
    this.thumbPlayUrl,
    this.duration,
    this.webUrl,
    this.releaseTime,
    this.playInfo,
    this.campaign,
    this.waterMarks,
    this.ad,
    this.adTrack,
    this.type,
    this.titlePgc,
    this.descriptionPgc,
    this.remark,
    this.ifLimitVideo,
    this.searchWeight,
    this.brandWebsiteInfo,
    this.videoPosterBean,
    this.idx,
    this.shareAdTrack,
    this.favoriteAdTrack,
    this.webAdTrack,
    this.date,
    this.promotion,
    this.label,
    this.labelList,
    this.descriptionEditor,
    this.collected,
    this.reallyCollected,
    this.played,
    this.subtitles,
    this.lastViewTime,
    this.playlists,
    this.src,
    this.recallSource,
    this.dataRecallSource,
    this.urls,
  });

  ContentDataType? dataType;
  int? id;
  String? title;
  String? description;
  String? dataLibrary;
  List<Tag>? tags;
  Consumption? consumption;
  String? resourceType;
  String? uid;
  int? createTime;
  int? updateTime;
  Owner? owner;
  String? slogan;
  ZCLProvider? provider;
  String? category;
  Author? author;
  Cover? cover;
  String? playUrl;
  String? thumbPlayUrl;
  int? duration;
  WebUrl? webUrl;
  int? releaseTime;
  List<PlayInfo>? playInfo;
  dynamic? campaign;
  dynamic? waterMarks;
  bool? ad;
  List<dynamic>? adTrack;
  TagRecTypeEnum? type;
  String? titlePgc;
  String? descriptionPgc;
  String? remark;
  bool? ifLimitVideo;
  int? searchWeight;
  dynamic? brandWebsiteInfo;
  VideoPosterBean? videoPosterBean;
  int? idx;
  dynamic? shareAdTrack;
  dynamic? favoriteAdTrack;
  dynamic? webAdTrack;
  int? date;
  dynamic? promotion;
  dynamic? label;
  List<dynamic>? labelList;
  String? descriptionEditor;
  bool? collected;
  bool? reallyCollected;
  bool? played;
  List<dynamic>? subtitles;
  dynamic? lastViewTime;
  dynamic? playlists;
  dynamic? src;
  dynamic? recallSource;
  dynamic? dataRecallSource;
  List<String>? urls;

  factory ContentData.fromJson(Map<String, dynamic> json) => ContentData(
    dataType: json["dataType"] == null ? null : contentDataTypeValues.map![json["dataType"]],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    dataLibrary: json["library"] == null ? null : json["library"],
    tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    consumption: json["consumption"] == null ? null : Consumption.fromJson(json["consumption"]),
    resourceType: json["resourceType"] == null ? null : json["resourceType"],
    uid: json["uid"] == null ? null : json["uid"].toString(),
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    slogan: json["slogan"] == null ? null : json["slogan"],
    provider: json["provider"] == null ? null : ZCLProvider.fromJson(json["provider"]),
    category: json["category"] == null ? null : json["category"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    cover: json["cover"] == null ? null : Cover.fromJson(json["cover"]),
    playUrl: json["playUrl"] == null ? null : json["playUrl"],
    thumbPlayUrl: json["thumbPlayUrl"] == null ? null : json["thumbPlayUrl"],
    duration: json["duration"] == null ? null : json["duration"],
    webUrl: json["webUrl"] == null ? null : WebUrl.fromJson(json["webUrl"]),
    releaseTime: json["releaseTime"] == null ? null : json["releaseTime"],
    playInfo: json["playInfo"] == null ? null : List<PlayInfo>.from(json["playInfo"].map((x) => PlayInfo.fromJson(x))),
    campaign: json["campaign"],
    waterMarks: json["waterMarks"],
    ad: json["ad"] == null ? null : json["ad"],
    adTrack: json["adTrack"] == null ? null : List<dynamic>.from(json["adTrack"].map((x) => x)),
    type: json["type"] == null ? null : tagRecTypeEnumValues.map![json["type"]],
    titlePgc: json["titlePgc"] == null ? null : json["titlePgc"],
    descriptionPgc: json["descriptionPgc"] == null ? null : json["descriptionPgc"],
    remark: json["remark"] == null ? null : json["remark"],
    ifLimitVideo: json["ifLimitVideo"] == null ? null : json["ifLimitVideo"],
    searchWeight: json["searchWeight"] == null ? null : json["searchWeight"],
    brandWebsiteInfo: json["brandWebsiteInfo"],
    videoPosterBean: json["videoPosterBean"] == null ? null : VideoPosterBean.fromJson(json["videoPosterBean"]),
    idx: json["idx"] == null ? null : json["idx"],
    shareAdTrack: json["shareAdTrack"],
    favoriteAdTrack: json["favoriteAdTrack"],
    webAdTrack: json["webAdTrack"],
    date: json["date"] == null ? null : json["date"],
    promotion: json["promotion"],
    label: json["label"],
    labelList: json["labelList"] == null ? null : List<dynamic>.from(json["labelList"].map((x) => x)),
    descriptionEditor: json["descriptionEditor"] == null ? null : json["descriptionEditor"],
    collected: json["collected"] == null ? null : json["collected"],
    reallyCollected: json["reallyCollected"] == null ? null : json["reallyCollected"],
    played: json["played"] == null ? null : json["played"],
    subtitles: json["subtitles"] == null ? null : List<dynamic>.from(json["subtitles"].map((x) => x)),
    lastViewTime: json["lastViewTime"],
    playlists: json["playlists"],
    src: json["src"],
    recallSource: json["recallSource"],
    dataRecallSource: json["recall_source"],
    urls: json["urls"] == null ? null : List<String>.from(json["urls"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : dataType,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "library": dataLibrary == null ? null : dataLibrary,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "consumption": consumption == null ? null : consumption!.toJson(),
    "resourceType": resourceType == null ? null : resourceType,
    "uid": uid == null ? null : uid,
    "createTime": createTime == null ? null : createTime,
    "updateTime": updateTime == null ? null : updateTime,
    "slogan": slogan == null ? null : slogan,
    "provider": provider == null ? null : provider!.toJson(),
    "category": category == null ? null : category,
    "author": author == null ? null : author!.toJson(),
    "cover": cover == null ? null : cover!.toJson(),
    "playUrl": playUrl == null ? null : playUrl,
    "thumbPlayUrl": thumbPlayUrl == null ? null : thumbPlayUrl,
    "duration": duration == null ? null : duration,
    "webUrl": webUrl == null ? null : webUrl!.toJson(),
    "releaseTime": releaseTime == null ? null : releaseTime,
    "playInfo": playInfo == null ? null : List<dynamic>.from(playInfo!.map((x) => x.toJson())),
    "campaign": campaign,
    "waterMarks": waterMarks,
    "ad": ad == null ? null : ad,
    "adTrack": adTrack == null ? null : List<dynamic>.from(adTrack!.map((x) => x)),
    "type": type == null ? null : tagRecTypeEnumValues.reverse[type],
    "titlePgc": titlePgc == null ? null : titlePgc,
    "descriptionPgc": descriptionPgc == null ? null : descriptionPgc,
    "remark": remark == null ? null : remark,
    "ifLimitVideo": ifLimitVideo == null ? null : ifLimitVideo,
    "searchWeight": searchWeight == null ? null : searchWeight,
    "brandWebsiteInfo": brandWebsiteInfo,
    "videoPosterBean": videoPosterBean == null ? null : videoPosterBean!.toJson(),
    "idx": idx == null ? null : idx,
    "shareAdTrack": shareAdTrack,
    "favoriteAdTrack": favoriteAdTrack,
    "webAdTrack": webAdTrack,
    "date": date == null ? null : date,
    "promotion": promotion,
    "label": label,
    "labelList": labelList == null ? null : List<dynamic>.from(labelList!.map((x) => x)),
    "descriptionEditor": descriptionEditor == null ? null : descriptionEditor,
    "collected": collected == null ? null : collected,
    "reallyCollected": reallyCollected == null ? null : reallyCollected,
    "played": played == null ? null : played,
    "subtitles": subtitles == null ? null : List<dynamic>.from(subtitles!.map((x) => x)),
    "lastViewTime": lastViewTime,
    "playlists": playlists,
    "src": src,
    "recallSource": recallSource,
    "recall_source": dataRecallSource,
    "urls": urls == null ? null : List<dynamic>.from(urls!.map((x) => x)),
  };
}

enum ContentDataType {UGC_PICTURE_BEAN, UGC_VIDEO_BEAN, VIDEO_BEAN_FOR_CLIENT}
final contentDataTypeValues = EnumValues({
  "UgcPictureBean": ContentDataType.UGC_PICTURE_BEAN,
  "UgcVideoBean": ContentDataType.UGC_VIDEO_BEAN,
  "VideoBeanForClient": ContentDataType.VIDEO_BEAN_FOR_CLIENT
});

class Author {
  Author({
    this.id,
    this.icon,
    this.name,
    this.description,
    this.link,
    this.latestReleaseTime,
    this.videoNum,
    this.adTrack,
    this.follow,
    this.shield,
    this.approvedNotReadyVideoCount,
    this.ifPgc,
    this.recSort,
    this.expert,
  });

  int? id;
  String? icon;
  String? name;
  String? description;
  String? link;
  int? latestReleaseTime;
  int? videoNum;
  dynamic? adTrack;
  Follow? follow;
  Shield? shield;
  int? approvedNotReadyVideoCount;
  bool? ifPgc;
  int? recSort;
  bool? expert;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"] == null ? null : json["id"],
    icon: json["icon"] == null ? null : json["icon"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    latestReleaseTime: json["latestReleaseTime"] == null ? null : json["latestReleaseTime"],
    videoNum: json["videoNum"] == null ? null : json["videoNum"],
    adTrack: json["adTrack"],
    follow: json["follow"] == null ? null : Follow.fromJson(json["follow"]),
    shield: json["shield"] == null ? null : Shield.fromJson(json["shield"]),
    approvedNotReadyVideoCount: json["approvedNotReadyVideoCount"] == null ? null : json["approvedNotReadyVideoCount"],
    ifPgc: json["ifPgc"] == null ? null : json["ifPgc"],
    recSort: json["recSort"] == null ? null : json["recSort"],
    expert: json["expert"] == null ? null : json["expert"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "icon": icon == null ? null : icon,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "link": link == null ? null : link,
    "latestReleaseTime": latestReleaseTime == null ? null : latestReleaseTime,
    "videoNum": videoNum == null ? null : videoNum,
    "adTrack": adTrack,
    "follow": follow == null ? null : follow!.toJson(),
    "shield": shield == null ? null : shield!.toJson(),
    "approvedNotReadyVideoCount": approvedNotReadyVideoCount == null ? null : approvedNotReadyVideoCount,
    "ifPgc": ifPgc == null ? null : ifPgc,
    "recSort": recSort == null ? null : recSort,
    "expert": expert == null ? null : expert,
  };
}

class Follow {
  Follow({
    this.itemType,
    this.itemId,
    this.followed,
  });

  String? itemType;
  int? itemId;
  bool? followed;

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
    itemType: json["itemType"] == null ? null : json["itemType"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    followed: json["followed"] == null ? null : json["followed"],
  );

  Map<String, dynamic> toJson() => {
    "itemType": itemType == null ? null : itemType,
    "itemId": itemId == null ? null : itemId,
    "followed": followed == null ? null : followed,
  };
}

class Shield {
  Shield({
    this.itemType,
    this.itemId,
    this.shielded,
  });

  String? itemType;
  int? itemId;
  bool? shielded;

  factory Shield.fromJson(Map<String, dynamic> json) => Shield(
    itemType: json["itemType"] == null ? null : json["itemType"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    shielded: json["shielded"] == null ? null : json["shielded"],
  );

  Map<String, dynamic> toJson() => {
    "itemType": itemType == null ? null : itemType,
    "itemId": itemId == null ? null : itemId,
    "shielded": shielded == null ? null : shielded,
  };
}

class Consumption {
  Consumption({
    this.collectionCount,
    this.shareCount,
    this.replyCount,
    this.realCollectionCount,
  });

  int? collectionCount;
  int? shareCount;
  int? replyCount;
  int? realCollectionCount;

  factory Consumption.fromJson(Map<String, dynamic> json) => Consumption(
    collectionCount: json["collectionCount"] == null ? null : json["collectionCount"],
    shareCount: json["shareCount"] == null ? null : json["shareCount"],
    replyCount: json["replyCount"] == null ? null : json["replyCount"],
    realCollectionCount: json["realCollectionCount"] == null ? null : json["realCollectionCount"],
  );

  Map<String, dynamic> toJson() => {
    "collectionCount": collectionCount == null ? null : collectionCount,
    "shareCount": shareCount == null ? null : shareCount,
    "replyCount": replyCount == null ? null : replyCount,
    "realCollectionCount": realCollectionCount == null ? null : realCollectionCount,
  };
}

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
  String? userType;
  bool? ifPgc;
  dynamic? description;
  dynamic? area;
  String? gender;
  int? registDate;
  int? releaseDate;
  String? cover;
  String? actionUrl;
  bool? followed;
  bool? limitVideoOpen;
  String? ownerLibrary;
  dynamic? birthday;
  String? country;
  String? city;
  String? university;
  String? job;
  bool? expert;
  String? username;
  String? uploadStatus;
  dynamic? bannedDate;
  dynamic? bannedDays;
  dynamic? tagIds;
  dynamic? userMedalBeanList;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    uid: json["uid"] == null ? null : json["uid"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    userType: json["userType"] == null ? null : json["userType"],
    ifPgc: json["ifPgc"] == null ? null : json["ifPgc"],
    description: json["description"],
    area: json["area"],
    gender: json["gender"] == null ? null : json["gender"],
    registDate: json["registDate"] == null ? null : json["registDate"],
    releaseDate: json["releaseDate"] == null ? null : json["releaseDate"],
    cover: json["cover"] == null ? null : json["cover"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    followed: json["followed"] == null ? null : json["followed"],
    limitVideoOpen: json["limitVideoOpen"] == null ? null : json["limitVideoOpen"],
    ownerLibrary: json["library"] == null ? null : json["library"],
    birthday: json["birthday"],
    country: json["country"] == null ? null : json["country"],
    city: json["city"] == null ? null : json["city"],
    university: json["university"] == null ? null : json["university"],
    job: json["job"] == null ? null : json["job"],
    expert: json["expert"] == null ? null : json["expert"],
    username: json["username"] == null ? null : json["username"],
    uploadStatus: json["uploadStatus"] == null ? null : json["uploadStatus"],
    bannedDate: json["bannedDate"],
    bannedDays: json["bannedDays"],
    tagIds: json["tagIds"],
    userMedalBeanList: json["userMedalBeanList"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "userType": userType == null ? null : userType,
    "ifPgc": ifPgc == null ? null : ifPgc,
    "description": description,
    "area": area,
    "gender": gender == null ? null : gender,
    "registDate": registDate == null ? null : registDate,
    "releaseDate": releaseDate == null ? null : releaseDate,
    "cover": cover == null ? null : cover,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "followed": followed == null ? null : followed,
    "limitVideoOpen": limitVideoOpen == null ? null : limitVideoOpen,
    "library": ownerLibrary == null ? null : ownerLibrary,
    "birthday": birthday,
    "country": country == null ? null : country,
    "city": city == null ? null : city,
    "university": university == null ? null : university,
    "job": job == null ? null : job,
    "expert": expert == null ? null : expert,
    "username": username == null ? null : username,
    "uploadStatus": uploadStatus == null ? null : uploadStatus,
    "bannedDate": bannedDate,
    "bannedDays": bannedDays,
    "tagIds": tagIds,
    "userMedalBeanList": userMedalBeanList,
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
  String? blurred;
  dynamic? sharing;
  String? homepage;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
    feed: json["feed"] == null ? null : json["feed"],
    detail: json["detail"] == null ? null : json["detail"],
    blurred: json["blurred"] == null ? null : json["blurred"],
    sharing: json["sharing"],
    homepage: json["homepage"] == null ? null : json["homepage"],
  );

  Map<String, dynamic> toJson() => {
    "feed": feed == null ? null : feed,
    "detail": detail == null ? null : detail,
    "blurred": blurred == null ? null : blurred,
    "sharing": sharing,
    "homepage": homepage == null ? null : homepage,
  };
}

class PlayInfo {
  PlayInfo({
    this.height,
    this.width,
    this.urlList,
    this.name,
    this.type,
    this.url,
  });

  int? height;
  int? width;
  List<UrlList>? urlList;
  PlayInfoName? name;
  PlayInfoType? type;
  String? url;

  factory PlayInfo.fromJson(Map<String, dynamic> json) => PlayInfo(
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    urlList: json["urlList"] == null ? null : List<UrlList>.from(json["urlList"].map((x) => UrlList.fromJson(x))),
    name: json["name"] == null ? null : playInfoNameValues.map![json["name"]],
    type: json["type"] == null ? null : playInfoTypeValues.map![json["type"]],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "urlList": urlList == null ? null : List<dynamic>.from(urlList!.map((x) => x.toJson())),
    "name": name == null ? null : playInfoNameValues.reverse[name],
    "type": type == null ? null : playInfoTypeValues.reverse[type],
    "url": url == null ? null : url,
  };
}

enum PlayInfoName { EMPTY, NAME, PURPLE }

final playInfoNameValues = EnumValues({
  "流畅": PlayInfoName.EMPTY,
  "标清": PlayInfoName.NAME,
  "高清": PlayInfoName.PURPLE
});

enum PlayInfoType { LOW, NORMAL, HIGH }

final playInfoTypeValues = EnumValues({
  "high": PlayInfoType.HIGH,
  "low": PlayInfoType.LOW,
  "normal": PlayInfoType.NORMAL
});

class UrlList {
  UrlList({
    this.name,
    this.url,
    this.size,
  });

  UrlListName? name;
  String? url;
  int? size;

  factory UrlList.fromJson(Map<String, dynamic> json) => UrlList(
    name: json["name"] == null ? null : urlListNameValues.map![json["name"]],
    url: json["url"] == null ? null : json["url"],
    size: json["size"] == null ? null : json["size"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : urlListNameValues.reverse[name],
    "url": url == null ? null : url,
    "size": size == null ? null : size,
  };
}

enum UrlListName { ALIYUN, UCLOUD }

final urlListNameValues = EnumValues({
  "aliyun": UrlListName.ALIYUN,
  "ucloud": UrlListName.UCLOUD
});

class ZCLProvider {
  ZCLProvider({
    this.name,
    this.alias,
    this.icon,
  });

  String? name;
  String? alias;
  String? icon;

  factory ZCLProvider.fromJson(Map<String, dynamic> json) => ZCLProvider(
    name: json["name"] == null ? null : json["name"],
    alias: json["alias"] == null ? null : json["alias"],
    icon: json["icon"] == null ? null : json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "alias": alias == null ? null : alias,
    "icon": icon == null ? null : icon,
  };
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.actionUrl,
    this.adTrack,
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
  });

  int? id;
  String? name;
  String? actionUrl;
  dynamic? adTrack;
  String? desc;
  String? bgPicture;
  String? headerImage;
  TagRecTypeEnum? tagRecType;
  dynamic? childTagList;
  dynamic? childTagIdList;
  bool? haveReward;
  bool? ifNewest;
  dynamic? newestEndTime;
  int? communityIndex;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    adTrack: json["adTrack"],
    desc: json["desc"] == null ? null : json["desc"],
    bgPicture: json["bgPicture"] == null ? null : json["bgPicture"],
    headerImage: json["headerImage"] == null ? null : json["headerImage"],
    tagRecType: json["tagRecType"] == null ? null : tagRecTypeEnumValues.map![json["tagRecType"]],
    childTagList: json["childTagList"],
    childTagIdList: json["childTagIdList"],
    haveReward: json["haveReward"] == null ? null : json["haveReward"],
    ifNewest: json["ifNewest"] == null ? null : json["ifNewest"],
    newestEndTime: json["newestEndTime"],
    communityIndex: json["communityIndex"] == null ? null : json["communityIndex"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "adTrack": adTrack,
    "desc": desc == null ? null : desc,
    "bgPicture": bgPicture == null ? null : bgPicture,
    "headerImage": headerImage == null ? null : headerImage,
    "tagRecType": tagRecType == null ? null : tagRecTypeEnumValues.reverse[tagRecType],
    "childTagList": childTagList,
    "childTagIdList": childTagIdList,
    "haveReward": haveReward == null ? null : haveReward,
    "ifNewest": ifNewest == null ? null : ifNewest,
    "newestEndTime": newestEndTime,
    "communityIndex": communityIndex == null ? null : communityIndex,
  };
}

enum TagRecTypeEnum { IMPORTANT, NORMAL }

final tagRecTypeEnumValues = EnumValues({
  "IMPORTANT": TagRecTypeEnum.IMPORTANT,
  "NORMAL": TagRecTypeEnum.NORMAL
});

class VideoPosterBean {
  VideoPosterBean({
    this.scale,
    this.url,
    this.fileSizeStr,
  });

  double? scale;
  String? url;
  String? fileSizeStr;

  factory VideoPosterBean.fromJson(Map<String, dynamic> json) => VideoPosterBean(
    scale: json["scale"] == null ? null : json["scale"].toDouble(),
    url: json["url"] == null ? null : json["url"],
    fileSizeStr: json["fileSizeStr"] == null ? null : json["fileSizeStr"],
  );

  Map<String, dynamic> toJson() => {
    "scale": scale == null ? null : scale,
    "url": url == null ? null : url,
    "fileSizeStr": fileSizeStr == null ? null : fileSizeStr,
  };
}

class WebUrl {
  WebUrl({
    this.raw,
    this.forWeibo,
  });

  String? raw;
  String? forWeibo;

  factory WebUrl.fromJson(Map<String, dynamic> json) => WebUrl(
    raw: json["raw"] == null ? null : json["raw"],
    forWeibo: json["forWeibo"] == null ? null : json["forWeibo"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw == null ? null : raw,
    "forWeibo": forWeibo == null ? null : forWeibo,
  };
}

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
  dynamic? labelList;
  String? icon;
  String? iconType;
  int? time;
  bool? showHateVideo;
  String? followType;
  int? tagId;
  dynamic? tagName;
  String? issuerName;
  bool? topShow;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    id: json["id"] == null ? null : json["id"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    labelList: json["labelList"],
    icon: json["icon"] == null ? null : json["icon"],
    iconType: json["iconType"] == null ? null : json["iconType"],
    time: json["time"] == null ? null : json["time"],
    showHateVideo: json["showHateVideo"] == null ? null : json["showHateVideo"],
    followType: json["followType"] == null ? null : json["followType"],
    tagId: json["tagId"] == null ? null : json["tagId"],
    tagName: json["tagName"],
    issuerName: json["issuerName"] == null ? null : json["issuerName"],
    topShow: json["topShow"] == null ? null : json["topShow"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "actionUrl": actionUrl == null ? null : actionUrl,
    "labelList": labelList,
    "icon": icon == null ? null : icon,
    "iconType": iconType == null ? null : iconType,
    "time": time == null ? null : time,
    "showHateVideo": showHateVideo == null ? null : showHateVideo,
    "followType": followType == null ? null : followType,
    "tagId": tagId == null ? null : tagId,
    "tagName": tagName,
    "issuerName": issuerName == null ? null : issuerName,
    "topShow": topShow == null ? null : topShow,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
