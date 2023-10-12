/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 10:36:59
 * @LastEditors: TT
 * @LastEditTime: 2023-05-15 15:17:21
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../routers/example_module_routers.dart';

class ExampleBasicV extends CommonGetXWidget<ExampleBasicC> {
  ExampleBasicV({Key? key}) : super(key: key);
  @override
  ExampleBasicC get controller => Get.put(ExampleBasicC());

  @override
  String? createAppBarTitleStr() => controller.title.value;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ListView(
      children: [
        ...List.generate(
          controller.list.length,
          (index) => configNormalDarkItemWidget(
            itemModel: controller.list[index],
            index: index,
            allNum: controller.list.length,
          ),
        ),
      ],
    );
    body = Container(
      margin: EdgeInsets.all(20.w),
      child: body,
    );
    return body;
  }
}

class ExampleBasicC extends CommonGetXController {
  // --------- 属性 --------- //
  List<HzyNormalItemModel> list = [
    HzyNormalItemModel(
      leftMsg: "基于CommonLessV",
      router: ExampleModuleRouterS.basicLess,
    ),
    HzyNormalItemModel(
      leftMsg: "基于CommonState",
      router: ExampleModuleRouterS.basicState,
    ),
    HzyNormalItemModel(
      leftMsg: "基于CommonListState",
      router: ExampleModuleRouterS.basicListState,
    ),
    HzyNormalItemModel(
      leftMsg: "基于CommonGetX",
      router: ExampleModuleRouterS.basicGetv,
    ),
    HzyNormalItemModel(
      leftMsg: "基于CommonGetXlist",
      router: ExampleModuleRouterS.basicGetListV,
    ),
  ];
  Rx<String?> title = "".obs;
  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();
    configNormalData();
  }

  // --------- 数据处理  --------- //
  configNormalData() {
    HzyNormalItemModel itemModel = currentGetArguments();
    title.value = itemModel.leftMsg;
  }
  // --------- 触发事件  --------- //
}
