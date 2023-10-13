import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_normal_colors.dart';
import 'package:hzy_normal_tool/hzy_normal_tools/hzy_normal_tools.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_normal_widgets_index.dart';
import '../hzy_normal_config/hzy_text_style.dart';

/*
 * @description: 创建通用 item 带> 带下划线 带 点击事件
 * @param {
 * title 左边文字
 * messge 右边文字
 * isshowline 是否显示细线,默认false
 * ontap item 点击事件回调
 * mainAxisAlignment title 和 messge  横轴显示位置
 * isshownext 是否显示 > 默认不显示
 * }
 * @return {*}
 */

Widget createNormalItemWidget({
  String? title,
  String? messge,
  bool? isshowline = false,
  MainAxisAlignment? mainAxisAlignment = MainAxisAlignment.spaceBetween,
  bool? isshownext = false,
  int type = 0,
  double height = 50,
  EdgeInsetsGeometry? padding = const EdgeInsets.only(
    left: 20,
  ),
  bool? istap = false,
  int? index = 0,
  Color? arrowrightColor = HzyNormalColorS.col666666,
  Widget? leftwidget,
  Widget? rightwidget,
  Widget? arrowrightwidget,
  Widget? linewidget,
  BoxDecoration? decoration,
  Color? backgroundColor,
  BorderRadius? borderRadius,
  Function(int)? ontap,
}) {
  return InkWell(
    onTap: () {
      if (ontap != null && istap!) {
        ontap(index!);
      }
    },
    child: Container(
      height: height,
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: borderRadius,
          ),
      child: Column(
        children: [
          SizedBox(
            height: height - 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment!,
                    children: [
                      leftwidget ??
                          Text(
                            title ?? "",
                            style: HzyTextStyle.fontMedium(
                              size: 14,
                              color: type == 0
                                  ? HzyNormalColorS.col222222
                                  : HzyNormalColorS.col666666,
                            ),
                          ),
                      rightwidget ??
                          Text(
                            messge ?? "",
                            style: HzyTextStyle.fontMedium(
                              size: 14,
                              color: HzyNormalColorS.col222222,
                            ),
                          ),
                    ],
                  ),
                ),
                isshownext!
                    ? arrowrightwidget ??
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: arrowrightColor,
                        )
                    : Container(),
              ],
            ),
          ),
          isshowline!
              ? linewidget ?? HzyNormalTools.configlineSpace()
              : Container()
        ],
      ),
    ),
  );
}

// 向右箭头 带圆角
configArrowForwardIosRounded({
  double? size = 20,
  Color? color,
}) {
  return Icon(
    Icons.arrow_forward_ios_rounded,
    size: size,
    color: color,
  );
}

// 向右箭头 不带圆角
configChevronRight({
  double? size = 20,
  Color? color,
}) {
  return Icon(
    Icons.chevron_right,
    size: size,
    color: color,
  );
}

/*
 * @description: 默认弹框
 * @param
 * {
 *    barrierDismissible: 点击屏幕关闭弹框
 *    dialogBackColor: 弹框背景颜色
 *    body: 自定义弹框内容
 *    titleWidget: 自定义提示语Widget
 *    title: 提示语
 *    titleColor: 提示语字体颜色
 *    titleFontSize: 提示语字体大小
 *    msgWidget: 提示内容自定义Widget
 *    msg: 显示内容
 *    msgColor: 提示内容字体颜色
 *    msgFontSize: 提示内容字体大小
 *    btnWidget: 自定义底部按钮
 *    padding: 弹框内边距
 *    msgAndBtnSpace: 提示内容和底部按钮的间距
 *    titleAndMsgSpace: 标题与提示内容间距
 *    sureMsg: 确认按钮文字
 *    sureBgColor: 确认按钮背景颜色
 *    sureTitleColor: 确认按钮字体颜色
 *    cannerMsg: 取消按钮文字
 *    cannerBgColor: 取消按钮背景颜色
 *    cannerTitleColor: 取消按钮字体颜色
 *    tapSure: 确认按钮点击事件
 *    tapCanner: 取消按钮点击事件
 *    space: 两个按钮间距
 *    layoutType: 1 左右 2 上下
 *    btnType:  按钮样式 1 一个按钮 2 两个按钮
 * }
 * @return {*}
 */
