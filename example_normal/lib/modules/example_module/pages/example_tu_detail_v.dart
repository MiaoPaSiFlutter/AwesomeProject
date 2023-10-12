/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-18 14:14:21
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 15:11:56
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../compontents/compontents.dart';
import '../compontents/example_subscript_widget.dart';
import '../models/tu_chong_model.dart';
import '../routers/example_module_routers.dart';
import '../vm/example_vm.dart';

class ExampleTuDetailV extends CommonGetXWidget<ExampleTuDetailC> {
  ExampleTuDetailV({Key? key}) : super(key: key);
  @override
  ExampleTuDetailC get controller => Get.put(ExampleTuDetailC());

  @override
  bool configSafeAreaTop() => false;

  @override
  Color? configScallBackgroundColor() => const Color(0xff181818);
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configTabBarView();
    body = Stack(
      children: [
        body,
        configBottomWidget(),
        configSubscriptWidget(),
      ],
    );
    return body;
  }

  @override
  configBoxDecoreation() {
    return null;
  }

  /// 创建tabbarView
  configTabBarView() {
    Widget body = TabBarView(
      controller: controller.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        configBannerWidget(),
        configLongImageWidget(),
      ],
    );
    return body;
  }

  /// 创建长图
  configLongImageWidget() {
    Widget body = CommonLongImageSWidget(
      key: controller.longKey,
      imageModellist: controller.imagelist,
      scrollerIndex: (index) {
        controller.configChangeIndex(index: index);
      },
      index: controller.currentIndex,
      scrollStar: (notification) {
        controller.scrollEnd = false;
      },
      scrollUpdata: (notification) {
        controller.scrollEnd = false;
        controller.configScrollerOffset(offset: notification.metrics.pixels);
      },
      scrollEnd: (notification) {
        controller.scrollEnd = true;
      },
      userScroll: (notification) {
        controller.configAnimationChangeState(isStar: false);
      },
      tapImageCall: (index, imageNormalModel) {
        controller.tapImage(imageNormalModel: imageNormalModel);
      },
    );
    body = Center(
      child: body,
    );
    return body;
  }

  /// 创建图片显示器
  configBannerWidget() {
    Widget body = CommonBannerImagesWidget(
      key: controller.bannerKey,
      imageModellist: controller.imagelist,
      index: controller.currentIndex,
      onPageChanged: (index) {
        controller.configChangeIndex(index: index);
      },
      onLongPress: (p0) {
        controller.configLongPress(index: p0);
      },
    );

    body = Container(
      margin: EdgeInsets.only(
        bottom: SizeMacro.bottomBarHeight + 80.w,
        left: 10,
        right: 10,
        top: SizeMacro.statusBarHeight,
      ),
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: configScallBackgroundColor(),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: HzyNormalColorS.colbfbfbf.withOpacity(0.6),
            offset: const Offset(0, 0),
            blurRadius: 10.0,
            spreadRadius: 0,
          )
        ],
      ),
      child: body,
    );
    return body;
  }

  /// 创建底部视图
  configBottomWidget() {
    Widget body = GetBuilder<ExampleTuDetailC>(
      builder: (controller) {
        Widget bt = createTuchongImageDetailBottomWidget(
          titile: controller.tuChongItem.title,
          isPositioned: false,
          tapSure: () {
            controller.tapChangeMode();
          },
          tapcanner: () {
            currentGoback();
          },
          color: const Color(0xff201e22).withOpacity(
            1,
          ),
          suretitle: controller.tabController.index == 0 ? "长图" : "轮播",
        );
        bt = SlideTransition(
          position: controller.animation,
          child: bt,
        );
        return bt;
      },
    );

    body = Positioned(
      bottom: (SizeMacro.bottomBarHeight == 0 ? 10 : SizeMacro.bottomBarHeight),
      right: 10,
      left: 10,
      child: body,
    );
    return body;
  }

  /// 创建角标
  configSubscriptWidget() {
    Widget body = ExampleSubscriptWidget(
      key: controller.subScriptkey,
      allNum: controller.imagelist.length,
      index: controller.currentIndex,
    );
    body = Positioned(
      right: 0,
      left: 0,
      top: 0,
      child: body,
    );
    return body;
  }
}

