import 'dart:io';

import 'package:eyepetizer/core/model/ugc_video_detail_model.dart';
import 'package:eyepetizer/core/services/config.dart';

import 'http_request.dart';


class ZCLUgcVideoDetailRequest {
  static Future<ZCLUgcVideoDetailModel> getData(Map<String, dynamic> params) async {
    final String url = HttpConfig.apiBaseURL + "/content/item/get_item_detail_v2";
    final result = await HttpRequest.request(url, headers: HttpConfig.apiHeaders, params: params);
    return ZCLUgcVideoDetailModel.fromJson(result["result"]);
  }
}
