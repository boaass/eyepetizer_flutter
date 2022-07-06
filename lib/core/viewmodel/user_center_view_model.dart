import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/model/user_info.dart';
import 'package:eyepetizer/core/services/card_page_request.dart';
import 'package:eyepetizer/core/services/metro_list_request.dart';
import 'package:eyepetizer/core/services/user_info_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';
import 'package:eyepetizer/ui/shared/task_queue_utils.dart';
import 'package:flutter/cupertino.dart';

class ZCLUserCenterNotifier extends ChangeNotifier {
  String _link = "";
  String get link => _link;
  set link(String link) {
    _link = link;
    notifyListeners();
  }
}

class ZCLUserCenterViewModel extends ZCLBaseViewModel {
  AuthorUserInfo? _authorUserInfo;
  set authorUserInfo(AuthorUserInfo? authorUserInfo) {
    _authorUserInfo = authorUserInfo;
    notifyListeners();
  }
  AuthorUserInfo? get authorUserInfo => _authorUserInfo;

  List<ZCLCardPageModel>? _pageModels;
  set pageModels(List<ZCLCardPageModel>? pageModels) {
    _pageModels = pageModels;
    notifyListeners();
  }
  List<ZCLCardPageModel>? get pageModels => _pageModels;

  ZCLUserCenterViewModel(String uid) {
    refresh(uid);
  }

  Future<void> refresh(String uid) async {
    TaskQueueUtils queueUtils = TaskQueueUtils();
    await ZCLUserInfoRequest.getData(uid).then((value) {
      authorUserInfo = value;
      _pageModels = List.from(authorUserInfo!.navTabs!.navList!.asMap().map((key, value) {
        queueUtils.addTask(requestPageModel, param: key);
        return MapEntry(key, value);
      }).values.map((e) => ZCLCardPageModel()));
      pageModels = _pageModels;
      return _pageModels;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
      return Future.error(error!);
    });
  }

  Future<dynamic> requestPageModel(int index) async {
    Map<String, dynamic> params = {
      "page_type": authorUserInfo!.navTabs!.navList![index].pageType,
      "page_label": authorUserInfo!.navTabs!.navList![index].pageLabel
    };
    await ZCLCardPageRequest.getData(params).then((value) {
      _pageModels![index] = value;
      notifyListeners();
      return _pageModels;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
      return _pageModels;
    });
  }

  loadMore(int pageIndex) {
    ZCLCardPageModel? cardPageModel = _pageModels![pageIndex];
    if (cardPageModel.cards!.last.body!.apiRequest == null) {
      return;
    }
    Map<String, dynamic> lastParams = cardPageModel.cards!.last.body!.apiRequest!.params!.toJson();
    ZCLMetroListRequest.getData(cardPageModel.cards!.last.body!.apiRequest!.url!, lastParams).then((value) {
      cardPageModel.cards!.last.body!.metro_list!.addAll(value.itemList!);
      cardPageModel.cards!.last.body!.apiRequest!.params!.lastItemId = value.lastItemId;
      notifyListeners();
    }).catchError((error, stack) {
      print("$error\n$stack");
    });
  }
}