/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-21 21:11:14
 * @LastEditors: TT
 * @LastEditTime: 2023-07-11 11:36:34
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:hzy_common_module/hzy_common_module.dart';

abstract class CommonState<T extends StatefulWidget>
    extends HzyLifeCycleState<T> {
  /// 配置缺省页状态值
  CommonPlaceHoldType placeHoldType = CommonPlaceHoldType.nothing;

  /// 导航栏背景颜色
  @override
  Color? get navBackgroudColor => PageNormalConfig().navBackgroundColor;
  @override
  bool get isAddPopScope => PageNormalConfig().canPopScope;
  @override
  bool get safeAreabottm => false;

  /// 创建缺省页
  @override
  Widget? createEmptyWidget() {
    return CommonPlaceHoldPage(
      placeHoldType: placeHoldType,
      msg: errMsg,
      ontap: () {
        tapPlaceHoldWidgetMethod(
          placeHoldType: placeHoldType,
        );
      },
    );
  }

  @override
  bool configIsNeedLayout() {
    return kIsWeb == true ? false : isNeedLayout;
  }

  /// 是否使用脚手架
  @override
  bool configIsNeedScaffol() {
    return isNeedScaffol;
  }

  /// 配置AppBar 字体颜色
  @override
  Color? createAppBarTextColor() {
    return PageNormalConfig().appBarTextColor;
  }

  /// 配置AppBar 返回按钮icon 颜色
  @override
  Color? createLeadingIconColor() {
    return PageNormalConfig().leadingIconColor;
  }

  /// 配置状态栏的高度
  @override
  configPrferredheight() {
    return PageNormalConfig().preferredHeight ??
        SizeMacro.navh - SizeMacro.statusBarHeight;
  }

  /// 配置加载动画
  @override
  Widget? createLoadingWidget() {
    return PageNormalConfig().loadingWidget;
  }

  /// 配置导航栏 背景视图
  @override
  Widget? createFlexBleSpace() {
    return PageNormalConfig().flexBleSpace;
  }

  /// =============== 网络事件 =============== ///

  /// =============== 触发事件 =============== ///
  ///
  //  点击缺省页触发事件
  tapPlaceHoldWidgetMethod({
    required CommonPlaceHoldType placeHoldType,
  }) {}

  @override
  configPlatformBrightness() {
    ThemeTool.changeTheme(isUserCache: true);
  }
}
