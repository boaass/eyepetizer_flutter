import 'package:flutter/cupertino.dart';

class ZCLCard {
  final int? card_id;
  final String? type;
  final ZCLHeader? header;
  final ZCLBody? body;
  final ZCLFooter? footer;
  final String? create_source;
  final ApiRequest? apiRequest;

  ZCLCard({this.card_id, this.type, this.header, this.body, this.footer, this.apiRequest, this.create_source});

  factory ZCLCard.fromJson(Map<String, dynamic>? json) => ZCLCard(
    card_id: json?["card_id"] ?? "",
    type: json?["type"] ?? "",
    header: ZCLHeader.fromJson(json?["card_data"]?["header"] ?? {}),
    body: ZCLBody.fromJson(json?["card_data"]?["body"] ?? {}),
    footer: ZCLFooter.fromJson(json?["card_data"]?["footer"] ?? {}),
    apiRequest: json?["card_data"]?["body"]?["api_request"] == null ? null : ApiRequest.fromJson(json?["card_data"]?["body"]?["api_request"])  ,
    create_source: json?["create_source"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "card_id": card_id,
    "type": type,
    "header": header?.toJson(),
    "body": body?.toJson(),
    "footer": footer?.toJson(),
    "create_source": create_source,
    "apiRequest": apiRequest?.toJson(),
  };
}

class ZCLCardList {
  ZCLCardList({
    this.itemList,
    this.itemCount,
    this.lastItemId,
  });

  List<ZCLCard>? itemList;
  int? itemCount;
  String? lastItemId;

  factory ZCLCardList.fromJson(Map<String, dynamic> json) => ZCLCardList(
    itemList: json["item_list"] == null ? null : List<ZCLCard>.from(json["item_list"].map((x) => ZCLCard.fromJson(x))),
    itemCount: json["item_count"] == null ? null : json["item_count"],
    lastItemId: json["last_item_id"] == null ? null : json["last_item_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "item_list": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "item_count": itemCount == null ? null : itemCount,
    "last_item_id": lastItemId == null ? null : lastItemId,
  };
}

class ZCLMertroList {
  ZCLMertroList({
    this.itemList,
    this.itemCount,
    this.lastItemId,
  });

  List<ZCLMetro>? itemList;
  int? itemCount;
  String? lastItemId;

  factory ZCLMertroList.fromJson(Map<String, dynamic> json) => ZCLMertroList(
    itemList: json["item_list"] == null ? null : List<ZCLMetro>.from(json["item_list"].map((x) => ZCLMetro.fromJson(x))),
    itemCount: json["item_count"] == null ? null : json["item_count"],
    lastItemId: json["last_item_id"] == null ? null : json["last_item_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "item_list": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "item_count": itemCount == null ? null : itemCount,
    "last_item_id": lastItemId == null ? null : lastItemId,
  };
}

class ZCLMetro {
  final String? metro_id;
  final String? type;
  final String? video_id;
  final String? title;
  final ZCLDuration? duration;
  final bool? autoplay;
  final String? play_url;
  final List<String>? tags;
  final String? cover;
  final ZCLAuthor? author;
  final String? link;
  final ZCLStyle? style;
  final String? publish_time;
  final List<ZCLTopic>? topics;
  final String? text;
  final ZCLConsumption? consumption;
  final bool? followed;
  final int? follow_count;
  final int? fans_count;
  final ZCLAvatar? avatar;
  final String? nick;
  final String? description;
  final ZCLVideo? video;
  final bool? is_ad;
  double? videoPlayerAspectRatio;
  GlobalKey? stickyKey;
  final Background? background;
  final MetroData? metroData;

  ZCLMetro({
    this.metro_id,
    this.type,
    this.video_id,
    this.title,
    this.duration,
    this.autoplay,
    this.play_url,
    this.tags,
    this.cover,
    this.author,
    this.link,
    this.style,
    this.publish_time,
    this.topics,
    this.text,
    this.consumption,
    this.followed,
    this.follow_count,
    this.fans_count,
    this.avatar,
    this.nick,
    this.description,
    this.video,
    this.videoPlayerAspectRatio = 0,
    this.is_ad,
    this.background,
    this.metroData,
  });

