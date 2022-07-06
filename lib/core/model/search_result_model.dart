import 'card_model.dart';

class ZCLSearchResultModel {
  List<ZCLSearchResultItem>? itemList;
  ZCLSearchResultModel({this.itemList});

  factory ZCLSearchResultModel.fromJson(Map<String, dynamic> json) => ZCLSearchResultModel(
    itemList: json["item_list"] == null ? null : List.from(json["item_list"].map((e) => ZCLSearchResultItem.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    "item_list" : itemList == null ? null : itemList!.map((e) => e.toJson())
  };
}

class ZCLSearchResultItem {
  final Nav? nav;
  final PageInfo? pageInfo;
  final List<ZCLCard>? cardList;
  final Debug? debug;

  ZCLSearchResultItem({this.nav, this.pageInfo, this.cardList, this.debug});

  factory ZCLSearchResultItem.fromJson(Map<String, dynamic> json) => ZCLSearchResultItem(
    nav: json["nav"] == null ? null : Nav.fromJson(json["nav"]),
    pageInfo: json["page_info"] == null ? null : PageInfo.fromJson(json["page_info"]),
    cardList: json["card_list"] == null ? null : List.from(json["card_list"].map((e) => ZCLCard.fromJson(e))),
    debug: json["debug"] == null ? null : Debug.fromJson(json["debug"])
  );

  Map<String, dynamic> toJson() => {
    "nav": nav == null ? null : nav!.toJson(),
    "page_info": pageInfo == null ? null : pageInfo!.toJson(),
    "card_list": cardList == null ? null : List.from(cardList!.map((e) => e.toJson())),
    "debug": debug == null ? null : debug!.toJson()
  };
}

class Nav {
  final String? title;
  final String? type;

  Nav({this.title, this.type});

  factory Nav.fromJson(Map<String, dynamic> json) => Nav(
    title: json["title"] == null ? null : json["title"],
    type: json["type"] == null ? null : json["type"]
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "type": type == null ? null : type
  };
}

class PageInfo {
  PageInfo({
    this.title,
  });

  String? title;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    title: json["title"] == null ? null : json["title"]
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title
  };
}

class Debug {
  Debug({
    this.page,
    this.pageCount,
    this.itemCount,
    this.itemPerPage,
    this.itemList,
    this.lastItemId,
  });

  int? page;
  int? pageCount;
  int? itemCount;
  int? itemPerPage;
  List<ItemList>? itemList;
  int? lastItemId;

  factory Debug.fromJson(Map<String, dynamic> json) => Debug(
    page: json["page"] == null ? null : json["page"],
    pageCount: json["page_count"] == null ? null : json["page_count"],
    itemCount: json["item_count"] == null ? null : json["item_count"],
    itemPerPage: json["item_per_page"] == null ? null : json["item_per_page"],
    itemList: json["item_list"] == null ? null : List<ItemList>.from(json["item_list"].map((x) => ItemList.fromJson(x))),
    lastItemId: json["last_item_id"] == null ? null : json["last_item_id"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "page_count": pageCount == null ? null : pageCount,
    "item_count": itemCount == null ? null : itemCount,
    "item_per_page": itemPerPage == null ? null : itemPerPage,
    "item_list": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "last_item_id": lastItemId == null ? null : lastItemId,
  };
}

class ItemList {
  ItemList({
    this.descriptionBaiduPosL1,
    this.sysTag,
    this.rankScore,
    this.city,
    this.titleBaiduNe,
    this.robotValidateStatus,
    this.description,
    this.title,
    this.type,
    this.allTagLabels,
    this.auth,
    this.resourceVersion,
    this.robotValidateLabel,
    this.descriptionBaiduPosL2,
    this.uid,
    this.updateTime,
    this.itemListLibrary,
    this.categoryId,
    this.titleBaiduParticiple,
    this.tagList,
    this.descriptionBaiduParticiple,
    this.header,
    this.id,
    this.tag,
    this.indexName,
    this.realCollectionCount,
    this.resourceStatus,
    this.releaseTime,
    this.area,
    this.selectedTime,
    this.titleBaiduPosL2,
    this.ad,
    this.titleBaiduPosL1,
    this.resourceType,
    this.playCount,
    this.descriptionBaiduNe,
    this.shareCount,
    this.titleBaiduAll,
    this.updateScoreVersion,
    this.collectionCount,
    this.descriptionBaiduAll,
    this.resourceId,
    this.category,
    this.authorId,
    this.robotValidateResult,
    this.tfUpdateTime,
    this.homeSchedule,
    this.publishTime,
  });

