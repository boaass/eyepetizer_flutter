import 'topic_detail_tag_model.dart';

class ZCLTopicDetailLight {
  ZCLTopicDetailLight({
    this.id,
    this.headerImage,
    this.brief,
    this.text,
    this.shareLink,
    this.itemList,
    this.count
  });

  int? id;
  String? headerImage;
  String? brief;
  String? text;
  String? shareLink;
  List<ItemList>? itemList;
  int? count;

  factory ZCLTopicDetailLight.fromJson(Map<String, dynamic> json) => ZCLTopicDetailLight(
    id: json["id"] == null ? null : json["id"],
    headerImage: json["headerImage"] == null ? null : json["headerImage"],
    brief: json["brief"] == null ? null : json["brief"],
    text: json["text"] == null ? null : json["text"],
    shareLink: json["shareLink"] == null ? null : json["shareLink"],
    itemList: json["itemList"] == null ? null : List<ItemList>.from(json["itemList"].map((x) => ItemList.fromJson(x))),
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "headerImage": headerImage == null ? null : headerImage,
    "brief": brief == null ? null : brief,
    "text": text == null ? null : text,
    "shareLink": shareLink == null ? null : shareLink,
    "itemList": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "count": count == null ? null : count,
  };
}
