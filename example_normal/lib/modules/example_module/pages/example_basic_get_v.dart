/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 11:16:09
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 16:51:39
 */

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../compontents/example_list_widget.dart';
import '../config/example_config.dart';
import '../vm/example_vm.dart';

class ExampleBasicGetV extends CommonGetXWidget<ExampleBasicGetC> {
  ExampleBasicGetV({Key? key}) : super(key: key);
  @override
  String? createAppBarTitleStr() => controller.title;
  @override
  ExampleBasicGetC get controller => Get.put(ExampleBasicGetC());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = GetBuilder<ExampleBasicGetC>(
      builder: (controller) {
        Widget body = ExampleListWidget(
          list: kIsWeb
              ? controller.vm.state.feedList
              : controller.vm.state.imageList,
        );
        return body;
      },
    );
    return body;
  }

  @override
  List<Widget>? createAppBaractions() {
    return [
      HzyBtnWidget(
        text: "切换",
        tapCall: () {
          controller.tapRanderTypeStr();
        },
      ),
      Gaps.hGap20,
    ];
  }
}

class ExampleBasicGetC extends CommonGetXController {
  // --------- 属性 --------- //
  String title = '';
  String typeStr = "game";
  ExampleVM vm = ExampleVM();
  ExamplConfig config = ExamplConfig();

  /// 默认页数
  int page = 1;
  // --------- 生命周期  --------- //

  @override
  configDefault() {
    HzyNormalItemModel itemModel = currentGetArguments();
    title = itemModel.leftMsg ?? '';
    isShowLoadWidget.value = true;
    getNetWorkData();
  }
  // --------- 数据处理  --------- //

  @override
  getNetWorkData({int? type, Map<String, dynamic>? info}) async {
    await vm.configNormalImageListData(
      page: page,
      type: typeStr,
    );
    update();
    pageState.value = vm.state.pageState!;
  }

  // --------- 触发事件  --------- //
  /// 点击切换  触发事件
  tapRanderTypeStr() {
    if (kIsWeb) {
      configTuchongRander();
    } else {
      configImageRanderType();
    }
  }

  /// 配置图虫随机资源
  configTuchongRander() {
    int newPage = Random().nextInt(16);
    if (page == newPage) {
      if (newPage < 4) {
        newPage = newPage + 1;
      } else if (newPage == 15) {
        newPage = 0;
      }
    }
    page = newPage;
    vm.state.feedList.clear();
    configDefault();
  }

  /// 配置图片关键字
  configImageRanderType() {
    int allNum = config.typeStrList.length;
    int netNum = Random().nextInt(config.typeStrList.length);
    String newType = config.typeStrList[netNum];
    if (newType == typeStr) {
      if (netNum < allNum - 2) {
        newType = config.typeStrList[netNum + 1];
      } else if (netNum == allNum - 1) {
        newType = config.typeStrList[0];
      }
    }
    typeStr = newType;
    configDefault();
  }
}
