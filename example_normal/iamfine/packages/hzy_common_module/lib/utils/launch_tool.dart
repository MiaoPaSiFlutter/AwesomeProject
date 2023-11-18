/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-03 14:53:49
 * @LastEditors: TT
 * @LastEditTime: 2023-06-08 17:54:10
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sp_tool.dart';

class LaunchTool {
  /// 切换语言
  static changeLaunch({required String launchStr}) async {
    List list = launchStr.split("_");
    String languageCode = 'zh';
    String countryCode = "CN";
    if (list.length == 2) {
      languageCode = list[0];
      countryCode = list[1];
    }
    var locale = Locale(languageCode, countryCode);
    await Get.updateLocale(locale);
    await SpTool.saveLauchType(launch: launchStr);
  }

  /// 获取配置语言
// zh_CN 中文
  /// en_US 英文
  static getLocalLaunch() {
    List<String> list = ["zh", 'CN'];
    String launch = SpTool.getLaunchType();
    List<String> lochlist = launch.split('_');
    if (lochlist.length == 2) {
      list = lochlist;
    }
    return list;
  }
}
