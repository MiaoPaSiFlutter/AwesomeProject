/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 11:36:02
 * @LastEditors: TT
 * @LastEditTime: 2023-05-15 23:11:47
 */

import 'package:flutter/foundation.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import '../compontents/compontents.dart';
import '../compontents/example_list_widget.dart';
import '../vm/example_vm.dart';

class ExampleBasicListPage extends StatefulWidget {
  const ExampleBasicListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleBasicListState();
  }
}

class ExampleBasicListState extends CommonListState<ExampleBasicListPage> {
  /// VM
  ExampleVM vm = ExampleVM();

  /// 滑动控制器
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    isShowLoading = true;
    super.initState();
  }

  @override
  void initDefaultState() {
    super.initDefaultState();
    configRefreshController();
    getNetWorkData();
  }

  @override
  Widget createListView(BuildContext context) {
    Widget body = ExampleListWidget(
      list: kIsWeb ? vm.state.feedList : vm.state.imageList,
      scrollController: scrollController,
    );
    body = configStackMoreBtn(
      child: body,
      onTap: (p0) {
        if (p0 == 0) {
          tapShowNothing();
        } else if (p0 == 1) {
          tapNomoreData();
        }
      },
    );
    return body;
  }

  @override
  configPageState() {
    return vm.state.pageState;
  }

  @override
  String? createAppBarTitleStr() {
    HzyNormalItemModel itemModel = currentGetArguments();
    return itemModel.leftMsg;
  }

  @override
  getNetWorkData({int? type, Map<String, dynamic>? info}) async {
    await vm.configNormalImageListData(
      page: page,
    );
    isShowLoading = false;
    endRefresh(type: type ?? 1, pageState: vm.state.pageState!);
    setState(() {});
  }

  /// 点击空数据界面
  tapShowNothing() {
    placeHoldType = CommonPlaceHoldType.nothing;
    vm.state.pageState = PageState.emptyDataState;
    setState(() {});
  }

  /// 点击没有更多数据
  tapNomoreData() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
    endRefresh(type: 2, pageState: PageState.noMoreDataState);
  }

  // 点击缺省页触发事件
  @override
  tapPlaceHoldWidgetMethod({
    required CommonPlaceHoldType placeHoldType,
  }) {
    setState(() {
      isShowLoading = true;
    });
    getNetWorkData();
  }
}
