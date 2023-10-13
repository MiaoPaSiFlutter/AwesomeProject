import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hzy_normal_network/hzy_normal_network.dart';

import 'utils.dart';

HzyNormalClient defaultClient() {
  return Get.find<HzyNormalClient>(
    tag: HzyNormalClient.defaultClientTag,
  );
}

enum Method {
  get,
  post,
}

/*
 * @description: 通用网络请求器
 * @params {
 *            path: 请求接口地址.
 *                  可以是url + path
 *                  也可以 path.但要设置baseurl.才可以正常使用,否者会404.
 *            data: 请求参数
 *          method: 请求方式.默认get
 *  isglobalparams: 是否需要全局参数.默认是true
 *                  这里我简单说一下,什么时候全局参数.一般我们后台接口,会添加一些通用参数.
 *                  比如客户端类型.(iOS,android,h5)等等.这样话,可能就需要大部分接口都
 *                  需要这样的参数.所以为了满足这个需求,我在封装这个请求器的时候,
 *                  就添加了这个参数.
 *    globalparams: 这个就是你要配置全局参数
 *                  你在请求器的方法里写死也可以.或者某些场景需要修改默认参数.这里也是支持的.
 *        showload: 显示默认加载loading.默认是true
 *         loadmsg: 加载动画提示文字.默认 加载中...
 * }
 * @return {网络数据}
 *  
*/
Future<HzyNormalResponse> request({
  required String path,
  Map<String, dynamic>? data,
  Method method = Method.get,
  bool isShowLoad = true,
  bool isneedglobalparams = true,
  Map<String, dynamic>? globalparams,
  String loadmsg = "加载中...",
  HzyNormalTransFormer? httpTransformer,
}) async {
  HzyNormalResponse res;
  if (isShowLoad) {
    showLoad();
  }
  Map<String, dynamic> params = {};
  if (isneedglobalparams) {
    globalparams ??= {};
    params.addAll(globalparams);
  }
  params.addAll(data ?? {});
  if (method == Method.get) {
    res = await defaultClient().get(
      url: path,
      queryParameters: params,
      httpTransformer: httpTransformer,
    );
  } else {
    res = await defaultClient().post(
      path,
      data: params,
      httpTransformer: httpTransformer,
    );
  }
  if (isShowLoad) {
    loadDismiss();
  }
  return res;
}

configNormalBottomSheet({
  required Widget body,
  Color? barrierColor,
}) {
  Get.bottomSheet(
    body,
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.6),
    exitBottomSheetDuration: const Duration(milliseconds: 300),
    enterBottomSheetDuration: const Duration(milliseconds: 300),
    isScrollControlled: true,
  );
}

configNormal({
  required Widget body,
}) {
  Get.dialog(body);
}

/// 跳转到指定界面
currentToPage(
  String name, {
  Map<String, String>? parameters,
  dynamic arguments,
  Function(Map info)? onChange,
  bool preventDuplicates = true,
}) {
  if (name == "") {
    return;
  }

  return Get.toNamed(
    name,
    parameters: parameters,
    arguments: arguments,
    preventDuplicates: preventDuplicates,
  );
}

/// 将指定页面添加到当前路由中,并将其他页面pop
/// Navigation.pushNamedAndRemoveUntil()
/// name 新的页面路由
/// predicate
/// Get.until((route) => Get.currentRoute == '/home')`
/// 如果你想保留某个界面不被清除,使用👆.
Future<T?>? currentTo<T>({
  required String name,
  RoutePredicate? predicate,
  dynamic arguments,
  int? id,
  Map<String, String>? parameters,
}) {
  return Get.offAllNamed(name,
      parameters: parameters,
      arguments: arguments,
      id: id,
      predicate: predicate);
}

/// 返回上一界面,再跳转到新界面
/// 这个会有返回动画
/// Navigation.popAndPushNamed()
Future<T?>? currentOffAndToName<T>({
  required String name,
  dynamic arguments,
  int? id,
  dynamic result,
  Map<String, String>? parameters,
}) {
  return Get.offAndToNamed(
    name,
    arguments: arguments,
    parameters: parameters,
  );
}

/// 替换当前界面,并跳转到目标页
/// Navigator.of(context).pushReplacementNamed(name);
Future<T?>? currentOffName<T>({
  required String name,
  Map<String, String>? parameters,
  dynamic arguments,
  int? id,
  bool preventDuplicates = true,
}) {
  return Get.offNamed(
    name,
    arguments: arguments,
    parameters: parameters,
  );
}

// ================= 返回界面 ============== //

// 返回到指定界面
// `Get.until((route) => Get.currentRoute == '/home')`
currentUntil({required String name}) {
  Get.until((route) => Get.currentRoute == name);
}

/// 返回上一个界面
void currentGoback({Map? info}) {
  Get.back(
    result: info,
  );
}

/// 获取界面传值 parameters
Map<String, String?> currentGetParams() {
  return Get.parameters;
}

/// 获取界面传值 arguments
dynamic currentGetArguments() {
  return Get.arguments;
}
