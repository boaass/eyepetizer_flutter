import 'package:flutter/cupertino.dart';

class ZCLCard {
  final int? card_id;
  final String? type;
  final ZCLHeader? header;
  final ZCLBody? body;
  final ZCLFooter? footer;
  final String? create_source;
  Map<String, dynamic>? api_request_params;

  ZCLCard({this.card_id, this.type, this.header, this.body, this.footer, this.api_request_params, this.create_source});

  factory ZCLCard.fromJson(Map<String, dynamic>? json) => ZCLCard(
    card_id: json?["card_id"] ?? "",
    type: json?["type"] ?? "",
    header: ZCLHeader.fromJson(json?["card_data"]?["header"] ?? {}),
    body: ZCLBody.fromJson(json?["card_data"]?["body"] ?? {}),
    footer: ZCLFooter.fromJson(json?["card_data"]?["footer"] ?? {}),
    api_request_params: json?["card_data"]?["body"]?["api_request"]?["params"] ?? {},
    create_source: json?["create_source"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "card_id": card_id,
    "type": type,
    "header": header?.toJson(),
    "body": body?.toJson(),
    "footer": footer?.toJson(),
    "create_source": create_source
  };
}

class ZCLMetro {
  final int? metro_id;
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
    this.is_ad
  });

  factory ZCLMetro.fromJson(Map<String, dynamic>? json) => ZCLMetro(
    metro_id: json?["metro_id"] ?? "",
    type: json?["type"] ?? "",
    video_id: json?["metro_data"]["video_id"] ?? "",
    title: json?["metro_data"]["title"] ?? "",
    duration: ZCLDuration.fromJson(json?["metro_data"]?["duration"]),
    autoplay: json?["metro_data"]?["play_ctrl"]?["autoplay"] ?? false,
    play_url: json?["metro_data"]?["play_url"] ?? "",
    tags: List<String>.from((json?["metro_data"]?["tags"]??[]).map((x) => x?["title"])),
    cover: json?["metro_data"]?["cover"]?["url"] ?? "",
    author: ZCLAuthor.fromJson(json?["metro_data"]?["author"]),
    link: json?["link"] ?? "",
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
    is_ad: json?["metro_data"]?["is_ad"] ?? false
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
    "is_ad": is_ad
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

  ZCLBody({this.metro_list, this.refill_link});
  
  factory ZCLBody.fromJson(Map<String, dynamic> json) => ZCLBody(
    metro_list: List<ZCLMetro>.from((json["metro_list"] ?? []).map((x) => ZCLMetro.fromJson(x))),
    refill_link: json["refill_link"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "metro_list": metro_list?.map((e) => e.toJson()).toList(),
    "refill_link": refill_link
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

  ZCLAvatar({this.url});

  factory ZCLAvatar.fromJson(Map<String, dynamic> json) => ZCLAvatar(
    url: json["url"]
  );

  Map<String, dynamic> toJson() => {
    "url": url
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