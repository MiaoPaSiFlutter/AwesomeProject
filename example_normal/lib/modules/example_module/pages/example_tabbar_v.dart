/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 17:12:56
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 09:00:14
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/pages_index.dart';

import '../config/example_config.dart';
import '../models/image_type_model.dart';

class ExampleTabBarV extends CommonGetXWidget<ExampleTabBarC> {
  ExampleTabBarV({Key? key}) : super(key: key);
  @override
  ExampleTabBarC get controller => Get.put(ExampleTabBarC());

  @override
  String? createAppBarTitleStr() {
    return controller.title;
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Column(
      children: [
        configTabBar(),
        configTabbarView(),
      ],
    );
    return body;
  }

  /// 创建Tabbar
  configTabBar() {
    Widget body = TabBar(
      tabs: [
        ...List.generate(controller.config.typeList.length, (index) {
          ImageTypeModel typeModel = controller.config.typeList[index];
          Widget body = Tab(
            text: typeModel.title,
            height: 40,
          );
          return body;
        })
      ],
      controller: controller.tabController,
      labelColor: HzyCommonColor().wbgblacktextcolor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: CustomUnderlineTabIndicator(
        width: 20,
        strokeCap: StrokeCap.round,
        insets: EdgeInsets.only(bottom: 2.w),
        borderSide: BorderSide(
          width: 3.0,
          color: HzyCommonColor().colthemes,
        ),
      ),
      indicatorColor: HzyCommonColor().colthemes,
      isScrollable: true,
      labelPadding: const EdgeInsets.only(left: 12, right: 18),
      unselectedLabelColor: getColorFromHex("#B1B3B8"),
      unselectedLabelStyle: HzyTextStyle.fontRegular(
        size: 16,
        color: getColorFromHex("#B1B3B8"),
      ),
      labelStyle: HzyTextStyle.fontSemi(
        size: 16,
        color: HzyCommonColor().wbgblacktextcolor,
      ),
    );
    body = Container(
      width: SizeMacro.screenWidth,
      decoration: BoxDecoration(
        color: HzyCommonColor().whitebackgroundColor,
      ),
      child: body,
    );
    return body;
  }

  /// 创建TabbarView
  configTabbarView() {
    Widget body = TabBarView(
      controller: controller.tabController,
      children: [
        ...List.generate(
          controller.config.typeList.length,
          (index) {
            ImageTypeModel typeModel = controller.config.typeList[index];
            Widget body = configListView(
              typeModel: typeModel,
              index: index,
            );

            return body;
          },
        ),
      ],
    );
    body = Expanded(
      child: body,
    );
    return body;
  }

  configListView({
    required ImageTypeModel typeModel,
    required int index,
  }) {
    dPrint(typeModel.type);
    Widget body = ExampleBasicListV(
      typeStr: typeModel.type,
      listTag: typeModel.type,
      isShowAppBar: false,
    );
    body = CommonKeepAliverWrapper(
      child: body,
    );
    return body;
  }
}

class ExampleTabBarC extends CommonGetXController
    with GetSingleTickerProviderStateMixin {
  // --------- 属性 --------- //
  late TabController tabController;

  ExamplConfig config = ExamplConfig();
  String? title;
  // --------- 生命周期  --------- //
  @override
  configDefault() {
    super.configDefault();
    tabController = TabController(
      length: config.typeList.length,
      vsync: this,
    );
    HzyNormalItemModel itemModel = currentGetArguments();
    title = itemModel.leftMsg;
  }

  @override
  onClose() {
    super.onClose();
    tabController.dispose();
  }

  configEvent() {}
  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //
}
