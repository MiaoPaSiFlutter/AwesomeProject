class Utils {
  static String assets(String assetsPath) {
    String assetsFullPath = Utils.configPackagesImage(
        packagename: "flutter_chat_app", name: "assets/$assetsPath");
    return assetsFullPath;
  }

  /// 用于加载 package 模块图片
  static configPackagesImage(
      {required String packagename, required String name}) {
    return "packages/$packagename/$name";
  }
}
