/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-18 18:13:28
 * @LastEditors: TT
 * @LastEditTime: 2023-09-18 10:41:05
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_normal_colors.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_text_style.dart';
import 'package:hzy_normal_tool/hzy_normal_tools/hzy_normal_tools.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_normal_widagets.dart';

class HzyNormalItemModel {
  /**
   * 整体样式:
   * 左边整体 + 右边整体
   * 左边整体 = 左边图片 + 左边文字
   * 右边整体 = 右边文字 + 右边图片
   * 
   * 细分为:
   * 左文字 
   * 左文字 + 左图片
   * 左文字 + 右图片
   * 左文字 + 右文字
   * 左文字 + 右文字 + 右图片
   * 左图片 + 右图片
   * 左图片 + 右文字
   * 左图片 + 右文字 + 右图片
   * 左文字 + 左图片 + 右图片
   * 左文字 + 左图片 + 右文字
   * 左文字 + 左图片 + 右文字 + 右图片
   * 
  */

  /// 整体布局左右样式
  MainAxisAlignment? mainAxisAlignment;

  /// 是否是占位视图
  /// 占位视图 只可以修改背景颜色和视图高度
  bool? isHintWidget;

  /// 左边模块 可包含 图片 + 文字
  /// 左边文字

  /*
   * 左边视图布局样式
   * 1 左文字
   * 2 左图片
   * 3 左图片 + 左文字
   * 3 左图片
   */
  int? leftType;

  /// 左边字体
  String? leftMsg;

  /// 左边字体类型
  TextStyle? leftStyle;

  /// 左边 图片和文本的间距
  double? leftSpace;

  /// 左边文字大小
  double? leftFontSize;

  /// 左边文字颜色
  Color? leftMsgColor;

  /// 左边图片视图
  Widget? leftImageWidget;

  /// 左边图片路径
  String? leftImagePath;

  /// 左边图片大小
  Size? leftImageSize;

  /// 左边整个模块视图
  Widget? leftWidget;

  /// 右边模块 文字 +  图片
  /// 右边整个模块
  ///

  /*
   * 右边模块布局
   * 0 空
   * 1 右图
   * 2 右文字
   * 3 右文字 + 右图
  */
  int? rightType;

  /// 右边整体视图
  Widget? rightWidget;

  /// 右边 文字和图片的间距
  double? rightSpace;

  /// 右边文字
  String? rightMsg;

  /// 右边字体类型
  TextStyle? rightStyle;

  /// 右边文字大小
  double? rightFontSize;

  /// 右边文字颜色
  Color? rightFontColor;

  /// 右边图片路径 默认 >
  String? rightImagePath;

  /// 右边图片大小
  Size? rightImageSize;

  /// 右边箭头的颜色
  Color? rightIconColor;

  /// 是否显示底部细线
  bool? isShowLine;

  /// 整个item的paddint
  EdgeInsetsGeometry? padding;

  /// 整个item的margin
  EdgeInsetsGeometry? margin;

  /// 是否可以点击
  bool? isCanTap;

  /// 细线视图
  Widget? lineWidget;

  /// 细线颜色
  Color? lineColor;

  /// 细线高度
  double? lineHeight;

  /// 细线的外边距
  EdgeInsetsGeometry? lineMargin;

  /// 细线的内边距
  EdgeInsetsGeometry? linePadding;

  /// 细线的装饰器
  Decoration? lineDecoration;

  /// 整个item 背景颜色
  Color? backGroudColor;

  /// 整个item 圆角
  BorderRadius? borderRadius;

  /// 整个item 的装饰器
  BoxDecoration? decoration;

  /// 当item 只是一个占位视图的时候,才会生效
  double? height;

  /// item 下标
  int? type;

  /// 路由
  String? router;

  /// 点击响应事件类型
  /// 1 路由跳转
  /// 2 其他触发事件
  int? tapType;

  /// item 点击事件
  TapIndexOptionCallback? tapItemCall;

  HzyNormalItemModel({
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.backGroudColor = Colors.white,
    this.borderRadius,
    this.decoration,
    this.isCanTap = true,
    this.isShowLine = false,
    this.leftFontSize = 16,
    this.leftImageWidget,
    this.leftImagePath,
    this.leftImageSize = const Size(20, 20),
    this.leftMsg,
    this.leftStyle,
    this.leftMsgColor = HzyNormalColorS.col222222,
    this.leftSpace = 8,
    this.leftType = 1,
    this.leftWidget,
    this.lineWidget,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
    this.rightFontColor = const Color(0xff93969e),
    this.rightFontSize = 14,
    this.rightIconColor = const Color(0xffB1B3B8),
    this.rightImagePath,
    this.rightImageSize,
    this.rightMsg,
    this.rightStyle,
    this.rightSpace = 8,
    this.rightType = 0,
    this.rightWidget,
    this.lineColor = HzyNormalColorS.coleeeeee,
    this.lineHeight = 0.5,
    this.lineDecoration,
    this.lineMargin = const EdgeInsets.symmetric(horizontal: 12),
    this.linePadding,
    this.tapItemCall,
    this.type,
    this.height = 10,
    this.isHintWidget = false,
    this.router,
    this.margin,
    this.tapType = 1,
  });
}

