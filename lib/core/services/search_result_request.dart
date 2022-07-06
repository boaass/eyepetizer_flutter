import 'package:eyepetizer/core/model/search_result_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/core/services/http_request.dart';

class ZCLSearchResultRequest {
  static Future<ZCLSearchResultModel> getData(String query) async {
    String url = HttpConfig.apiBaseURL + "/search/search/get_search_result_v2";
    final headers = HttpConfig.apiHeaders;
    Map<String, dynamic> params = {
      "query" : query
    };

    final result = await HttpRequest.request(url, method: "post", headers: headers, params: params);
    return ZCLSearchResultModel.fromJson(result["result"]);
  }
}