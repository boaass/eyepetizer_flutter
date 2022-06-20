class ZCLUgcPicDetailModel {
  ZCLUgcPicDetailModel({
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
    this.imagesWithWatermark,
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
  List<UgcPicImage>? images;
  Message? video;
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
  List<UgcPicImage>? imagesWithWatermark;
  String? link;
  String? appLink;

  factory ZCLUgcPicDetailModel.fromJson(Map<String, dynamic> json) => ZCLUgcPicDetailModel(
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
    images: json["images"] == null ? null : List<UgcPicImage>.from(json["images"].map((x) => UgcPicImage.fromJson(x))),
    video: json["video"] == null ? null : Message.fromJson(json["video"]),
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
    imagesWithWatermark: json["images_with_watermark"] == null ? null : List<UgcPicImage>.from(json["images_with_watermark"].map((x) => UgcPicImage.fromJson(x))),
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
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
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
    "images_with_watermark": imagesWithWatermark == null ? null : List<dynamic>.from(imagesWithWatermark!.map((x) => x.toJson())),
    "link": link == null ? null : link,
    "app_link": appLink == null ? null : appLink,
  };
}

class Message {
  Message();

  factory Message.fromJson(Map<String, dynamic> json) => Message(
  );

  Map<String, dynamic> toJson() => {
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

class UgcPicImage {
  UgcPicImage({
    this.imageId,
    this.cover,
  });

  String? imageId;
  Cover? cover;

  factory UgcPicImage.fromJson(Map<String, dynamic> json) => UgcPicImage(
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
  ImgInfo? imgInfo;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
    url: json["url"] == null ? null : json["url"],
    imgInfo: json["img_info"] == null ? null : ImgInfo.fromJson(json["img_info"]),
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

  String? id;
  String? title;
  String? link;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"] == null ? null : json["id"].toString(),
    title: json["title"] == null ? null : json["title"],
    link: json["link"] == null ? null : json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "link": link == null ? null : link,
  };
}
