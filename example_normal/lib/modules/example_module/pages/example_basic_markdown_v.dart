/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-11 16:36:25
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 18:11:08
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../compontents/compontents.dart';
import '../compontents/drawer_top_widget.dart';

class ExampleBasicMarkdownV extends CommonGetXWidget<ExampleBasicMarkdownC> {
  ExampleBasicMarkdownV({Key? key}) : super(key: key);
  @override
  ExampleBasicMarkdownC get controller => Get.put(ExampleBasicMarkdownC());

  @override
  String? createAppBarTitleStr() =>
      controller.isShowAppBar.value ? "火之夜" : null;
  @override
  bool configIsAddPopScope() => controller.isCloseOnWillPop.value;
  @override
  bool configSafeAreaBottom() => controller.safeAreabottm.value;
  @override
  bool configSafeAreaTop() => controller.safeAreatop.value;
  @override
  bool configIsNeedScaffol() => controller.isneedScaffol.value;
  @override
  Color? configScallBackgroundColor() => controller.backgroundColor.value;
  @override
  Widget build(BuildContext context) {
    return Obx(() => createScaffol(context: context));
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    List<Widget> child = [];
    for (var i = 0; i < controller.basicList.length; i++) {
      List<HzyNormalItemModel> element = controller.basicList[i];
      Widget bt = Column(
        children: [
          ...List.generate(
            element.length,
            (index) {
              HzyNormalItemModel itemModel = element[index];
              itemModel.isCanTap = true;
              itemModel.isShowLine = true;
              if (itemModel.isHintWidget != true) {
                itemModel.type = i * 10 + index;
              }
              if (index == 0) {
                itemModel.borderRadius =
                    BorderRadius.vertical(top: Radius.circular(16.r));
              } else if (index == element.length - 1) {
                itemModel.isShowLine = false;
                itemModel.borderRadius = BorderRadius.vertical(
                  bottom: Radius.circular(16.r),
                );
              }

              Widget body = configNormalDarkItemWidget(
                itemModel: itemModel,
                onOtherTap: (_) {
                  controller.tapItem(itemModel: itemModel);
                },
              );
              return body;
            },
          ),
          Gaps.vGap10,
        ],
      );
      child.add(bt);
    }

    Widget body = ListView(
      children: child,
    );
    body = Container(
      margin: EdgeInsets.all(20.w),
      child: body,
    );
    return body;
  }

  /// =============== 属性修改 ============== //
  ///
  ///

  /// 设置系统返回按钮 icon 颜色
  @override
  Color? createLeadingIconColor() {
    return controller.leadIconColor.value;
  }

  /// 配置返回按钮iconData
  @override
  IconData? createLeadIcon() {
    return controller.isNeedLeadIcon.value ? Icons.close : null;
  }

  /// 重写返回按钮控件
  @override
  Widget? createAppBarleading() {
    return controller.isChangBack.value ? configBtnImageWidget() : null;
  }

  /// 是否显示返回按钮
  @override
  bool configShowBack() {
    return controller.isShowBack.value;
  }

  /// 设置默认 title 字体颜色
  @override
  Color? createAppBarTextColor() {
    // PageNormalConfig.configNormalAppBarTextColor = controller.textColor.value;

    return controller.textColor.value;
  }

  /// 自定义appBar title
  @override
  Widget? createAppBarTitleWidget() {
    return controller.isShowTitle.value ? configBtnImageWidget() : null;
  }

  /// 创建导航栏 右边按钮集合
  @override
  List<Widget>? createAppBaractions() {
    return controller.isShowActionS.value
        ? [
            configBtnImageWidget(),
            Gaps.hGap20,
          ]
        : null;
  }

  /// 配置导航栏背景
  @override
  Widget? createFlexBleSpace() {
    return controller.isChangeAppBarBg.value
        ? DrawerToplessV()
        : super.createFlexBleSpace();
  }

  /// 修改appBar高度
  @override
  double? configPrferredheight() {
    return controller.isChangeAppBarHeight.value
        ? 150
        : super.configPrferredheight();
  }

  @override
  configPageState() {
    return controller.pageState.value;
  }

  @override
  bool configIsshowLoading() {
    return controller.isShowLoadWidget.value;
  }

  @override
  configBoxDecoreation() {
    return controller.isChangeBoxD.value
        ? const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.red,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          )
        : super.configBoxDecoreation();
  }

  @override
  Widget? createLoadingWidget() {
    return configLoadWidget();
  }
}