  List<String>? descriptionBaiduPosL1;
  List<double>? sysTag;
  RankScore? rankScore;
  String? city;
  List<String>? titleBaiduNe;
  RobotValidateStatus? robotValidateStatus;
  String? description;
  String? title;
  String? type;
  List<String>? allTagLabels;
  Auth? auth;
  DateTime? resourceVersion;
  List<dynamic>? robotValidateLabel;
  List<dynamic>? descriptionBaiduPosL2;
  int? uid;
  dynamic? updateTime;
  int? itemListLibrary;
  int? categoryId;
  List<String>? titleBaiduParticiple;
  List<dynamic>? tagList;
  List<String>? descriptionBaiduParticiple;
  Header? header;
  String? id;
  List<String>? tag;
  String? indexName;
  int? realCollectionCount;
  ResourceStatus? resourceStatus;
  DateTime? releaseTime;
  String? area;
  int? selectedTime;
  List<dynamic>? titleBaiduPosL2;
  int? ad;
  List<String>? titleBaiduPosL1;
  ResourceType? resourceType;
  int? playCount;
  List<String>? descriptionBaiduNe;
  int? shareCount;
  List<String>? titleBaiduAll;
  String? updateScoreVersion;
  int? collectionCount;
  List<String>? descriptionBaiduAll;
  String? resourceId;
  String? category;
  int? authorId;
  RobotValidateResult? robotValidateResult;
  int? tfUpdateTime;
  int? homeSchedule;
  int? publishTime;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    descriptionBaiduPosL1: json["description_baidu_pos_l1"] == null ? null : List<String>.from(json["description_baidu_pos_l1"].map((x) => x)),
    sysTag: json["sys_tag"] == null ? null : List<double>.from(json["sys_tag"].map((x) => x.toDouble())),
    rankScore: json["rank_score"] == null ? null : RankScore.fromJson(json["rank_score"]),
    city: json["city"] == null ? null : json["city"],
    titleBaiduNe: json["title_baidu_ne"] == null ? null : List<String>.from(json["title_baidu_ne"].map((x) => x)),
    robotValidateStatus: json["robot_validate_status"] == null ? null : robotValidateStatusValues.map![json["robot_validate_status"]],
    description: json["description"] == null ? null : json["description"],
    title: json["title"] == null ? null : json["title"],
    type: json["type"] == null ? null : json["type"].toString(),
    allTagLabels: json["all_tag_labels"] == null ? null : List<String>.from(json["all_tag_labels"].map((x) => x)),
    auth: json["__auth"] == null ? null : Auth.fromJson(json["__auth"]),
    resourceVersion: json["resource_version"] == null ? null : DateTime.parse(json["resource_version"]),
    robotValidateLabel: json["robot_validate_label"] == null ? null : List<dynamic>.from(json["robot_validate_label"].map((x) => x)),
    descriptionBaiduPosL2: json["description_baidu_pos_l2"] == null ? null : List<dynamic>.from(json["description_baidu_pos_l2"].map((x) => x)),
    uid: json["uid"] == null ? null : json["uid"],
    updateTime: json["update_time"],
    itemListLibrary: json["library"] == null ? null : json["library"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    titleBaiduParticiple: json["title_baidu_participle"] == null ? null : List<String>.from(json["title_baidu_participle"].map((x) => x)),
    tagList: json["tag_list"] == null ? null : List<dynamic>.from(json["tag_list"].map((x) => x)),
    descriptionBaiduParticiple: json["description_baidu_participle"] == null ? null : List<String>.from(json["description_baidu_participle"].map((x) => x)),
    header: json["__header"] == null ? null : Header.fromJson(json["__header"]),
    id: json["id"] == null ? null : json["id"],
    tag: json["tag"] == null ? null : List<String>.from(json["tag"].map((x) => x)),
    indexName: json["index_name"] == null ? null : json["index_name"],
    realCollectionCount: json["real_collection_count"] == null ? null : json["real_collection_count"],
    resourceStatus: json["resource_status"] == null ? null : resourceStatusValues.map![json["resource_status"]],
    releaseTime: json["release_time"] == null ? null : DateTime.parse(json["release_time"]),
    area: json["area"] == null ? null : json["area"],
    selectedTime: json["selected_time"] == null ? null : json["selected_time"],
    titleBaiduPosL2: json["title_baidu_pos_l2"] == null ? null : List<dynamic>.from(json["title_baidu_pos_l2"].map((x) => x)),
    ad: json["ad"] == null ? null : json["ad"],
    titleBaiduPosL1: json["title_baidu_pos_l1"] == null ? null : List<String>.from(json["title_baidu_pos_l1"].map((x) => x)),
    resourceType: json["resource_type"] == null ? null : resourceTypeValues.map![json["resource_type"]],
    playCount: json["play_count"] == null ? null : json["play_count"],
    descriptionBaiduNe: json["description_baidu_ne"] == null ? null : List<String>.from(json["description_baidu_ne"].map((x) => x)),
    shareCount: json["share_count"] == null ? null : json["share_count"],
    titleBaiduAll: json["title_baidu_all"] == null ? null : List<String>.from(json["title_baidu_all"].map((x) => x)),
    updateScoreVersion: json["update_score_version"] == null ? null : json["update_score_version"],
    collectionCount: json["collection_count"] == null ? null : json["collection_count"],
    descriptionBaiduAll: json["description_baidu_all"] == null ? null : List<String>.from(json["description_baidu_all"].map((x) => x)),
    resourceId: json["resource_id"] == null ? null : json["resource_id"],
    category: json["category"] == null ? null : json["category"],
    authorId: json["author_id"] == null ? null : json["author_id"],
    robotValidateResult: json["robot_validate_result"] == null ? null : robotValidateResultValues.map![json["robot_validate_result"]],
    tfUpdateTime: json["tf_update_time"] == null ? null : json["tf_update_time"],
    homeSchedule: json["home_schedule"] == null ? null : json["home_schedule"],
    publishTime: json["publish_time"] == null ? null : json["publish_time"],
  );

