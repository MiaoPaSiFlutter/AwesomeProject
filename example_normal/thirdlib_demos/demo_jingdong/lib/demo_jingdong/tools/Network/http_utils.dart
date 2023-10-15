import 'package:dio/dio.dart';

class Http {
  static Dio _dio = Dio();
  static Http https = Http();

  static Http getInstance() {
    return https;
  }

  Dio get dio => _dio;

  Http() {
    _dio = createDio();
  }

  Dio createDio() {
    var dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      baseUrl: "https://www.baidu.com",
      responseType: ResponseType.json,
    ));

    return dio;
  }
}
