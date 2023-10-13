/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 21:08:58
 * @LastEditors: TT
 * @LastEditTime: 2023-03-19 21:11:13
 */

import 'package:hzy_common_module/utils/utils.dart';

class NormalImagePathConfit {
  /// 第一种 图片加载失败
  static String imageFail = NormalModuleUtils.normalModuleImagePath(
    name: "assets/image_failed.jpg",
  );

  /// 第二种 图片加载失败
  static String imageError = NormalModuleUtils.normalModuleImagePath(
    name: "assets/image_error.png",
  );
}
