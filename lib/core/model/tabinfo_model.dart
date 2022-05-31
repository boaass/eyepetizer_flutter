class ZCLTabInfo {
  ZCLTabInfo({
    this.tabInfo,
    this.tagInfo,
  });

  TabInfo? tabInfo;
  TagInfo? tagInfo;

  factory ZCLTabInfo.fromJson(Map<String, dynamic> json) => ZCLTabInfo(
    tabInfo: json["tabInfo"] == null ? null : TabInfo.fromJson(json["tabInfo"]),
    tagInfo: json["tagInfo"] == null ? null : TagInfo.fromJson(json["tagInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "tabInfo": tabInfo == null ? null : tabInfo!.toJson(),
    "tagInfo": tagInfo == null ? null : tagInfo!.toJson(),
  };
}

class TabInfo {
  TabInfo({
    this.tabList,
    this.defaultIdx,
  });

  List<TabList>? tabList;
  int? defaultIdx;

  factory TabInfo.fromJson(Map<String, dynamic> json) => TabInfo(
    tabList: json["tabList"] == null ? null : List<TabList>.from(json["tabList"].map((x) => TabList.fromJson(x))),
    defaultIdx: json["defaultIdx"] == null ? null : json["defaultIdx"],
  );

  Map<String, dynamic> toJson() => {
    "tabList": tabList == null ? null : List<dynamic>.from(tabList!.map((x) => x.toJson())),
    "defaultIdx": defaultIdx == null ? null : defaultIdx,
  };
}

class TabList {
  TabList({
    this.id,
    this.name,
    this.apiUrl,
    this.tabType,
    this.nameType,
  });

  int? id;
  String? name;
  String? apiUrl;
  int? tabType;
  int? nameType;

  factory TabList.fromJson(Map<String, dynamic> json) => TabList(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    apiUrl: json["apiUrl"] == null ? null : json["apiUrl"],
    tabType: json["tabType"] == null ? null : json["tabType"],
    nameType: json["nameType"] == null ? null : json["nameType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "apiUrl": apiUrl == null ? null : apiUrl,
    "tabType": tabType == null ? null : tabType,
    "nameType": nameType == null ? null : nameType,
  };
}

class TagInfo {
  TagInfo({
    this.dataType,
    this.id,
    this.name,
    this.description,
    this.headerImage,
    this.bgPicture,
    this.actionUrl,
    this.recType,
    this.follow,
    this.tagFollowCount,
    this.tagVideoCount,
    this.tagDynamicCount,
    this.childTabList,
    this.lookCount,
    this.shareLinkUrl,
  });

  String? dataType;
  int? id;
  String? name;
  String? description;
  String? headerImage;
  String? bgPicture;
  String? actionUrl;
  int? recType;
  Follow? follow;
  int? tagFollowCount;
  int? tagVideoCount;
  int? tagDynamicCount;
  List<TabList>? childTabList;
  int? lookCount;
  String? shareLinkUrl;

  factory TagInfo.fromJson(Map<String, dynamic> json) => TagInfo(
    dataType: json["dataType"] == null ? null : json["dataType"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    headerImage: json["headerImage"] == null ? null : json["headerImage"],
    bgPicture: json["bgPicture"] == null ? null : json["bgPicture"],
    actionUrl: json["actionUrl"] == null ? null : json["actionUrl"],
    recType: json["recType"] == null ? null : json["recType"],
    follow: json["follow"] == null ? null : Follow.fromJson(json["follow"]),
    tagFollowCount: json["tagFollowCount"] == null ? null : json["tagFollowCount"],
    tagVideoCount: json["tagVideoCount"] == null ? null : json["tagVideoCount"],
    tagDynamicCount: json["tagDynamicCount"] == null ? null : json["tagDynamicCount"],
    childTabList: json["childTabList"] == null ? null : List.from(json["childTabList"]).map((e) => TabList.fromJson(e)).toList(),
    lookCount: json["lookCount"] == null ? null : json["lookCount"],
    shareLinkUrl: json["shareLinkUrl"] == null ? null : json["shareLinkUrl"],
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType == null ? null : dataType,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "headerImage": headerImage == null ? null : headerImage,
    "bgPicture": bgPicture == null ? null : bgPicture,
    "actionUrl": actionUrl,
    "recType": recType == null ? null : recType,
    "follow": follow == null ? null : follow!.toJson(),
    "tagFollowCount": tagFollowCount == null ? null : tagFollowCount,
    "tagVideoCount": tagVideoCount == null ? null : tagVideoCount,
    "tagDynamicCount": tagDynamicCount == null ? null : tagDynamicCount,
    "childTabList": childTabList,
    "lookCount": lookCount == null ? null : lookCount,
    "shareLinkUrl": shareLinkUrl == null ? null : shareLinkUrl,
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
