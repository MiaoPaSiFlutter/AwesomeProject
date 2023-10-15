import 'dart:convert';

import 'package:dio/dio.dart';

import '../status/http_status.dart';

class MpsfResponse {
  const MpsfResponse({
    this.dioResponse,
  });

  /// The Http [Request] linked with this [Response].
  final Response? dioResponse;

  /// [HttpStatus] from [Response]. `status.connectionError` is true
  /// when statusCode is null. `status.isUnauthorized` is true when
  /// statusCode is equal `401`. `status.isNotFound` is true when
  /// statusCode is equal `404`. `status.isServerError` is true when
  /// statusCode is between `500` and `599`.
  MpsfHttpStatus get status => MpsfHttpStatus(dioResponse?.statusCode);

  /// `hasError` is true when statusCode is not between 200 and 299.
  bool get hasError => status.hasError;

  /// `isOk` is true when statusCode is between 200 and 299.
  bool get isOk => !hasError;

  dynamic get data => dioResponse?.data;

  dynamic get jsonData {
    if (data is String) {
      Map<String, dynamic> finalData = jsonDecode(data);
      return finalData;
    } else {
      return {};
    }
  }
}
