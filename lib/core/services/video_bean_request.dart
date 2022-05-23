import 'package:eyepetizer/core/model/video_bean_model.dart';
import 'package:eyepetizer/core/services/config.dart';

import 'http_request.dart';


class ZCLVideoBeanRequest {
  static Future<ZCLVideoBean> getData(String videoId) async  {
    final url = HttpConfig.baobabBaseURL + "/api/v2/video/" + videoId;
    final headers = HttpConfig.baobabHeaders;
    
    final result = await HttpRequest.request(url, headers: headers);
    
    return ZCLVideoBean.fromJson(result);
  }
}