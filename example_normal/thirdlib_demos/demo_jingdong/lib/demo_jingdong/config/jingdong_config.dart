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
      leftMsg: "Scroll-官方demo",
      router: JingDongModuleRouterS.ScrollOfficialDemo,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-加载更多",
      router: JingDongModuleRouterS.ScrollLoadMoreDemo,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-滑动到顶部",
      router: JingDongModuleRouterS.ScrollScrollToTopDemo,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-pinnedHeader高度不固定",
      router: JingDongModuleRouterS.ScrollDynamicPinnedHeaderHeightDemo,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-ScrollView横向滚动",
      router: JingDongModuleRouterS.ScrollScrollDirectionDemo,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-多个ScrollView嵌套",
      router: JingDongModuleRouterS.ScrollExtendedNestedScrollViewDemo,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-下拉放大顶部图片Demo",
      router: JingDongModuleRouterS.ScrollPullDownToScaleImageDemo,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-下拉放大顶部图片Demo2",
      router: JingDongModuleRouterS.ScrollPullDownToScaleImageDemo2,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-CustomScrollDemo1Page",
      router: JingDongModuleRouterS.CustomScrollDemo1Page,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-CustomScrollDemo2Page",
      router: JingDongModuleRouterS.CustomScrollDemo2Page,
    ),
    HzyNormalItemModel(
      leftMsg: "Scroll-CustomScrollDemo3Page",
      router: JingDongModuleRouterS.CustomScrollDemo3Page,
    ),

    /// 按钮
    ///
  ];
}
