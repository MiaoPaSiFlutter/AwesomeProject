/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-19 09:13:39
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:13
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

import '../config/example_config.dart';

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return ExampleHomeState();
  }
}

class ExampleHomeState extends CommonState<ExampleHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  String? createAppBarTitleStr() => LaunchIdConfig.example.tr;

  ExamplConfig get config => ExamplConfig();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ListView.builder(
      itemBuilder: configItemBuilder,
      itemCount: config.itemList.length,
    );
    body = Container(
      // margin: EdgeInsets.only(
      //   left: 15.w,
      //   right: 15.w,
      //   top: 10.h,
      // ),
      child: body,
    );
    return body;
  }

  /// 创建item
  Widget configItemBuilder(BuildContext context, int index) {
    HzyNormalItemModel itemModel = config.itemList[index];
    if (index == 0) {
      itemModel.borderRadius =
          BorderRadius.vertical(top: Radius.circular(16.r));
    } else if (index == config.itemList.length - 1) {
      itemModel.borderRadius =
          BorderRadius.vertical(bottom: Radius.circular(16.r));
    }
    itemModel.rightType = 1;
    itemModel.isShowLine = (index != config.itemList.length - 1);
    Widget body = configNormalDarkItemWidget(
      itemModel: itemModel,
      onOtherTap: (_) {},
    );
    return body;
  }

  @override
  bool get wantKeepAlive => true;
}
