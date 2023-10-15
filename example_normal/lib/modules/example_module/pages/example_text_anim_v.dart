/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-20 11:24:02
 * @LastEditors: TT
 * @LastEditTime: 2023-04-20 15:33:48
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class ExampleTextAnimV extends CommonGetXWidget<ExampleTextAnimC> {
  ExampleTextAnimV({Key? key}) : super(key: key);
  @override
  ExampleTextAnimC get controller => Get.put(ExampleTextAnimC());
  @override
  bool configIsNeedScaffol() => false;
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    // Widget body = AnimatedBuilder(
    //   animation: controller.animation,
    //   builder: (context, child) {
    //     // Widget bt = Text(
    //     //   controller.animation.value,
    //     //   style: FontConfig()fontMedium14Black,
    //     //   textAlign: TextAlign.center,
    //     // );
    //     // bt = SizedBox(
    //     //   width: constraints?.maxWidth,
    //     //   height: constraints?.maxHeight,
    //     //   child: bt,
    //     // );
    //     return Wrap(
    //       direction: controller.direction,
    //       alignment: WrapAlignment.center,
    //       runAlignment: WrapAlignment.center,
    //       crossAxisAlignment: WrapCrossAlignment.center,
    //       children: controller.children,
    //     );
    //   },
    // );
    Widget body = Wrap(
      direction: controller.direction,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: controller.children,
    );

    // body = Container(
    //   width: 40,
    //   height: 300,
    //   decoration: BoxDecoration(
    //     color: HzyNormalColorS.getRandomColor(),
    //   ),
    //   child: body,
    // );

    body = SizeTransition(
      sizeFactor: controller.sizeAnimation,
      axis: controller.direction,
      child: body,
    );
    switch (controller.direction) {
      case Axis.horizontal:
        body = Column(
          children: [
            body,
            Gaps.hGap10,
          ],
        );
        break;
      case Axis.vertical:
        body = Row(
          children: [
            body,
            Gaps.hGap10,
          ],
        );
        break;

      default:
    }

    return body;
  }
}

class ExampleTextAnimC extends CommonGetXController
    with GetSingleTickerProviderStateMixin, WidgetsBindingObserver {
  // --------- 属性 --------- //
  late AnimationController animationController;
  late Animation<String> animation;
  late Animation<double> sizeAnimation;
  Axis direction = Axis.vertical;
  RxList<Widget> children = <Widget>[].obs;
  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    sizeAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
  }

  @override
  onClose() {
    animationController.dispose();
    super.onClose();
  }

  tapAnima() {
    animationController.repeat(reverse: true);
  }

  configText({
    required String text,
    required Axis axis,
  }) {
    List<Widget> list = text
        .split("")
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(
              right: 3,
            ),
            child: Text(
              e,
              style: HzyTextStyle.fontBold(
                size: 18.sp,
                color: HzyNormalColorS.getRandomColor(),
              ),
            ),
          ),
        )
        .toList();
    direction = axis;
    children.clear();
    children.addAll(list);
    animationController.repeat(reverse: true);
  }
  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //
}
