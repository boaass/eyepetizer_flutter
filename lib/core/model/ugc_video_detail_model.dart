class ZCLUgcVideoDetailModel {
  ZCLUgcVideoDetailModel({
    this.itemId,
    this.publishTime,
    this.rawPublishTime,
    this.location,
    this.topics,
    this.category,
    this.labels,
    this.subtitles,
    this.type,
    this.text,
    this.textPgc,
    this.images,
    this.video,
    this.recommendLevel,
    this.author,
    this.consumption,
    this.liked,
    this.collected,
    this.resourceId,
    this.resourceType,
    this.privateMsgLink,
    this.commentExtraTrackingFields,
    this.isMine,
    this.link,
    this.appLink,
  });

  String? itemId;
  String? publishTime;
  DateTime? rawPublishTime;
  Location? location;
  List<Topic>? topics;
  Category? category;
  List<dynamic>? labels;
  List<dynamic>? subtitles;
  String? type;
  String? text;
  String? textPgc;
  List<dynamic>? images;
  Video? video;
  String? recommendLevel;
  Author? author;
  Consumption? consumption;
  bool? liked;
  bool? collected;
  String? resourceId;
  String? resourceType;
  String? privateMsgLink;
  CommentExtraTrackingFields? commentExtraTrackingFields;
  bool? isMine;
  String? link;
  String? appLink;

  factory ZCLUgcVideoDetailModel.fromJson(Map<String, dynamic> json) => ZCLUgcVideoDetailModel(
    itemId: json["item_id"] == null ? null : json["item_id"],
    publishTime: json["publish_time"] == null ? null : json["publish_time"],
    rawPublishTime: json["raw_publish_time"] == null ? null : DateTime.parse(json["raw_publish_time"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    topics: json["topics"] == null ? null : List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    labels: json["labels"] == null ? null : List<dynamic>.from(json["labels"].map((x) => x)),
    subtitles: json["subtitles"] == null ? null : List<dynamic>.from(json["subtitles"].map((x) => x)),
    type: json["type"] == null ? null : json["type"],
    text: json["text"] == null ? null : json["text"],
    textPgc: json["text_pgc"] == null ? null : json["text_pgc"],
    images: json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
    video: json["video"] == null ? null : Video.fromJson(json["video"]),
    recommendLevel: json["recommend_level"] == null ? null : json["recommend_level"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    consumption: json["consumption"] == null ? null : Consumption.fromJson(json["consumption"]),
    liked: json["liked"] == null ? null : json["liked"],
    collected: json["collected"] == null ? null : json["collected"],
    resourceId: json["resource_id"] == null ? null : json["resource_id"],
    resourceType: json["resource_type"] == null ? null : json["resource_type"],
    privateMsgLink: json["private_msg_link"] == null ? null : json["private_msg_link"],
    commentExtraTrackingFields: json["comment_extra_tracking_fields"] == null ? null : CommentExtraTrackingFields.fromJson(json["comment_extra_tracking_fields"]),
    isMine: json["is_mine"] == null ? null : json["is_mine"],
    link: json["link"] == null ? null : json["link"],
    appLink: json["app_link"] == null ? null : json["app_link"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId == null ? null : itemId,
    "publish_time": publishTime == null ? null : publishTime,
    "raw_publish_time": rawPublishTime == null ? null : rawPublishTime!.toIso8601String(),
    "location": location == null ? null : location!.toJson(),
    "topics": topics == null ? null : List<dynamic>.from(topics!.map((x) => x.toJson())),
    "category": category == null ? null : category!.toJson(),
    "labels": labels == null ? null : List<dynamic>.from(labels!.map((x) => x)),
    "subtitles": subtitles == null ? null : List<dynamic>.from(subtitles!.map((x) => x)),
    "type": type == null ? null : type,
    "text": text == null ? null : text,
    "text_pgc": textPgc == null ? null : textPgc,
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
    "video": video == null ? null : video!.toJson(),
    "recommend_level": recommendLevel == null ? null : recommendLevel,
    "author": author == null ? null : author!.toJson(),
    "consumption": consumption == null ? null : consumption!.toJson(),
    "liked": liked == null ? null : liked,
    "collected": collected == null ? null : collected,
    "resource_id": resourceId == null ? null : resourceId,
    "resource_type": resourceType == null ? null : resourceType,
    "private_msg_link": privateMsgLink == null ? null : privateMsgLink,
    "comment_extra_tracking_fields": commentExtraTrackingFields == null ? null : commentExtraTrackingFields!.toJson(),
    "is_mine": isMine == null ? null : isMine,
    "link": link == null ? null : link,
    "app_link": appLink == null ? null : appLink,
  };
}

class Author {
  Author({
    this.uid,
    this.nick,
    this.description,
    this.avatar,
    this.link,
    this.type,
    this.followed,
  });

  int? uid;
  String? nick;
  String? description;
  Avatar? avatar;
  String? link;
  String? type;
  bool? followed;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    uid: json["uid"] == null ? null : json["uid"],
    nick: json["nick"] == null ? null : json["nick"],
    description: json["description"] == null ? null : json["description"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    link: json["link"] == null ? null : json["link"],
    type: json["type"] == null ? null : json["type"],
    followed: json["followed"] == null ? null : json["followed"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "nick": nick == null ? null : nick,
    "description": description == null ? null : description,
    "avatar": avatar == null ? null : avatar!.toJson(),
    "link": link == null ? null : link,
    "type": type == null ? null : type,
    "followed": followed == null ? null : followed,
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
  double? scale;

  factory ImgInfo.fromJson(Map<String, dynamic> json) => ImgInfo(
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    scale: json["scale"] == null ? null : json["scale"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "scale": scale == null ? null : scale,
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
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

class Consumption {
  Consumption({
    this.likeCount,
    this.collectionCount,
    this.commentCount,
    this.shareCount,
  });

  int? likeCount;
  int? collectionCount;
  int? commentCount;
  int? shareCount;

  factory Consumption.fromJson(Map<String, dynamic> json) => Consumption(
    likeCount: json["like_count"] == null ? null : json["like_count"],
    collectionCount: json["collection_count"] == null ? null : json["collection_count"],
    commentCount: json["comment_count"] == null ? null : json["comment_count"],
    shareCount: json["share_count"] == null ? null : json["share_count"],
  );

  Map<String, dynamic> toJson() => {
    "like_count": likeCount == null ? null : likeCount,
    "collection_count": collectionCount == null ? null : collectionCount,
    "comment_count": commentCount == null ? null : commentCount,
    "share_count": shareCount == null ? null : shareCount,
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
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "area": area == null ? null : area,
    "city": city == null ? null : city,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
  };
}

class Topic {
  Topic({
    this.id,
    this.title,
    this.link,
  });

  int? id;
  String? title;
  String? link;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    link: json["link"] == null ? null : json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "link": link == null ? null : link,
  };
}

class Video {
  Video({
    this.videoId,
    this.title,
    this.titlePgc,
    this.descriptionEditor,
    this.duration,
    this.playCtrl,
    this.playUrl,
    this.playInfo,
    this.recommendLevel,
    this.tags,
    this.cover,
    this.background,
    this.width,
    this.height,
    this.poster,
    this.playUrlWithWatermark,
  });

  String? videoId;
  String? title;
  String? titlePgc;
  String? descriptionEditor;
  UgcVideoDuration? duration;
  PlayCtrl? playCtrl;
  String? playUrl;
  List<dynamic>? playInfo;
  String? recommendLevel;
  List<dynamic>? tags;
  Background? cover;
  Background? background;
  int? width;
  int? height;
  dynamic? poster;
  String? playUrlWithWatermark;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    videoId: json["video_id"] == null ? null : json["video_id"],
    title: json["title"] == null ? null : json["title"],
    titlePgc: json["title_pgc"] == null ? null : json["title_pgc"],
    descriptionEditor: json["description_editor"] == null ? null : json["description_editor"],
    duration: json["duration"] == null ? null : UgcVideoDuration.fromJson(json["duration"]),
    playCtrl: json["play_ctrl"] == null ? null : PlayCtrl.fromJson(json["play_ctrl"]),
    playUrl: json["play_url"] == null ? null : json["play_url"],
    playInfo: json["play_info"] == null ? null : List<dynamic>.from(json["play_info"].map((x) => x)),
    recommendLevel: json["recommend_level"] == null ? null : json["recommend_level"],
    tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
    cover: json["cover"] == null ? null : Background.fromJson(json["cover"]),
    background: json["background"] == null ? null : Background.fromJson(json["background"]),
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    poster: json["poster"],
    playUrlWithWatermark: json["play_url_with_watermark"] == null ? null : json["play_url_with_watermark"],
  );

  Map<String, dynamic> toJson() => {
    "video_id": videoId == null ? null : videoId,
    "title": title == null ? null : title,
    "title_pgc": titlePgc == null ? null : titlePgc,
    "description_editor": descriptionEditor == null ? null : descriptionEditor,
    "duration": duration == null ? null : duration!.toJson(),
    "play_ctrl": playCtrl == null ? null : playCtrl!.toJson(),
    "play_url": playUrl == null ? null : playUrl,
    "play_info": playInfo == null ? null : List<dynamic>.from(playInfo!.map((x) => x)),
    "recommend_level": recommendLevel == null ? null : recommendLevel,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
    "cover": cover == null ? null : cover!.toJson(),
    "background": background == null ? null : background!.toJson(),
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "poster": poster,
    "play_url_with_watermark": playUrlWithWatermark == null ? null : playUrlWithWatermark,
  };
}

class Background {
  Background({
    this.url,
    this.imgInfo,
  });

  String? url;
  ImgInfo? imgInfo;

  factory Background.fromJson(Map<String, dynamic> json) => Background(
    url: json["url"] == null ? null : json["url"],
    imgInfo: json["img_info"] == null ? null : ImgInfo.fromJson(json["img_info"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "img_info": imgInfo == null ? null : imgInfo!.toJson(),
  };
}

class UgcVideoDuration {
  UgcVideoDuration({
    this.value,
    this.text,
  });

  int? value;
  String? text;

  factory UgcVideoDuration.fromJson(Map<String, dynamic> json) => UgcVideoDuration(
    value: json["value"] == null ? null : json["value"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "text": text == null ? null : text,
  };
}

class PlayCtrl {
  PlayCtrl({
    this.autoplay,
    this.autoplayTimes,
    this.needWifi,
    this.needCellular,
  });

  bool? autoplay;
  int? autoplayTimes;
  bool? needWifi;
  bool? needCellular;

  factory PlayCtrl.fromJson(Map<String, dynamic> json) => PlayCtrl(
    autoplay: json["autoplay"] == null ? null : json["autoplay"],
    autoplayTimes: json["autoplay_times"] == null ? null : json["autoplay_times"],
    needWifi: json["need_wifi"] == null ? null : json["need_wifi"],
    needCellular: json["need_cellular"] == null ? null : json["need_cellular"],
  );

  Map<String, dynamic> toJson() => {
    "autoplay": autoplay == null ? null : autoplay,
    "autoplay_times": autoplayTimes == null ? null : autoplayTimes,
    "need_wifi": needWifi == null ? null : needWifi,
    "need_cellular": needCellular == null ? null : needCellular,
  };
}
