/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-17 20:44:46
 * @LastEditors: TT
 * @LastEditTime: 2023-07-26 17:53:53
 */

import 'package:flutter/material.dart';

import 'package:hzy_normal_tool/hzy_normal_config/hzy_normal_colors.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_text_style.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_normal_widgets_index.dart';

class HzyPopDiaLogWidget extends StatelessWidget {
  const HzyPopDiaLogWidget({
    super.key,
    this.bgColor = Colors.white,
    this.radius = 20,
    this.titleWidget,
    this.title,
    this.titleColor = HzyNormalColorS.col222222,
    this.titleFontSize = 16,
    this.msgWidget,
    this.msgColor = HzyNormalColorS.col333333,
    this.msgFontSize = 14,
    this.msg,
    this.btnSWidget,
    this.padding = const EdgeInsets.all(20),
    this.msgAndBtnSpace = 20,
    this.titleAndMsgSpace = 12,
    this.sureMsg = "确认",
    this.sureBgColor = HzyNormalColorS.col2865ff,
    this.sureTitleColor = Colors.white,
    this.cannerMsg = "取消",
    this.cannerBgColor = HzyNormalColorS.colf5f5f5,
    this.cannerTitleColor = HzyNormalColorS.col999999,
    this.tapSure,
    this.tapCanner,
    this.space = 20,
    this.layoutType = 1,
    this.btnType = 2,
  });

  /// 背景色
  final Color? bgColor;

  /// 按钮圆角
  final double? radius;

  /// 标题视图
  final Widget? titleWidget;

  /// 标题内容
  final String? title;

  /// 标题颜色
  final Color? titleColor;

  /// 标题字体大小
  final double? titleFontSize;

  /// 提示语视图
  final Widget? msgWidget;

  /// 提示语字体颜色
  final Color? msgColor;

  /// 提示语字体带下
  final double? msgFontSize;

  /// 提示内容
  final String? msg;

  /// 标题和提示间距
  final double? titleAndMsgSpace;

  /// 提示和按钮间距
  final double? msgAndBtnSpace;

  /// 整体布局的内边距
  final EdgeInsetsGeometry? padding;

  /// 底部按钮视图
  final Widget? btnSWidget;

  /// 确认文字
  final String? sureMsg;

  /// 确认字体颜色
  final Color? sureTitleColor;

  /// 确认背景颜色
  final Color? sureBgColor;

  /// 取消文字
  final String? cannerMsg;

  /// 取消字体颜色
  final Color? cannerTitleColor;

  /// 取消按钮背景颜色
  final Color? cannerBgColor;

  /// 1 一个按钮 2 取消 + 确认 按钮
  final int? btnType;

  /// 1 左右 2上下
  final int? layoutType;

  /// 确认事件回调
  final GestureTapCallback? tapSure;

  /// 取消事件回调
  final GestureTapCallback? tapCanner;

  /// 两个按钮间距
  final double? space;

  @override
  Widget build(BuildContext context) {
    Widget body = createPopDialogWidget();
    return body;
  }

  /// 创建弹框内容
  createPopDialogWidget() {
    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        createTitleWidget(),
        SizedBox(
          height: (title == null && titleWidget == null)
              ? 0
              : ((msg == null && msgWidget == null) ? 30 : titleAndMsgSpace),
        ),
        createMsgWidget(),
        SizedBox(
          height: (msg == null && msgWidget == null) ? 8 : msgAndBtnSpace,
        ),
        createBtnWidget(),
      ],
    );

    body = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius ?? 16),
      ),
      child: body,
    );
    return body;
  }

  /// 创建标题
  createTitleWidget() {
    Widget body = title == null
        ? Container()
        : Text(
            title ?? "",
            style: HzyTextStyle.fontBold(
              size: titleFontSize,
              color: titleColor,
            ),
            textAlign: TextAlign.center,
          );
    body = titleWidget ?? body;
    return body;
  }

  /// 创建内容
  createMsgWidget() {
    Widget body = msg == null
        ? Container()
        : Text(
            msg ?? "",
            style: HzyTextStyle.fontMedium(
              size: msgFontSize,
              color: msgColor,
            ),
            textAlign: TextAlign.center,
          );
    body = msgWidget ?? body;

    return body;
  }

  /// 创建底部按钮
  createBtnWidget() {
    Widget body = HzySureAndCannerBtnWidget(
      space: space,
      sureBgColor: sureBgColor,
      sureMsg: sureMsg,
      sureTitleColor: sureTitleColor,
      cannerBgColor: cannerBgColor,
      cannerMsg: cannerMsg,
      cannerTitleColor: cannerTitleColor,
      tapCanner: tapCanner,
      radius: radius,
      tapSure: tapSure,
      layoutType: layoutType,
      btnType: btnType,
    );

    body = btnSWidget ?? body;
    return body;
  }
}
