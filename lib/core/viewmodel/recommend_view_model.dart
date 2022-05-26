import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/metro_list_request.dart';
import 'package:eyepetizer/core/services/recommend_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';


class ZCLRecommendViewModel extends ZCLBaseViewModel {

  ZCLCardPageModel _cardPageModel = ZCLCardPageModel();
  bool _isBigVideoNeedShow = true;

  ZCLCardPageModel get cardPageModel => _cardPageModel;

  set cardPageModel(ZCLCardPageModel value) {
    _cardPageModel = value;
    isBigVideoNeedShow = true;
    notifyListeners();
  }

  bool get isBigVideoNeedShow => _isBigVideoNeedShow;

  set isBigVideoNeedShow(bool isBigVideoNeedShow) {
    _isBigVideoNeedShow = isBigVideoNeedShow;
    notifyListeners();
  }

  Future<void> update() async {
    await ZCLRecommendRequest.getData().then<ZCLCardPageModel>((x) {
      cardPageModel = x;
      return cardPageModel;
    });
  }

  addMetroList(List<ZCLMetro> metros) {
    cardPageModel.cards!.last.body!.metro_list!.addAll(metros);
    notifyListeners();
  }

  requestMoreMetros() {
    Map<String, dynamic> lastParams = cardPageModel.cards!.last.api_request_params!;
    lastParams["last_item_id"] = (lastParams["last_item_id"] as int) + 10;
    cardPageModel.cards!.last.api_request_params = lastParams;
    ZCLMetroListRequest.getData(lastParams).then((value) {
      addMetroList(value.itemList!);
    });
  }

  ZCLRecommendViewModel() {
    ZCLRecommendRequest.getData().then<ZCLCardPageModel>((x) {
      print(x.toJson());
      cardPageModel = x;
      return cardPageModel;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
      return cardPageModel;
    });
  }
}