  factory ZCLMetro.fromJson(Map<String, dynamic>? json) => ZCLMetro(
    metro_id: json?["metro_id"].toString() ?? "",
    type: json?["type"] ?? "",
    video_id: json?["metro_data"]?["video_id"] == null ? null : json?["metro_data"]["video_id"],
    title: json?["metro_data"]?["title"] ?? "",
    duration: ZCLDuration.fromJson(json?["metro_data"]?["duration"]),
    autoplay: json?["metro_data"]?["play_ctrl"]?["autoplay"] ?? false,
    play_url: json?["metro_data"]?["play_url"] ?? "",
    tags: List<String>.from((json?["metro_data"]?["tags"]??[]).map((x) => x?["title"])),
    cover: json?["metro_data"]?["cover"]?["url"] ?? "",
    author: ZCLAuthor.fromJson(json?["metro_data"]?["author"]),
    link: json?["link"].toString() ?? "",
    style: ZCLStyle.fromJson(json?["style"] ?? {}),
    publish_time: json?["metro_data"]?["publish_time"] ?? "",
    topics: List<ZCLTopic>.from((json?["metro_data"]?["topics"] ?? []).map((e) => ZCLTopic.fromJson(e))),
    text: json?["metro_data"]?["text"] ?? "",
    consumption: ZCLConsumption.fromJson(json?["metro_data"]?["consumption"] ?? {}),
    followed: json?["metro_data"]?["followed"] ?? false,
    follow_count: json?["metro_data"]?["follow_count"] ?? 0,
    fans_count: json?["metro_data"]?["fans_count"] ?? 0,
    avatar: ZCLAvatar.fromJson(json?["metro_data"]?["avatar"] ?? {}),
    nick: json?["metro_data"]?["nick"] ?? "",
    description: json?["metro_data"]?["description"] ?? "",
    video: ZCLVideo.fromJson(json?["metro_data"]?["video"] ?? {}),
    is_ad: json?["metro_data"]?["is_ad"] ?? false,
    background: Background.fromJson(json?["metro_data"]?["background"] ?? {}),
    metroData: MetroData.fromJson(json?["metro_data"] ?? {})
  );

  Map<String, dynamic> toJson() => {
    "metro_id": metro_id,
    "type": type,
    "video_id": video_id,
    "title": title,
    "duration": duration?.toJson(),
    "autoplay": autoplay,
    "play_url": play_url,
    "tags": tags,
    "cover": cover,
    "author": author,
    "link": author?.toJson(),
    "style": style?.toJson(),
    "publish_time": publish_time,
    "topics": topics?.map((e) => e.toJson()).toList(),
    "text": text,
    "consumption": consumption!.toJson(),
    "followed": followed! ? "true" : "false",
    "follow_count": follow_count.toString(),
    "fans_count": fans_count.toString(),
    "avatar": avatar?.toJson(),
    "nick": nick,
    "description": description,
    "video": video?.toJson(),
    "is_ad": is_ad,
    "background": background?.toJson(),
    "metroData": metroData?.toJson()
  };
}

class ZCLHeader {
  final List<ZCLMetro>? left;
  final List<ZCLMetro>? right;

  ZCLHeader({this.left, this.right});