class ExampleBasicMarkdownC extends CommonGetXController {
  // --------- 属性 --------- //
  List<List<HzyNormalItemModel>> basicList = [
    [
      HzyNormalItemModel(
        leftMsg: "设置系统返回按钮 icon 颜色",
      ),
      HzyNormalItemModel(
        leftMsg: "配置返回按钮iconData",
      ),
      HzyNormalItemModel(
        leftMsg: "重写返回按钮控件",
      ),
      HzyNormalItemModel(
        leftMsg: "是否显示返回按钮",
      )
    ],
    [
      HzyNormalItemModel(
        leftMsg: "设置默认 title 字体颜色",
      ),
      HzyNormalItemModel(
        leftMsg: "自定义appBar title",
      ),
    ],
    [
      HzyNormalItemModel(
        leftMsg: "创建导航栏 右边按钮集合",
      ),
      HzyNormalItemModel(
        leftMsg: "配置导航栏背景",
      ),
      HzyNormalItemModel(
        leftMsg: "配置appBar 高度",
      ),
      HzyNormalItemModel(
        leftMsg: "隐藏导航栏",
      ),
      HzyNormalItemModel(
        leftMsg: "是否关闭右滑返回",
      ),
    ],
    [
      HzyNormalItemModel(
        leftMsg: "顶部安全区域显示或隐藏",
      ),
      HzyNormalItemModel(
        leftMsg: "低部安全区域显示或隐藏",
      ),
      HzyNormalItemModel(
        leftMsg: "是否有脚手架(没有脚手架，是Widget)",
      ),
    ],
    [
      HzyNormalItemModel(
        leftMsg: "修改脚手架背景颜色",
      ),
      HzyNormalItemModel(
        leftMsg: "配置根视图 装饰器",
      ),
      HzyNormalItemModel(
        leftMsg: "显示加载动画",
      ),
      HzyNormalItemModel(
        leftMsg: "显示空数据界面",
      ),
    ],
  ];
  Rx<Color?> leadIconColor = HzyCommonColor().col000000.obs;

  /// 配置导航栏字体
  var isShowAppBar = true.obs;

  /// 按钮iconData
  var isNeedLeadIcon = false.obs;

  /// 重写返回按钮控件
  var isChangBack = false.obs;

  var isShowBack = true.obs;

  Rx<Color?> textColor = HzyCommonColor().col000000.obs;

  var isShowTitle = false.obs;

  var isShowActionS = false.obs;

  var isChangeAppBarBg = false.obs;

  var isChangeAppBarHeight = false.obs;

  var isCloseOnWillPop = false.obs;

  var safeAreabottm = false.obs;

  var safeAreatop = false.obs;

  var isneedScaffol = true.obs;

  var backgroundColor = HzyCommonColor().whitebackgroundColor.obs;

  var isChangeBoxD = false.obs;
  // --------- 生命周期  --------- //

  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  tapItem({required HzyNormalItemModel itemModel}) {
    switch (itemModel.type) {
      case 0:
        leadIconColor.value = HzyNormalColorS.getRandomColor();
        break;
      case 1:
        isNeedLeadIcon.value = !isNeedLeadIcon.value;
        break;
      case 2:
        isChangBack.value = !isChangBack.value;
        break;
      case 3:
        isShowBack.value = !isShowBack.value;
        break;
      case 10:
        textColor.value = HzyNormalColorS.getRandomColor();
        break;
      case 11:
        isShowTitle.value = !isShowTitle.value;
        break;
      case 20:
        isShowActionS.value = !isShowActionS.value;
        break;
      case 21:
        isChangeAppBarBg.value = !isChangeAppBarBg.value;
        break;
      case 22:
        isChangeAppBarHeight.value = !isChangeAppBarHeight.value;
        break;
      case 23:
        isShowAppBar.value = !isShowAppBar.value;
        break;
      case 24:
        isCloseOnWillPop.value = !isCloseOnWillPop.value;
        break;
      case 30:
        safeAreatop.value = !safeAreatop.value;
        break;
      case 31:
        safeAreabottm.value = !safeAreabottm.value;
        break;
      case 32:
        isneedScaffol.value = !isneedScaffol.value;
        break;
      case 40:
        backgroundColor.value = HzyNormalColorS.getRandomColor();
        break;
      case 41:
        isChangeBoxD.value = !isChangeBoxD.value;
        break;
      case 42:
        isShowLoadWidget.value = !isShowLoadWidget.value;
        Future.delayed(const Duration(seconds: 1)).then(
          (value) => isShowLoadWidget.value = false,
        );
        break;
      case 43:
        pageState.value = PageState.emptyDataState;
        break;
      default:
    }
  }

  @override
  tapPlaceHoldWidgetMethod({required CommonPlaceHoldType placeHoldType}) {
    pageState.value = PageState.dataFetchState;
  }
}
