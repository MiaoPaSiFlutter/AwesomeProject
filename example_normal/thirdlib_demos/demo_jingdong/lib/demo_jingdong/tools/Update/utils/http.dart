import 'package:dio/dio.dart';
import 'toast.dart';

/// 网络请求工具类
class HttpUtils {
  HttpUtils._internal();

  static Dio? sDio;

  ///全局初始化
  static init(
    String baseUrl, {
    Duration timeout = const Duration(milliseconds: 5000),
    Map<String, dynamic>? headers,
  }) {
    sDio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        sendTimeout: timeout,
        receiveTimeout: timeout,
        headers: headers));
    //添加拦截器
    // sDio?.interceptors.add(InterceptorsWrapper(
    //     onRequest: (RequestOptions options, RequestInterceptorHandler _) {
    //   print("请求之前");
    // }, onResponse: (Response response, ResponseInterceptorHandler _) {
    //   print("响应之前");
    // }, onError: (DioError e, ErrorInterceptorHandler _) {
    //   print("错误之前");
    //   handleError(e);
    // }));
  }

  ///error统一处理
  static void handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        showError("连接超时");
        break;
      case DioExceptionType.sendTimeout:
        showError("请求超时");
        break;
      case DioExceptionType.receiveTimeout:
        showError("响应超时");
        break;
      case DioExceptionType.badResponse:
        showError("出现异常");
        break;
      case DioExceptionType.cancel:
        showError("请求取消");
        break;
      default:
        showError("未知错误");
        break;
    }
  }

  static void showError(String error) {
    print(error);
    ToastUtils.toast(error);
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic>? params]) async {
    Response? response;
    try {
      if (params != null) {
        response = await sDio?.get(url, queryParameters: params);
      } else {
        response = await sDio?.get(url);
      }
    } catch (e) {
      print("object $e");
    }
    return response?.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic>? params]) async {
    Response? response = await sDio?.post(url, queryParameters: params);
    return response?.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic>? data]) async {
    Response? response = await sDio?.post(url, data: data);
    return response?.data;
  }

  ///下载文件
  static Future downloadFile(String urlPath, String savePath,
      {ProgressCallback? onReceiveProgress}) async {
    Response? response = await sDio?.download(urlPath, savePath,
        onReceiveProgress: onReceiveProgress,
        options: Options(
            sendTimeout: const Duration(milliseconds: 25000),
            receiveTimeout: const Duration(milliseconds: 25000)));
    return response;
  }
}
