/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-17 22:30:37
 * @LastEditors: TT
 * @LastEditTime: 2023-05-08 11:15:44
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../my_module/pages/my_theme_sett_v.dart';
import '../compontents/drawer_top_widget.dart';
import '../config/example_launch_id_config.dart';
import 'example_text_anim_v.dart';

class ExampleDrawerV extends CommonGetXWidget<ExampleDrawerC> {
  ExampleDrawerV({Key? key}) : super(key: key);

  @override
  ExampleDrawerC get controller => Get.put(ExampleDrawerC());
  @override
  bool configSafeAreaTop() => false;

  @override
  bool configIsAddPopScope() => true;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = CommonDrawerPage(
      bodyView: DrawerBodylessV(),
      drawerWidth: controller.drawerW,
      type: controller.type,
      drawerWidget: controller.drawerWidget,
    );
    return body;
  }

  @override
  Widget? createLoadingWidget() {
    Widget body = configLoadWidget(
      size: const Size(
        60,
        60,
      ),
    );

    body = Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HzyCommonColor().col000000.withOpacity(
              0.2,
            ),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: body,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              "转换中...",
              style: FontConfig.fontMedium12White,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
    body = Center(
      child: body,
    );
    return body;
  }
}

class ExampleDrawerC extends CommonGetXController {
  // --------- 属性 --------- //

  var type = CommonDrawerType.left;
  Widget drawerWidget = MyThemeV(
    isShowBack: false,
  );
  double drawerW = 200;

  // --------- 生命周期  --------- //

  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  configChangeType({
    required CommonDrawerType commonDrawerType,
  }) {
    if (commonDrawerType != type) {
      drawerWidget = Container(
        color: Colors.red,
      );
      switch (commonDrawerType) {
        case CommonDrawerType.bottom:
        case CommonDrawerType.top:
          drawerW = 350;
          drawerWidget = DrawerToplessV();
          break;

        case CommonDrawerType.left:
          drawerW = 200;
          drawerWidget = MyThemeV(
            isShowBack: false,
          );
          break;
        case CommonDrawerType.right:
          drawerW = 250;
          drawerWidget = MyThemeV(
            isShowBack: false,
          );
          break;
        default:
      }
      isShowLoadWidget.value = true;
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        type = commonDrawerType;
        isShowLoadWidget.value = false;
      });
    } else {
      showToastMsg("暂不需要切换");
    }
  }
}

class DrawerBodylessV extends CommonLessV {
  DrawerBodylessV({super.key});
  final ExampleDrawerC controller = Get.put(ExampleDrawerC());

  @override
  String? createAppBarTitleStr() => ExampleLaunchIdConfig.drawer.tr;

  @override
  bool configSafeAreaTop() => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150.r),
        color: HzyCommonColor().whitebackgroundColor,
        boxShadow: [
          configShadow(),
        ],
      ),
      width: 150.w,
      height: 150.w,
      child: Stack(
        children: [
          configLeftAndRight(),
          configTopAndBottomWidget(),
        ],
      ),
    );

    body = Center(
      child: body,
    );
    body = Stack(
      children: [
        body,
        configSlideDirectionWidget(),
      ],
    );
    return body;
  }

  /// 创建滑动方向标志
  configSlideDirectionWidget() {
    String msg = "左";
    double? left;
    double? right;
    double? top;
    double? bottom;
    Axis axis = Axis.vertical;

    switch (controller.type) {
      case CommonDrawerType.left:
        left = 20;
        top = 20;
        bottom = 20;
        msg = "右";
        axis = Axis.vertical;
        break;
      case CommonDrawerType.right:
        msg = "左";
        right = 20;
        top = 20;
        bottom = 20;
        axis = Axis.vertical;
        break;
      case CommonDrawerType.top:
        msg = "下";
        top = 20;
        left = 20;
        right = 20;
        axis = Axis.horizontal;
        break;
      case CommonDrawerType.bottom:
        msg = "上";
        bottom = 20 + SizeMacro.bottomBarHeight;
        left = 20;
        right = 20;
        axis = Axis.horizontal;
        break;
      default:
    }
    msg = "向$msg滑动,有惊喜哦•••";

    Widget body = ExampleTextAnimV();
    Get.put(ExampleTextAnimC()).configText(
      text: msg,
      axis: axis,
    );

    body = Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: body,
    );

    return body;
  }

  /// 配置右上角导航按钮
  @override
  List<Widget>? createAppBaractions() {
    List<Widget> list = [];
    if (controller.type == CommonDrawerType.left) {
      list.add(
        HzyBtnWidget(
          btnLayoutType: BtnLayoutType.img,
          margin: EdgeInsets.only(right: 10.w),
          imageWidget: Icon(
            Icons.close,
            color: HzyCommonColor().wbgblacktextcolor,
            size: 20,
          ),
          tapCall: () {
            configgoback(Get.context!);
          },
        ),
      );
    }
    return list;
  }

  /// 配置是否显示返回按钮
  @override
  bool configShowBack() {
    return controller.type == CommonDrawerType.left ? false : true;
  }

  /// 自定义返回按钮
  configBackBtn() {
    Widget body = HzyBtnWidget(
      width: 50.w,
      height: 50.w,
      btnLayoutType: BtnLayoutType.img,
      imageWidget: Icon(
        Icons.close,
        size: 20.w,
      ),
      tapCall: () => configgoback(Get.context!),
    );

    return body;
  }

  /// 创建左右
  configLeftAndRight() {
    Widget body = Row(
      children: [
        configIconBtnWidget(
          icons: Icons.arrow_back,
          type: CommonDrawerType.left,
        ),
        Gaps.hGap50,
        configIconBtnWidget(
          icons: Icons.arrow_forward,
          type: CommonDrawerType.right,
        ),
      ],
    );

    body = Positioned.fill(child: body);
    return body;
  }

  /// 创建上下
  configTopAndBottomWidget() {
    Widget body = Column(
      children: [
        configIconBtnWidget(
          icons: Icons.arrow_upward,
          type: CommonDrawerType.top,
        ),
        Gaps.configvbox(
          height: 50,
          reversal: true,
        ),
        configIconBtnWidget(
          icons: Icons.arrow_downward,
          type: CommonDrawerType.bottom,
        ),
      ],
    );
    body = Positioned.fill(child: body);
    return body;
  }

  /// 创建按钮
  configIconBtnWidget({
    required IconData icons,
    required CommonDrawerType type,
  }) {
    Widget body = HzyBtnWidget(
      width: 50.w,
      height: 50.w,
      tapCall: () {
        controller.configChangeType(commonDrawerType: type);
      },
      btnLayoutType: BtnLayoutType.img,
      imageWidget: Icon(icons),
    );
    return body;
  }
}
