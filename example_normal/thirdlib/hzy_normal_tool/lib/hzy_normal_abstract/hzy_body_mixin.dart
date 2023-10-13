/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-09-23 11:19:16
 * @LastEditors: TT
 * @LastEditTime: 2023-09-23 16:09:34
 */

import 'package:flutter/material.dart';

import '../hzy_normal_config/page_state.dart';
import '../hzy_normal_widgets/hzy_normal_widgets_index.dart';

mixin HzyBodyMixin {
  /// 创建脚手架 body

  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return createSafeArea(
      context: context,
      constraints: constraints,
    );
  }

  /// 创建safe
  Widget createSafeArea({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = createSafeBody(
      context: context,
      constraints: constraints,
    );
    body = configIsNeedSafeArea()
        ? SafeArea(
            top: configSafeAreaTop(),
            bottom: configSafeAreaBottom(),
            child: body,
          )
        : body;
    return body;
  }

  /// 创建safe body
  Widget createSafeBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = createBody(
      constraints: constraints,
      context: context,
    );
    body = configIsNeedPlaceHolder()
        ? HzyPlaceHolderWidget(
            pageState: configPageState(),
            errorWidget: createEmptyWidget(),
            loadingWidget: createLoadingWidget(),
            isshowloading: configIsshowLoading(),
            child: body,
          )
        : body;
    return body;
  }

  /// 创建真实body
  @protected
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  });

  /// 是否需要安全区域
  bool configIsNeedSafeArea() {
    return true;
  }

  /// 是否打开顶部安全区域
  bool configSafeAreaTop() {
    return true;
  }

  /// 是否打开底部安全区域
  bool configSafeAreaBottom() {
    return true;
  }

  /// 是否需要占位图
  bool configIsNeedPlaceHolder() {
    return true;
  }

  /// 配置界面状态
  configPageState() {
    return PageState.initializedState;
  }

  /// 创建缺省页
  Widget? createEmptyWidget() {
    return null;
  }

  /// 创建加载界面
  Widget? createLoadingWidget() {
    return null;
  }

  /// 配置是否显示加载界面
  bool configIsshowLoading() {
    return false;
  }
}
