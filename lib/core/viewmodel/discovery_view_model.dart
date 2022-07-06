import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/model/discovery_nav_model.dart';
import 'package:eyepetizer/core/services/discovery_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';

class ZCLDiscoveryViewModel extends ZCLBaseViewModel {
  ZCLDiscoveryNavModel? _discoveryNavModel;
  ZCLCardPageModel? _discoveryModel;

  set discoveryNavModel(ZCLDiscoveryNavModel? discoveryNavModel) {
    _discoveryNavModel = discoveryNavModel;
    notifyListeners();
  }
  ZCLDiscoveryNavModel? get discoveryNavModel => _discoveryNavModel;

  set discoveryModel(ZCLCardPageModel? cardPageModel) {
    _discoveryModel = cardPageModel;
    notifyListeners();
  }
  ZCLCardPageModel? get discoveryModel => _discoveryModel;

  Future<ZCLCardPageModel?> update() async {
    ZCLDiscoveryRequest.getDiscoveryNavData().then((value) {
      discoveryNavModel = value;

      String schemeUrl = discoveryNavModel!.navList!.first.url!;
      String str = schemeUrl.split("?").last;
      Map<String, dynamic> dataMap = new Map.fromIterable(str.split("&"), key: (item) => item.split("=").first, value: (item) => item.split("=").last);
      ZCLDiscoveryRequest.getData(dataMap).then((value) {
        return discoveryModel = value;
      }).onError((error, stackTrace) {
        print("$error \n $stackTrace");
        return Future.error(error!);
      });
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }

  ZCLDiscoveryViewModel() {
    ZCLDiscoveryRequest.getDiscoveryNavData().then((value) {
      discoveryNavModel = value;

      String schemeUrl = discoveryNavModel!.navList!.first.url!;
      String str = schemeUrl.split("?").last;
      Map<String, dynamic> dataMap = new Map.fromIterable(str.split("&"), key: (item) => item.split("=").first, value: (item) => item.split("=").last);
      ZCLDiscoveryRequest.getData(dataMap).then((value) {
        discoveryModel = value;
      }).onError((error, stackTrace) {
        print("$error \n $stackTrace");
      });
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}