import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.apiBaseURL, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);
  static Future<T> request<T>(String url, {
                              String method = "get",
                              dynamic data,
                              Map<String, dynamic>? headers,
                              Map<String, dynamic>? params,
                              String? contentType = Headers.formUrlEncodedContentType,
                              Interceptor? inter}) async {
    var option;
    // 1. 创建单独配置
    if (null == contentType || contentType.length == 0) {
      option = Options(method: method, headers: headers);
    } else {
      option = Options(method: method, headers: headers, contentType: contentType);
    }

    // 全局；拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (option){
        // print("请求拦截");
        return option;
      },
      onResponse: (option) {
        // print("响应拦截");
        return option;
      },
      onError: (err) {
        print("错误拦截");
        return err;
      }
    );

    List<Interceptor> inters = [dInter];
    if (inter != null){
      inters.add(inter);
    }

    // 请求单独拦截器
    if (inters != null) {
      inters.add(dInter);
    }

    dio.interceptors.addAll(inters);

    // 2. 发送网络请求
    try {
      Response response = await dio.request(url, data: data, queryParameters: params, options: option);
      if (HttpConfig.PHPSESSID.length == 0) {
        HttpConfig.PHPSESSID = response.headers.value("Set-Cookie").split(";").first.split("=").last;
      }
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  static void get(String url) {
    request(url);
  }

  static void post(String url) {
    request(url, method: "post");
  }
}