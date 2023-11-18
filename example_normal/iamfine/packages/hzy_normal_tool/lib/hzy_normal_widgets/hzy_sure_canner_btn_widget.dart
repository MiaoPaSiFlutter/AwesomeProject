/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-17 21:58:03
 * @LastEditors: TT
 * @LastEditTime: 2023-08-14 16:46:38
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_normal_colors.dart';

import 'hzy_btn_widget.dart';

class HzySureAndCannerBtnWidget extends StatelessWidget {
  const HzySureAndCannerBtnWidget({
    super.key,
    this.sureWidget,
    this.sureMsg = "确认",
    this.sureBgColor = HzyNormalColorS.col2865ff,
    this.sureTitleColor = Colors.white,
    this.cannerWidget,
    this.cannerMsg = "取消",
    this.cannerBgColor = HzyNormalColorS.colf5f5f5,
    this.cannerTitleColor = HzyNormalColorS.col999999,
    this.radius = 20,
    this.height = 40,
    this.fontSize,
    this.tapSure,
    this.tapCanner,
    this.space = 20,
    this.spaceWidget,
    this.cannerScale = 1,
    this.sureScale = 1,
    this.layoutType = 1,
    this.btnType = 2,
  });

  /// 确认按钮
  final Widget? sureWidget;

  /// 确认文字
  final String? sureMsg;

  /// 确认字体颜色
  final Color? sureTitleColor;

  /// 确认背景颜色
  final Color? sureBgColor;

  /// 取消按钮
  final Widget? cannerWidget;

  /// 取消文字
  final String? cannerMsg;

  /// 取消字体颜色
  final Color? cannerTitleColor;

  /// 取消按钮背景颜色
  final Color? cannerBgColor;

  /// 按钮圆角
  final double? radius;

  /// 按钮高度
  final double? height;

  /// 文字大小
  final double? fontSize;

  /// 1 一个按钮 2 取消 + 确认 按钮
  final int? btnType;

  /// 1 左右 2上下
  final int? layoutType;

  /// 确认事件回调
  final GestureTapCallback? tapSure;

  /// 取消事件回调
  final GestureTapCallback? tapCanner;

  /// 中间空隙视图
  final Widget? spaceWidget;

  /// 两个按钮间距
  final double? space;

  ///  取消按钮布局比例 只针对左右布局生效
  final int? cannerScale;

  /// 确认按钮布局比例 只针对左右布局生效
  final int? sureScale;

  @override
  Widget build(BuildContext context) {
    /// 确认按钮
    Widget sBtn = createSureWidget();

    /// 取消按钮
    Widget cBtn = createCannerWidget();

    Widget body = Container();

    if (layoutType == 1) {
      body = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          cBtn,
          spaceWidget ??
              SizedBox(
                width: btnType == 1 ? 0 : space,
              ),
          sBtn,
        ],
      );
    } else {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sBtn,
          spaceWidget ??
              SizedBox(
                height: btnType == 1 ? 0 : space,
              ),
          cBtn,
        ],
      );
    }
    return body;
  }

  /// 创建确认按钮
  createSureWidget() {
    Widget body = HzyBtnWidget(
      text: sureMsg,
      bgColor: sureBgColor,
      radius: radius,
      height: height,
      fontColor: sureTitleColor,
      tapCall: tapSure,
    );
    body = layoutType == 2
        ? body
        : Expanded(
            flex: sureScale ?? 1,
            child: body,
          );
    body = sureWidget ?? body;
    return body;
  }

  /// 创建取消按钮
  createCannerWidget() {
    Widget body = HzyBtnWidget(
      text: cannerMsg,
      bgColor: cannerBgColor,
      radius: radius,
      height: height,
      fontColor: cannerTitleColor,
      tapCall: tapCanner,
    );
    body = layoutType == 2
        ? body
        : Expanded(
            flex: cannerScale ?? 1,
            child: body,
          );
    body = cannerWidget ?? body;
    body = btnType == 1 ? Container() : body;
    return body;
  }
}
