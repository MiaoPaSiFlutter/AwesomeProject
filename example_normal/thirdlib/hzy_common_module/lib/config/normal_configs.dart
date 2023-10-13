/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-10 17:56:27
 * @LastEditors: TT
 * @LastEditTime: 2023-07-01 17:52:30
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../components/common_widgets.dart';

import 'hzy_common_color_config.dart';

class SpConfig {
  /// 主题标志
  static String themeType = "themeType";

  /// 语言标志
  static String launchType = "launchType";
}

class PageNormalConfig {
  // static PageNormalConfig get instance => _instace;
  // static final PageNormalConfig _instace = PageNormalConfig._();

  /// 配置全局 界面装饰器
  BoxDecoration dec = BoxDecoration(
    color: HzyCommonColor().whitebackgroundColor,
  );

  /// 配置全局 导航栏字体颜色
  Color appBarTextColor = HzyCommonColor().col000000;

  /// 配置全局 返回按钮颜色
  Color leadingIconColor = HzyCommonColor().col000000;

  /// 配置全局 Scall 背景颜色
  Color scallBackgroudColor = HzyCommonColor().backgroudgrey;

  /// 配置全局 加载动画
  Widget loadingWidget = configLoadWidget();

  /// 配置全局 导航栏高度
  double? preferredHeight;

  /// 配置全局 导航栏背景图
  Widget? flexBleSpace;

  /// 配置全局 导航栏背景颜色
  Color navBackgroundColor = HzyCommonColor().whitebackgroundColor;

  /// 配置全局 是否打开右滑返回
  bool canPopScope = (kIsWeb == true ? true : false);

  /// 初始化
  // PageNormalConfig._() {
  //   dec = BoxDecoration(
  //     color: HzyCommonColor().whitebackgroundColor,
  //   );
  //   appBarTextColor = HzyCommonColor().col000000;
  //   leadingIconColor = HzyCommonColor().col000000;
  //   scallBackgroudColor = HzyCommonColor().backgroudgrey;
  //   loadingWidget = configLoadWidget();
  //   navBackgroundColor = HzyCommonColor().whitebackgroundColor;
  //   canPopScope = (kIsWeb == true ? true : false);
  // }
}
