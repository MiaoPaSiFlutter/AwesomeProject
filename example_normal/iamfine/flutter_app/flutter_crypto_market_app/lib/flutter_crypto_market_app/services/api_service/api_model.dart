import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../tools/tools_index.dart';

class APICallModel {
  static bool useAssetsJson = true;
  static String baseUrl() {
    if (useAssetsJson) {
      return Utils.assets("mock-datas/api/v3");
    } else {
      return "https://api.coingecko.com/api/v3";
    }
  }

// https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$day
// https://api.coingecko.com/api/v3/coins/$id
// https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true
// "https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=30"

  // Get API
  static Future<http.Response> getAPICallMethod(String apiUrl) async {
    if (useAssetsJson) {
      String fullPath = "${APICallModel.baseUrl()}/$apiUrl";
      var value = await rootBundle.loadString(fullPath);
      // var map = json.decode(value); // 解码
      http.Response response = http.Response(value, 200);
      return response;
    }
    Uri url = Uri.parse("$baseUrl/$apiUrl");
    var response;
    try {
      response = await http.get(url, headers: {
        "Content-Type": "application/json; charset=utf-8",
        "Accept": "application/json",
      });
      print("response success=> ${response.toString()}");
    } catch (e) {
      print("response error=> ${e.toString()}");
      // ShowSnackBar.showSnackBar(
      //     text: AppString.errorMessage,
      //     snackBarBackgroundColor: AppColors.redColor);
    }
    return response;
  }

  // Post API
  static Future<http.Response> postAPICallMethod(
      String apiUrl, Map<String, dynamic> body) async {
    Uri url = Uri.parse(apiUrl);
    var response;
    Map<String, String> headers = {
      "EmailID": "adil@hypeteq.com",
      "Content-Type": "application/json"
    };
    try {
      response = await http.post(url, body: jsonEncode(body), headers: headers);
      print(response);
    } catch (e) {
      print("response => ${e.toString()}");
      // ShowSnackBar.showSnackBar(
      //     text: AppString.errorMessage,
      //     snackBarBackgroundColor: AppColors.redColor);
    }
    return response;
  }

  // delete API
  static Future<http.Response> deleteAPICallMethod(String apiUrl) async {
    Uri url = Uri.parse(apiUrl);
    var response;
    Map<String, String> headers = {
      "EmailID": "adil@hypeteq.com",
    };
    try {
      response = await http.delete(url, headers: headers);
      print(response);
    } catch (e) {
      print("response => ${e.toString()}");
      // ShowSnackBar.showSnackBar(
      //     text: AppString.errorMessage,
      //     snackBarBackgroundColor: AppColors.redColor);
    }
    return response;
  }
}
