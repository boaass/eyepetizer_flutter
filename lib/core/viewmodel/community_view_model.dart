import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/card_list_request.dart';
import 'package:eyepetizer/core/services/comunity_request.dart';
import 'package:eyepetizer/core/services/metro_list_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';


class ZCLCommunityViewModel extends ZCLBaseViewModel {

  ZCLCardPageModel _cardPageModel = ZCLCardPageModel();

  ZCLCardPageModel get cardPageModel => _cardPageModel;

  set cardPageModel(ZCLCardPageModel value) {
    _cardPageModel = value;
    notifyListeners();
  }

  Future<void> update() async {
    await ZCLCommunityRequest.getData().then<ZCLCardPageModel>((x) {
      cardPageModel = x;
      return cardPageModel;
    });
  }

  addCardList(List<ZCLCard> cards) {
    cardPageModel.cards!.insertAll(cardPageModel.cards!.length - 1, cards);
    notifyListeners();
  }

  requestMoreMetros() {
    Params lastParams = cardPageModel.cards!.last.apiRequest!.params!;
    // lastParams.lastItemId = (int.parse(lastParams.lastItemId!) + 10).toString();
    // cardPageModel.cards!.last.apiRequest!.params = lastParams;
    ZCLCardListRequest.getData(cardPageModel.cards!.last.apiRequest!.url!, lastParams.toJson()).then((value) {
      lastParams.lastItemId = value.lastItemId;
      addCardList(value.itemList!);
    }).onError((error, stackTrace) {
      print("${error}, ${stackTrace}");
      // cardPageModel.cards!.last.apiRequest!.params!.lastItemId = (int.parse(lastParams.lastItemId!) - 10).toString();
    });
  }

  ZCLCommunityViewModel() {
    ZCLCommunityRequest.getData().then<ZCLCardPageModel>((x) {
      cardPageModel = x;
      return cardPageModel;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
      return cardPageModel;
    });
  }
}
