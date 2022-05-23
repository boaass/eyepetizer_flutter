
class ZCLVideoBean {
  ZCLVideoBean({
    this.dataType,
    this.id,
    this.title,
    this.description,
    this.ZCLVideoBeanLibrary,
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
    this.ZCLVideoBeanRecallSource,
  });

  String? dataType;
  int? id;
  String? title;
  String? description;
  String? ZCLVideoBeanLibrary;
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
  List<dynamic>? adTrack;
  String? type;
  dynamic? titlePgc;
  dynamic? descriptionPgc;
  dynamic? remark;
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
  dynamic? ZCLVideoBeanRecallSource;

  factory ZCLVideoBean.fromJson(Map<String, dynamic> json) => ZCLVideoBean(
    dataType: json["dataType"] == null ? null : json["dataType"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    ZCLVideoBeanLibrary: json["library"] == null ? null : json["library"],
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
    adTrack: json["adTrack"] == null ? null : List<dynamic>.from(json["adTrack"].map((x) => x)),
    type: json["type"] == null ? null : json["type"],
    titlePgc: json["titlePgc"],
    descriptionPgc: json["descriptionPgc"],
    remark: json["remark"],
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
    ZCLVideoBeanRecallSource: json["recall_source"],
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : dataType,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "library": ZCLVideoBeanLibrary == null ? null : ZCLVideoBeanLibrary,
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
    "adTrack": adTrack == null ? null : List<dynamic>.from(adTrack!.map((x) => x)),
    "type": type == null ? null : type,
    "titlePgc": titlePgc,
    "descriptionPgc": descriptionPgc,
    "remark": remark,
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
    "recall_source": ZCLVideoBeanRecallSource,
  };
}

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
  String? name;
  String? type;
  String? url;

  factory PlayInfo.fromJson(Map<String, dynamic> json) => PlayInfo(
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    urlList: json["urlList"] == null ? null : List<UrlList>.from(json["urlList"].map((x) => UrlList.fromJson(x))),
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : json["type"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "urlList": urlList == null ? null : List<dynamic>.from(urlList!.map((x) => x.toJson())),
    "name": name == null ? null : name,
    "type": type == null ? null : type,
    "url": url == null ? null : url,
  };
}

class UrlList {
  UrlList({
    this.name,
    this.url,
    this.size,
  });

  String? name;
  String? url;
  int? size;

  factory UrlList.fromJson(Map<String, dynamic> json) => UrlList(
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
    size: json["size"] == null ? null : json["size"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "url": url == null ? null : url,
    "size": size == null ? null : size,
  };
}

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
  String? tagRecType;
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
    tagRecType: json["tagRecType"] == null ? null : json["tagRecType"],
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
    "tagRecType": tagRecType == null ? null : tagRecType,
    "childTagList": childTagList,
    "childTagIdList": childTagIdList,
    "haveReward": haveReward == null ? null : haveReward,
    "ifNewest": ifNewest == null ? null : ifNewest,
    "newestEndTime": newestEndTime,
    "communityIndex": communityIndex == null ? null : communityIndex,
  };
}

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
