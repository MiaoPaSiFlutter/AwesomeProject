/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-08 11:31:51
 * @LastEditors: TT
 * @LastEditTime: 2023-05-15 11:14:03
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class ExampleBannerV extends CommonGetXWidget<ExampleBannerC> {
  ExampleBannerV({Key? key}) : super(key: key);
  @override
  ExampleBannerC get controller => Get.put(ExampleBannerC());
  @override
  bool configSafeAreaTop() => false;
  @override
  String? createAppBarTitleStr() => "banrn";
  @override
  Color? configScallBackgroundColor() => Colors.black;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configExtendedBannerWidget();
    return body;
  }

  /// 创建轮播图组件
  configExtendedBannerWidget() {
    Widget body = GetBuilder<ExampleBannerC>(
      builder: (ct) {
        Widget body = ExtendedImageGesturePageView.builder(
          itemBuilder: (context, index) {
            Widget body = CommonExtendedImageWidget.configImage(
              bytes: ct.list[index],
              width: SizeMacro.screenWidth - 50.w,
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              isShowLoadIng: false,
            );
            return body;
          },
          itemCount: ct.list.length,
          controller: ct.extendedPageController,
          onPageChanged: (value) {},
        );
        return body;
      },
    );
    return body;
  }
}

class ExampleBannerC extends CommonGetXController {
  // --------- 属性 --------- //
  /// 图片数据
  List<Uint8List> list = [];
  Rx<String?> title = "".obs;

  /// 初始化轮播图控制器
  ExtendedPageController extendedPageController = ExtendedPageController(
    keepPage: false,
  );
  // --------- 生命周期  --------- //

  // --------- 数据处理  --------- //
  @override
  configDefault() async {
    list = currentGetArguments();
  }
  // --------- 触发事件  --------- //
}
