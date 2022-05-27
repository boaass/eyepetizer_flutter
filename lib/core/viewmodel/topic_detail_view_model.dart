import 'dart:convert';

import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/core/services/metro_list_request.dart';
import 'package:eyepetizer/core/services/topic_detail_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ZCLTopicDetailNotifier extends ChangeNotifier {
  String _link = "";
  String get link => _link;
  set link(String link) {
    _link = link;
    notifyListeners();
  }
}

class ZCLTopicDetailViewModel extends ZCLBaseViewModel {
  ZCLCardPageModel? _cardPageModel;
  ZCLCardPageModel? _navItemModel;
  ZCLCardPageModel? _originCardPageModel;
  List<String> pageLabels = [];

  ZCLCardPageModel? get cardPageModel => _cardPageModel;
  set cardPageModel(ZCLCardPageModel? cardPageModel) {
    _cardPageModel = cardPageModel;
    notifyListeners();
  }

  addItemForCardPageModel(ZCLCard card) {
    _cardPageModel!.cards!.add(card);
    cardPageModel = _cardPageModel;
  }

  addMetroList(List<ZCLMetro> metros) {
    _cardPageModel!.cards!.last.body!.metro_list!.addAll(metros);
    notifyListeners();
  }

  ZCLCardPageModel? get navItemModel =>_navItemModel;
  set navItemModel(ZCLCardPageModel? navItemModel) {
    _navItemModel = navItemModel;
    notifyListeners();
  }

  requestNavItemModel(int index) {
    String url = HttpConfig.apiBaseURL + "/card/page/get_page";
    Map params = {
      "page_label" : pageLabels[index],//_originCardPageModel!.cards!.last.body!.metro_list!.first.metroData!.navList![index].pageLabel,
      "page_type" : "card"
    };

    ZCLTopicDetailRequest.getData(url, params).then((value) {
      if (navItemModel == null) {
        navItemModel = value;
        addItemForCardPageModel(navItemModel!.cards!.first);
      } else {
        navItemModel = value;
        cardPageModel!.cards!.last = navItemModel!.cards!.first;
      }
      cardPageModel!.cards!.last.body!.apiRequest = value.cards!.last.body!.apiRequest;
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }

  requestMoreNavItem() {
    if (cardPageModel!.cards!.last.body!.apiRequest == null) {
      return;
    }
    Map<String, dynamic> lastParams = cardPageModel!.cards!.last.body!.apiRequest!.params!.toJson();
    ZCLMetroListRequest.getData(lastParams).then((value) {
      addMetroList(value.itemList!);
      cardPageModel!.cards!.last.body!.apiRequest!.params!.lastItemId = value.lastItemId;
    }).catchError((error, stack) {
      print("$error\n$stack");
    });
  }

  updateDetailModelToNavModel() {
    _originCardPageModel = _cardPageModel;
    List<ZCLCard> tmpCards = _cardPageModel!.cards!.sublist(2);
    cardPageModel = ZCLCardPageModel(pageInfo: _cardPageModel!.pageInfo, cards: tmpCards, floatEntrances: _cardPageModel!.floatEntrances);
  }

  updateDetailModelToOriginModel() {
    List<ZCLCard> tmpCards = _originCardPageModel!.cards!.sublist(0, 3)..add(_cardPageModel!.cards!.last);
    _originCardPageModel = ZCLCardPageModel(pageInfo: _originCardPageModel!.pageInfo, cards: tmpCards, floatEntrances: _originCardPageModel!.floatEntrances);
    cardPageModel = _originCardPageModel;
  }

  ZCLTopicDetailViewModel(String link) {
    String str = link.split("api_request=").last;
    var decode = Uri.decodeFull(str);
    Map<String, dynamic> dataMap = Map.castFrom(json.decode(decode));
    ZCLTopicDetailRequest.getData(dataMap["url"], dataMap["params"]).then((value) {
      cardPageModel = value;
      pageLabels = cardPageModel!.cards!.last.body!.metro_list!.first.metroData!.navList!.map((e) => e.pageLabel!).toList();
      requestNavItemModel(0);
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}