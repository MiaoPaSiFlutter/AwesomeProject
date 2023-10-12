/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-30 16:49:50
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:37
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../routers/routers_index.dart';
import 'my_launch_id_config.dart';

class MyNormalConfig {
  /// 配置个人中 item列表
  List<HzyNormalItemModel> myItemList = [
    /// 草稿
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.darft.tr,
      rightType: 1,
      isShowLine: true,
      leftImageWidget: const Icon(
        Icons.bookmarks_outlined,
        size: 20,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.r),
        topRight: Radius.circular(12.r),
      ),
    ),

    /// 图集
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.atlas.tr,
      leftImageWidget: const Icon(
        Icons.donut_small_outlined,
        size: 20,
      ),
      rightType: 1,
      isShowLine: true,
    ),

    /// 收藏
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.collection.tr,
      leftImageWidget: const Icon(
        Icons.favorite_border_outlined,
        size: 20,
      ),
      rightType: 1,
      isShowLine: true,
    ),

    /// 足迹
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.track.tr,
      leftImageWidget: const Icon(
        Icons.fingerprint_outlined,
        size: 20,
      ),
      rightType: 1,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12.r),
        bottomRight: Radius.circular(12.r),
      ),
    ),

    /// 空格
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(
        0,
      ),
    ),

    /// 帮助与反馈
    HzyNormalItemModel(
      leftMsg: (LaunchIdConfig.help.tr +
          LaunchIdConfig.and.tr +
          LaunchIdConfig.feedback.tr),
      rightType: 1,
      isShowLine: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.r),
        topRight: Radius.circular(12.r),
      ),
    ),

    /// 隐私政策
    HzyNormalItemModel(
      leftMsg: LaunchIdConfig.privacy.tr + LaunchIdConfig.policy.tr,
      rightType: 1,
      isShowLine: true,
    ),

    /// 推荐给好友
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.shareFriend.tr,
      rightType: 1,
      isShowLine: true,
    ),

    /// 关于我们
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.aboutUs.tr,
      rightType: 1,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12.r),
        bottomRight: Radius.circular(12.r),
      ),
    ),
  ];

  /// 配置轮播图数据
  List<String> bannerList = [
    "assets/images/example/lol_ak.png",
    "assets/images/example/lol_ey.png",
    "assets/images/example/lol_jie.png",
    "assets/images/example/lol_vn.png",
    "assets/images/example/lol_ys.png",
  ];

  /// 配置抽屉工具栏数据
  List<HzyNormalItemModel> toolItemList = [
    ///  账号与安全
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.accountSecurity.tr,
    ),

    /// 空格
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),

    /// 消息通知
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.messageNoti.tr,
      isShowLine: true,
    ),

    /// 通用
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.general.tr,
      isShowLine: false,
      router: MyModuleRouterS.myGeneral,
    ),
  ];

  List<HzyNormalItemModel> toolBottomList = [
    /// 切换账号
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.switchAccount.tr,
      mainAxisAlignment: MainAxisAlignment.center,
      isShowLine: true,
    ),

    /// 空格
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),

    /// 退出登录
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.logOut.tr,
      mainAxisAlignment: MainAxisAlignment.center,
      isShowLine: false,
    ),

    /// 空格
    HzyNormalItemModel(
      isHintWidget: true,
      height: SizeMacro.bottomBarHeight + 20,
      backGroudColor: Colors.white.withOpacity(0),
    ),
  ];

  List<HzyNormalItemModel> generalList = [
    /// 空格
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),

    /// 深色模式
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.dark.tr,
      rightType: 3,
      rightMsg: configDarkModelIsOpen(),
      router: MyModuleRouterS.myTheme,
    ),

    /// 空格
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),

    /// 多语言
    HzyNormalItemModel(
      leftMsg: MyLaunchIdConfig.language.tr,
      rightType: 1,
      router: MyModuleRouterS.myLaunchSett,
    ),
  ];

  /// 配置主题开关状态文案
  static String configDarkModelIsOpen({
    bool isUserCache = true,
    int themeType = 0,
  }) {
    String msg = LaunchIdConfig.disabled.tr;
    int type = isUserCache ? SpTool.themeType() : themeType;
    if (type == 0) {
      msg = LaunchIdConfig.disabled.tr;
    } else if (type == 1) {
      msg = LaunchIdConfig.enabled.tr;
    } else {
      msg = MyLaunchIdConfig.system.tr;
    }
    return msg;
  }
}
