import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

import '../config/font_config.dart';
import '../config/hzy_common_color_config.dart';
import '../utils/screenutil_tools.dart';
import 'common_widgets.dart';

enum CommonPlaceHoldType {
  /// 无网络
  nonetwork,

  /// 未登录
  nologin,

  ///空数据
  nothing,
}

class CommonPlaceHoldPage extends StatefulWidget {
  const CommonPlaceHoldPage({
    Key? key,
    required this.placeHoldType,
    this.ontap,
    this.msg,
  }) : super(key: key);
  final CommonPlaceHoldType placeHoldType;
  final String? msg;
  final Function? ontap;
  @override
  State<StatefulWidget> createState() {
    return _CommonPlaceHoldPageState();
  }
}

class _CommonPlaceHoldPageState extends HzyState<CommonPlaceHoldPage> {
  /// 属性
  ///
  ///

  @override
  bool get safeAreabottm => false;
  @override
  bool configSafeAreaTop() => false;

  /// 生命周期
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return createBody(
      context: context,
    );
  }

  /// 网路请求
  ///
  ///

  /// 构建视图
  ///
  ///
  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HzyCommonColor().whitebackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          configplaceWidget(type: 1),
          Gaps.vGap15,
          configplaceWidget(type: 2),
          Gaps.vGap15,
          configplaceWidget(type: 4),
        ],
      ),
    );
  }

  /// 创建暂位图
  Widget createPlaceImageWidget() {
    return createNoDataWidget();
  }

  /// 创建暂位图标语
  Widget createPlaceTitleWidget() {
    String title = "";
    if (widget.placeHoldType == CommonPlaceHoldType.nonetwork) {
      title = "暂无网络,请稍后重试";
    } else if (widget.placeHoldType == CommonPlaceHoldType.nothing) {
      title = "暂无数据";
    }
    title = widget.msg ?? title;
    return Text(
      title,
      style: FontConfig.fontBold18Black,
    );
  }

  /// 创建暂位图描述语
  Widget createPlaceMessageWidget() {
    return Container();
  }

  /// 创建暂位图 刷新按钮
  Widget createPlaceReloadBtnWidget() {
    return InkWell(
      onTap: () async {
        if (widget.ontap != null) {
          widget.ontap!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 100.w,
        height: 40.w,
        decoration: BoxDecoration(
          boxShadow: [
            configThemeShadow(),
          ],
          color: HzyCommonColor().colthemes,
          borderRadius: BorderRadius.all(
            Radius.circular(20.w),
          ),
        ),
        child: Text(
          "刷新",
          style: HzyTextStyle.fontMedium(
            size: 16.sp,
            color: HzyCommonColor().colonlywhite,
          ),
        ),
      ),
    );
  }

  /// 触发方法
  ///
  ///
  Widget configplaceWidget({
    int type = 1,
  }) {
    Widget? child = Container();
    switch (type) {
      case 1:
        child = createPlaceImageWidget();
        break;
      case 2:
        child = createPlaceTitleWidget();
        break;
      case 3:
        child = createPlaceMessageWidget();
        break;
      case 4:
        child = createPlaceReloadBtnWidget();
        break;
      default:
    }
    return child;
  }
}