class ExampleTuDetailC extends CommonGetXController
    with GetTickerProviderStateMixin {
  // --------- 属性 --------- //
  /// 数据源
  late TuChongItem tuChongItem;

  /// 当前下标
  int currentIndex = 0;

  /// 上一次滑动距离
  double oldOffset = 0;

  /// 底部距离
  double? bottom;

  /// 动画控制器
  late AnimationController animationController;

  /// 控制器
  late TabController tabController;

  /// 滚动结束
  bool scrollEnd = true;

  /// 底部
  Tween<Offset> bottomTween = Tween(
    begin: const Offset(0, 0),
    end: const Offset(0, 2),
  );

  /// 移动动画
  late Animation<Offset> animation;

  /// 转换后的数据源
  List<ImageNormalModel> imagelist = [];

  /// 下标key
  GlobalKey<ExampleSubscriptState> subScriptkey = GlobalKey();

  /// 长图key
  GlobalKey<CommonLongImageSState> longKey = GlobalKey();

  /// 轮播图key
  GlobalKey<CommonBannerImagesState> bannerKey = GlobalKey();
  // --------- 生命周期  --------- //

  @override
  configDefault() {
    /// 创建动画控制器
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationController.addStatusListener((status) {
      dPrint(status);
    });

    /// 创建动画解释器
    animation = bottomTween.animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );

    /// 创建tab控制器
    tabController = TabController(length: 2, vsync: this);

    /// 界面传值
    tuChongItem = currentGetArguments();
    imagelist = ExampleVM.configDetailImageModelList(
      tuChongItem: tuChongItem,
      width: SizeMacro.screenWidth,
    );

    /// 当前下标
    currentIndex = int.parse(
      currentGetParams()["index"] ?? "0",
    );
  }
  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  /// 长图滚动监听
  configScrollerOffset({required double offset}) {
    if (offset > oldOffset && offset > 100) {
      animationController.forward();
    } else if (offset < oldOffset || offset < 0) {
      animationController.reverse();
    }
    oldOffset = offset;
  }

  configAnimationChangeState({required bool isStar}) {
    if (isStar) {
      /// 动画开始
      animationController.forward();
    } else if (isStar == false && scrollEnd) {
      /// 动画逆执行
      animationController.reverse();
    }
  }

  /// 切换下标
  configChangeIndex({required int index}) {
    if (currentIndex != index) {
      currentIndex = index;
      dPrint(currentIndex);
      subScriptkey.currentState?.configCurrentIndex(index: index);
    }
  }

  /// 切换模式
  tapChangeMode() {
    if (tabController.index == 0) {
      longKey.currentState?.configLongImageSjumpToIndex(index: currentIndex);
    } else {
      bannerKey.currentState?.configBannerJumpToIndex(index: currentIndex);
    }
    tabController.animateTo(tabController.index == 0 ? 1 : 0);
    update();
  }

  tapImage({
    required ImageNormalModel imageNormalModel,
  }) {
    currentToPage(
      ExampleModuleRouterS.tuOnlyImage,
      arguments: imageNormalModel,
    );
  }

  /// 配置长按图片触发事件
  configLongPress({required int index}) {
    // showToolTop(
    //   tapCall: (type) {
    //     tapToolIndex(
    //       index: index,
    //       type: type,
    //     );
    //   },
    // );
  }

  tapToolIndex({
    required int index,
    required int type,
  }) {
    if (kIsWeb) {
      showToastMsg("Web端暂时不支持图片存储");
      return;
    }
    if (imagelist.length == 1) {
      tapDoCall(
        type: type,
        list: imagelist,
      );
    } else {
      // showselectimage(
      //   list: imagelist,
      //   normalSelect: index,
      //   busiType: 3,
      //   themeType: 1,
      //   tapDoCall: (p0) {
      //     tapDoCall(
      //       type: type,
      //       list: p0,
      //     );
      //   },
      // );
    }
  }

  /// 点击完成
  tapDoCall({
    required int type,
    required List<ImageNormalModel> list,
  }) async {
    if (list.isEmpty) return;

    showNormalLoadMsg(msg: "下载中\n1/${list.length}");
    SavePhotoTool.saveImgToPhotos(
      context: Get.context!,
      list: list,
      onProgress: (index, allNum) {
        EasyLoading.instance.key?.currentState
            ?.updateStatus("下载中\n$index/$allNum");
      },
      onSuccess: () {
        loadDismiss();
        EasyLoading.instance.key?.currentState?.updateStatus(
          "保存成功",
        );
      },
      onFail: () {
        loadDismiss();
      },
    );
  }
}
