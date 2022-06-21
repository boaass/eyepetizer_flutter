import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/model/discovery_nav_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/ui/pages/discovery/discovery.dart';

import 'http_request.dart';


class ZCLDiscoveryRequest {
  static Future<ZCLDiscoveryNavModel> getDiscoveryNavData() async {
    String url = HttpConfig.apiBaseURL + "/card/page/get_nav";
    final headers = HttpConfig.apiHeaders;
    Map<String, dynamic> params = {
      "tab_label" : "discovery"
    };
    FormData formData = FormData.fromMap(params);
    
    final result = await HttpRequest.request(url, method: "post", headers: headers, data: formData);
    return ZCLDiscoveryNavModel.fromJson(result["result"]);
  }
  
  static Future<ZCLCardPageModel> getData(Map<String, dynamic> params) async {
    final url = HttpConfig.apiBaseURL + "/card/page/get_page";
    final headers = HttpConfig.apiHeaders;

    String urlEncodeStr = encodeMap(params);
    final result = await HttpRequest.request(url, method: "post", headers: headers, data: urlEncodeStr);
    return ZCLCardPageModel.fromJson(result["result"]);
  }

  static String encodeMap(Map data) {
    return data.keys.map((key) =>"${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key].toString())}").join("&");
  }
}