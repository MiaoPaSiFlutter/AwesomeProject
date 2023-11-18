/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 18:47:09
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 14:55:52
 */

import 'package:example_normal/modules/flutter_apps_module/pages/flutter_apps_home_v.dart';
import 'package:example_normal/modules/flutter_games_module/pages/flutter_games_home_v.dart';
import 'package:example_normal/modules/flutter_test_module/pages/flutter_test_home_v.dart';
import 'package:example_normal/modules/flutter_ui_module/pages/flutter_ui_home_v.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:example_normal/modules/example_module/module_index.dart';
import 'package:example_normal/modules/my_module/pages/pages_index.dart';
import 'package:example_normal/pages/root_pages/root_tab_v.dart';

class RootV extends CommonGetXWidget<RootC> {
  RootV({Key? key}) : super(key: key);
  @override
  RootC get controller => Get.put(RootC());

  @override
  bool configIsNeedScaffol() => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    /// 创建 body + tabbar
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        configTabBarView(),
        configTabBar(),
      ],
    );

    /// 固定 整体 大小
    body = SizedBox(
      width: SizeMacro.screenWidth,
      height: SizeMacro.screenHeight,
      child: body,
    );

    /// 创建导航栏抽屉按钮
    body = Stack(
      children: [
        body,

        /// 创建蒙层
        controller.progress.value > 0.2
            ? configBlackAplaneWidget()
            : Container(),

        /// 创建导航栏右边抽屉按钮
        controller.tabController.index == (controller.pageList.length - 1)
            ? configAppBarBtnWidget()
            : Container(),
      ],
    );

    /// 创建 抽屉布局
    /// body + drawerTools
    body = Row(
      children: [
        body,
        SizedBox(
          width: SizeMacro.screenWidth / 5 * 3,
          height: SizeMacro.screenHeight,
          child: MyToollessV(),
        )
      ],
    );

    /// 整体界面被滚动视图包裹住
    /// 用户滑动监听
    body = SingleChildScrollView(
      physics: controller.isCanScroller.value
          ? const PageScrollPhysics(
              parent: ClampingScrollPhysics(),
            )
          : const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: controller.scrollController,
      child: body,
    );

    return body;
  }

  /// 创建黑色透明层
  configBlackAplaneWidget() {
    double ct = Tween<double>(begin: 0, end: 0.2).transform(
      controller.progress.value,
    );
    Widget body = Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, ct),
      ),
    );

    body = InkWell(
      onTap: () {
        controller.tapNavItem();
      },
      child: body,
    );

    body = Positioned.fill(
      child: body,
    );
    return body;
  }

  /// 创建TabbarView
  configTabBarView() {
    Widget body = TabBarView(
      controller: controller.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: controller.pageList,
    );

    body = MediaQuery.removePadding(
      context: Get.context!,
      removeBottom: true,
      child: body,
    );
    body = Expanded(child: body);
    return body;
  }

  /// 创建TabBar
  configTabBar() {
    Widget body = RootTabV();
    return body;
  }

  /// 创建导航栏按钮
  configAppBarBtnWidget() {
    /// 创建按钮
    Widget body = InkWell(
      borderRadius: BorderRadius.circular(
        AppBar().preferredSize.height,
      ),
      child: Center(
        child: AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: controller.iconAnimationController,
        ),
      ),
      onTap: () {
        controller.tapNavItem();
      },
    );

    body = SizedBox(
      width: 40,
      height: 40,
      child: body,
    );

    /// 相对布局
    body = Positioned(
      right: 5,
      top: SizeMacro.statusBarHeight,
      child: body,
    );
    return body;
  }
}

class RootC extends CommonGetXController
    with GetSingleTickerProviderStateMixin, GetTickerProviderStateMixin {
  // --------- 属性 --------- //

  /// tab 控制器
  late TabController tabController;

  /// 配置滚动视图 滚动效果
  Rx<ScrollPhysics> physics = const NeverScrollableScrollPhysics().obs;

  /// 创建滚动视图 控制器
  ScrollController scrollController = ScrollController();

  /// 获取tabbar 控制器
  RootTabC tabC = Get.put(RootTabC());

  /// 创建导航按钮动画控制器
  late AnimationController iconAnimationController;

  /// tab 界面列表
  List<Widget> pageList = [
    // const HomePage(),
    const FlutterUIHomePage(),
    const FlutterAppsHomePage(),
    const FlutterGamesHomePage(),
    const FlutterTestHomePage(),
    const ExampleHomePage(),
    ExampleTuListV(),
    const MyPage(),
    // RootDrawerlessV(),
  ];

  /// 抽屉工具栏宽度
  double cardW = SizeMacro.screenWidth / 5 * 3;

  /// 是否可以滑动
  var isCanScroller = false.obs;

  /// 是否显示蒙层
  var isShowSmegma = false.obs;

  /// 滑动进度
  var progress = 0.0.obs;

  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();

    /// 初始化 tab 控制器
    configInitController();

    /// 事件监听
    configEven();
  }

  @override
  onClose() {
    super.onClose();
    tabController.dispose();
    iconAnimationController.dispose();
    tabC.dispose();
  }
  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  /// 初始化控制器
  configInitController() {
    /// 初始化 tab 控制器
    tabController = TabController(
      length: pageList.length,
      vsync: this,
    );

    /// 初始化 icon 动画控制器
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 0,
      ),
    );

    /// 配置icon 控制器 动画进度
    configIconAnimateTo(offset: 0);
  }

  /// 做控制器事件坚挺
  configEven() {
    /// tab 控制器事件监听
    tabC.selectIndex.listen((p0) {
      isCanScroller.value = (p0 == (pageList.length - 1));
      tabController.animateTo(p0);
    });

    /// 滚动控制器 事件监听
    scrollController.addListener(() {
      double pg = scrollController.offset / cardW;
      configIconAnimateTo(offset: pg);
      progress.value = pg;
    });
  }

  /// 配置 icon控制器动画进度
  configIconAnimateTo({double offset = 0}) {
    double animateTo = 1 - offset;
    iconAnimationController.animateTo(
      animateTo,
      duration: const Duration(milliseconds: 0),
      curve: Curves.fastOutSlowIn,
    );
  }

  /// 点击导航栏按钮
  tapNavItem() {
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        cardW,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
