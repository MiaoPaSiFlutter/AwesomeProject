// ignore_for_file: dead_code

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    return true;

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
