import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/core/services/http_request.dart';

class ZCLSearchHotQueriesRequest {
  static Future<List<String>> getData() async {
    final url = HttpConfig.apiBaseURL + "/recommend/search/get_hot_queries";
    final headers = HttpConfig.apiHeaders;
    final params = {
      "udid" : "e1aced42b7014358bc3403c1e70269703be49dcb",
      "vc" : "7050400"
    };

    final result = await HttpRequest.request(url, headers: headers, params: params);
    return List<String>.from(result["result"]["item_list"]);
  }
}