class HzyNormalItemWidget extends StatelessWidget {
  const HzyNormalItemWidget({
    super.key,
    this.tapItemCallback,
    required this.itemModel,
  });

  final HzyNormalItemModel itemModel;
  final TapItemCallback? tapItemCallback;

  @override
  Widget build(BuildContext context) {
    Widget body = LayoutBuilder(
      builder: (p0, p1) {
        Widget bt = Row(
          mainAxisAlignment:
              itemModel.mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createLeftWidget(
              maxW: p1.maxWidth,
            ),
            createRightWidget(),
          ],
        );
        return bt;
      },
    );

    body = itemModel.padding == null
        ? body
        : Padding(
            padding: itemModel.padding!,
            child: body,
          );

    body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        body,
        itemModel.isShowLine == true
            ? itemModel.lineWidget ??
                HzyNormalTools.configlineSpace(
                  color: itemModel.lineColor!,
                  height: itemModel.lineHeight ?? 0.5,
                  margin: itemModel.lineMargin,
                  padding: itemModel.linePadding,
                  decoration: itemModel.lineDecoration,
                )
            : Container()
      ],
    );
    body = Container(
      margin: itemModel.margin,
      decoration: itemModel.decoration ??
          BoxDecoration(
            color: itemModel.backGroudColor,
            borderRadius: itemModel.borderRadius,
          ),
      child: body,
    );
    body = itemModel.isCanTap == true
        ? InkWell(
            onTap: () {
              if (tapItemCallback != null) {
                tapItemCallback?.call(itemModel, itemModel.type);
              } else if (itemModel.tapItemCall != null) {
                itemModel.tapItemCall?.call(itemModel.type);
              }
            },
            child: body,
          )
        : body;

    body = itemModel.isHintWidget == true
        ? Container(
            height: itemModel.height,
            margin: itemModel.margin,
            decoration: itemModel.decoration ??
                BoxDecoration(
                  color: itemModel.backGroudColor,
                  borderRadius: itemModel.borderRadius,
                ),
          )
        : body;
    return body;
  }

  /// 左边视图
  Widget createLeftWidget({
    required double maxW,
  }) {
    // 创建左边文字部分
    createLeftTextWidget() {
      Widget body = Text(
        itemModel.leftMsg ?? "",
        style: itemModel.leftStyle ??
            HzyTextStyle.fontMedium(
              size: itemModel.leftFontSize,
              color: itemModel.leftMsgColor,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      );
      double maxWidth = maxW;
      if (itemModel.rightType == 0 && itemModel.rightWidget == null) {
        maxWidth = maxW;
      } else {
        maxWidth = maxW - 50;
      }
      body = Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: body,
      );
      body = (itemModel.leftType == 1 || itemModel.leftType == 3)
          ? body
          : Container();

      return body;
    }

    // 创建左边图片部分
    createLeftImageWidget() {
      Widget body = itemModel.leftImageWidget ??
          Image.asset(
            itemModel.leftImagePath ?? "",
            width: itemModel.leftImageSize?.width,
            height: itemModel.leftImageSize?.height,
          );
      body = (itemModel.leftType == 1 && itemModel.leftImageWidget == null)
          ? Container()
          : body;
      return body;
    }

    Widget body = Row(
      children: [
        createLeftImageWidget(),
        SizedBox(
          width: (itemModel.leftType != 3 && itemModel.leftImageWidget == null)
              ? 0
              : itemModel.leftSpace,
        ),
        createLeftTextWidget(),
      ],
    );

    body = itemModel.leftWidget ?? body;
    return body;
  }

  /// 右边视图
  Widget createRightWidget() {
    // 创建右边文字部分
    createRightTextWidget() {
      Widget body = Text(
        itemModel.rightMsg ?? "",
        style: itemModel.rightStyle ??
            HzyTextStyle.fontMedium(
              size: itemModel.rightFontSize,
              color: itemModel.rightFontColor,
            ),
        overflow: TextOverflow.ellipsis,
      );
      body = itemModel.rightType == 1 ? Container() : body;

      return body;
    }

    // 创建右边图片部分
    createRightImageWidget() {
      Widget body = configChevronRight(
        color: itemModel.rightIconColor,
      );
      body = itemModel.rightImagePath == null
          ? body
          : Image.asset(
              itemModel.rightImagePath!,
              width: itemModel.rightImageSize?.width,
              height: itemModel.rightImageSize?.height,
            );

      body = itemModel.rightType == 2 ? Container() : body;
      return body;
    }

    Widget body = Row(
      children: [
        createRightTextWidget(),
        SizedBox(
          width: itemModel.rightType == 2 ? 0 : itemModel.rightSpace,
        ),
        createRightImageWidget(),
      ],
    );
    body = itemModel.rightWidget ?? body;
    body = itemModel.rightType == 0 ? Container() : body;

    return body;
  }
}
