/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-06 16:04:44
 * @LastEditors: TT
 * @LastEditTime: 2023-05-07 10:03:34
 */

import 'package:flutter/material.dart';

import 'package:hzy_common_module/hzy_common_module.dart';

class NormalBtnModel {
  // 按钮布局类型
  BtnLayoutType? btnLayoutType;

  /// 按钮宽
  double? width;

  /// 按钮高
  double? height;
  // ---------- 装饰器 ----------- //

  /// 背景装饰器
  Decoration? decoration;

  /// 背景颜色
  Color? bgColor;

  /// 外边距
  EdgeInsetsGeometry? margin;

  /// 内边距
  EdgeInsetsGeometry? padding;

  /// 边框
  BoxBorder? border;

  /// 圆角边
  BorderRadiusGeometry? borderRadius;

  /// 圆角
  double? radius;
  // ---------- 文字视图 --------- //
  /// 自定义文字Widget
  Widget? titleWidget;

  /// 文本内容
  String? text;

  /// 字体样式
  TextStyle? textStyle;

  /// 字体大小
  double? fontSize;

  /// 字体颜色
  Color? fontcolor;

  /// 字体行高
  double? lineHeight;
  // ----------- 图片视图 ------------ //
  /// 图片Widget
  Widget? imageWidget;

  /// 间距
  double? space;

  /// 是否使用fitbox
  bool? isFittedBox;

  NormalBtnModel({
    this.bgColor,
    this.btnLayoutType = BtnLayoutType.text,
    this.decoration,
    this.margin,
    this.width,
    this.height = 40,
    this.border,
    this.borderRadius,
    this.radius,
    this.titleWidget,
    this.text,
    this.textStyle,
    this.fontSize = 14,
    this.fontcolor = Colors.black,
    this.lineHeight,
    this.imageWidget,
    this.space = 4,
    this.isFittedBox = false,
  });
}

class NormalComBtnModel {
  /// 确认按钮
  Widget? sureWidget;

  /// 确认文字
  String? sureMsg;

  /// 确认字体颜色
  Color? sureTitleColor;

  /// 确认背景颜色
  Color? sureBgColor;

  /// 取消按钮
  Widget? cannerWidget;

  /// 取消文字
  String? cannerMsg;

  /// 取消字体颜色
  Color? cannerTitleColor;

  /// 取消按钮背景颜色
  Color? cannerBgColor;

  /// 按钮圆角
  double? radius;

  /// 按钮高度
  double? height;

  /// 文字大小
  double? fontSize;

  /// 1 一个按钮 2 取消 + 确认 按钮
  int? btnType;

  /// 1 左右 2上下
  int? layoutType;

  /// 中间空隙视图
  Widget? spaceWidget;

  /// 两个按钮间距
  double? space;

  ///  取消按钮布局比例 只针对左右布局生效
  int? cannerScale;

  /// 确认按钮布局比例 只针对左右布局生效
  int? sureScale;

  NormalComBtnModel({
    this.sureWidget,
    this.sureMsg,
    this.sureBgColor = HzyNormalColorS.col2865ff,
    this.sureTitleColor = Colors.white,
    this.cannerWidget,
    this.cannerMsg,
    this.cannerBgColor = HzyNormalColorS.colf5f5f5,
    this.cannerTitleColor = HzyNormalColorS.col999999,
    this.radius = 20,
    this.height = 40,
    this.fontSize,
    this.space = 20,
    this.spaceWidget,
    this.cannerScale = 1,
    this.sureScale = 1,
    this.layoutType = 1,
    this.btnType = 2,
  });
}

class NormalDialogModel {
  Color? dialogBackColor;
  bool? barrierDismissible;
  Widget? body;
  Widget? titleWidget;
  String? title;
  Color? titleColor;
  double? titleFontSize;
  Widget? msgWidget;
  Color? msgColor;
  double? msgFontSize;
  String? msg;
  Widget? btnSWidget;
  EdgeInsetsGeometry? padding;
  double? msgAndBtnSpace;
  double? titleAndMsgSpace;
  String? sureMsg;
  Color? sureBgColor;
  Color? sureTitleColor;
  String? cannerMsg;
  Color? cannerBgColor;
  Color? cannerTitleColor;
  double? space;
  int? layoutType;
  int? btnType;
  double? radius;

  NormalDialogModel({
    this.dialogBackColor,
    this.barrierDismissible = true,
    this.body,
    this.btnSWidget,
    this.btnType,
    this.cannerBgColor,
    this.cannerMsg,
    this.cannerTitleColor,
    this.layoutType,
    this.msg,
    this.msgAndBtnSpace,
    this.msgColor,
    this.msgFontSize,
    this.msgWidget,
    this.padding,
    this.space,
    this.sureBgColor,
    this.sureMsg,
    this.sureTitleColor,
    this.title,
    this.titleAndMsgSpace,
    this.titleColor,
    this.titleFontSize,
    this.titleWidget,
    this.radius,
  });
}
