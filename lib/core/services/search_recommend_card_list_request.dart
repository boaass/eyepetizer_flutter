import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/core/services/http_request.dart';

class ZCLSearchRecommendRequest {
  static Future<ZCLCardPageModel> getData() async {
    final url = HttpConfig.apiBaseURL + "/search/search/get_search_recommend_card_list";
    final headers = HttpConfig.apiHeaders;
    final params = {
      "udid": "e1aced42b7014358bc3403c1e70269703be49dcb",
      "vc": "7050400"
    };
    
    final result = await HttpRequest.request(url, method: "post", headers: headers, params: params);
    return ZCLCardPageModel.fromJson(result["result"]);
  }
}