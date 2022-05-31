import 'dart:io';

import 'package:eyepetizer/core/model/tabinfo_model.dart';
import 'package:eyepetizer/core/services/config.dart';

import 'http_request.dart';


class ZCLTabInfoRequest {
  static Future<ZCLTabInfo> getData(String id) async {
    String url = HttpConfig.baobabBaseURL + "/api/v6/tag/index";
    Map<String, dynamic> params = {
      "id": id
    };

    final result = await HttpRequest.request(url, params: params);
    return ZCLTabInfo.fromJson(result);
  }
}