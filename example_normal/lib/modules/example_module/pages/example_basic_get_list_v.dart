/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-16 08:44:20
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 16:42:32
 */
/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 11:16:27
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 08:33:59
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../compontents/example_list_widget.dart';
import '../compontents/compontents.dart';
import '../vm/example_vm.dart';

class ExampleBasicListV extends CommonGetXlistWidget<ExampleBasicListC> {
  final String? typeStr;
  final bool? isShowAppBar;
  final String? listTag;
  ExampleBasicListV({
    Key? key,
    this.typeStr,
    this.listTag,
    this.isShowAppBar = true,
  }) : super(key: key);
  @override
  String? createAppBarTitleStr() => controller.title;
  @override
  bool configIsNeedScaffol() => isShowAppBar ?? true;

  @override
  ExampleBasicListC get controller => Get.put(
        ExampleBasicListC(
          typeStr: typeStr ?? "beauty",
        ),
        tag: listTag,
      );

  @override
  Widget createListView(BuildContext context) {
    Widget body = GetBuilder<ExampleBasicListC>(
      builder: (controller) {
        Widget bt = ExampleListWidget(
          list: kIsWeb
              ? controller.vm.state.feedList
              : controller.vm.state.imageList,
          scrollController: controller.scrollController,
        );
        return bt;
      },
      tag: listTag,
    );
    body = isShowAppBar!
        ? configStackMoreBtn(
            child: body,
            onTap: (p0) {
              if (p0 == 0) {
                controller.tapShowNothing();
              } else if (p0 == 1) {
                controller.tapNomoreData();
              }
            },
          )
        : body;

    return body;
  }
}

class ExampleBasicListC extends CommonGetXListController {
  // --------- 属性 --------- //
  /// 标题
  String? title;

  /// 图片类型
  final String typeStr;
  ExampleBasicListC({
    required this.typeStr,
  });

  /// VM
  ExampleVM vm = ExampleVM();

  /// 滚动控制器
  ScrollController scrollController = ScrollController();

  // --------- 生命周期  --------- //
  @override
  configDefault() {
    super.configDefault();
    HzyNormalItemModel itemModel = currentGetArguments();
    title = itemModel.leftMsg;
    isShowLoadWidget.value = true;
    getNetWorkData();
  }

  @override
  Future<bool> configWidgetRenderingCompleted() async {
    return true;
  }
  // --------- 数据处理  --------- //

  @override
  getNetWorkData({int? type, Map<String, dynamic>? info}) async {
    dPrint(typeStr);
    await vm.configNormalImageListData(
      page: page,
      type: typeStr,
    );
    isShowLoadWidget.value = false;
    update();
    endRefresh(type: type ?? 1, pageState: vm.state.pageState!);
  }

  // --------- 触发事件  --------- //

  /// 点击空数据界面
  tapShowNothing() {
    placeHoldType = CommonPlaceHoldType.nothing;
    vm.state.pageState = PageState.emptyDataState;
    update();
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
  tapPlaceHoldWidgetMethod({required CommonPlaceHoldType placeHoldType}) {
    isShowLoadWidget.value = true;
    getNetWorkData();
  }
}
