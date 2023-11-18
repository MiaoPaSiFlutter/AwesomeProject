import 'package:hzy_common_module/hzy_common_module.dart';

class Utils {
  static String assets(String assetsPath) {
    String assetsFullPath = NormalModuleUtils.configPackagesImage(
        packagename: "flutter_mitchkoko",
        name: "assets/BlogClubAppUI/$assetsPath");
    return assetsFullPath;
  }
}

// Utils.assets("
