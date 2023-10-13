/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 09:51:44
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 16:04:53
 */

import 'package:flutter/cupertino.dart';

import '../hzy_normal_abstract/hzy_normal_abstract_index.dart';

abstract class HzyLess extends StatelessWidget
    with
        HzyAbsWidget,
        HzyAbsAttribute,
        HzyAbstractNetWork,
        WidgetsBindingObserver {
  HzyLess({super.key});
  @override
  Widget build(BuildContext context) {
    Widget body = createBuild(
      context: context,
    );
    return body;
  }

  /// =============== UI配置 =============== ///

  /// 是否使用Layout
  @override
  bool configIsNeedLayout() {
    return isNeedLayout;
  }

  /// 创建根视图装饰器
  @override
  configBoxDecoreation() {
    return null;
  }

  /// 是否使用脚手架
  @override
  bool configIsNeedScaffol() {
    return isNeedScaffol;
  }

  ///是否形变
  @override
  bool? configResizeToAvoidBottomInset() {
    return resizeToAvoidBottomInset;
  }

  /// 脚手架背景颜色
  @override
  Color? configScallBackgroundColor() {
    return scallBackGroundColor;
  }

  /// 是否关闭右滑返回
  @override
  bool configIsAddPopScope() {
    return isAddPopScope;
  }

  /// 是否关闭顶部安全区域
  @override
  bool configSafeAreaTop() {
    return safeAreatop;
  }

  /// 是否关闭底部安全区域
  @override
  bool configSafeAreaBottom() {
    return safeAreabottm;
  }

  /// 是否显示加载动画
  @override
  bool configIsshowLoading() {
    return false;
  }

  /// 是否关闭右滑返回
  @override
  bool configOnWillPop() {
    return true;
  }

  @override
  bool configIsShowAppBar() {
    return isShowAppBar;
  }

  /// 配置导航栏标题
  @override
  String? createAppBarTitleStr() {
    return appBarTitle;
  }

  /// 配置导航栏背景颜色
  @override
  Color? createAppBarNavBackColor() {
    return navBackgroudColor;
  }

  /// =============== 网络事件 =============== ///
  @override
  Map<String, dynamic>? configNetWorkParmas({
    String? mark,
    Map<String, dynamic>? params,
  }) {
    return null;
  }

  @override
  getNetWorkData({
    int? type,
    Map<String, dynamic>? info,
  }) async {}

  /// =============== 触发事件 =============== ///
}
