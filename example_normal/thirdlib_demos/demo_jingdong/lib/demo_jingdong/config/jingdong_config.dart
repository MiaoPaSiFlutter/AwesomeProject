/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-19 09:14:44
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 17:18:40
 */

import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JingDongConfig {
  List itemList = [
    HzyNormalItemModel(
      leftMsg: "登录页面",
      router: JingDongModuleRouterS.LOGIN,
    ),

    HzyNormalItemModel(
      leftMsg: "新品页面",
      router: JingDongModuleRouterS.NEWS,
    ),

    /// 按钮
    ///
  ];
}
