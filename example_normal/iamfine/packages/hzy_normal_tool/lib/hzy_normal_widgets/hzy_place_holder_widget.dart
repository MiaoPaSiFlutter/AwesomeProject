
import 'package:flutter/material.dart';

import '../hzy_normal_config/page_state.dart';

class HzyPlaceHolderConfig {
  static Map<String, HzyPlaceHolderModel>? placeholdinfo;

  static Widget? loadWidget;
}

class HzyPlaceHolderModel {
  /// 站位图
  Widget? icon;

  /// 站位描述语
  String? desc;

  /// 站位图 本地图片路径
  String? imageAssert;

  /// 站位图大小
  Size? imageSize;

  /// 失败界面 大小
  double? size;

  /// 背景颜色
  Color? backgroundColor;

  /// 按钮与图片的距离
  double? space;

  /// 字体配置
  TextStyle? textStyle;

  /// 按钮
  Widget? buttonWidget;

  /// 扩展字段
  Map? extendInfo;

  /// 描述语
  String? message;

  HzyPlaceHolderModel({
    this.icon,
    this.desc,
    this.imageAssert,
    this.imageSize,
    this.backgroundColor,
    this.space,
    this.textStyle,
    this.buttonWidget,
    this.extendInfo,
    this.message,
    this.size,
  });
}

class HzyPlaceHolderWidget extends StatelessWidget {
  // 网络请求状态
  final PageState pageState;
  // 子视图
  final Widget? child;

  /// 加载动画
  final Widget? loadingWidget;
  // 站位图
  final Widget? errorWidget;
  // 是否显示加载动画
  final bool? isshowloading;
  const HzyPlaceHolderWidget({
    Key? key,
    required this.pageState,
    this.child,
    this.errorWidget,
    this.loadingWidget,
    this.isshowloading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pageState == PageState.errorState ||
        pageState == PageState.errorshowRelesh ||
        pageState == PageState.emptyDataState) {
      return errorWidget ?? Container();
    } else if (isshowloading! && pageState == PageState.initializedState) {
      return Center(
        child:
            loadingWidget ?? (HzyPlaceHolderConfig.loadWidget ?? Container()),
      );
    }
    return child ?? Container();
  }
}
