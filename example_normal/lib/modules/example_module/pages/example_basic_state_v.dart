/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 11:15:53
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 16:59:22
 */

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

import '../compontents/example_list_widget.dart';
import '../config/example_config.dart';
import '../vm/example_vm.dart';

class ExampleBasicStatePage extends StatefulWidget {
  const ExampleBasicStatePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleBasicStateState();
  }
}

class ExampleBasicStateState extends CommonState<ExampleBasicStatePage> {
  ExampleVM vm = ExampleVM();
  ExamplConfig config = ExamplConfig();

  String typeStr = "game";

  int page = 1;

  @override
  void initState() {
    isShowLoading = true;
    super.initState();
  }

  @override
  void initDefaultState() {
    super.initDefaultState();
    getNetWorkData();
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ExampleListWidget(
      list: kIsWeb ? vm.state.feedList : vm.state.imageList,
    );
    return body;
  }

  @override
  String? createAppBarTitleStr() {
    HzyNormalItemModel itemModel = currentGetArguments();
    return itemModel.leftMsg;
  }

  @override
  List<Widget>? createAppBaractions() {
    return [
      HzyBtnWidget(
        text: "切换",
        tapCall: () {
          tapRanderTypeStr();
        },
      ),
      Gaps.hGap20,
    ];
  }

  @override
  configPageState() {
    return vm.state.pageState;
  }

  @override
  getNetWorkData({int? type, Map<String, dynamic>? info}) async {
    await vm.configNormalImageListData(
      page: page,
      type: typeStr,
    );
    setState(() {
      isShowLoading = false;
    });
  }

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
    configReloadData();
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
    configReloadData();
  }

  // 点击缺省页触发事件
  @override
  tapPlaceHoldWidgetMethod({
    required CommonPlaceHoldType placeHoldType,
  }) {
    configReloadData();
  }

  /// 触发数据切换
  configReloadData() {
    setState(() {
      isShowLoading = true;
    });
    getNetWorkData();
  }
}
