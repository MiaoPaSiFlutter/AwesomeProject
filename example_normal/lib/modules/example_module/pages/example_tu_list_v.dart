/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-20 15:25:31
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 14:19:32
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../compontents/example_tu_item_widget.dart';
import '../models/tu_chong_model.dart';
import '../vm/example_vm.dart';

class ExampleTuListV extends CommonGetXlistWidget<ExampleTuListC> {
  ExampleTuListV({Key? key}) : super(key: key);

  @override
  String? createAppBarTitleStr() => LaunchIdConfig.example.tr;

  @override
  Color? createAppBarNavBackColor() => Colors.blue;

  @override
  bool configIsNeedScaffol() {
    // TODO: implement configIsNeedScaffol
    return true;
  }

  @override
  ExampleTuListC get controller => Get.put(ExampleTuListC());

  @override
  Widget createListView(BuildContext context) {
    Widget body = GetBuilder<ExampleTuListC>(
      builder: (controller) {
        Widget bt = ListView.builder(
          itemBuilder: (context, index) {
            TuChongItem tuChongItem = controller.vm.state.feedList[index];
            return ExampleTuItemlessV(
              tuChongItem: tuChongItem,
              tapOneKey: (tuChongItem) {
                controller.tapOneKey(
                  tuChongItem: tuChongItem,
                );
              },
            );
          },
          itemCount: controller.vm.state.feedList.length,
        );
        return bt;
      },
    );
    return body;
  }
}

class ExampleTuListC extends CommonGetXListController {
  // --------- 属性 --------- //
  /// VM
  ExampleVM vm = ExampleVM();
  // --------- 生命周期  --------- //
  @override
  configDefault() {
    super.configDefault();
    isShowLoadWidget.value = true;
    getNetWorkData();
  }

  // --------- 数据处理  --------- //
  @override
  getNetWorkData({int? type, Map<String, dynamic>? info}) async {
    await vm.configTuchongData(page: page);
    isShowLoadWidget.value = false;
    update();
    endRefresh(
      type: type ?? 1,
      pageState: vm.state.pageState!,
    );
  }

  // --------- 触发事件  --------- //

  tapOneKey({
    required TuChongItem tuChongItem,
  }) {}
}
