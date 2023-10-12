
/// 用于扩展你的请求域名
enum HttpBaseUrlEnum {
  /// 默认域名
  normalUrl,

  /// 其他域名
  otherUrl,
}

/// 用于配置当前环境选择
enum HttpEnvironEnmu {
  /// 开发环境
  debug,

  /// 发布环境
  release,
}

class HttpNormalConfig {
  static const HttpEnvironEnmu environ = HttpEnvironEnmu.release;

  /*
   * @description:获取完整url 
   * @param {*}
   * @return {*}
   */
  static conFigNetWorkPath({
    required String path,
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
    HttpEnvironEnmu environEnmu = HttpNormalConfig.environ,
  }) {
    String baseurl = configbaseUrl(urlEnum: urlEnum, environEnmu: environ);
    return baseurl + path;
  }

  /*
   * @description: 获取baseUrl 
   * @param {*}
   * @return {*}
   */
  static configbaseUrl({
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
    HttpEnvironEnmu environEnmu = HttpNormalConfig.environ,
  }) {
    String baseUrl = "";
    switch (environEnmu) {
      case HttpEnvironEnmu.debug:
        baseUrl = configDebugBaseUrl(urlEnum: urlEnum);
        break;
      case HttpEnvironEnmu.release:
        baseUrl = configReleaseBaseUrl(urlEnum: urlEnum);
        break;
      default:
    }
    return baseUrl;
  }

  /*
   * @description: 获取开发环境baseUrl
   * @param {*}
   * @return {*}
   */
  static configDebugBaseUrl({
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
  }) {
    String url = "";
    switch (urlEnum) {
      case HttpBaseUrlEnum.normalUrl:
        url = "https://api.apiopen.top/api";
        break;
      case HttpBaseUrlEnum.otherUrl:
        url = "https://api.apiopen.top/api";
        break;
      default:
    }
    return url;
  }

  /*
   * @description: 获取预发布环境baseurl
   * @param {*}
   * @return {*}
   */
  static configReleaseBaseUrl({
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
  }) {
    String url = "";
    switch (urlEnum) {
      case HttpBaseUrlEnum.normalUrl:
        url = "https://api.apiopen.top/api";
        break;
      case HttpBaseUrlEnum.otherUrl:
        url = "https://api.apiopen.top/api";
        break;
      default:
    }
    return url;
  }
}