  factory ZCLHeader.fromJson(Map<String, dynamic> json) => ZCLHeader(
    left: List<ZCLMetro>.from((json["left"]??[]).map((e) => ZCLMetro.fromJson(e))),
    right: List<ZCLMetro>.from((json["right"]??[]).map((e) => ZCLMetro.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    "left": left!.map((e) => e.toJson()).toList(),
    "right": right!.map((e) => e.toJson()).toList()
  };
}

class ZCLBody {
  final List<ZCLMetro>? metro_list;
  final String? refill_link;
  ApiRequest? apiRequest;

  ZCLBody({this.metro_list, this.refill_link, this.apiRequest});
  
  factory ZCLBody.fromJson(Map<String, dynamic> json) => ZCLBody(
    metro_list: List<ZCLMetro>.from((json["metro_list"] ?? []).map((x) => ZCLMetro.fromJson(x))),
    refill_link: json["refill_link"] ?? "",
    apiRequest: json["api_request"] == null ? null : ApiRequest.fromJson(json["api_request"])
  );

  Map<String, dynamic> toJson() => {
    "metro_list": metro_list?.map((e) => e.toJson()).toList(),
    "refill_link": refill_link,
    "apiRequest": apiRequest?.toJson()
  };
}

class ZCLFooter {
  final List<ZCLMetro>? left;
  final List<ZCLMetro>? right;

  ZCLFooter({this.left, this.right});

  factory ZCLFooter.fromJson(Map<String, dynamic> json) => ZCLFooter(
      left: List<ZCLMetro>.from((json["left"]??[]).map((e) => ZCLMetro.fromJson(e))),
      right: List<ZCLMetro>.from((json["right"]??[]).map((e) => ZCLMetro.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    "left": left!.map((e) => e.toJson()).toList(),
    "right": right!.map((e) => e.toJson()).toList()
  };
}

class ApiRequest {
  ApiRequest({
    this.url,
    this.params,
  });

  String? url;
  Params? params;

  factory ApiRequest.fromJson(Map<String, dynamic> json) => ApiRequest(
    url: json["url"] == null ? null : json["url"],
    params: json["params"] == null ? null : Params.fromJson(json["params"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "params": params == null ? null : params!.toJson(),
  };
}

class Params {
  Params({
    this.card,
    this.cardIndex,
    this.materialIndex,
    this.materialRelativeIndex,
    this.material,
    this.dataSource,
    this.lastItemId,
    this.pageLabel,
    this.pageParams,
    this.cardList,
  });

  String? card;
  int? cardIndex;
  int? materialIndex;
  int? materialRelativeIndex;
  String? material;
  String? dataSource;
  String? lastItemId;
  String? pageLabel;
  String? pageParams;
  String? cardList;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
    card: json["card"] == null ? null : json["card"],
    cardIndex: json["card_index"] == null ? null : json["card_index"],
    materialIndex: json["material_index"] == null ? null : json["material_index"],
    materialRelativeIndex: json["material_relative_index"] == null ? null : json["material_relative_index"],
    material: json["material"] == null ? null : json["material"],
    dataSource: json["data_source"] == null ? null : json["data_source"],
    lastItemId: json["last_item_id"] == null ? null : json["last_item_id"].toString(),
    pageLabel: json["page_label"] == null ? null : json["page_label"],
    pageParams: json["page_params"] == null ? null : json["page_params"],
    cardList: json["card_list"] == null ? null : json["card_list"],
  );

  Map<String, dynamic> toJson() => {
    "card": card == null ? null : card,
    "card_index": cardIndex == null ? null : cardIndex,
    "material_index": materialIndex == null ? null : materialIndex,
    "material_relative_index": materialRelativeIndex == null ? null : materialRelativeIndex,
    "material": material == null ? null : material,
    "data_source": dataSource == null ? null : dataSource,
    "last_item_id": lastItemId == null ? null : lastItemId,
    "page_label": pageLabel == null ? null : pageLabel,
    "page_params": pageParams == null ? null : pageParams,
    "card_list": cardList == null ? null : cardList,
  };
}

class ZCLDuration {
  final int? value;
  final String? text;

  ZCLDuration({this.value, this.text});

  factory ZCLDuration.fromJson(Map<String, dynamic>? json) => ZCLDuration(
    value: json?["value"] ?? 0,
    text: json?["text"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text
  };
}

class ZCLAuthor {
  final int? uid;
  final String? nick;
  final String? description;
  final String? avatar;
  final String? link;
  final bool? followed;

  ZCLAuthor({this.uid, this.nick, this.description, this.avatar, this.link,
      this.followed});

  factory ZCLAuthor.fromJson(Map<String, dynamic>? json) => ZCLAuthor(
    uid: json?["uid"] ?? 0,
    nick: json?["nick"] ?? "",
    description: json?["description"] ?? "",
    avatar: json?["avatar"]["url"] ?? "",
    link: json?["link"] ?? "",
    followed: json?["followed"] ?? false
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "nick": nick,
    "description": description,
    "avatar": avatar,
    "link": link,
    "followed": followed
  };
}

class ZCLItem {
  final String? text;
  final String? link;

  ZCLItem({this.text, this.link});

  factory ZCLItem.fromJson(Map<String, dynamic>? json) => ZCLItem(
    text: json?["text"] ?? "",
    link: json?["link"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "link": link
  };
}

class ZCLTopic {
  final String? title;
  final String? link;

  ZCLTopic({this.title, this.link});

  factory ZCLTopic.fromJson(Map<String, dynamic>? json) => ZCLTopic(
      title: json?["title"] ?? "",
      link: json?["link"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "text": title,
    "link": link
  };
}

class ZCLConsumption {
  final int? like_count;
  final int? collection_count;
  final int? comment_count;
  final int? share_count;

  ZCLConsumption({this.like_count, this.collection_count, this.comment_count,
      this.share_count});

  factory ZCLConsumption.fromJson(Map<String, dynamic> json) => ZCLConsumption(
    like_count: json["like_count"] ?? 0,
    collection_count: json["collection_count"] ?? 0,
    comment_count: json["comment_count"] ?? 0,
    share_count: json["share_count"] ?? 0
  );

  Map<String, dynamic> toJson() => {
    "like_count": like_count,
    "collection_count": collection_count,
    "comment_count": comment_count,
    "share_count": share_count
  };
}

class ZCLAvatar {
  final String? url;
  final ImageInfo? imageInfo;

  ZCLAvatar({this.url, this.imageInfo});

  factory ZCLAvatar.fromJson(Map<String, dynamic> json) => ZCLAvatar(
    url: json["url"],
    imageInfo: json["img_info"] == null ? null : ImageInfo.fromJson(json["img_info"])
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "imageInfo": imageInfo?.toJson()
  };
}

class ZCLVideo {
  final String? video_id;
  final String? title;
  final ZCLDuration? duration;
  final ZCLPlayCtrl? play_ctrl;
  final String? play_url;
  final List<String>? tags;
  final String? cover;

  ZCLVideo({
    this.video_id,
    this.title,
    this.duration,
    this.play_ctrl,
    this.play_url,
    this.tags,
    this.cover,
  });

  factory ZCLVideo.fromJson(Map<String, dynamic> json) => ZCLVideo(
    video_id: json["video_id"] ?? "",
    title: json["title"] ?? "",
    duration: ZCLDuration.fromJson(json["duration"] ?? {}),
    play_ctrl: ZCLPlayCtrl.fromJson(json["play_ctrl"] ?? {}),
    tags: List<String>.from((json["tags"]??[]).map((x) => x?["title"])),
    cover: json["cover"]?["url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "video_id": video_id,
    "title": title,
    "duration": duration?.toJson(),
    "play_ctrl": play_ctrl?.toJson(),
    "tags": tags.toString(),
    "cover": cover
  };
}

class ZCLPlayCtrl {
  final bool? autoplay;

  ZCLPlayCtrl({this.autoplay});

  factory ZCLPlayCtrl.fromJson(Map<String, dynamic> json) => ZCLPlayCtrl(
      autoplay: json["autoplay"] ?? false
  );

  Map<String, dynamic> toJson() =>
  {
    "autoplay": autoplay! ? "true" : "false"
  };
}

class ZCLMoreOption {
  final String? title;
  final String? type;

  ZCLMoreOption({this.title, this.type});

  factory ZCLMoreOption.fromJson(Map<String, dynamic> json) => ZCLMoreOption(
    title: json["title"] ?? "",
    type: json["type"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "type": type
  };
}

class ZCLStyle {
  final String? tpl_label;
  final bool? across_column;

  ZCLStyle({this.tpl_label, this.across_column});

  factory ZCLStyle.fromJson(Map<String, dynamic> json) => ZCLStyle(
    tpl_label: json["tpl_label"] ?? "",
    across_column: json["across_column"] ?? false
  );

  Map<String, dynamic> toJson() => {
    "tpl_label": tpl_label,
    "across_column": across_column
  };
}

class Background {
  Background({
    this.url,
    this.imageInfo,
  });

  String? url;
  ImageInfo? imageInfo;

  factory Background.fromJson(Map<String, dynamic> json) => Background(
    url: json["url"] == null ? null : json["url"],
    imageInfo: json["img_info"] == null ? null : ImageInfo.fromJson(json["img_info"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "img_info": imageInfo == null ? null : imageInfo!.toJson(),
  };
}

class ImageInfo {
  ImageInfo({
    this.width,
    this.height,
    this.scale,
  });

  int? width;
  int? height;
  int? scale;

  factory ImageInfo.fromJson(Map<String, dynamic> json) => ImageInfo(
    width: json["width"] == null ? null : json["width"].toInt(),
    height: json["height"] == null ? null : json["height"].toInt(),
    scale: json["scale"] == null ? null : json["scale"].toInt(),
  );

  Map<String, dynamic> toJson() => {
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "scale": scale == null ? null : scale,
  };
}

class MetroData {
  MetroData({
    this.type,
    this.style,
    this.content,
    this.navList,
    this.itemId,
    this.publishTime,
    this.rawPublishTime,
    this.location,
    this.topics,
    this.text,
    this.images,
    this.video,
    this.author,
    this.consumption,
    this.liked,
    this.collected,
    this.resourceId,
    this.resourceType,
    this.privateMsgLink,
    this.commentExtraTrackingFields,
    this.isMine,
    this.showLockIcon,
    this.showFollowBtn,
    this.showMoreBtn,
    this.moreOption,
    this.cover,
    this.avatar,
  });

  String? type;
  String? style;
  Content? content;
  List<NavList>? navList;
  String? itemId;
  String? publishTime;
  DateTime? rawPublishTime;
  Location? location;
  List<ZCLTopic>? topics;
  String? text;
  List<ZCLImage>? images;
  ZCLVideo? video;
  ZCLAuthor? author;
  ZCLConsumption? consumption;
  bool? liked;
  bool? collected;
  String? resourceId;
  String? resourceType;
  String? privateMsgLink;
  CommentExtraTrackingFields? commentExtraTrackingFields;
  bool? isMine;
  bool? showLockIcon;
  bool? showFollowBtn;
  bool? showMoreBtn;
  List<ZCLMoreOption>? moreOption;
  Cover? cover;
  ZCLAvatar? avatar;

  factory MetroData.fromJson(Map<String, dynamic> json) => MetroData(
    type: json["type"] == null ? null : json["type"],
    style: json["style"] == null ? null : json["style"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
    navList: json["nav_list"] == null ? null : List<NavList>.from(json["nav_list"].map((x) => NavList.fromJson(x ?? {}))),
    itemId: json["item_id"] == null ? null : json["item_id"],
    publishTime: json["publish_time"] == null ? null : json["publish_time"],
    rawPublishTime: json["raw_publish_time"] == null ? null : DateTime.parse(json["raw_publish_time"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    topics: json["topics"] == null ? null : List<ZCLTopic>.from(json["topics"].map((x) => ZCLTopic.fromJson(x))),
    text: json["text"] == null ? null : json["text"],
    images: json["images"] == null ? null : List<ZCLImage>.from(json["images"].map((x) => ZCLImage.fromJson(x))),
    video: json["video"] == null ? null : ZCLVideo.fromJson(json["video"]),
    author: json["author"] == null ? null : ZCLAuthor.fromJson(json["author"]),
    consumption: json["consumption"] == null ? null : ZCLConsumption.fromJson(json["consumption"]),
    liked: json["liked"] == null ? null : json["liked"],
    collected: json["collected"] == null ? null : json["collected"],
    resourceId: json["resource_id"] == null ? null : json["resource_id"].toString(),
    resourceType: json["resource_type"] == null ? null : json["resource_type"],
    privateMsgLink: json["private_msg_link"] == null ? null : json["private_msg_link"],
    commentExtraTrackingFields: json["comment_extra_tracking_fields"] == null ? null : CommentExtraTrackingFields.fromJson(json["comment_extra_tracking_fields"]),
    isMine: json["is_mine"] == null ? null : json["is_mine"],
    showLockIcon: json["show_lock_icon"] == null ? null : json["show_lock_icon"],
    showFollowBtn: json["show_follow_btn"] == null ? null : json["show_follow_btn"],
    showMoreBtn: json["show_more_btn"] == null ? null : json["show_more_btn"],
    moreOption: json["more_option"] == null ? null : List<ZCLMoreOption>.from(json["more_option"].map((x) => ZCLMoreOption.fromJson(x))),
    cover: json["cover"] == null ? null : Cover.fromJson(json["cover"]),
    avatar: json["avatar"] == null ? null : ZCLAvatar.fromJson(json["avatar"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "style": style == null ? null : style,
    "content": content == null ? null : content!.toJson(),
    "navList": navList == null ? null : navList!.map((NavList e) => e.toJson()),
    "item_id": itemId == null ? null : itemId,
    "publish_time": publishTime == null ? null : publishTime,
    "raw_publish_time": rawPublishTime == null ? null : rawPublishTime!.toIso8601String(),
    "location": location == null ? null : location!.toJson(),
    "topics": topics == null ? null : List<dynamic>.from(topics!.map((x) => x)),
    "text": text == null ? null : text,
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
    "video": video == null ? null : video!.toJson(),
    "author": author == null ? null : author!.toJson(),
    "consumption": consumption == null ? null : consumption!.toJson(),
    "liked": liked == null ? null : liked,
    "collected": collected == null ? null : collected,
    "resource_id": resourceId == null ? null : resourceId,
    "resource_type": resourceType == null ? null : resourceType,
    "private_msg_link": privateMsgLink == null ? null : privateMsgLink,
    "comment_extra_tracking_fields": commentExtraTrackingFields == null ? null : commentExtraTrackingFields!.toJson(),
    "is_mine": isMine == null ? null : isMine,
    "show_lock_icon": showLockIcon == null ? null : showLockIcon,
    "show_follow_btn": showFollowBtn == null ? null : showFollowBtn,
    "show_more_btn": showMoreBtn == null ? null : showMoreBtn,
    "more_option": moreOption == null ? null : List<dynamic>.from(moreOption!.map((x) => x.toJson())),
    "cover": cover == null ? null : cover!.toJson(),
    "avatar": avatar == null ? null : avatar!.toJson(),
  };
}

class ZCLImage {
  ZCLImage({
    this.imageId,
    this.cover,
  });

  String? imageId;
  Cover? cover;

  factory ZCLImage.fromJson(Map<String, dynamic> json) => ZCLImage(
    imageId: json["image_id"] == null ? null : json["image_id"],
    cover: json["cover"] == null ? null : Cover.fromJson(json["cover"]),
  );

  Map<String, dynamic> toJson() => {
    "image_id": imageId == null ? null : imageId,
    "cover": cover == null ? null : cover!.toJson(),
  };
}

class Cover {
  Cover({
    this.url,
    this.imgInfo,
  });

  String? url;
  ImageInfo? imgInfo;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
    url: json["url"] == null ? null : json["url"],
    imgInfo: json["img_info"] == null ? null : ImageInfo.fromJson(json["img_info"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "img_info": imgInfo == null ? null : imgInfo!.toJson(),
  };
}

class Location {
  Location({
    this.area,
    this.city,
    this.longitude,
    this.latitude,
  });

  String? area;
  String? city;
  String? longitude;
  String? latitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    area: json["area"] == null ? null : json["area"],
    city: json["city"] == null ? null : json["city"],
    longitude: json["longitude"] == null ? null : json["longitude"].toString(),
    latitude: json["latitude"] == null ? null : json["latitude"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "area": area == null ? null : area,
    "city": city == null ? null : city,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
  };
}

class CommentExtraTrackingFields {
  CommentExtraTrackingFields({
    this.resourceId,
    this.resourceType,
  });

  String? resourceId;
  String? resourceType;

  factory CommentExtraTrackingFields.fromJson(Map<String, dynamic> json) => CommentExtraTrackingFields(
    resourceId: json["resource_id"] == null ? null : json["resource_id"],
    resourceType: json["resource_type"] == null ? null : json["resource_type"],
  );

  Map<String, dynamic> toJson() => {
    "resource_id": resourceId == null ? null : resourceId,
    "resource_type": resourceType == null ? null : resourceType,
  };
}

class Content {
  Content({
    this.blocks,
    this.entityMap,
    this.globalStyle,
  });

  List<Block>? blocks;
  List<dynamic>? entityMap;
  GlobalStyle? globalStyle;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    blocks: json["blocks"] == null ? null : List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
    entityMap: json["entityMap"] == null ? null : List<dynamic>.from(json["entityMap"].map((x) => x)),
    globalStyle: json["globalStyle"] == null ? null : GlobalStyle.fromJson(json["globalStyle"]),
  );

  Map<String, dynamic> toJson() => {
    "blocks": blocks == null ? null : List<dynamic>.from(blocks!.map((x) => x.toJson())),
    "entityMap": entityMap == null ? null : List<dynamic>.from(entityMap!.map((x) => x)),
    "globalStyle": globalStyle == null ? null : globalStyle!.toJson(),
  };
}

class Block {
  Block({
    this.key,
    this.text,
    this.type,
    this.depth,
    this.inlineStyleRanges,
    this.entityRanges,
    this.data,
  });

  String? key;
  String? text;
  String? type;
  int? depth;
  List<dynamic>? inlineStyleRanges;
  List<dynamic>? entityRanges;
  Data? data;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
    key: json["key"] == null ? null : json["key"],
    text: json["text"] == null ? null : json["text"],
    type: json["type"] == null ? null : json["type"],
    depth: json["depth"] == null ? null : json["depth"],
    inlineStyleRanges: json["inlineStyleRanges"] == null ? null : List<dynamic>.from(json["inlineStyleRanges"].map((x) => x)),
    entityRanges: json["entityRanges"] == null ? null : List<dynamic>.from(json["entityRanges"].map((x) => x)),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "text": text == null ? null : text,
    "type": type == null ? null : type,
    "depth": depth == null ? null : depth,
    "inlineStyleRanges": inlineStyleRanges == null ? null : List<dynamic>.from(inlineStyleRanges!.map((x) => x)),
    "entityRanges": entityRanges == null ? null : List<dynamic>.from(entityRanges!.map((x) => x)),
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.marginLeft,
    this.marginRight,
  });

  int? marginLeft;
  int? marginRight;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    marginLeft: json["marginLeft"] == null ? null : json["marginLeft"],
    marginRight: json["marginRight"] == null ? null : json["marginRight"],
  );

  Map<String, dynamic> toJson() => {
    "marginLeft": marginLeft == null ? null : marginLeft,
    "marginRight": marginRight == null ? null : marginRight,
  };
}

class GlobalStyle {
  GlobalStyle({
    this.fontSize,
    this.letterSpacing,
    this.lineHeight,
    this.fontFamily,
    this.backgroundColor,
  });

  int? fontSize;
  double? letterSpacing;
  int? lineHeight;
  String? fontFamily;
  String? backgroundColor;

  factory GlobalStyle.fromJson(Map<String, dynamic> json) => GlobalStyle(
    fontSize: json["fontSize"] == null ? null : json["fontSize"],
    letterSpacing: json["letterSpacing"] == null ? null : json["letterSpacing"].toDouble(),
    lineHeight: json["lineHeight"] == null ? null : json["lineHeight"],
    fontFamily: json["fontFamily"] == null ? null : json["fontFamily"],
    backgroundColor: json["backgroundColor"] == null ? null : json["backgroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "fontSize": fontSize == null ? null : fontSize,
    "letterSpacing": letterSpacing == null ? null : letterSpacing,
    "lineHeight": lineHeight == null ? null : lineHeight,
    "fontFamily": fontFamily == null ? null : fontFamily,
    "backgroundColor": backgroundColor == null ? null : backgroundColor,
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

