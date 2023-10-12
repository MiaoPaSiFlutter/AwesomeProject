/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-25 17:44:50
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 15:08:31
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class ExampleTuOnlyImageV extends CommonGetXWidget<ExampleTuOnlyImageC> {
  ExampleTuOnlyImageV({Key? key}) : super(key: key);
  @override
  ExampleTuOnlyImageC get controller => Get.put(ExampleTuOnlyImageC());
  @override
  Color? configScallBackgroundColor() => const Color(0xff181818);

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = createImageBuilder(
      imageNormalModel: controller.imageNormalModel,
      doubleClickAnimationController: controller.doubleClickAnimationController,
      isGesture: true,
      isCanTap: true,
    );
    body = Center(
      child: body,
    );
    body = Stack(
      children: [
        body,
        configCloseWidget(),
      ],
    );
    return body;
  }

  configCloseWidget() {
    Widget body = IconButton(
      onPressed: () {
        currentGoback();
      },
      icon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );

    body = Positioned(
      left: 10,
      top: SizeMacro.statusBarHeight,
      child: body,
    );
    return body;
  }

  @override
  Widget? createFlexBleSpace() {
    return null;
  }

  @override
  IconData? createLeadIcon() {
    return Icons.close;
  }

  @override
  Color? createLeadingIconColor() {
    return Colors.white;
  }

  @override
  configBoxDecoreation() {
    return null;
  }
}

class ExampleTuOnlyImageC extends CommonGetXController
    with GetTickerProviderStateMixin {
  // --------- 属性 --------- //
  late AnimationController doubleClickAnimationController;

  late ImageNormalModel imageNormalModel;
  // --------- 生命周期  --------- //
  @override
  configDefault() async {
    doubleClickAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    imageNormalModel = currentGetArguments();
    imageNormalModel.heroStr = null;
  }
  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //
}
