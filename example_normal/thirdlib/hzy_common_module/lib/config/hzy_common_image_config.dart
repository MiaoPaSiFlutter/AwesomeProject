/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-12 21:24:46
 * @LastEditors: TT
 * @LastEditTime: 2023-04-12 21:36:22
 */

import 'package:hzy_common_module/config/hzy_theme_abs.dart';
import 'package:hzy_common_module/utils/utils.dart';

class HzyCommonImageIdConfig {
  static String navBgImg = "navBgImg";
}

class HzyCommonImagePathConfig extends HzyImageAbs {
  @override
  Map<String, String> get lightInfo => {
        HzyCommonImageIdConfig.navBgImg:
            NormalModuleUtils.normalModuleImagePath(
          name: "assets/common_nav.png",
        ),
      };

  @override
  Map<String, String> get darkInfo => {
        HzyCommonImageIdConfig.navBgImg:
            NormalModuleUtils.normalModuleImagePath(
          name: "assets/dark_common_nav.png",
        ),
      };
}