showPopDiaLogWidget({
  required BuildContext context,
  Color? dialogBackColor,
  bool barrierDismissible = true,
  Widget? body,
  Widget? titleWidget,
  String? title,
  Color? titleColor,
  double? titleFontSize,
  Widget? msgWidget,
  Color? msgColor,
  double? msgFontSize,
  String? msg,
  Widget? btnSWidget,
  EdgeInsetsGeometry? padding,
  double? msgAndBtnSpace,
  double? titleAndMsgSpace,
  double? radius,
  String? sureMsg,
  Color? sureBgColor,
  Color? sureTitleColor,
  String? cannerMsg,
  Color? cannerBgColor,
  Color? cannerTitleColor,
  Function? tapSure,
  Function? tapCanner,
  double? space,
  int? layoutType,
  int? btnType,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return Dialog(
        backgroundColor: dialogBackColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        child: body ??
            HzyPopDiaLogWidget(
              bgColor: dialogBackColor ?? Colors.white,
              titleWidget: titleWidget,
              titleAndMsgSpace: titleAndMsgSpace ?? 10,
              title: title,
              titleColor: titleColor ?? HzyNormalColorS.col222222,
              titleFontSize: titleFontSize ?? 16,
              msg: msg,
              msgAndBtnSpace: msgAndBtnSpace ?? 20,
              msgColor: msgColor ?? HzyNormalColorS.col333333,
              msgFontSize: msgFontSize ?? 14,
              msgWidget: msgWidget,
              btnSWidget: btnSWidget,
              padding: padding ?? const EdgeInsets.all(20),
              space: space ?? 20,
              sureBgColor: sureBgColor ?? HzyNormalColorS.col2865ff,
              radius: radius ?? 20,
              sureMsg: sureMsg ?? "确认",
              sureTitleColor: sureTitleColor ?? Colors.white,
              cannerBgColor: cannerBgColor ?? HzyNormalColorS.colf5f5f5,
              cannerMsg: cannerMsg ?? "取消",
              cannerTitleColor: cannerTitleColor ?? HzyNormalColorS.col999999,
              tapCanner: () {
                Navigator.pop(context, false);
                if (tapCanner != null) {
                  tapCanner();
                }
              },
              tapSure: () {
                if (tapSure != null) {
                  tapSure();
                } else {
                  Navigator.pop(context, true);
                }
              },
              layoutType: layoutType ?? 1,
              btnType: btnType ?? 2,
            ),
      );
    },
  );
}

/*
 * @description: 创建通用tf
 * @param {
 *  
 *  textEditingController 控制器
 *  textAlign 文本位置
 *  hintText 占位文案
 *  fontSize 文本大小
 *  keyboardType 键盘类型
 *  maxLength 最大输入字数
 *  obscureText 是否加密
 *  isExpanded 是否铺满
 *  focusNode 
 *  hintStyle 占位字体样式
 *  style 内容字体样式
 *  textInputAction
 *  contentPaddinge 内容内边距
 *  maxLines 最大行数
 *  minLines 最小行数
 *  onChange 输入监听
 *  ontap 点击事件
 * }
 * @return {*}
 */
Widget createNormaltfWidget({
  required BuildContext context,
  TextAlign textAlign = TextAlign.left,
  TextEditingController? textEditingController,
  String? hintText,
  double? fontsize = 14,
  TextInputType? keyboardType,
  int? maxLength,
  bool obscureText = false,
  bool isExpanded = true,
  FocusNode? focusNode,
  TextStyle? hintStyle,
  TextStyle? style,
  TextInputAction? textInputAction,
  List<TextInputFormatter>? inputFormatters,
  Brightness? keyboardAppearance,
  EdgeInsetsGeometry? contentPadding,
  Widget? prefixIcon,
  int? maxLines = 1,
  InputDecoration? decoration,
  int? minLines,
  Function(String value)? onChange,
  Function? ontap,
  Color? cursorColor,
  Function? onEditingComplete,
}) {
  Widget body = TextField(
    keyboardType: keyboardType,
    textAlign: textAlign,
    maxLines: maxLines,
    minLines: minLines,
    obscureText: obscureText,
    maxLength: maxLength,
    inputFormatters: inputFormatters,
    style: style ??
        HzyTextStyle.fontMedium(
          size: fontsize!,
          color: HzyNormalColorS.col222222,
        ),
    controller: textEditingController,
    focusNode: focusNode,
    textInputAction: textInputAction ?? TextInputAction.go,
    keyboardAppearance: keyboardAppearance,
    decoration: decoration ??
        InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          counterText: "",
          contentPadding: contentPadding,
          hintText: hintText,
          hintStyle: hintStyle ??
              HzyTextStyle.fontMedium(
                size: fontsize!,
                color: HzyNormalColorS.colcccccc,
              ),
        ),
    cursorColor: cursorColor,
    onTap: () {
      if (ontap != null) {
        ontap();
      }
    },
    onChanged: (value) {
      if (onChange != null) {
        onChange(value);
      }
    },
    onEditingComplete: () {
      HzyNormalTools.keydissmiss(context);
      if (onEditingComplete != null) onEditingComplete();
    },
  );
  if (isExpanded) {
    body = Expanded(child: body);
  }
  return body;
}

/// 保持光标在最后
TextEditingController configTextEndEditingController({
  String text = '',
}) {
  return TextEditingController.fromValue(
    TextEditingValue(
      // 设置内容
      text: text,
      // 保持光标在最后
      selection: TextSelection.fromPosition(
        TextPosition(
          affinity: TextAffinity.downstream,
          offset: text.length,
        ),
      ),
    ),
  );
}

/// 创建dialog
configDiaLogWidget({
  required Widget child,
  Color? backgroundColor,
  ShapeBorder? shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        15,
      ),
    ),
  ),
}) {
  return Dialog(
    backgroundColor: backgroundColor,
    shape: shape,
    child: child,
  );
}
