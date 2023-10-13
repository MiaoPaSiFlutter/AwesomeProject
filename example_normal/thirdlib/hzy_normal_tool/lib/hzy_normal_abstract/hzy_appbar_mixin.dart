/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-09-23 11:18:24
 * @LastEditors: TT
 * @LastEditTime: 2023-09-26 11:30:54
 */

import 'package:flutter/material.dart';

import '../hzy_normal_widgets/hzy_appbar_generator.dart';

/// 导航栏
mixin HzyAppBarMixin {
  /// 创建导航栏
  PreferredSizeWidget? createAppBar({
    required BuildContext context,
  }) {
    if (configIsShowAppBar()) {
      return HzyAppBarGenerator.getNoramlAppBar(
        context: context,
        title: createAppBarTitleStr() ?? "",
        backgroundColor: createAppBarNavBackColor(),
        actions: createAppBaractions(),
        leading: createAppBarleading(),
        textColor: createAppBarTextColor(),
        flexibleSpace: createFlexBleSpace(),
        leadingIconColor: createLeadingIconColor(),
        icon: createLeadIcon(),
        leadingCallback: () {
          configleadingCallbak(context: context);
        },
        showback: configShowBack(),
        titlew: createAppBarTitleWidget(),
        bottom: createAppBarBottomWidget(),
        toolbarHeight: configPrferredheight(),
      );
    }
    return null;
  }

  /// 是否显示导航栏
  bool configIsShowAppBar() {
    return createAppBarTitleStr() == null;
  }

  /// 配置导航栏背景颜色
  Color? createAppBarNavBackColor() {
    return null;
  }

  /// 配置导航栏字体
  String? createAppBarTitleStr() {
    return null;
  }

  /// 配置返回按钮iconData
  IconData? createLeadIcon() {
    return null;
  }

  /// 自定义appBar title
  Widget? createAppBarTitleWidget() {
    return null;
  }

  /// 设置系统返回按钮 icon 颜色
  Color? createLeadingIconColor() {
    return null;
  }

  /// 设置默认 title 字体颜色
  Color? createAppBarTextColor() {
    return null;
  }

  /// 创建导航栏 右边按钮集合
  List<Widget>? createAppBaractions() {
    return null;
  }

  /// 重写返回按钮控件
  Widget? createAppBarleading() {
    return null;
  }

  /// 配置导航栏背景
  Widget? createFlexBleSpace() {
    return null;
  }

  /// 创建AppBar bottom
  PreferredSizeWidget? createAppBarBottomWidget() {
    return null;
  }

  /// 是否显示返回按钮
  bool configShowBack() {
    return true;
  }

  /// 配置appBar 高度
  double? configPrferredheight() {
    return null;
  }

  @protected
  configleadingCallbak({
    BuildContext? context,
  });
}
