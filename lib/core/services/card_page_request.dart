import 'package:dio/dio.dart';
import 'package:eyepetizer/core/model/card_page_model.dart';
import 'package:eyepetizer/core/services/config.dart';
import 'package:eyepetizer/core/services/http_request.dart';

class ZCLCardPageRequest {
  static Future<ZCLCardPageModel> getData( Map<String, dynamic> params) async {
    final url = HttpConfig.apiBaseURL + "/card/page/get_page";
    final headers = HttpConfig.apiHeaders;
    FormData formData = FormData.fromMap(params);
    final result = await HttpRequest.request(url, method: "post", headers: headers, data: formData);
    return ZCLCardPageModel.fromJson(result["result"]);
  }
}