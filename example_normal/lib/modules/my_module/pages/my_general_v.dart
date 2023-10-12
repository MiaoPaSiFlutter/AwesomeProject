/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-01 17:37:23
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 17:24:23
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../config/my_launch_id_config.dart';
import '../config/my_normal_config.dart';

class MyGeneralV extends CommonLessV {
  MyGeneralV({Key? key}) : super(key: key);
  @override
  String? get appBarTitle => MyLaunchIdConfig.general.tr;

  final MyGeneralC controller = Get.put(MyGeneralC());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configListWidget();
    return body;
  }

  configListWidget() {
    Widget body = ListView.builder(
      itemBuilder: configItemBuilder,
      itemCount: controller.config.length,
    );
    return body;
  }

  Widget configItemBuilder(BuildContext context, int index) {
    HzyNormalItemModel itemModel = controller.config[index];
    Widget body = configNormalDarkItemWidget(
      itemModel: itemModel,
      onOtherTap: (HzyNormalItemModel itemModel) {
        controller.tapItemOtherEvent(
          itemModel: itemModel,
        );
      },
    );

    return body;
  }
}

class MyGeneralC extends CommonGetXController {
  // --------- 属性 --------- //

  List<HzyNormalItemModel> get config => MyNormalConfig().generalList;

  String msg = MyNormalConfig.configDarkModelIsOpen();
  // --------- 生命周期  --------- //

  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  /// 点击item 触发其他事件
  /// 不包含路由跳转
  tapItemOtherEvent({required HzyNormalItemModel itemModel}) {}
}