  Map<String, dynamic> toJson() => {
    "description_baidu_pos_l1": descriptionBaiduPosL1 == null ? null : List<dynamic>.from(descriptionBaiduPosL1!.map((x) => x)),
    "sys_tag": sysTag == null ? null : List<dynamic>.from(sysTag!.map((x) => x)),
    "rank_score": rankScore == null ? null : rankScore!.toJson(),
    "city": city == null ? null : city,
    "title_baidu_ne": titleBaiduNe == null ? null : List<dynamic>.from(titleBaiduNe!.map((x) => x)),
    "robot_validate_status": robotValidateStatus == null ? null : robotValidateStatusValues.reverse[robotValidateStatus],
    "description": description == null ? null : description,
    "title": title == null ? null : title,
    "type": type == null ? null : type,
    "all_tag_labels": allTagLabels == null ? null : List<dynamic>.from(allTagLabels!.map((x) => x)),
    "__auth": auth == null ? null : auth!.toJson(),
    "resource_version": resourceVersion == null ? null : "${resourceVersion!.year.toString().padLeft(4, '0')}-${resourceVersion!.month.toString().padLeft(2, '0')}-${resourceVersion!.day.toString().padLeft(2, '0')}",
    "robot_validate_label": robotValidateLabel == null ? null : List<dynamic>.from(robotValidateLabel!.map((x) => x)),
    "description_baidu_pos_l2": descriptionBaiduPosL2 == null ? null : List<dynamic>.from(descriptionBaiduPosL2!.map((x) => x)),
    "uid": uid == null ? null : uid,
    "update_time": updateTime,
    "library": itemListLibrary == null ? null : itemListLibrary,
    "category_id": categoryId == null ? null : categoryId,
    "title_baidu_participle": titleBaiduParticiple == null ? null : List<dynamic>.from(titleBaiduParticiple!.map((x) => x)),
    "tag_list": tagList == null ? null : List<dynamic>.from(tagList!.map((x) => x)),
    "description_baidu_participle": descriptionBaiduParticiple == null ? null : List<dynamic>.from(descriptionBaiduParticiple!.map((x) => x)),
    "__header": header == null ? null : header!.toJson(),
    "id": id == null ? null : id,
    "tag": tag == null ? null : List<dynamic>.from(tag!.map((x) => x)),
    "index_name": indexName == null ? null : indexName,
    "real_collection_count": realCollectionCount == null ? null : realCollectionCount,
    "resource_status": resourceStatus == null ? null : resourceStatusValues.reverse[resourceStatus],
    "release_time": releaseTime == null ? null : releaseTime!.toIso8601String(),
    "area": area == null ? null : area,
    "selected_time": selectedTime == null ? null : selectedTime,
    "title_baidu_pos_l2": titleBaiduPosL2 == null ? null : List<dynamic>.from(titleBaiduPosL2!.map((x) => x)),
    "ad": ad == null ? null : ad,
    "title_baidu_pos_l1": titleBaiduPosL1 == null ? null : List<dynamic>.from(titleBaiduPosL1!.map((x) => x)),
    "resource_type": resourceType == null ? null : resourceTypeValues.reverse[resourceType],
    "play_count": playCount == null ? null : playCount,
    "description_baidu_ne": descriptionBaiduNe == null ? null : List<dynamic>.from(descriptionBaiduNe!.map((x) => x)),
    "share_count": shareCount == null ? null : shareCount,
    "title_baidu_all": titleBaiduAll == null ? null : List<dynamic>.from(titleBaiduAll!.map((x) => x)),
    "update_score_version": updateScoreVersion == null ? null : updateScoreVersion,
    "collection_count": collectionCount == null ? null : collectionCount,
    "description_baidu_all": descriptionBaiduAll == null ? null : List<dynamic>.from(descriptionBaiduAll!.map((x) => x)),
    "resource_id": resourceId == null ? null : resourceId,
    "category": category == null ? null : category,
    "author_id": authorId == null ? null : authorId,
    "robot_validate_result": robotValidateResult == null ? null : robotValidateResultValues.reverse[robotValidateResult],
    "tf_update_time": tfUpdateTime == null ? null : tfUpdateTime,
    "home_schedule": homeSchedule == null ? null : homeSchedule,
    "publish_time": publishTime == null ? null : publishTime,
  };
}

class Auth {
  Auth({
    this.appKey,
    this.sign,
    this.time,
  });

