/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-10 18:09:36
 * @LastEditors: TT
 * @LastEditTime: 2023-04-19 21:53:39
 */

import 'package:hzy_common_module/hzy_common_module.dart';

class SpTool {
  /// 存主题
  /// 1 白色
  /// 2 黑色
  /// 3 跟随系统
  static Future<bool> saveThemeType({required int type}) async {
    return await SharedPreferencesTool.putInt(SpConfig.themeType, type) ??
        false;
  }

  /// 取主题
  /// 1 白色
  /// 2 黑色
  /// 3 跟随系统
  static int themeType() {
    return SharedPreferencesTool.getInt(SpConfig.themeType) ?? 0;
  }

  /// 存语言配置
  /// zh_CN 中文
  /// en_US 英文
  static saveLauchType({required String launch}) {
    return SharedPreferencesTool.putString(SpConfig.launchType, launch);
  }

  /// 获取语言配置
  /// zh_CN 中文
  /// en_US 英文
  static String getLaunchType() {
    return SharedPreferencesTool.getString(SpConfig.launchType) ?? "zh_CN";
  }
}
