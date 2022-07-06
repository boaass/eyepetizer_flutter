import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/model/search_result_model.dart';
import 'package:eyepetizer/core/services/metro_list_request.dart';
import 'package:eyepetizer/core/services/search_hot_queries_request.dart';
import 'package:eyepetizer/core/services/search_recommend_card_list_request.dart';
import 'package:eyepetizer/core/services/search_result_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';


class ZCLSearchRecommendViewModel extends ZCLBaseViewModel {
  ZCLCardPageModel? _cardPageModel;
  List<String>? _hotQuerues;
  ZCLSearchResultModel? _searchResultModel;
  bool _isSearchPage = true;

  ZCLCardPageModel? get cardPageModel => _cardPageModel;
  set cardPageModel(ZCLCardPageModel? cardPageModel) {
    _cardPageModel = cardPageModel;
    notifyListeners();
  }

  List<String>? get hotQuerues => _hotQuerues;
  set hotQuerues(List<String>? hotQuerues) {
    _hotQuerues = hotQuerues;
    notifyListeners();
  }

  ZCLSearchResultModel? get searchResultModel => _searchResultModel;
  set searchResultModel(ZCLSearchResultModel? searchResultModel) {
    _searchResultModel = searchResultModel;
    notifyListeners();
  }

  bool get isSearchPage => _isSearchPage;
  set isSearchPage(bool isSearchPage) {
    _isSearchPage = isSearchPage;
    notifyListeners();
  }

  Future<void> changeToSearchResultPage(String query) async {
    await ZCLSearchResultRequest.getData(query).then((value) {
      searchResultModel = value;
      return searchResultModel;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
      return searchResultModel;
    });
  }

  loadMore(int index) {
    if (searchResultModel!.itemList![index].cardList!.last.body!.apiRequest == null) {
      return;
    }
    Map<String, dynamic> lastParams = searchResultModel!.itemList![index].cardList!.last.body!.apiRequest!.params!.toJson();
    ZCLMetroListRequest.getData(searchResultModel!.itemList![index].cardList!.last.body!.apiRequest!.url!, lastParams).then((value) {
      if (searchResultModel!.itemList![index].cardList!.last.body!.apiRequest!.params!.lastItemId == value.lastItemId) {
        searchResultModel!.itemList![index].cardList!.last.body!.apiRequest = null;
      } else {
        addMetroList(value.itemList!, index);
        searchResultModel!.itemList![index].cardList!.last.body!.apiRequest!.params!.lastItemId = value.lastItemId;
      }

    }).catchError((error, stack) {
      print("$error\n$stack");
    });
  }

  addMetroList(List<ZCLMetro> metros, int index) {
    searchResultModel!.itemList![index].cardList!.first.body!.metro_list!.addAll(metros);
    notifyListeners();
  }

  ZCLSearchRecommendViewModel() {
    ZCLSearchRecommendRequest.getData().then((value) {
      cardPageModel = value;

      ZCLSearchHotQueriesRequest.getData().then((value) {
        hotQuerues = value;
      });
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}