  String? appKey;
  String? sign;
  int? time;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    appKey: json["app_key"] == null ? null : json["app_key"],
    sign: json["sign"] == null ? null : json["sign"],
    time: json["time"] == null ? null : json["time"],
  );

  Map<String, dynamic> toJson() => {
    "app_key": appKey == null ? null : appKey,
    "sign": sign == null ? null : sign,
    "time": time == null ? null : time,
  };
}

class Header {
  Header({
    this.clientIp,
  });

  String? clientIp;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    clientIp: json["client_ip"] == null ? null : json["client_ip"],
  );

  Map<String, dynamic> toJson() => {
    "client_ip": clientIp == null ? null : clientIp,
  };
}

class RankScore {
  RankScore({
    this.all,
    this.month,
    this.weekday,
    this.latest30Days,
  });

  double? all;
  double? month;
  double? weekday;
  int? latest30Days;

  factory RankScore.fromJson(Map<String, dynamic> json) => RankScore(
    all: json["all"] == null ? null : json["all"].toDouble(),
    month: json["month"] == null ? null : json["month"].toDouble(),
    weekday: json["weekday"] == null ? null : json["weekday"].toDouble(),
    latest30Days: json["latest_30_days"] == null ? null : json["latest_30_days"],
  );

  Map<String, dynamic> toJson() => {
    "all": all == null ? null : all,
    "month": month == null ? null : month,
    "weekday": weekday == null ? null : weekday,
    "latest_30_days": latest30Days == null ? null : latest30Days,
  };
}

enum ResourceStatus { ONLINE }

final resourceStatusValues = EnumValues({
  "ONLINE": ResourceStatus.ONLINE
});

enum ResourceType { PGC_VIDEO }

final resourceTypeValues = EnumValues({
  "pgc_video": ResourceType.PGC_VIDEO
});

enum RobotValidateResult { PASS }

final robotValidateResultValues = EnumValues({
  "pass": RobotValidateResult.PASS
});

enum RobotValidateStatus { FINISHED }

final robotValidateStatusValues = EnumValues({
  "finished": RobotValidateStatus.FINISHED
});

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
