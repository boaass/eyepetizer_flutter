import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'http_request.dart';

class ZCLMetroListRequest {
  static Future<List<ZCLMetro>> getData(Map<String, dynamic> params) async {
    String url = "/card/metro/call_metro_list_v2";
    FormData formData = FormData.fromMap(params);
    final result = await HttpRequest.request(url, method: "post", data: formData);
    
    return List<ZCLMetro>.from((result["result"]["item_list"] ?? []).map((e) => ZCLMetro.fromJson(e)));
  }
}