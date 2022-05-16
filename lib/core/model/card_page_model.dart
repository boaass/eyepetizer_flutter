import 'package:eyepetizer/core/model/card_model.dart';

class ZCLCardPageModel {

  final List<ZCLCard>? cards;

  ZCLCardPageModel({this.cards});

  factory ZCLCardPageModel.fromJson(Map<String, dynamic> json) => ZCLCardPageModel(
    cards: List<ZCLCard>.from(json["card_list"].map((x) => ZCLCard.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "cards": cards
  };
}