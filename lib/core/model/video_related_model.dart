import 'topic_detail_tag_model.dart';

class ZCLVideoRelated {
  ZCLVideoRelated({
    this.itemList,
    this.count,
    this.total,
    this.nextPageUrl,
    this.adExist,
  });

  List<RelatedItemList>? itemList;
  int? count;
  int? total;
  dynamic? nextPageUrl;
  bool? adExist;

  factory ZCLVideoRelated.fromJson(Map<String, dynamic> json) => ZCLVideoRelated(
    itemList: json["itemList"] == null ? null : List<RelatedItemList>.from(json["itemList"].map((x) => RelatedItemList.fromJson(x))),
    count: json["count"] == null ? null : json["count"],
    total: json["total"] == null ? null : json["total"],
    nextPageUrl: json["nextPageUrl"],
    adExist: json["adExist"] == null ? null : json["adExist"],
  );

  Map<String, dynamic> toJson() => {
    "itemList": itemList == null ? null : List<dynamic>.from(itemList!.map((x) => x.toJson())),
    "count": count == null ? null : count,
    "total": total == null ? null : total,
    "nextPageUrl": nextPageUrl,
    "adExist": adExist == null ? null : adExist,
  };
}

class RelatedItemList {
  RelatedItemList({
    this.type,
    this.data,
    this.trackingData,
    this.tag,
    this.id,
    this.adIndex,
  });

  ItemListType? type;
  ContentData? data;
  dynamic? trackingData;
  dynamic? tag;
  int? id;
  int? adIndex;

  factory RelatedItemList.fromJson(Map<String, dynamic> json) => RelatedItemList(
    type: json["type"] == null ? null : itemListTypeEnumValues.map![json["type"]],
    data: json["data"] == null ? null : ContentData.fromJson(json["data"]),
    trackingData: json["trackingData"],
    tag: json["tag"],
    id: json["id"] == null ? null : json["id"],
    adIndex: json["adIndex"] == null ? null : json["adIndex"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "data": data == null ? null : data!.toJson(),
    "trackingData": trackingData,
    "tag": tag,
    "id": id == null ? null : id,
    "adIndex": adIndex == null ? null : adIndex,
  };
}
