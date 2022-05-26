import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/float_entrance_model.dart';

class ZCLCardPageModel {

  final List<ZCLCard>? cards;
  final List<ZCLFloatEntrance>? floatEntrances;
  final PageInfo? pageInfo;

  ZCLCardPageModel({this.pageInfo, this.cards, this.floatEntrances});

  factory ZCLCardPageModel.fromJson(Map<String, dynamic> json) => ZCLCardPageModel(
    pageInfo: json["page_info"] == null ? null : PageInfo.fromJson(json["page_info"]),
    cards: json["card_list"] == null ? null : List<ZCLCard>.from(json["card_list"].map((x) => ZCLCard.fromJson(x))),
    floatEntrances: json["float_entrance"] == null ? null : List<ZCLFloatEntrance>.from(json["float_entrance"].map((x) => ZCLFloatEntrance.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "pageInfo": pageInfo?.toJson(),
    "cards": List.from(cards!.map((e) => e.toJson())).toString(),
    "floatEntrances": floatEntrances == null ? null : floatEntrances!.map((e) => e.toJson()).toList().toString()
  };
}

class PageInfo {
  PageInfo({
    this.pageId,
    this.title,
    this.enableShare,
    this.baseLink,
    this.pageLabel,
    this.showTheEnd,
  });

  int? pageId;
  String? title;
  bool? enableShare;
  String? baseLink;
  String? pageLabel;
  bool? showTheEnd;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    pageId: json["page_id"] == null ? null : json["page_id"],
    title: json["title"] == null ? null : json["title"],
    enableShare: json["enable_share"] == null ? null : json["enable_share"],
    baseLink: json["base_link"] == null ? null : json["base_link"],
    pageLabel: json["page_label"] == null ? null : json["page_label"],
    showTheEnd: json["show_the_end"] == null ? null : json["show_the_end"],
  );

  Map<String, dynamic> toJson() => {
    "page_id": pageId == null ? null : pageId,
    "title": title == null ? null : title,
    "enable_share": enableShare == null ? null : enableShare,
    "base_link": baseLink == null ? null : baseLink,
    "page_label": pageLabel == null ? null : pageLabel,
    "show_the_end": showTheEnd == null ? null : showTheEnd,
  };
}