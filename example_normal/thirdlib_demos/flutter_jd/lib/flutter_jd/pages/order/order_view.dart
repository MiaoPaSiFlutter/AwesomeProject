// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'widgets/order_filter_dialog.dart';
import 'widgets/order_son_view.dart';

class OrderView extends CommonGetXlistWidget<OrderController> {
  OrderView({Key? key}) : super(key: key);

  @override
  String? createAppBarTitleStr() => "我的订单";
  @override
  OrderController get controller => Get.put(OrderController());
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return controller.obx(
      (data) => buildTabView(),
      onEmpty: const Center(child: Text('No data found')), //空数据显示
      onError: (error) => Center(
        child: InkWell(
          onTap: controller.getOrderTabs,
          child: Text(error ?? '请求失败，点击重试'),
        ),
      ), //出错界面显示
    );
  }

  /// 创建导航栏 右边按钮集合
  @override
  List<Widget>? createAppBaractions() {
    return [
      TextButton(
        onPressed: () {
          print("object");
          _showFilterDialog();
        },
        child: const Text('筛选'),
      ),
    ];
  }

  _showFilterDialog() {
    showAnimatedDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return OrderFilterDialog(
          callback: (List<String> selectedNames) {
            showToastMsg("$selectedNames");
          },
        );
      },
      animationType: DialogTransitionType.slideFromRight,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 600),
    );
  }

  ///////////////////////
  /////////////////////// EasyRefresh
  ///////////////////////
  Widget buildTabView() {
    return Column(
      children: <Widget>[
        _tabBar(),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller.pageController,
            itemCount: controller.orderTabs.length,
            itemBuilder: _pageItemBuilder,
            onPageChanged: (int index) {
              controller.controller?.animateTo(index);
            },
          ),
        )
      ],
    );
  }

  TabBar _tabBar() {
    return TabBar(
      tabs: _tabs(),
      isScrollable: true,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54,
      indicatorColor: Colors.black,
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.label,
      controller: controller.controller,
      onTap: (index) {
        controller.pageController?.animateToPage(index,
            duration: const Duration(microseconds: 200), curve: Curves.ease);
      },
    );
  }

  List<Widget> _tabs() {
    List<Widget> tabList = [];
    for (var page in controller.orderTabs) {
      tabList.add(Tab(text: page["name"]));
    }
    return tabList;
  }

  Widget _pageItemBuilder(context, index) {
    // return OrderSonView(orderTab: controller.orderTabs[index]);
    if (index == 0) {
      return const OrderSonListView("newUserAllOrderList");
    } else if (index == 1) {
      return const OrderSonListView("wait4Payment");
    } else if (index == 2) {
      return const OrderSonListView("wait4Delivery");
    } else if (index == 3) {
      return const OrderSonListView("userCompletedOrderList");
    } else if (index == 4) {
      return const OrderSonListView("canceledOrderList");
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
              Random().nextInt(256), 1),
        ),
      ),
    );
  }
}

class OrderController extends CommonGetXListController
    with StateMixin, GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  var orderTabs = [];
  TabController? controller;
  PageController? pageController;

  void increment() => count.value++;

  @override
  void onInit() {
    super.onInit();
    getOrderTabs();
  }

  @override
  void onClose() {
    controller?.dispose();
    pageController?.dispose();
    super.onClose();
  }
}

extension OrderControllerNetExt on OrderController {
  /// 获取楼层信息
  Future<void> getOrderTabs({bool useLocal = true}) async {
    change(null, status: RxStatus.loading());

    //执行网络请求
    MpsfResponse resp = await JdService.newUserAllOrderList(1);
    List tabs = resp.jsonData["orderTabs"] ?? [];
    orderTabs = tabs;

    Map<String, String?> parameters = currentGetParams();
    String index = parameters["index"] ?? "0";

    controller = TabController(
        initialIndex: int.parse(index), length: orderTabs.length, vsync: this);
    pageController =
        PageController(initialPage: int.parse(index), viewportFraction: 1);

    change(orderTabs, status: RxStatus.success());
  }
}
