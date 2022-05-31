import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/services/config.dart';

import 'http_request.dart';


class ZCLTopicDetailTagRequest {
  static Future<ZCLTopicDetailTag> getData(String url) async {

    var headers = {
      'Cookie': 'ky_auth=;sdk=28',
      'model': 'Android',
      'If-Modified-Since': 'Fri, 27 May 2022 00:47:05 GMT',
      'User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; V1813BT Build/PKQ1.181030.001)',
      'Host': 'baobab.kaiyanapp.com'
    };

    var params = {
      "vc" : "7020011"
    };

    final result = await HttpRequest.request(url, headers: headers, params: params);
    return ZCLTopicDetailTag.fromJson(result);
  }
}