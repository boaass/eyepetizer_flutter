import 'package:eyepetizer/core/model/video_related_model.dart';
import 'package:eyepetizer/core/model/video_replies_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'http_request.dart';


class ZCLVideoReplyRequest {

  static Future<ZCLVideoReply> getData(String videoId) async  {
    final url = HttpConfig.baobabBaseURL + "/api/v2/replies/video?videoId=" + videoId;
    final headers = HttpConfig.baobabHeaders;
    final params = {
      "udid": "e1aced42b7014358bc3403c1e70269703be49dcb",
      "vc": "7020011"
    };

    final result = await HttpRequest.request(url, headers: headers, params: params);

    return ZCLVideoReply.fromJson(result);
  }

  static Future<ZCLVideoReply> updateData(String url) async {
    final headers = HttpConfig.baobabHeaders;
    final params = {
      "udid": "e1aced42b7014358bc3403c1e70269703be49dcb",
      "vc": "7020011"
    };

    final result = await HttpRequest.request(url, headers: headers, params: params);
    return ZCLVideoReply.fromJson(result);
  }
}