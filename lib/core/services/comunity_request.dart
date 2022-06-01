import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/config.dart';

import 'http_request.dart';

class ZCLCommunityRequest {
  static Future<ZCLCardPageModel> getData() async {
    final url = HttpConfig.apiBaseURL + "/card/page/get_page";
    final headers = HttpConfig.apiHeaders;
    final params =
    {
      // "token": "34b93a59a1029aca",
      "page_type": "card",
      "page_label": "community"
    };

    FormData formData = FormData.fromMap(params);
    final result = await HttpRequest.request(url, method: "post", headers: headers, data: formData);
    // print(result);

    return ZCLCardPageModel.fromJson(result["result"]);
  }
}