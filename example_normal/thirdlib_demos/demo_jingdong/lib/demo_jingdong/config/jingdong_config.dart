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
    HzyNormalItemModel(
      leftMsg: "浏览历史",
      router: JingDongModuleRouterS.BrowseHistoryView,
    ),
    HzyNormalItemModel(
      leftMsg: "账户设置",
      router: JingDongModuleRouterS.AccountSetView,
    ),
    HzyNormalItemModel(
      leftMsg: "我的订单",
      router: JingDongModuleRouterS.OrderView,
    ),
    HzyNormalItemModel(
      leftMsg: "我的",
      router: JingDongModuleRouterS.MineView,
    ),
    HzyNormalItemModel(
      leftMsg: "发现",
      router: JingDongModuleRouterS.DiscoverView,
    ),

    /// 按钮
    ///
  ];
}
