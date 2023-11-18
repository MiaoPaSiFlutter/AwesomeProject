// ignore_for_file: unused_import

import 'package:hzy_common_module/hzy_common_module.dart';
import 'loading_utils.dart';
import 'pretty_dio_logger.dart';
import 'response_interceptor.dart';
import 'dio_log_interceptor.dart';
import 'result_data.dart';
import 'code.dart';
import 'address.dart';

class HttpManager {
  static final HttpManager _instance = HttpManager._internal();
  Dio? _dio;

  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;

  factory HttpManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpManager._internal({String? baseUrl}) {
    if (null == _dio) {
      _dio = Dio(
        BaseOptions(
          baseUrl: Address.BASE_URL,
          connectTimeout: const Duration(seconds: 10),
        ),
      );
      _dio?.interceptors.add(DioLogInterceptor());
      // _dio?.interceptors.add(PrettyDioLogger());
      _dio?.interceptors.add(ResponseInterceptors());
    }
  }

  static HttpManager getInstance({String? baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名
  HttpManager _baseUrl(String baseUrl) {
    _dio?.options.baseUrl = baseUrl;
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio?.options.baseUrl != Address.BASE_URL) {
      _dio?.options.baseUrl = Address.BASE_URL;
    }
    return this;
  }

  ///通用的GET请求
  get(
    String api, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    withLoading = true,
  }) async {
    if (withLoading) {
      LoadingUtils.show();
    }

    Response? response;
    try {
      response = await _dio?.get(
        api,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    } on DioException catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      return resultError(e);
    }

    if (response?.data is DioException) {
      return resultError(response?.data['code']);
    }

    return response?.data;
  }

  ///通用的POST请求
  post(
    String api, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    withLoading = true,
  }) async {
    if (withLoading) {
      LoadingUtils.show();
    }

    Response? response;

    try {
      response = await _dio?.post(
        api,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    } on DioException catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      return resultError(e);
    }

    if (response?.data is DioException) {
      return resultError(response?.data['code']);
    }

    return response?.data;
  }
}

ResultData resultError(DioException e) {
  Response? errorResponse;
  if (e.response != null) {
    errorResponse = e.response;
  } else {
    errorResponse = Response(statusCode: 666, requestOptions: e.requestOptions);
  }
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout) {
    errorResponse?.statusCode = Code.NETWORK_TIMEOUT;
  }
  return ResultData(
    errorResponse?.statusMessage,
    false,
    errorResponse?.statusCode ?? 0,
  );
}
