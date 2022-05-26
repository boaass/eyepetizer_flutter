import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'http_request.dart';

class ZCLMetroListRequest {
  static Future<ZCLMertroList> getData(Map<String, dynamic> params) async {
    String url = "/card/metro/call_metro_list_v2";
    String urlEncodeStr = encodeMap(params);
    final result = await HttpRequest.request(url, method: "post", headers: HttpConfig.apiHeaders, data: urlEncodeStr);
    
    return ZCLMertroList.fromJson(result["result"]);
  }

  static String encodeMap(Map data) {
    return data.keys.map((key) =>"${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key].toString())}").join("&");
  }
}