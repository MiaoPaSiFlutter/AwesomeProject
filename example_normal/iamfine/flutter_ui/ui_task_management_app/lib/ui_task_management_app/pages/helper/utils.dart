import 'package:hzy_common_module/hzy_common_module.dart';

class Utils {
  static String assets(String assetsPath) {
    String assetsFullPath = NormalModuleUtils.configPackagesImage(
        packagename: "ui_task_management_app", name: "assets/$assetsPath");
    return assetsFullPath;
  }
}
//Utils.assets("