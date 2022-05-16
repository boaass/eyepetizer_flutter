import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';

import 'http_request.dart';

class ZCLFollowRequest {
  static Future<ZCLCardPageModel> getData() async {
    final url = "/card/page/get_page";
    final params =
    {
      "page_type": "card",
      "page_label": "follow"
    };

    FormData formData = FormData.fromMap(params);
    final result = await HttpRequest.request(url, method: "post", data: formData);
    // print(result);

    return ZCLCardPageModel.fromJson(result["result"]);
  }
}