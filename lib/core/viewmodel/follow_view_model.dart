import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/metro_list_request.dart';
import 'package:eyepetizer/core/services/follow_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';


class ZCLFollowViewModel extends ZCLBaseViewModel {

  ZCLCardPageModel _cardPageModel = ZCLCardPageModel();

  ZCLCardPageModel get cardPageModel => _cardPageModel;

  set cardPageModel(ZCLCardPageModel value) {
    _cardPageModel = value;
    notifyListeners();
  }

  Future<void> update() async {
    await ZCLFollowRequest.getData().then<ZCLCardPageModel>((x) {
      cardPageModel = x;
      return cardPageModel;
    });
  }

  addMetroList(List<ZCLMetro> metros) {
    cardPageModel.cards!.last.body!.metro_list!.addAll(metros);
    notifyListeners();
  }

  requestMoreMetros() {
    Params lastParams = cardPageModel.cards!.last.apiRequest!.params!;
    lastParams.lastItemId = (int.parse(lastParams.lastItemId!) + 10).toString();
    cardPageModel.cards!.last.apiRequest!.params = lastParams;
    ZCLMetroListRequest.getData(cardPageModel.cards!.last.apiRequest!.url!, lastParams.toJson()).then((value) {
      addMetroList(value.itemList!);
    }).catchError((error, stack) {
      print("$error\n$stack");
      lastParams.lastItemId = (int.parse(lastParams.lastItemId!) - 10).toString();
      cardPageModel.cards!.last.apiRequest!.params = lastParams;
    });
  }

  ZCLFollowViewModel() {
    ZCLFollowRequest.getData().then<ZCLCardPageModel>((x) {
      cardPageModel = x;
      return cardPageModel;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
      return cardPageModel;
    });
  }
}
