import 'package:http/http.dart' as http;

import '../../compontents/show_snack_bar.dart';
import '../../constants/constants_index.dart';

class HandlingException {
  static bool checkStatusCode(http.Response response) {
    bool isStatus = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      isStatus = true;
    } else if (response.statusCode == 504) {
      isStatus = false;
      ShowSnackBar.showSnackBar(
          text: "Connection time out", snackBarBackgroundColor: AppColors.red);
    } else if (response.statusCode == 404) {
      isStatus = false;
      ShowSnackBar.showSnackBar(
          text: "Please check, User Not-found.",
          snackBarBackgroundColor: AppColors.red);
    } else {
      isStatus = false;
    }
    // print("${response.statusCode} isStatus $isStatus");
    return isStatus;
  }
}
