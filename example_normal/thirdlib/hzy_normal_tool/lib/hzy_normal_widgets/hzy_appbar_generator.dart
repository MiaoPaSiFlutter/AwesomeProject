/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 22:15:22
 * @LastEditors: TT
 * @LastEditTime: 2023-09-09 16:04:07
 */
import 'package:flutter/material.dart';
import '../hzy_normal_config/hzy_normal_colors.dart';

class HzyAppBarGenerator {
  static customAppBarWidget({
    required BuildContext context,
    String? title,
    List<Widget>? actions,
    Widget? titlew,
    Widget? leading,
    IconData? icon,
    bool showback = true,
    double elevation = 0,
    double? toolbarHeight,
    Color? textColor,
    Color? leadingIconColor,
    Color? backgroundColor,
    Widget? flexibleSpace,
    Function()? leadingCallback,
  }) {
    Widget leftWidget = configAppBarBackBtnWidget(
      context: context,
      leading: leading,
      icon: icon,
      showback: showback,
      leadingIconColor: leadingIconColor,
      leadingCallback: leadingCallback,
    );

    Widget textWidget = title == null
        ? Container()
        : Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: textColor ?? HzyNormalColorS.col101010,
            ),
            textAlign: TextAlign.center,
          );
    textWidget = titlew ?? textWidget;
    textWidget = Center(
      child: textWidget,
    );
    Widget rightWidget = Row(children: actions ?? []);

    Widget body = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget,
        rightWidget,
      ],
    );

    body = Container(
      height: MediaQuery.of(context).padding.top + kToolbarHeight,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white.withOpacity(0),
      ),
      child: body,
    );
    body = Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).padding.top,
          bottom: 0,
          child: textWidget,
        ),
        body,
      ],
    );
    return body;
  }

  /// 配置导航栏 返回按钮
  static configAppBarBackBtnWidget({
    required BuildContext context,
    Widget? leading,
    IconData? icon,
    bool showback = true,
    Color? leadingIconColor,
    Function()? leadingCallback,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    bool canShowBack = parentRoute?.canPop ?? false;
    ThemeData themeData = Theme.of(context);
    leadingIconColor ??=
        (themeData.appBarTheme.iconTheme?.color ?? HzyNormalColorS.col101010);

    Widget backBtn = leading ??
        IconButton(
          icon: Icon(
            icon ?? Icons.arrow_back_ios,
            color: leadingIconColor,
          ),
          onPressed: leadingCallback ?? () => Navigator.of(context).pop(),
        );
    backBtn = canShowBack ? backBtn : Container();
    backBtn = showback ? backBtn : Container();
    return backBtn;
  }

  static PreferredSizeWidget getNoramlAppBar({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? titlew,
    Widget? leading,
    IconData? icon,
    bool showback = true,
    double elevation = 0,
    double? toolbarHeight,
    PreferredSizeWidget? bottom,
    Color? textColor,
    Color? leadingIconColor,
    Color? backgroundColor,
    Widget? flexibleSpace,
    Function()? leadingCallback,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    bool canshowback = parentRoute?.canPop ?? false;
    ThemeData themeData = Theme.of(context);
    leadingIconColor ??=
        (themeData.appBarTheme.iconTheme?.color ?? HzyNormalColorS.col101010);
    backgroundColor ??=
        (themeData.appBarTheme.backgroundColor ?? HzyNormalColorS.colffffff);
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      toolbarHeight: toolbarHeight,
      actions: actions,
      flexibleSpace: flexibleSpace,
      leading: showback
          ? (canshowback
              ? (leading ??
                  IconButton(
                    icon: Icon(
                      icon ?? Icons.arrow_back_ios,
                      color: leadingIconColor,
                    ),
                    onPressed:
                        leadingCallback ?? () => Navigator.of(context).pop(),
                  ))
              : null)
          : null,
      title: titlew ??
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: textColor ?? HzyNormalColorS.col101010,
            ),
          ),
      elevation: elevation,
      bottom: bottom,
      automaticallyImplyLeading: showback,
    );
  }

  // 判断是否是一级界面
  static bool isfirstPage({required BuildContext context}) {
    bool showback;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    showback = parentRoute?.canPop ?? false;
    return showback;
  }
}
