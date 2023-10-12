/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-12 21:12:56
 * @LastEditors: TT
 * @LastEditTime: 2023-04-12 22:20:28
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import '../config/my_module_image_id_config.dart';

class MyModuleImagePathConfig extends HzyImageAbs {
  @override
  Map<String, String> get lightInfo => {
        MyModuleImageIdConfig.myHeaderImg:
            "assets/images/my/common_nav_big.png",
      };

  @override
  Map<String, String> get darkInfo => {
        MyModuleImageIdConfig.myHeaderImg:
            "assets/images/my/dark_common_nav_big.png",
      };
}
