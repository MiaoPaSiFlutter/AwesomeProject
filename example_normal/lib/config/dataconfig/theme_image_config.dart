/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 21:56:05
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 14:49:35
 */

import 'package:hzy_common_module/config/hzy_theme_abs.dart';

class HzyImageId {
  static String tabHomeNormal = "homeNor";
  static String tabHomeSelect = "homeSelect";
  static String tabMyNormal = "myNor";
  static String tabMySelect = "mySelect";
  static String tabWtNormal = "wtNor";
  static String tabWtSelect = "wtSelect";
}

class HzyThemeImageConfig extends HzyImageAbs {
  HzyThemeImageConfig._internal();
  factory HzyThemeImageConfig() => _instance;
  static final HzyThemeImageConfig _instance = HzyThemeImageConfig._internal();

  @override
  Map<String, String> get lightInfo => {
        HzyImageId.tabHomeNormal: "assets/images/tabbar/icon_fw_nor.png",
        HzyImageId.tabHomeSelect: "assets/images/tabbar/icon_fw_pre.png",
        HzyImageId.tabMyNormal: "assets/images/tabbar/icon_my_nor.png",
        HzyImageId.tabMySelect: "assets/images/tabbar/icon_my_pre.png",
        HzyImageId.tabWtNormal: "assets/images/tabbar/icon_wt_nor.png",
        HzyImageId.tabWtSelect: "assets/images/tabbar/icon_wt_pre.png"
      };

  @override
  Map<String, String> get darkInfo => {
        HzyImageId.tabHomeNormal: "assets/images/tabbar/icon_fw_nor.png",
        HzyImageId.tabHomeSelect: "assets/images/tabbar/icon_fw_pre.png",
        HzyImageId.tabMyNormal: "assets/images/tabbar/icon_my_nor.png",
        HzyImageId.tabMySelect: "assets/images/tabbar/icon_my_pre.png",
        HzyImageId.tabWtNormal: "assets/images/tabbar/icon_wt_pre.png",
        HzyImageId.tabWtSelect: "assets/images/tabbar/icon_wt_nor.png",
      };
}
