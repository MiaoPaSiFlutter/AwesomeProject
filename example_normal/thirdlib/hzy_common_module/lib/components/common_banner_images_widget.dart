import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../models/models_index.dart';
import 'components_index.dart';

class CommonBannerImagesWidget extends StatefulWidget {
  const CommonBannerImagesWidget({
    super.key,
    this.keepAlive,
    this.index,
    this.cache = true,
    this.onPageChanged,
    this.isNeedHero = false,
    this.cacheName = "cacheName",
    this.heroSub,
    this.onLongPress,
    required this.imageModellist,
  });

  /// 是否开启状态保存
  final bool? keepAlive;

  /// 初始值下标
  final int? index;

  /// 是否缓存图片
  final bool? cache;

  /// 缓存图片地址
  final String? cacheName;

  /// 点击回调
  final Function(int index)? onPageChanged;

  /// 是否需要hero动画
  final bool? isNeedHero;

  /// hero开头标志
  final String? heroSub;

  /// 图片缓存数据
  final List<ImageNormalModel> imageModellist;

  /// 长按触发事件
  final Function(int)? onLongPress;
  @override
  State<StatefulWidget> createState() {
    return CommonBannerImagesState();
  }
}

class CommonBannerImagesState extends CommonState<CommonBannerImagesWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get isNeedScaffol => false;

  /// 轮播图控制器
  late ExtendedPageController extendedPageController;

  /// 动画控制器
  late AnimationController animationController;

  /// 双击点击动画
  late AnimationController doubleClickAnimationController;
  @override
  bool get safeAreabottm => false;

  @override
  bool configSafeAreaTop() => false;

  /// 当前下标
  late int normalIndex;

  @override
  Color? get scallBackGroundColor => Colors.white.withOpacity(0);

  @override
  void initState() {
    normalIndex = widget.index ?? 0;
    configAnimationS();
    super.initState();
  }

  @override
  void initDefaultDispose() {
    animationController.dispose();
    extendedPageController.dispose();
    doubleClickAnimationController.dispose();
    super.initDefaultDispose();
  }

  @override
  configBoxDecoreation() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = createBannerWidget();
    return body;
  }

  /// 创建轮播图视图
  createBannerWidget() {
    Widget body = ExtendedImageGesturePageView.builder(
      itemBuilder: (context, index) {
        ImageNormalModel imageNormalModel = widget.imageModellist[index];
        Widget body = createImageBuilder(
          imageNormalModel: imageNormalModel,
          index: index,
          cache: widget.cache ?? true,
          cacheName: widget.cacheName,
          isGesture: true,
          isCanTap: true,
          heroStr: widget.heroSub == null ? null : "${widget.heroSub}$index",
          isNeedHero: widget.isNeedHero ?? false,
          doubleClickAnimationController: doubleClickAnimationController,
          onLongPress: (p0) {
            if (widget.onLongPress != null) widget.onLongPress!(p0);
          },
        );

        return body;
      },
      controller: extendedPageController,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.imageModellist.length,
      onPageChanged: (int index) {
        if (widget.onPageChanged != null) {
          widget.onPageChanged!(index);
        }
      },
    );
    return body;
  }

  // ======== 触发方法 ======== //
  /// 创建动画控制器
  configAnimationS() {
    extendedPageController = ExtendedPageController(
      initialPage: normalIndex,
    );
    doubleClickAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 1.0,
    );
  }

  configBannerJumpToIndex({required int index}) {
    extendedPageController.jumpToPage(index);
  }

  reladState() {
    setState(() {});
  }

  @override
  bool get wantKeepAlive => widget.keepAlive ?? true;
}
