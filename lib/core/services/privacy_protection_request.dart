
import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/core/services/http_request.dart';

class ZCLPrivacyProtectionRequest {
  static Future<String> getData() async {
    final headers = HttpConfig.apiHeaders;
    String url = HttpConfig.apiBaseURL + "/system/common/privacy_protection";
    final result = await HttpRequest.request(url, headers: headers, method: "post");
    return result["result"]["data"];
  }
}