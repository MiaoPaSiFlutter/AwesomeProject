/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 22:11:20
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:42:13
 */

import 'package:hzy_normal_tool/hzy_normal_tool.dart';

import '../utils/theme_tool.dart';

abstract class HzyImageAbs extends AbsThemeImagePathConfig {
  @override
  bool loadThemeModel() {
    return ThemeTool.isdark();
  }
}

abstract class HzyColorAbs extends AbsThemeColorConfig {
  @override
  bool loadThemeModel() {
    return ThemeTool.isdark();
  }
}
