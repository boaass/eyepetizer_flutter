class AuthorUserInfo {
  AuthorUserInfo({
    this.uid,
    this.nick,
    this.avatar,
    this.description,
    this.link,
    this.type,
    this.followed,
    this.authorId,
    this.cover,
    this.gender,
    this.country,
    this.city,
    this.job,
    this.university,
    this.birthday,
    this.constellation,
    this.medalCount,
    this.followCount,
    this.fansCount,
    this.collectedCount,
    this.sharedCount,
    this.itemCount,
    this.featuredCount,
    this.recommendCount,
    this.expert,
    this.isMine,
    this.medalCountLink,
    this.fansCountLink,
    this.followCountLink,
    this.privateMsgLink,
    this.watchHistoryLink,
    this.showFollowBtn,
    this.showPrivateMsgBtn,
    this.enableShare,
    this.mobile,
    this.brief,
    this.tags,
    this.navTabs,
    this.followPageLabel,
  });

  int? uid;
  String? nick;
  Avatar? avatar;
  String? description;
  String? link;
  String? type;
  bool? followed;
  int? authorId;
  String? cover;
  String? gender;
  String? country;
  String? city;
  String? job;
  String? university;
  int? birthday;
  String? constellation;
  int? medalCount;
  int? followCount;
  int? fansCount;
  int? collectedCount;
  int? sharedCount;
  int? itemCount;
  int? featuredCount;
  int? recommendCount;
  bool? expert;
  bool? isMine;
  String? medalCountLink;
  String? fansCountLink;
  String? followCountLink;
  String? privateMsgLink;
  String? watchHistoryLink;
  bool? showFollowBtn;
  bool? showPrivateMsgBtn;
  bool? enableShare;
  String? mobile;
  String? brief;
  List<dynamic>? tags;
  NavTabs? navTabs;
  String? followPageLabel;

  factory AuthorUserInfo.fromJson(Map<String, dynamic> json) => AuthorUserInfo(
    uid: json["uid"] == null ? null : json["uid"],
    nick: json["nick"] == null ? null : json["nick"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    type: json["type"] == null ? null : json["type"],
    followed: json["followed"] == null ? null : json["followed"],
    authorId: json["author_id"] == null ? null : json["author_id"],
    cover: json["cover"] == null ? null : json["cover"],
    gender: json["gender"] == null ? null : json["gender"],
    country: json["country"] == null ? null : json["country"],
    city: json["city"] == null ? null : json["city"],
    job: json["job"] == null ? null : json["job"],
    university: json["university"] == null ? null : json["university"],
    birthday: json["birthday"] == null ? null : json["birthday"],
    constellation: json["constellation"] == null ? null : json["constellation"],
    medalCount: json["medal_count"] == null ? null : json["medal_count"],
    followCount: json["follow_count"] == null ? null : json["follow_count"],
    fansCount: json["fans_count"] == null ? null : json["fans_count"],
    collectedCount: json["collected_count"] == null ? null : json["collected_count"],
    sharedCount: json["shared_count"] == null ? null : json["shared_count"],
    itemCount: json["item_count"] == null ? null : json["item_count"],
    featuredCount: json["featured_count"] == null ? null : json["featured_count"],
    recommendCount: json["recommend_count"] == null ? null : json["recommend_count"],
    expert: json["expert"] == null ? null : json["expert"],
    isMine: json["is_mine"] == null ? null : json["is_mine"],
    medalCountLink: json["medal_count_link"] == null ? null : json["medal_count_link"],
    fansCountLink: json["fans_count_link"] == null ? null : json["fans_count_link"],
    followCountLink: json["follow_count_link"] == null ? null : json["follow_count_link"],
    privateMsgLink: json["private_msg_link"] == null ? null : json["private_msg_link"],
    watchHistoryLink: json["watch_history_link"] == null ? null : json["watch_history_link"],
    showFollowBtn: json["show_follow_btn"] == null ? null : json["show_follow_btn"],
    showPrivateMsgBtn: json["show_private_msg_btn"] == null ? null : json["show_private_msg_btn"],
    enableShare: json["enable_share"] == null ? null : json["enable_share"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    brief: json["brief"] == null ? null : json["brief"],
    tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
    navTabs: json["nav_tabs"] == null ? null : NavTabs.fromJson(json["nav_tabs"]),
    followPageLabel: json["follow_page_label"] == null ? null : json["follow_page_label"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "nick": nick == null ? null : nick,
    "avatar": avatar == null ? null : avatar!.toJson(),
    "description": description == null ? null : description,
    "link": link == null ? null : link,
    "type": type == null ? null : type,
    "followed": followed == null ? null : followed,
    "author_id": authorId == null ? null : authorId,
    "cover": cover == null ? null : cover,
    "gender": gender == null ? null : gender,
    "country": country == null ? null : country,
    "city": city == null ? null : city,
    "job": job == null ? null : job,
    "university": university == null ? null : university,
    "birthday": birthday == null ? null : birthday,
    "constellation": constellation == null ? null : constellation,
    "medal_count": medalCount == null ? null : medalCount,
    "follow_count": followCount == null ? null : followCount,
    "fans_count": fansCount == null ? null : fansCount,
    "collected_count": collectedCount == null ? null : collectedCount,
    "shared_count": sharedCount == null ? null : sharedCount,
    "item_count": itemCount == null ? null : itemCount,
    "featured_count": featuredCount == null ? null : featuredCount,
    "recommend_count": recommendCount == null ? null : recommendCount,
    "expert": expert == null ? null : expert,
    "is_mine": isMine == null ? null : isMine,
    "medal_count_link": medalCountLink == null ? null : medalCountLink,
    "fans_count_link": fansCountLink == null ? null : fansCountLink,
    "follow_count_link": followCountLink == null ? null : followCountLink,
    "private_msg_link": privateMsgLink == null ? null : privateMsgLink,
    "watch_history_link": watchHistoryLink == null ? null : watchHistoryLink,
    "show_follow_btn": showFollowBtn == null ? null : showFollowBtn,
    "show_private_msg_btn": showPrivateMsgBtn == null ? null : showPrivateMsgBtn,
    "enable_share": enableShare == null ? null : enableShare,
    "mobile": mobile == null ? null : mobile,
    "brief": brief == null ? null : brief,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
    "nav_tabs": navTabs == null ? null : navTabs!.toJson(),
    "follow_page_label": followPageLabel == null ? null : followPageLabel,
  };
}

class Avatar {
  Avatar({
    this.url,
    this.imgInfo,
    this.shape,
  });

  String? url;
  ImgInfo? imgInfo;
  String? shape;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    url: json["url"] == null ? null : json["url"],
    imgInfo: json["img_info"] == null ? null : ImgInfo.fromJson(json["img_info"]),
    shape: json["shape"] == null ? null : json["shape"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "img_info": imgInfo == null ? null : imgInfo!.toJson(),
    "shape": shape == null ? null : shape,
  };
}

class ImgInfo {
  ImgInfo({
    this.width,
    this.height,
    this.scale,
  });

  int? width;
  int? height;
  int? scale;

  factory ImgInfo.fromJson(Map<String, dynamic> json) => ImgInfo(
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    scale: json["scale"] == null ? null : json["scale"],
  );

  Map<String, dynamic> toJson() => {
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "scale": scale == null ? null : scale,
  };
}

class NavTabs {
  NavTabs({
    this.style,
    this.navList,
    this.navItem,
  });

  String? style;
  List<NavList>? navList;
  NavItem? navItem;

  factory NavTabs.fromJson(Map<String, dynamic> json) => NavTabs(
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
    this.right,
  });

  List<dynamic>? left;
  List<dynamic>? right;

  factory NavItem.fromJson(Map<String, dynamic> json) => NavItem(
    left: json["left"] == null ? null : List<dynamic>.from(json["left"].map((x) => x)),
    right: json["right"] == null ? null : List<dynamic>.from(json["right"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "left": left == null ? null : List<dynamic>.from(left!.map((x) => x)),
    "right": right == null ? null : List<dynamic>.from(right!.map((x) => x)),
  };
}

class NavList {
  NavList({
    this.pageLabel,
    this.pageType,
    this.iconType,
    this.title,
    this.url,
    this.defaultDisplay,
    this.forceRefresh,
    this.apiRequest,
    this.pageUrl,
    this.pageUrlParameter,
    this.isRecommend,
    this.childNav,
  });

  String? pageLabel;
  String? pageType;
  String? iconType;
  String? title;
  String? url;
  bool? defaultDisplay;
  bool? forceRefresh;
  ApiRequest? apiRequest;
  String? pageUrl;
  String? pageUrlParameter;
  bool? isRecommend;
  ChildNav? childNav;

  factory NavList.fromJson(Map<String, dynamic> json) => NavList(
    pageLabel: json["page_label"] == null ? null : json["page_label"],
    pageType: json["page_type"] == null ? null : json["page_type"],
    iconType: json["icon_type"] == null ? null : json["icon_type"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    defaultDisplay: json["default_display"] == null ? null : json["default_display"],
    forceRefresh: json["force_refresh"] == null ? null : json["force_refresh"],
    apiRequest: json["api_request"] == null ? null : ApiRequest.fromJson(json["api_request"]),
    pageUrl: json["page_url"] == null ? null : json["page_url"],
    pageUrlParameter: json["page_url_parameter"] == null ? null : json["page_url_parameter"],
    isRecommend: json["is_recommend"] == null ? null : json["is_recommend"],
    childNav: json["child_nav"] == null ? null : ChildNav.fromJson(json["child_nav"]),
  );

  Map<String, dynamic> toJson() => {
    "page_label": pageLabel == null ? null : pageLabel,
    "page_type": pageType == null ? null : pageType,
    "icon_type": iconType == null ? null : iconType,
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "default_display": defaultDisplay == null ? null : defaultDisplay,
    "force_refresh": forceRefresh == null ? null : forceRefresh,
    "api_request": apiRequest == null ? null : apiRequest!.toJson(),
    "page_url": pageUrl == null ? null : pageUrl,
    "page_url_parameter": pageUrlParameter == null ? null : pageUrlParameter,
    "is_recommend": isRecommend == null ? null : isRecommend,
    "child_nav": childNav == null ? null : childNav!.toJson(),
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
