import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../compontents/show_snack_bar.dart';
import '../constants/constants_index.dart';
import '../models/models_index.dart';
import '../services/services_index.dart';

class APIServiceProvider with ChangeNotifier {
  List<CryptoDataModel> cryptoCoinsList = [];
  bool isLoad = false;

  Future<List<CryptoDataModel>> getCryptoData() async {
    isLoad = true;
    // String url = "/coins/markets?vs_currency=usd&sparkline=true";
    String url = "/coins/markets.json";
    if (await InternetConnectivity.checkInternet()) {
      await APICallModel.getAPICallMethod(url).then((response) {
        if (HandlingException.checkStatusCode(response)) {
          cryptoCoinsList.addAll(List<CryptoDataModel>.from(json
              .decode(response.body)
              .map((e) => CryptoDataModel.fromJson(e))));
        } else {
          isLoad = false;
        }
      });
    } else {
      isLoad = false;
      ShowSnackBar.showSnackBar(
          text: "No Internet Connection.",
          snackBarBackgroundColor: AppColors.red);
    }
    isLoad = false;
    notifyListeners();
    return cryptoCoinsList;
  }
}
