/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-13 08:46:46
 * @LastEditors: TT
 * @LastEditTime: 2023-04-13 09:19:59
 */

import 'package:flutter/material.dart';


/// 亮色主题
ThemeData hzyThemeDataLight = ThemeData(
  brightness: Brightness.light,

  /// scaffold 背景色
  // scaffoldBackgroundColor: HzyNormalColorS.colffffff,

  /// 点击水波纹动画效果
  /// 这里我们把水波纹动画去掉
  splashFactory: NoSplash.splashFactory,

  /// 水波纹颜色
  splashColor: Colors.white.withOpacity(0),
  
);

/// 暗黑主题
ThemeData hzyThemeDataDark = ThemeData(
  brightness: Brightness.dark,

  /// scaffold 背景色
  // scaffoldBackgroundColor: const Color.fromRGBO(27, 27, 27, 1),

  /// 点击水波纹动画效果
  /// 这里我们把水波纹动画去掉
  splashFactory: NoSplash.splashFactory,

  /// 水波纹颜色
  splashColor: Colors.white.withOpacity(0),
);
