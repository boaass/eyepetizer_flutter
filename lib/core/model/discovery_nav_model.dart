class ZCLDiscoveryNavModel {
  ZCLDiscoveryNavModel({
    this.style,
    this.navList,
    this.navItem,
  });

  String? style;
  List<NavList>? navList;
  NavItem? navItem;

  factory ZCLDiscoveryNavModel.fromJson(Map<String, dynamic> json) => ZCLDiscoveryNavModel(
    style: json["style"] == null ? null : json["style"],
    navList: json["nav_list"] == null ? null : List<NavList>.from(json["nav_list"].map((x) => NavList.fromJson(x))),
    navItem: json["nav_item"] == null ? null : NavItem.fromJson(json["nav_item"]),
  );

  Map<String, dynamic> toJson() => {
    "style": style == null ? null : style,
    "nav_list": navList == null ? null : List<dynamic>.from(navList!.map((x) => x.toJson())),
    "nav_item": navItem == null ? null : navItem!.toJson(),
  };
}

class NavItem {
  NavItem({
    this.left,
    this.center,
    this.right,
  });

  List<Left>? left;
  List<dynamic>? center;
  List<Right>? right;

  factory NavItem.fromJson(Map<String, dynamic> json) => NavItem(
    left: json["left"] == null ? null : List<Left>.from(json["left"].map((x) => Left.fromJson(x))),
    center: json["center"] == null ? null : List<dynamic>.from(json["center"].map((x) => x)),
    right: json["right"] == null ? null : List<Right>.from(json["right"].map((x) => Right.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "left": left == null ? null : List<dynamic>.from(left!.map((x) => x.toJson())),
    "center": center == null ? null : List<dynamic>.from(center!.map((x) => x)),
    "right": right == null ? null : List<dynamic>.from(right!.map((x) => x.toJson())),
  };
}

class Left {
  Left({
    this.type,
    this.label,
    this.text,
  });

  String? type;
  String? label;
  String? text;

  factory Left.fromJson(Map<String, dynamic> json) => Left(
    type: json["type"] == null ? null : json["type"],
    label: json["label"] == null ? null : json["label"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "label": label == null ? null : label,
    "text": text == null ? null : text,
  };
}

class Right {
  Right({
    this.type,
    this.label,
    this.link,
  });

  String? type;
  String? label;
  String? link;

  factory Right.fromJson(Map<String, dynamic> json) => Right(
    type: json["type"] == null ? null : json["type"],
    label: json["label"] == null ? null : json["label"],
    link: json["link"] == null ? null : json["link"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "label": label == null ? null : label,
    "link": link == null ? null : link,
  };
}

class NavList {
  NavList({
    this.pageLabel,
    this.pageType,
    this.title,
    this.url,
    this.defaultDisplay,
    this.forceRefresh,
    this.apiRequest,
    this.pageUrl,
    this.pageUrlParameter,
    this.isRecommend,
    this.childNav,
    this.enablePreload,
    this.preloadDuration,
  });

  String? pageLabel;
  String? pageType;
  String? title;
  String? url;
  bool? defaultDisplay;
  bool? forceRefresh;
  ApiRequest? apiRequest;
  String? pageUrl;
  String? pageUrlParameter;
  bool? isRecommend;
  ChildNav? childNav;
  bool? enablePreload;
  int? preloadDuration;

  factory NavList.fromJson(Map<String, dynamic> json) => NavList(
    pageLabel: json["page_label"] == null ? null : json["page_label"],
    pageType: json["page_type"] == null ? null : json["page_type"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    defaultDisplay: json["default_display"] == null ? null : json["default_display"],
    forceRefresh: json["force_refresh"] == null ? null : json["force_refresh"],
    apiRequest: json["api_request"] == null ? null : ApiRequest.fromJson(json["api_request"]),
    pageUrl: json["page_url"] == null ? null : json["page_url"],
    pageUrlParameter: json["page_url_parameter"] == null ? null : json["page_url_parameter"],
    isRecommend: json["is_recommend"] == null ? null : json["is_recommend"],
    childNav: json["child_nav"] == null ? null : ChildNav.fromJson(json["child_nav"]),
    enablePreload: json["enable_preload"] == null ? null : json["enable_preload"],
    preloadDuration: json["preload_duration"] == null ? null : json["preload_duration"],
  );

  Map<String, dynamic> toJson() => {
    "page_label": pageLabel == null ? null : pageLabel,
    "page_type": pageType == null ? null : pageType,
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "default_display": defaultDisplay == null ? null : defaultDisplay,
    "force_refresh": forceRefresh == null ? null : forceRefresh,
    "api_request": apiRequest == null ? null : apiRequest!.toJson(),
    "page_url": pageUrl == null ? null : pageUrl,
    "page_url_parameter": pageUrlParameter == null ? null : pageUrlParameter,
    "is_recommend": isRecommend == null ? null : isRecommend,
    "child_nav": childNav == null ? null : childNav!.toJson(),
    "enable_preload": enablePreload == null ? null : enablePreload,
    "preload_duration": preloadDuration == null ? null : preloadDuration,
  };
}

class ApiRequest {
  ApiRequest();

  factory ApiRequest.fromJson(Map<String, dynamic> json) => ApiRequest(
  );

  Map<String, dynamic> toJson() => {
  };
}

class ChildNav {
  ChildNav({
    this.fixed,
    this.slide,
  });

  List<dynamic>? fixed;
  List<dynamic>? slide;

  factory ChildNav.fromJson(Map<String, dynamic> json) => ChildNav(
    fixed: json["fixed"] == null ? null : List<dynamic>.from(json["fixed"].map((x) => x)),
    slide: json["slide"] == null ? null : List<dynamic>.from(json["slide"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "fixed": fixed == null ? null : List<dynamic>.from(fixed!.map((x) => x)),
    "slide": slide == null ? null : List<dynamic>.from(slide!.map((x) => x)),
  };
}
