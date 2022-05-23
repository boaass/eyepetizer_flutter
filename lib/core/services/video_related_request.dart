import 'package:eyepetizer/core/model/video_related_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'http_request.dart';


class ZCLVideoRelatedRequest {
  static Future<ZCLVideoRelated> getData(String videoId) async  {
    final url = HttpConfig.baobabBaseURL + "/api/v4/video/related?id=" + videoId;
    final headers = HttpConfig.baobabHeaders;
    final params = {
      "udid": "e1aced42b7014358bc3403c1e70269703be49dcb",
      "vc": "7020011"
    };

    final result = await HttpRequest.request(url, headers: headers, params: params);

    return ZCLVideoRelated.fromJson(result);
  }
}