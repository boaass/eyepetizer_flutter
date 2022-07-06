import 'package:eyepetizer/core/model/tabinfo_model.dart';
import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/services/tabinfo_request.dart';
import 'package:eyepetizer/core/services/topic_detail_tag_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';


class ZCLTopicDetailTagViewModel extends ZCLBaseViewModel {
  int initTabIndex = 0;
  ZCLTabInfo? _tabInfo;
  // ZCLTopicDetailTagModel? _dynamics;
  // ZCLTopicDetailTagModel? _videos;

  List<ZCLTopicDetailTagModel?> _tabs = [null, null];

  ZCLTabInfo? get tabInfo => _tabInfo;
  set tabInfo(ZCLTabInfo? tabInfo) {
    _tabInfo = tabInfo;
    notifyListeners();
  }

  // ZCLTopicDetailTagModel? get dynamics => _dynamics;
  // set dynamics(ZCLTopicDetailTagModel? dynamics) {
  //   _dynamics = dynamics;
  //   notifyListeners();
  // }
  //
  // ZCLTopicDetailTagModel? get videos => _videos;
  // set videos(ZCLTopicDetailTagModel? videos) {
  //   _videos = videos;
  //   notifyListeners();
  // }

  List<ZCLTopicDetailTagModel?> get tabs => _tabs;
  set tabs(List<ZCLTopicDetailTagModel?> tabs) {
    _tabs = tabs;
    notifyListeners();
  }

  updateTabs(int index, ZCLTopicDetailTagModel? tab) {
    _tabs[index] = tab;
    notifyListeners();
  }

  requestVideos() {
    ZCLTopicDetailTagRequest.getData(_tabInfo!.tabInfo!.tabList!.first.apiUrl!).then((value) {
      // videos = value;
      updateTabs(0, value);
    }).onError((error, stackTrace) {
      print("$error, $stackTrace}");
    });
  }

  requestDynamics() {
    ZCLTopicDetailTagRequest.getData(_tabInfo!.tabInfo!.tabList!.last.apiUrl!).then((value) {
      // dynamics = value;
      updateTabs(1, value);
    }).onError((error, stackTrace) {
      print("$error, $stackTrace}");
    });
  }

  loadMore(int tabIndex) {
    ZCLTopicDetailTagRequest.getData(tabs[tabIndex]!.nextPageUrl!).then((value) {
      value.itemList = tabs[tabIndex]!.itemList!..addAll(value.itemList!);
      updateTabs(tabIndex, value);
    }).onError((error, stackTrace) {
      print("$error, $stackTrace}");
    });
  }

  ZCLTopicDetailTagViewModel(String link) {
    if (!link.startsWith("eyepetizer://tag")) {
      return;
    }

    String id = link.split("eyepetizer://tag/").last.split("?").first.split("/").first;
    initTabIndex = int.tryParse(link.split("tabIndex=").last) ?? 0;

    ZCLTabInfoRequest.getData(id).then((value) {
      tabInfo = value;

      requestVideos();
      requestDynamics();
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}