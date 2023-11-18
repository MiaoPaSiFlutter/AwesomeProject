import 'package:hzy_common_module/hzy_common_module.dart';

class Utils {
  static String assets(String assetsPath) {
    String assetsFullPath = NormalModuleUtils.configPackagesImage(
        packagename: "flutter_crypto_market_app", name: "assets/$assetsPath");
    return assetsFullPath;
  }
}
