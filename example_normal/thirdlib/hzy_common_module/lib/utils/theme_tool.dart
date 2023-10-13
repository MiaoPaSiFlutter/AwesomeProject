/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 21:58:22
 * @LastEditors: TT
 * @LastEditTime: 2023-09-15 18:26:16
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

import 'sp_tool.dart';

class ThemeTool {
  /// 切换主题
  /// 0 白色
  /// 1 黑色
  /// 2 系统跟随
  static changeTheme({
    int type = 0,
    bool isUserCache = false,
  }) async {
    if (!isUserCache) {
      dPrint("准备存下来的主题类型$type");
    }

    ThemeMode mode = getlocalprofileaboutThemeModel(
      isUserCache: isUserCache,
      themeType: type,
    );
    ThemeData themeData = getlocalprofileaboutThemeData(
      isUserCache: isUserCache,
      themeType: type,
    );
    dPrint(mode);
    dPrint(themeData);
    EasyLoadingStyle easyLoadingStyle = EasyLoadingStyle.dark;
    if (mode == ThemeMode.dark) {
      easyLoadingStyle = EasyLoadingStyle.light;
    } else if (mode == ThemeMode.system) {
      if (!Get.isDarkMode) {
        easyLoadingStyle = EasyLoadingStyle.light;
      }
    }
    EasyLoading.instance.loadingStyle = easyLoadingStyle;
    Get.changeThemeMode(mode);
    Get.changeTheme(themeData);
    updateTheme();
    if (!isUserCache) {
      SpTool.saveThemeType(type: type);
    }
  }

  static updateTheme() {
    Future.delayed(const Duration(milliseconds: 250), () {
      Get.forceAppUpdate();
    });
  }

  /// 获取本地 主题配置
  /// 0 白色
  /// 1 黑色
  /// 2 跟随系统
  static getlocalprofileaboutThemeModel({
    bool isUserCache = true,
    int themeType = 0,
  }) {
    int type = isUserCache ? SpTool.themeType() : themeType;
    dPrint(type);
    if (type == 0) {
      return ThemeMode.light;
    } else if (type == 1) {
      return ThemeMode.dark;
    } else if (type == 2) {
      return ThemeMode.system;
    }
  }

  static getlocalprofileaboutThemeData({
    bool isUserCache = true,
    int themeType = 0,
  }) {
    int type = isUserCache ? SpTool.themeType() : themeType;
    if (type == 0) {
      return ThemeData(brightness: Brightness.light);
    } else if (type == 1) {
      return ThemeData(brightness: Brightness.dark);
    } else if (type == 2) {
      if (!Get.isDarkMode) {
        return ThemeData(brightness: Brightness.dark);
      } else {
        return ThemeData(brightness: Brightness.light);
      }
    }
  }

  static isdark() {
    //深色模式 0: 关闭 1: 开启 2: 随系统
    int type = SpTool.themeType();
    if (type == 0) {
      return false;
    } else if (type == 1) {
      return true;
    } else {
      return MediaQuery.of(Get.context!).platformBrightness == Brightness.dark;
    }
    // if (type == 2) {
    //   return MediaQuery.of(Get.context!).platformBrightness == Brightness.dark;
    // } else {
    //   return Get.isDarkMode;
    // }
  }
}
