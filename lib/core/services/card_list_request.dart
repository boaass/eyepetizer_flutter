import 'dart:io';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'http_request.dart';

class ZCLCardListRequest {
  static Future<ZCLCardList> getData(String url, Map<String, dynamic> params) async {
    // String url = "/card/metro/card/call_card_list";
    String urlEncodeStr = encodeMap(params);
    final result = await HttpRequest.request(url, method: "post", headers: HttpConfig.apiHeaders, data: urlEncodeStr);
    
    return ZCLCardList.fromJson(result["result"]);
  }

  static String encodeMap(Map data) {
    return data.keys.map((key) =>"${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key].toString())}").join("&");
  }
}