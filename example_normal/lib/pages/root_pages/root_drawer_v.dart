/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-17 15:09:14
 * @LastEditors: TT
 * @LastEditTime: 2023-04-24 11:26:52
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import '../../modules/my_module/module_index.dart';
import 'root_tab_v.dart';

class RootDrawerlessV extends CommonLessV {
  RootDrawerlessV({super.key});
  @override
  bool get isNeedScaffol => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = CommonDrawerPage(
      bodyView: const MyPage(),
      type: CommonDrawerType.right,
      drawerWidget: MyThemeV(),
      onScroll: (offset) {
        RootTabC rootC = Get.put(RootTabC());
        rootC.scrollController.jumpTo(offset);
      },
    );
    return body;
  }
}
