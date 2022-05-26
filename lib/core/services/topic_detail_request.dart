import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/config.dart';

import 'http_request.dart';


class ZCLTopicDetailRequest {
  static Future<ZCLCardPageModel> getData(String url, dynamic data) async {
    final headers = HttpConfig.apiHeaders;
    final result = await HttpRequest.request(url, method: "post", headers: headers, data: data);
    return ZCLCardPageModel.fromJson(result["result"]);
  }
}