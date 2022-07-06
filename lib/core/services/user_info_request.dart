import 'package:eyepetizer/core/model/user_info.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/core/services/http_request.dart';

class ZCLUserInfoRequest {
  static Future<AuthorUserInfo> getData(String uid) async {
    String url = HttpConfig.apiBaseURL + "/user/center/get_user_info";
    final headers = HttpConfig.apiHeaders;
    final params = {"uid" : uid};

    final result = await HttpRequest.request(url, headers: headers, params: params);
    return AuthorUserInfo.fromJson(result["result"]);
  }
}