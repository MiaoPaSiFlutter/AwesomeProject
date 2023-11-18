/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 08:46:03
 * @LastEditors: TT
 * @LastEditTime: 2023-09-23 11:51:38
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hzy_normal_config/page_state.dart';

import '../hzy_normal_widgets/hzy_appbar_generator.dart';
import '../hzy_normal_widgets/hzy_place_holder_widget.dart';

mixin class HzyAbsWidget {
  /**
   * 
   * 
   * 
   * 
   * 
  */
  /// 整体build
  Widget createBuild({required BuildContext context}) {
    Widget body = configIsNeedLayout()
        ? createLayoutWidget()
        : createLayoutChileWidget(context: context);
    return body;
  }

  // 创建layout根视图
  createLayoutWidget() {
    Widget body = LayoutBuilder(
      builder: (context, constraints) {
        configlayoutbuiderConstraints(constraints);
        return createLayoutChileWidget(
          context: context,
          constraints: constraints,
        );
      },
    );
    return body;
  }

  /// 创建可修改的根视图
  createLayoutChileWidget({
    BoxConstraints? constraints,
    required BuildContext context,
  }) {
    Widget body = configIsNeedRootContatner()
        ? Container(
            decoration: configBoxDecoreation(),
            height: configLayoutHeight(),
            width: constraints == null ? null : configSizeBoxWidth(constraints),
            child: createScaffol(
              context: context,
              constraints: constraints,
            ),
          )
        : createScaffol(
            context: context,
            constraints: constraints,
          );
    return body;
  }

  /// 创建scaffoll
  Widget createScaffol({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    bool isNeed = configIsNeedScaffol();

    Widget body = isNeed
        ? Scaffold(
            resizeToAvoidBottomInset: configResizeToAvoidBottomInset(),
            backgroundColor: configScallBackgroundColor(),
            appBar: createAppBar(context: context),
            body: createSafeArea(context: context, constraints: constraints),
          )
        : createScallBody(
            context: context,
            constraints: constraints,
          );

    /// 返回
    body = configIsAddPopScope()
        ? WillPopScope(
            child: body,
            onWillPop: () async {
              return configOnWillPop();
            },
          )
        : body;

    /// 电池栏样式
    body = AnnotatedRegion<SystemUiOverlayStyle>(
      value: configUiOverlayStyle(),
      child: body,
    );

    return body;
  }

  // -------------- 配置导航栏 -------------- //

  /// 创建导航栏
  PreferredSizeWidget? createAppBar({required BuildContext context}) {
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
          configleadingCallbak(context);
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

  // ----------- 创建Widget ----------- //

  /// 创建safe
  Widget createSafeArea({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = createScallBody(
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

  /// 配置脚手架子视图
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = !configIsShowHeader()
        ? createCommBaseWidget(
            context: context,
            constraints: constraints,
          )
        : createCommColum(
            context: context,
            constraints: constraints,
          );
    return body;
  }

  /// 分割
  Widget createCommColum({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = Column(
      mainAxisSize: configIsNeedScaffol() ? MainAxisSize.max : MainAxisSize.min,
      children: [
        createCommHeader(),
        createCommBaseWidget(
          context: context,
          constraints: constraints,
        ),
      ],
    );
    return body;
  }

  /// 自定义头部
  Widget createCommHeader() {
    Widget body = Container();
    return body;
  }

  /// 创建通用站位界面
  Widget createCommBaseWidget({
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
  }) {
    throw UnimplementedError();
  }

  /// 创建缺省页
  Widget? createEmptyWidget() {
    return null;
  }

  /// 创建加载界面
  Widget? createLoadingWidget() {
    return null;
  }

  // ----------- 配置项 ---------- //
  /// 是否需要根视图
  bool configIsNeedRootContatner() {
    return false;
  }

  /// 是否需要脚手架
  bool configIsNeedScaffol() {
    return true;
  }

  /// 电池栏颜色
  SystemUiOverlayStyle configUiOverlayStyle() {
    return SystemUiOverlayStyle.dark;
  }

  /// 是否需要安全区域
  bool configIsNeedSafeArea() {
    return true;
  }

  /// 是否需要占位图
  bool configIsNeedPlaceHolder() {
    return true;
  }

  /// 是否界面跟随键盘弹起而形变
  bool? configResizeToAvoidBottomInset() {
    return null;
  }

  /// 配置脚手架背景颜色
  Color? configScallBackgroundColor() {
    return null;
  }

  /// 是否打开顶部安全区域
  bool configSafeAreaTop() {
    return true;
  }

  /// 是否打开底部安全区域
  bool configSafeAreaBottom() {
    return true;
  }

  /// 是否关闭右滑返回
  bool configIsAddPopScope() {
    return false;
  }

  /// 配置是否显示加载界面
  bool configIsshowLoading() {
    return false;
  }

  /// 配置是否Layout
  bool configIsNeedLayout() {
    return false;
  }

  /// 配置是否可以右滑返回
  bool configOnWillPop() {
    return true;
  }

  /// 是否显示头部
  bool configIsShowHeader() {
    return false;
  }

  /// 配置界面状态
  configPageState() {
    return PageState.initializedState;
  }

  /// 配置根视图 装饰器
  configBoxDecoreation() {
    return null;
  }

  /// 配置显示界面最大宽度
  configSizeBoxWidth(constraints) {}

  /// 配置显示界面最大高度
  double? configLayoutHeight() {
    return null;
  }

  // -------------- 点击事件 ------------- //
  /// 点击通用返回按钮点击事件
  configleadingCallbak(
    BuildContext context,
  ) {
    configgoback(context);
  }

  /// 获取 屏幕 最大尺寸
  configlayoutbuiderConstraints(
    BoxConstraints constraints,
  ) {}

  /// 执行返回界面
  configgoback(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }
}
