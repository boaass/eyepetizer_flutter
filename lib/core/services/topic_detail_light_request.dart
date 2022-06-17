import 'http_request.dart';
import 'package:eyepetizer/core/model/topic_detail_light_model.dart';
import 'package:eyepetizer/core/services/config.dart';

class ZCLTopicDetailLightRequest {
  static Future<ZCLTopicDetailLight> getData(String id) async {

    String url = HttpConfig.baobabBaseURL+'/api/v3/lightTopics/internal/'+id;

    var headers = {
      'Cookie': 'ky_auth=;sdk=28',
      'model': 'Android',
      'User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; V1813BT Build/PKQ1.181030.001)',
      'Host': 'baobab.kaiyanapp.com'
    };

    var params = {
      'udid': 'e1aced42b7014358bc3403c1e70269703be49dcb',
      'vc': '7020011'
    };

    final result = await HttpRequest.request(url, headers: headers, params: params);
    return ZCLTopicDetailLight.fromJson(result);

  }
}