import 'package:hzy_common_module/hzy_common_module.dart';

class Utils {
  static String assets(String assetsPath) {
    String assetsFullPath = NormalModuleUtils.configPackagesImage(
        packagename: "flutter_weather", name: "assets/$assetsPath");
    return assetsFullPath;
  }

  static String apikey() {
    return "b62e9591a5b62fa739b6d82bb4b29f33";
  }

  static String appid() {
    return "b62e9591a5b62fa739b6d82bb4b29f33";
  }
}
